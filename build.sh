#!/bin/bash

# Runs regressions on the GTD.

# Repository's root
REPO_ROOT=`pwd`

# Path to data folder
DATA=$REPO_ROOT/data

# Path to the GTD data folder
GTD=$DATA/gtd

# Path to the urbanization data folder that contains the zip file
URBAN=$DATA/urbanization

# Path to the R script
SCRIPT=$DATA/build.R

# Path to the urban csv file (consistent w/ setup.sh)
CSV_WB=$URBAN/urban.csv

# Path to the GTD csv file (consistent w/ reconcile.sh)
CSV_GTD_NEW=$GTD/new_gtd.csv


# Run the script.
if [[ -f $CSV_WB ]]; then
    if [[ -f $CSV_GTD_NEW ]]; then
	`which Rscript` $SCRIPT $CSV_WB $CSV_GTD_NEW
    else
	echo "File not found: $CSV_GTD_NEW..."
    fi
else
    echo "File not found: $CSV_WB..."
fi

# DOES THE HEAVY LIFTING! RUNS REGRESSIONS ON GTD!
