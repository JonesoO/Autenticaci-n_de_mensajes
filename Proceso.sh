#!/bin/bash

# generar certificado con claves publicas y privadas
echo"Generando claves"
sudo openssl genrsa -out certificado.crt 2048


# Extraer mediante rsa las claves publica y privada 
echo"Extraer claves der certificado"
sudo openssl rsa -in certificado.crt -out clave_publica.key -pubout

sudo openssl rsa -in certificado.crt -out clave_privada.key

# Cifrar con clave publica rsa
echo"Cifrando con clave publica"
sudo openssl rsautl -in texto.txt -out texto.rsa -inkey clave_publica.key -pubin -encrypt

# Descifrar con la clave privada
echo"Descifrando con clave privada"
sudo openssl rsautl -in texto.rsa -out texto_recuperado.txt -inkey clave_privada.key -decrypt

# Se puede descrifrar on el certificado
# sudo openssl rsautl -in texto.rsa -out texto_recuperado.txt -inkey certificado.crt -decrypt

# Para cifrar imagen 
echo"Cifrando archivo(imagen)"
sudo openssl enc -aes-256-cbc -salt -in HTTPS_TLS.png -out HTTPS_TLS.png.enc -k UNAN

# Para descifrar la imagen 
echo"Descifrando archivo(imagen)"
sudo openssl enc -aes-256-cbc -d -in HTTPS_TLS.png.enc -out HTTPS_TLS_N.png -k UNAN

