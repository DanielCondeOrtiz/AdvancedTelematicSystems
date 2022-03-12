#Descargamos la iso
wget https://sourceforge.net/projects/gparted/files/gparted-live-stable/0.30.0-1/gparted-live-0.30.0-1-i686.iso

#Iniciamos drbl-sl para poner la imagen a disposicion de los clientes
printf "\n\n" | drbl-sl -i gparted-live-0.30.0-1-i686.iso