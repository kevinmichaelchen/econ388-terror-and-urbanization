# Elsevier
From Elsevier's *.dtx* file, generate the template files, bibliographic styles, documentation, and class file by running `latex elsarticle.ins`. To compile the documentation, use `make all`.

# World Bank Dataset
The World Bank data is included in this repo.

## Step 1
Run `setup.sh` to extract the csv data from `data/urbanization/urbanization.zip` and write a prettified version of the CSV file into the `data/urbanization` directory.

# Global Terrorism Database
The GTD is available for download [here](http://www.start.umd.edu/gtd/contact/).
It comes in *.xlsx* format but we need it in the *.csv* format.
One way to do this is to use the [xlsx2csv](https://github.com/dilshod/xlsx2csv) repo.  

First, `cd` to where the *.xlsx* GTD file is. Then:
1. `mv gtd.xlsv ~/Desktop
2. `cd ~/Desktop`
3. `git clone https://github.com/dilshod/xlsx2csv`
4. `cd xlsx2csv`
5. `python setup.py`
  * This should put the *xlsx2csv* command in `/usr/local/bin`.
6. `time xlsx ~/Desktop/gtd.xlsx ~/Desktop/gtd.csv`
  * This takes anywhere from 90 seconds to over 7 minutes.
7. `mv ~/Desktop/gtd.csv ~/Desktop/econ388-terror-and-urbanization`
  * Assumes you haven't changed this repository's name.
  * Assumes this repository is on the desktop.


## Step 2
Run `reconcile.sh` to create a World Bank Country Code column in the GTD frame.  
This reconciles the differences in the two dataset's use of country codes.  

This step is much faster than Step 3, as it relies on the *subset* function rather than brute force iteration. Here we subset whole swathes of the GTD whose country matches a particular target (say, Northern Ireland) and we assign those instances a World Bank Country Code (say, GBR / Great Britain).

## Step 3
Run `build.sh` to create columns in the GTD whose data is drawn from the World Bank set.  

For example, for each instance's specific year and country, we add a column of that country's urban growth rate in the year of the attack.  

The initial naive solution is to iterate through all 113,113 instances.