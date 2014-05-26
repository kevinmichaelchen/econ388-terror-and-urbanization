# Elsevier
From Elsevier's *.dtx file, generate the template files, bibliographic styles, documentation, and class file by running `latex elsarticle.ins`. To compile the documentation, use `make all`.

# World Bank Dataset
The World Bank data is included in this repo.
If the csv file does not exist in the `data/urbanization` directory, then run `setup.sh`.
This will extract the csv data from `data/urbanization/urbanization.zip`, prettify the columns, and save the result into `data/urbanization/new_urban.csv`.

# Global Terrorism Database
The GTD is available for download [here](http://www.start.umd.edu/gtd/contact/).
To reconcile GTD countries with World Bank country codes, run `reconcile.sh`.