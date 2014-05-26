# Elsevier
From Elsevier's *.dtx file, generate the template files, bibliographic styles, documentation, and class file by running `latex elsarticle.ins`. To compile the documentation, use `make all`.

# World Bank Dataset
The World Bank data is included in this repo.

## Step 1
Run `setup.sh` to extract the csv data from `data/urbanization/urbanization.zip` and write a prettified version of the CSV file into the `data/urbanization` directory.

# Global Terrorism Database
The GTD is available for download [here](http://www.start.umd.edu/gtd/contact/).
It comes in .xlsx format but can be converted into a .csv file using the [xlsx2xcsv](https://github.com/dilshod/xlsx2csv) project.

## Step 2
Run `reconcile.sh` to use the prettified World Bank data (which was extracted in Step 1) in order to modify GTD country codes.

## Step 3
Run `build.sh` to build new columns into the GTD.