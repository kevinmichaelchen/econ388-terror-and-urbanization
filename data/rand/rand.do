clear
local path "~/Desktop/ECON388/Final"
use "`path'/RAND.csv"
capture log close
log using "`path'/RAND.log", text replace

* order variables alphabetically
order *, sequential
reg a b-d, f-h

gen hot = temp > 70 if !missing(temp)
regress riot temp
mean height if hot */ mean height during hot day */

log close