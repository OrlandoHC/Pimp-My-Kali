#!/bin/bash
if [[ $EUID -ne 0 ]]; then
echo "Este script debe ser ejecutado por el usuario Root" 1>&2
exit 1
fi
# LISTA DE CAMBIOS
# Versión 1.0 beta
#-MODS
#	- Condición de Ejecución restrictiva para usuarios Root.
#	- Comprobación de Conexion a Internet, En caso de no contar con conexión el script aborta.
#	- Al finalizar, Pimp My Kali reinicia el sistema en 1 minuto para que surtan efecto las modificaciones.
#	- Dentro del Banner se agrego mi pagina web www.orlandohc.org y el @OrlandoHC esto con fines informativos y didácticos.
#	- Marcas Sleep para facil comprensión del usuario acerca proceso que se lleva a cabo en tiempo real. 
#-APPS
#	- Se Eliminó Open Office de la lista de Apps, esto para disminuir el tiempo, se tiene pensado incluir Evernote.
#
# Versión 1.1 alpha
#-MODS
#	- Interfaz que lanza el script correspondiente para personalizar Kali Linux.
#	- Desactivación De Cursos Parpadeante.
#	- Instalación de GKrellM Barra de Herramientas.
#	- Activación De Configuración Avanzada, Escritorio, Extensiones, Gnome-Shell, 
#	Nautilus, Tema, Tipografias y Ventanas (Mejor Conocido como Gnome Tweak Tool).
#	- Personalización Del Entorno Tema Numix e Iconos Elementary.
#-APPS
#	- Ark
#	- HTop
#	- Open Office
#	- Audacious
#	- Shutter
#	- Filezilla
#	- Puty
#	- K3b
#
# Versión 1.1 alpha
#-MODS
#	- Mejoras estéticas.
#	- Se cambio el nombre del dominio del server a orlandohc.ddns.net.
#	- Creación de log lista de cambios.
#	- Alsa Util (Audio Ya no Inicia en Mute)
#-APPS
#	- Tor
#	- Nethogs
#	- GTKRecord My Desktop
#	- Gdebi
#	- Flash Plugin
#
sc(){
echo -e " 
############################################################
##                                                        ##
##   __           __                                      ##
##  |__) |  |\/| |__)     |\/| \ /    |__/  /\  |    |    ##
##  |    |  |  | |        |  |  |     |  \ /~~\ |___ |    ##
##                                                        ##
##                        1.0-beta                        ##
##               By: Masterk3y (@OrlandoHC) 	            ##
##                    www.orlahdohc.org     	            ## 
##                                                        ##
############################################################
\n"
echo -e "\033[1;37mScript para Personalizar Kali Linux\033[0m \n\n "
echo -e "\033[1;37mInstrucciones: S = SI   N = NO (Mayuscula)\033[0m \n\n "
echo -e "¿Deseas Personalizar tu Kali Linux? [ \033[0;32mS\033[0m / \033[0;31mN\033[0m ]: \c ";
read respuesta
if [ $respuesta = "S" ]; then
echo -e "\033[0;31m[+]\033[0m Comprobando Conexion a Internet...";
sleep 3
if [ "`ping -c 1 www.google.com`" ]
then
	echo -e "\033[0;31m[+]\033[0m Ping Exitoso, Status = Conectado";
	sleep 3
	else
	echo -e "\033[0;31m[+]\033[0m Ping Muerto, Al parecer no tienes conexion a Internet, Verifica y reintenta nuevamente."; exit 1 
fi
sleep 3
echo -e "\033[0;31m[+]\033[0m Comenzando Personalización";
echo -e "\033[0;31m[+]\033[0m Deshabilitando Cursor Parpadeante";
gsettings set org.gnome.desktop.interface cursor-blink false
echo -e "\033[0;31m[+]\033[0m Instalando Ark ";
apt-get install ark
echo -e "\033[0;31m[+]\033[0m Instalando Gnome Tweak Tool";
apt-get install gnome-tweak-tool
echo -e "\033[0;31m[+]\033[0m Instalando HTop";
apt-get install htop
echo -e "\033[0;31m[+]\033[0m Instalando Audacious ";
apt-get install audacious
echo -e "\033[0;31m[+]\033[0m Instalando Shutter";
apt-get install shutter
echo -e "\033[0;31m[+]\033[0m Instalando Filezilla";
apt-get install filezilla
echo -e "\033[0;31m[+]\033[0m Instalando Putty";
apt-get install putty
echo -e "\033[0;31m[+]\033[0m Instalando K3b";
apt-get install k3b
echo -e "\033[0;31m[+]\033[0m Instalando TOR";
apt-get install tor
echo -e "\033[0;31m[+]\033[0m Instalando NetHogs";
apt-get install nethogs
echo -e "\033[0;31m[+]\033[0m Instalando GTk Record My Desktop";
apt-get install gtk-recordmydesktop recordmydesktop remmina -y
echo -e "\033[0;31m[+]\033[0m Instalando GDeby";
apt-get install gdebi -y
echo -e "\033[0;31m[+]\033[0m Incorporando Flash Plugin";
apt-get install apt-get flashplugin-nonfree
echo -e "\033[0;31m[+]\033[0m Configurando Audio";
apt-get install alsa-utils -y
echo -e "\033[0;31m[+]\033[0m Instalando GKrellM";
apt-get install gkrellm
echo -e "\033[0;31m[+]\033[0m Descargando Skins De GKrellM";
wget http://orlandohc.ddns.net/downloads/GKrellM-Skins.tar.gz
echo -e "\033[0;31m[+]\033[0m Descomprimiendo Skins";
for i in $(ls *.tar.gz)
do
tar -xzvf $i;
done
for i in *.tar.gz; 
do 
tar -xzvf $i; 
done
mv GKrellM-skins/  ~/home
echo -e "\033[0;31m[+]\033[0m Descargando Archivos Para Personalizar Entorno";
wget http://orlandohc.ddns.net/downloads/numix.zip
wget http://orlandohc.ddns.net/downloads/elementary.zip
echo -e "\033[0;31m[+]\033[0m Descomprimiendo Archivos Para Personalizar Entorno";
for i in $(ls *.zip)
do
unzip $i
done
mv Numix/ /usr/share/themes
mv elementary/ /usr/share/icons
sleep 3
echo -e $green"\033[0;31m[+]\033[0m Instalación Exitosa!";
sleep 3
echo -e "\033[0;31m[+]\033[0m Kali Se Reiniciará para que los cambios surtan efecto. Guarda tu trabajo"
shutdown -r +1
fi
if [ $respuesta = "N" ]; then
echo -e "\033[0;31m \n[-] Operación Cancelada [-]\033[0m";
fi
}
sc
