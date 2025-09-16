//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	/* {"⌨", "sb-kbselect", 0, 30}, */
	{"", "scripts/playerctl_music.sh",	0,	11},
	{"| ", "scripts/sb_internet.sh",	30,	12},
	{"| ", "scripts/sb_cpu.sh",	         1,  15},
	{"| ", "scripts/sb_ram.sh",	         1,  14},
	{"| ", "scripts/sb_timedate.sh",	60,	13},
	
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = " ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
