#! /bin/bash
# --------------------------------------------------------------#
# By GoDlikE
# Version 2.00-0
# --------------------------------------------------------------#
# Install conky in this machine

# Echo colors
RED="\e[1;31m"
GREEN="\e[1;32m"
BLUE="\e[1;34m"
WHITE="\e[1;37m"
RESET="\e[0m"

# Message
echo -e "${BLUE}:: ${WHITE}Checking conky folder...${RESET}"

# Check file directories
if [[ -d "$HOME/.conky" ]]; then
    echo -e "${BLUE}:: ${WHITE}Folder \"${GREEN}.conky${WHITE}\" exist in your home directory!${RESET}"
else
    echo "${BLUE}:: ${WHITE}Creating \".conky\" folder in your home directory${RESET}"
    mkdir "$HOME/.conky"
fi

# Move files
echo -e "${BLUE}:: ${WHITE}Moving Conky files to .conky folder...${RESET}"
cp Mega-Conky/ "$HOME"/.conky/Mega-Conky/ -rf
sleep 1

# Set permissions of execution
echo -e "${BLUE}:: ${WHITE}Granting permission of execution to files...${RESET}"

echo -ne "$\t${WHITE} start-conky.sh: ${RESET}"
chmod +x "$HOME"/.conky/Mega-Conky/start-conky.sh > /dev/null
if [[ $? -eq 0 ]]; then
    echo -e "${GREEN} Sucess! ${RESET}"
else
    echo -e "${RED} Error... ${RESET}"
fi

echo -ne "$\t${WHITE} script.lua: ${RESET}"
chmod +x "$HOME"/.conky/Mega-Conky/Scripts/script.lua > /dev/null
if [[ $? -eq 0 ]]; then
    echo -e "${GREEN} Sucess! ${RESET}"
else
    echo -e "${RED} Error... ${RESET}"
fi

echo -ne "$\t${WHITE} script.lua: ${RESET}"
chmod +x "$HOME"/.conky/Mega-Conky/Scripts/netpeak.lua > /dev/null
if [[ $? -eq 0 ]]; then
    echo -e "${GREEN} Sucess! ${RESET}"
else
    echo -e "${RED} Error... ${RESET}"
fi

echo
if [[ "$ERROR" == 1 ]]; then
    echo -e "${WHITE} Status: ${RED} Error: ${WHITE}Something went wrong...${RESET}"
else
    echo -e "${WHITE} Status: ${GREEN} Done${WHITE}!${RESET}"
fi

cd "$HOME"/.conky/ || exit
sleep 1

# Check for run it
echo -e "${BLUE}:: ${WHITE}Run it? (S/n) ${RESET}"
echo -en "${WHITE}Command: ${RESET}"
read -r ASS
if [[ "$ASS" == "s" ]]; then
    echo -e "${BLUE}:: ${WHITE}Starting conky... ${RESET}"
    "$HOME"/.conky/Mega-Conky/start-conky.sh
else
    echo -e "${BLUE}:: ${WHITE} Script done! Press enter to continue. ${RESET}"
    read -r
fi
