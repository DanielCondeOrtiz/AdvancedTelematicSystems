#!/bin/bash
clear
#Cambiamos configuracion de eth1 a estatica y le asignamos ip
cp -f ../Ficheros_Configuracion/ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-eth1
service network restart

#Instalamos la key para drbl
mkdir drbl
cd drbl
rm -f GPG-KEY-DRBL
wget http://drbl.org/GPG-KEY-DRBL
rpm --import GPG-KEY-DRBL 

#Necesario para el funcionamiento de drbl
yum install -y perl-Digest-SHA1

#Descargamos e instalamos el programa
wget http://free.nchc.org.tw/drbl-core/i386/RPMS.drbl-stable/drbl-2.25.10-drbl1.noarch.rpm
yum install -y drbl-2.25.10-drbl1.noarch.rpm

cd ..

#Actualizamos la lista de servidores de CentOS
cp -f ../Ficheros_Configuracion/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo

#Iniciamos dbrl
printf "n\n\n\n\n\n\n" | drblsrv -i
drblpush -i < ../Ficheros_Configuracion/respuestas

#Creamos usuarios nuevos
printf "sta\nsta\n" | drbl-useradd -s sta sta