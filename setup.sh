#!/bin/bash

# Repository's root
REPO_ROOT=`pwd`

# Path to data folder
DATA=$REPO_ROOT/data

# Path to the urbanization data folder that contains the zip file
URBAN=$DATA/urbanization

# Path to preprocessing script
SCRIPT=$URBAN/preprocessing.R

# Path to zip file of urbanization data
ZIP_FILE=$URBAN/urbanization.zip

# Path that zipped urbanization data file extracts to
CSV_FILE=$URBAN/4df40cf6-9709-4b99-be87-b675b5f3b4c4_Data.csv


# If the csv file does not exist...
if [[ ! -f $CSV_FILE ]]; then
    echo "$CSV_FILE does not exist..."
    # extract it from zip file
    if [[ -f $ZIP_FILE ]]; then
	echo "Unzipping $ZIP_FILE..."
	unzip $ZIP_FILE -d .
    else
	echo "$ZIP_FILE does not exist..."
    fi
fi

# If the csv file has been successfully extracted, run the preprocessing R script 
if [[ -f $CSV_FILE ]]; then
    echo "Preprocessing $CSV_FILE..."
    `which Rscript` $SCRIPT $CSV_FILE $URBAN
else
    echo "$CSV_FILE not found..."
fi