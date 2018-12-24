#!/bin/bash 

rm *.t7
rm *.hdf5
rm linux_train.txt
rm linux_test.txt

COUNTER=100
until [  $COUNTER -lt 10 ]; do
 sed -n 671,692p linux.txt >> linux_train.txt 
 sed -n 671,692p linux.txt >> linux_test.txt 
 let COUNTER-=1
done

python ../preprocess.py linux_train.txt linux_test.txt 10 30 train
th ../main.lua -data_file train.hdf5 -val_data_file train-val.hdf5 -epochs 20 -gpuid -1 -rnn_size 128 -word_vec_size 128 -savefile lm.t7
th ../get_states.lua -gpuid -1 -data_file train.hdf5 -output_file states.hdf5 -rnn_size 128 -checkpoint_file $(ls lm*20*)
th ../get_lookuptable.lua -gpuid -1 -output_file embeddings.hdf5 -checkpoint_file $(ls lm*20*)
