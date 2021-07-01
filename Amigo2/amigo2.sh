#!/bin/bash

# generar certificado con claves publicas y privadas
sudo openssl genrsa -out certificado_2.crt 2048

# Extraer mediante rsa las claves publica y privada 
sudo openssl rsa -in certificado_2.crt -out clave_publica_2.key -pubout

sudo openssl rsa -in certificado_2.crt -out clave_privada_2.key

# Cifrar con clave publica de amigo 1
sudo openssl rsautl -in Clave_2.txt -out clave_1.rsa -inkey clave_publica_1.key -pubin -encrypt

# Descifrar con la clave privada amigo 2
sudo openssl rsautl -in clave_2.rsa -out clave_recuperada.txt -inkey clave_privada_2.key -decrypt

# Para cifrar imagen  amigo 2
sudo openssl enc -aes-256-cbc -salt -in leon.jpg -out leon_amigo2.enc -k UNANleon2

# Para descifrar la imagen de amigo 1
sudo openssl enc -aes-256-cbc -d -in pikachu_amigo1.enc -out pikachu_N2.jpg -k UNANleon1
