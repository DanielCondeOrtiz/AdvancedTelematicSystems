#!/bin/bash
clear

#Descargamos ypserv y descomprimimos el archivo
wget http://www.linux-nis.org/download/ypserv/ypserv-2.32.1.tar.bz2
tar -jxvf ypserv-2.32.1.tar.bz2

cd ypserv-2.32.1

#Iniciamos el proceso de configuracion
./configure

#Compilamos e instalamos
make
make install

cd ..

#Instalamos DRBL igual que mediante una instalacion sin compilacion
./instalacion_desde_paquetes.sh