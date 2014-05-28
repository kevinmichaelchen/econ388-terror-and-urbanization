#!/bin/bash

# Assumes user has the git command.

# Repository's root
REPO_ROOT=`pwd`

# Path to data folder
DATA=$REPO_ROOT/data

# Path to the GTD data folder
GTD=$DATA/gtd

# Path to the urbanization data folder that contains the zip file
URB=$DATA/urbanization


CSV_GTD_OLD=$GTD/gtd.csv
CSV_GTD_NEW=$GTD/new_gtd.csv

CSV_URB_OLD=$URB/4df40cf6-9709-4b99-be87-b675b5f3b4c4_Data.csv
CSV_URB_NEW=$URB/urban.csv



# CHECK FOR THE GTD
echo "Checking for GTD at: $CSV_GTD_OLD"
if [[ ! -f $CSV_GTD_OLD ]]; then
    echo "GTD not found."
    echo "Using xlsx2csv to convert .xlsx into $CSV_GTD_OLD..."
    echo "THIS MAY TAKE SEVERAL MINUTES..."
    xlsx2csv globalterrorismdb_1213dist.xlsx $CSV_GTD_OLD
else
    echo "GTD exists."
fi



# CHECK FOR URBAN DATA
ZIP_FILE=$URBAN/urbanization.zip
echo "Checking for urbanization data at: $CSV_URB_NEW"
if [[ ! -f $CSV_URB_NEW ]]; then
    echo "World Bank Urbanization Data not found."
    echo "Extracting data from $ZIP_FILE"
    if [[ -f $ZIP_FILE ]]; then
	echo "Unzipping $ZIP_FILE"
	unzip $ZIP_FILE -d $URBAN
    else
	echo "File not found: $ZIP_FILE"
	exit 1
    fi
fi


# urban data exists, preprocess it
SCRIPT=$URBAN/preprocessing.R
if [[ -f $CSV_URB_OLD ]]; then
    echo "Preprocessing $CSV_URB_OLD..."
    Rscript $SCRIPT $CSV_URB_OLD $CSV_URB_NEW
else
    echo "File not found: $CSV_URB_OLD..."
fi


