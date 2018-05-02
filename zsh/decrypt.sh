#!/usr/bin/env bash

# Decrypts and untars a folder
# https://linuxconfig.org/using-openssl-to-encrypt-messages-and-files-on-linux

f_name=$1

# echo "tar cz $f_name | openssl enc -aes-256-cbc -out ${base_dir}${f_tar_name}${RANDOM}.tar.gz.dat"
openssl enc -aes-256-cbc -d -in $f_name.tar.gz.dat | tar xz

# decrypt with private key:
# openssl rsautl -decrypt -inkey private_key.pem -in encrypt.dat -out new_encrypt.txt
