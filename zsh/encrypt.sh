#!/usr/bin/env bash

# Tars and encrypts a folder
# https://linuxconfig.org/using-openssl-to-encrypt-messages-and-files-on-linux

f_name=$1

# get the last word in the input filename as use in the new file
IFS='\/'
f_name_split=(${f_name//\// })
unset IFS
# echo $f_name_split
f_tar_name=$(echo $f_name_split | grep -oE '[^ ]+$')

base_dir=~/backups/ 

# echo "tar cz $f_name | openssl enc -aes-256-cbc -out ${base_dir}${f_tar_name}${RANDOM}.tar.gz.dat"
tar cz $f_name | openssl enc -aes-256-cbc -out ${base_dir}${f_tar_name}${RANDOM}.tar.gz.dat

# Generate private key:
# openssl genrsa -out private_key.pem 1024

# Generate public key:
# openssl rsa -in private_key.pem -out public_key.pem -outform PEM -pubout

# encrypt with private key:
# openssl rsautl -encrypt -inkey public_key.pem -pubin -in encrypt.txt -out encrypt.dat 
