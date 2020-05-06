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

# Dirty Build...
function make_dirty() {
. b*/e*
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
lunch rebellion_X00T-userdebug
export REBELLION_OFFICIAL=true
source ~/.bashrc
export USE_CCACHE=1
ccache -M 300G
brunch X00T
}

# Clean Build...
function make_clean () {
make clean
make installclean
. b*/e*
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
lunch rebellion_X00T-userdebug
export REBELLION_OFFICIAL=true
source ~/.bashrc
export USE_CCACHE=1
ccache -M 300G
brunch X00T
}

# Choice
  echo -e "${CLR_BLD_RED}Would you like to make Dirty or Clean Build ??: ${CLR_RST}"
  echo -e "${CLR_BLD_BLU} 1.Dirty${CLR_RST}"
  echo -e "${CLR_BLD_BLU} 2.Clean${CLR_RST}"
  echo -n "${CLR_BLD_BLU} Your choice : ? ${CLR_RST}"
  read build

case $ch in
  1) echo -e "${CLR_BLD_RED}Make a Dirty Build{CLR_RST}"
     make_dirty ;;
  2) echo -e "${CLR_BLD_RED}Let's cook a Clean Build{CLR_RST}"
     make_clean ;;
esac

if [ "$build" = "1" ]; then
     echo -e "${CLR_BLD_RED}Making a Dirty Build...!${CLR_RST}"
     make_dirty
else
     echo -e "${CLR_BLD_GRN}Cooking a Clean Build...!${CLR_RST}"
     make_clean
fi
