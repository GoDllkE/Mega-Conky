# Mega-Conky
# Just Another Desktop Conky

	This conky is Mconky by "mortazamakasaadi" with some bug fixes and improvements by GoDlikE

Installation Setup)

    0 - If you have installed conky on your machine, you'll have to unistall it because this one really need that version with lua support, in my case, i got with the lua and nvidia support.

    1 - After installing the conky with lua support, get this files on your home directory, inside the folder ".conky". (if you don't have it, create it).

    2 - After moving it, if you change the name or something else, check "conkyrc" and "script.lua" for respective path's inside and change any desired value.

    3 - Change line 392 in "script.lua" to set the image work. (keep the absolute path please).

    4 - Run the script "start-conky.sh" and suprise! 

Observations)
    1 - The lines on vertical are bounded with battery percentage, change it on "script.lua" file to show then

    2 - (Optional) Change desktop wallpaper and "conky.png" to get a more badass.

    3 - I use in 1366x786 and get nice (laptop). But, if you use in a TV or something with 1920x1080, you can change line 26 in "conkyrc" file according to your screen resolution. And lines 28 and 29 to center the conky, i think, changing to 604 the "gap_x" and 382 for "gap_y" should do the trick, feel free to change it.

