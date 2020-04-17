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

echo -e ""
echo -e "${CLR_BLD_RED} █████╗ ███████╗████████╗ ██████╗ ███╗   ██╗      ███╗   ███╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗███╗   ██╗ ${CLR_RST}"
echo -e "${CLR_BLD_RED}██╔══██╗██╔════╝╚══██╔══╝██╔═══██╗████╗  ██║      ████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║████╗  ██║${CLR_RST}"
echo -e "${CLR_BLD_RED}███████║███████╗   ██║   ██║   ██║██╔██╗ ██║█████╗██╔████╔██║███████║██████╔╝   ██║   ██║██╔██╗ ██║██╔██╗ ██${CLR_RST}"
echo -e "${CLR_BLD_RED}██╔══██║╚════██║   ██║   ██║   ██║██║╚██╗██║╚════╝██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║██║╚██╗██║${CLR_RST}"
echo -e "${CLR_BLD_RED}██║  ██║███████║   ██║   ╚██████╔╝██║ ╚████║      ██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ██║██║ ╚████║██║ ╚████║${CLR_RST}"
echo -e "${CLR_BLD_RED}╚═╝  ╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝      ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝${CLR_RST}"
echo -e ""
echo -e "${CLR_BLD_GRN}Its Rebellion Stuff...${CLR_RST}"
echo -e ""

# Create folder
echo -e ""
echo -e "${CLR_BLD_GRN}Creating Rebellion folder...${CLR_RST}"
mkdir rebellion
echo -e ""
echo -e "${CLR_BLD_GRN}Rebellion Folder has been created Succussfully...${CLR_RST}"
echo -e ""

# Init rebellion repos
echo -e ""
echo -e "${CLR_BLD_BLU}Initializing the repos...${CLR_RST}"
cd rebellion && repo init -u https://github.com/Rebellion-Hub/Manifest_Rebellion.git -b ten
echo -e "${CLR_BLD_BLU}Repo has been initialized Succussfully...${CLR_RST}"
echo -e ""

# Sync repos
echo -e ""
echo -e "${CLR_BLD_PPL}Lets sync the repos...${CLR_RST}"
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo -e "${CLR_BLD_PPL}Repo has been synced succussfully...${CLR_RST}"
echo -e ""

# Clone my device trees
echo -e ""
echo -e "${CLR_BLD_YLW}Clone device trees...${CLR_RST}"
git clone https://github.com/Rebellion-Hub-Devices/device_Asus_X00T.git -b ten device/asus/X00T
git clone https://github.com/pranavkapoor001/kernel_asus_sdm660.git -b Stardust kernel/asus/sdm660
git clone https://github.com/pranavkapoor001/proprietary_vendor_asus.git -b lineage-17.1 vendor/asus
echo -e "${CLR_BLD_YLW}Device trees are succussfully cloned...${CLR_RST}"
echo -e ""

option=0

function make_quit() {
return null;
}

function make_rom() {
. b*/e*
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true
lunch rebellion_X00T-userdebug
export REBELLION_OFFICIAL=true
source ~/.bashrc
export USE_CCACHE=1
ccache -M 300G
brunch X00T
}

  echo -e " Select if you want to Build or Not : "
  echo -e " 1.Yes Let's make Rebellion"
  echo -e " 2.No "
  echo -n " Your choice : ? "
  read build

case $ch in
  1) echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     echo -e "          	Building Rebellion Hurray                            "
     echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     make_rom ;;
  2) echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     echo -e "          	Ohh NO...                                            "
     echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     do_quit ;;
esac

if [ "$build" = "1" ]; then
     echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     echo -e "                   Building Rebellion                                  "
     echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     make_rom
else
     echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
     echo -e "                   Build has been Quited                               "
     echo -e "${CLR_BLD_GRN}***********************************************${CLR_RST}"
fi

echo -e ""
echo -e "${CLR_BLD_CYN}Build Completed...${CLR_RST}"

# Push to gdrive
echo -e ""
echo -e "${CLR_BLD_CYN}Uploading to Gdrive...${CLR_RST}"
cd ~
cd r*/o*/t*/p*/X*
gdrive upload R*.zip
echo -e ""
echo -e "${CLR_BLD_RED}Upload Completed...${CLR_RST}"
