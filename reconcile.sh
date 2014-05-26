#!/bin/bash

# Repository's root
REPO_ROOT=`pwd`

# Path to data folder
DATA=$REPO_ROOT/data

# Path to the GTD data folder
GTD=$DATA/gtd

# Path to the urbanization data folder that contains the zip file
URBAN=$DATA/urbanization

# Path to setup shell script
SETUP_SCRIPT=$REPO_ROOT/setup.sh

# Path to reconciliation R script
RECONCILIATION_SCRIPT=$URBAN/reconciliation.R

# Path to the urban csv file
CSV_WB=$URBAN/urban.csv

# Path to the original GTD csv file
CSV_GTD_OLD=$GTD/gtd.csv

# Path where the new GTD csv file will be written to
CSV_GTD_NEW=$GTD/new_gtd.csv


# If the World Bank csv file does not exist, create it
if [[ ! -f $CSV_WB ]]; then
    `which bash` $SETUP_SCRIPT
fi


# Run the reconciliation script.
if [[ -f $CSV_WB ]]; then
    if [[ -f $CSV_GTD_OLD ]]; then
	`which Rscript` $RECONCILIATION_SCRIPT $CSV_WB $CSV_GTD_OLD $CSV_GTD_NEW
    else
	echo "File not found: $CSV_GTD_OLD..."
    fi
else
    echo "File not found: $CSV_WB..."
fi