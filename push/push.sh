#!/bin/bash

CLR_RST=$(tput sgr0)                        ## reset flag
CLR_RED=$CLR_RST$(tput setaf 1)             #  red, plain
CLR_GRN=$CLR_RST$(tput setaf 2)             #  green, plain
CLR_YLW=$CLR_RST$(tput setaf 3)             #  yellow, plain
CLR_BLU=$CLR_RST$(tput setaf 4)             #  blue, plain
CLR_PPL=$CLR_RST$(tput setaf 5)             #  purple,plain
CLR_CYA=$CLR_RST$(tput setaf 6)             #  cyan, plain
CLR_BLD=$(tput bold)                        ## bold flag
CLR_BLD_RED=$CLR_RST$CLR_BLD$(tput setaf 1) #  red, bold
CLR_BLD_GRN=$CLR_RST$CLR_BLD$(tput setaf 2) #  green, bold
CLR_BLD_YLW=$CLR_RST$CLR_BLD$(tput setaf 3) #  yellow, bold
CLR_BLD_BLU=$CLR_RST$CLR_BLD$(tput setaf 4) #  blue, bold
CLR_BLD_PPL=$CLR_RST$CLR_BLD$(tput setaf 5) #  purple, bold
CLR_BLD_CYA=$CLR_RST$CLR_BLD$(tput setaf 6) #  cyan, bold

option=0

# For test Builds
function push_gdrive() {
cd ~
cd o*/t*/p*/X*
gdrive upload R*.zip
}

# For Rebelized Builds
function push_sf() {
sftp abhat993@frs.sourceforge.net
cd /home/frs/project/rebellion-os/X00T
put R*.zip
exit
}

  echo -e " Select Where you want to Push your Builds: "
  echo -e " 1.Gdrive"
  echo -e " 2.Source Forge"
  echo -n " Your choice : ? "
  read push

case $ch in
  1) echo -e "${CLR_BLD_GRN}Push To Gdrive{CLR_RST}"
     push_gdrive ;;
  2) echo -e "${CLR_BLD_GRN}Push To Source Forge{CLR_RST}"
     push_sf ;;
esac

if [ "$push" = "1" ]; then
     echo -e "${CLR_BLD_GRN}Uploading to Gdrive...!${CLR_RST}"
     push_gdrive
     echo -e "${CLR_BLD_GRN}Build has been uploaded to Gdrive Succussfully...!${CLR_RST}"
else
     echo -e "${CLR_BLD_GRN}Uploading to Sourceforge...!${CLR_RST}"
     push_sf
     echo -e "${CLR_BLD_GRN}Build has been uploaded to Sourceforge Succussfully...!${CLR_RST}"
fi

