# Mega-Conky

 ![screenshot](https://github.com/GoDllkE/Mega-Conky/blob/master/Mega-Conky/Pictures/Mega-Conky-Desktop.png)
 ![screenshot](https://github.com/GoDllkE/Mega-Conky/blob/master/Mega-Conky/Pictures/Mega-Conky-Wireless.png)
-> Awsome no?

### Installation
    - Download the Mega-conky folder and the install.sh
    - Install conky with lua support (see below)
    - Run [install.sh](https://github.com/GoDllkE/Mega-Conky/blob/master/install.sh)
    - Enjoy the conky :D
     
    OR
    
    - Clone this repo https://github.com/GoDllkE/Mega-Conky.git
    - Copy everything to .conky folder inside your home (should be like $HOME/.conky/Mega-Conky)
    - (Optional) Change line 392 from [script.lua](https://github.com/GoDllkE/Mega-Conky/blob/master/Mega-Conky/Scripts/script.lua), changing 'user' to you username (keep absolute path to not bug it).
    - Run the [start-conky.sh](https://github.com/GoDllkE/Mega-Conky/blob/master/Mega-Conky/start-conky.sh) inside Mega-Conky folder and see your desktop getting badass haha.
    - Enjoy the conky :D
    
### Conky with lua support
    For now, i can say only for Arch linux users because it's the only system i tested until now. Need a conky with lua support. 
    For arch linux users, the [conky-lua](https://aur.archlinux.org/packages/conky-lua/) will be enouth to run it. To download it, just type:
    
        $ pacman -S conky-lua
    
    This should do the trick to run this conky, but, if you have a nvidia graphic card, i really recommend to install a version that have the support for the nvidia too, you can get it in AUR [conky-lua-nv](https://aur.archlinux.org/packages/conky-lua-nv/). If you use yaourt as your package manager to get from [AUR](https://www.archlinux.org/), just type:
    
        $ yaourt -S conky-lua-nv 
    
    All this should do the trick.
    For more information about conky for arch linux, see the ArchWiki about conky, here [Conky - ArchWiki](https://wiki.archlinux.org/index.php/conky).
    
    For more details you can read [readme file](https://github.com/GoDllkE/Mega-Conky/blob/master/Mega-Conky/readme-info.txt) inside the Mega-Conky folder for more details about how to install and other things.
