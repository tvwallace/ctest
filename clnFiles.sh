#!/bin/bash
#

#specs.csv, change NA to 0
#and make specs integers (not factors)
cd /home/wally/kaggle/cat/cdat

cp specs.csv nspec.csv
sed "s/NA/0/g" nspec.csv > ns2.csv 
sed "s/SP-//g" ns2.csv > nspec.csv
rm ns2.csv

cp bill_of_materials.csv bom.csv
sed "s/NA/0/g" bom.csv > b2.csv 
sed "s/C-//g" b2.csv > bom.csv
rm b2.csv

#about 300 tubes don't have material spec
#just add fake factor
cp tube.csv ntube.csv
sed "s/NA/SP-9999/g" ntube.csv > n2.csv
mv n2.csv ntube.csv

#1st test, supplier (in train_set) as int or factor
cp train_set.csv ntrn.csv
sed "s/S-//g" ntrn.csv > n2.csv
mv n2.csv ntrn.csv
cp test_set.csv ntst.csv
sed "s/S-//g" ntst.csv > n2.csv
mv n2.csv ntst.csv
