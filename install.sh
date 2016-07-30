#! /bin/bash
# --------------------------------------------------------------- #
# By GoDlikE
# Version 1.00-0
# --------------------------------------------------------------- #
# Install conky in this machine

# Check file directories
if [[ -d "$HOME/.conky" ]]; then
    echo "folder \".conky\" founded in your home directory!"
else
    echo "Creating \".conky\" folder in your home directory"
    mkdir "$HOME/.conky"
fi

# Move files
echo "Moving Conky files to .conky folder..."
cp Mega-Conky "$HOME"/.conky -rf
sleep 1

# Set permissions of execution
chmod +x "$HOME"/.conky/Mega-Conky/start-conky.sh

echo "Everything moved!"
cd "$HOME"/.conky/ || exit
sleep 1

# Check for run it
echo "Run it? (S/n)"
echo -n "Command: "
read -r ASS

if [[ "$ASS" == "s" ]]; then
    echo "Starting conky"
    "$HOME"/.conky/Mega-Conky/start-conky.sh
else
    echo "Done - Press enter to continue."
    read -r
fi
