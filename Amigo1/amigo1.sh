#!/bin/bash

# generar certificado con claves publicas y privadas
sudo openssl genrsa -out certificado_1.crt 2048

# Extraer mediante rsa las claves publica y privada 
sudo openssl rsa -in certificado_1.crt -out clave_publica_1.key -pubout

sudo openssl rsa -in certificado_1.crt -out clave_privada_1.key

# Cifrar con clave publica de amigo 2
sudo openssl rsautl -in Clave_1.txt -out clave_2.rsa -inkey clave_publica_2.key -pubin -encrypt

# Descifrar con la clave privada amigo 1
sudo openssl rsautl -in clave_1.rsa -out clave_recuperada.txt -inkey clave_privada_1.key -decrypt

# Para cifrar imagen  amigo 1
sudo openssl enc -aes-256-cbc -salt -in pikachu.jpg -out pikachu_amigo1.enc -k UNANleon1

# Para descifrar la imagen  amigo 2
sudo openssl enc -aes-256-cbc -d -in leon_amigo2.enc -out leon_N1.jpg -k UNANleon2
