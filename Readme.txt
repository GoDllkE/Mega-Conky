# Mega-Conky
# Instructions

Minumum Requisites)

    Conky with lua support)
    You should have conky with lua support, for arch linux users, you can install the "conky-lua" package.

Installation Steps)

    1) After install the conky with lua support and downloaded this file, there's two ways to install it, of course, there's more, but i'll say two of then. First one is by the script in shell i made and the other manually.

    2) Install step by "install.sh"

    2.1) Run the script as your normal user and it'll do all the trick.

        # ./install.sh

    2.2) After running it, add the file "start-conky.sh" to the initialization of your OS or use "Conky-Manager" package to do it.
    2.3) Run the "start-conky.sh" script.
    2.4) Enjoy!

    3) Install step manually

    3.1) Move the folder "Mega-Conky" to the ".conky" inside of your home folder, the path should be like "/home/<your-user/.conky/Mega-Conky/"
    3.2) After moving it, Add permission of execution to the file "start-conky.sh", like:
        
        # chmod +x start-conky.sh

    3.3) After set the permition to it, add the file "start-conky.sh" to the initialization of your OS or use "Conky-Manager" package to do it.
    3.4) Run the "start-conky.sh" script.
    3.5) Enjoy!

Final Observations)

    1) The lines on vertial are bounded to use battery as the variable to made then, you can change it on "script.lua" inside the folder "Script". The path to it should be "/home/<your-user/.conky/Mega-Conky/Script/script.lua", where to modify i believe i comment on it to be more easer to find it.

    2) There's a image inside of the central ring, you should adjust it to the desired pic you want. Another thing, this image is responsible to make the separation on time rings, adjust and run and you'll see it.

    3) This conky was made for laptops, but you can adjust to another resolutions as well, i found in comments, that you can change the aligment of X and Y on "conkyrc" file to your desired resoltuion, and i think changing the "gap_x" propety to 604 and 382 for the "gap_y" should do the trick, feel free to change it.

    4) I don't know if is a bug or not, but with time, this conky get's a lot of RAM, i mean, it starts consuming 32Mb of RAM and after a long time on, he reach high levels like 312Mb on RAM. I'm tryng a solution, but be aware of it. I think can be the dmesg exection where conky save all data and with time get big.
