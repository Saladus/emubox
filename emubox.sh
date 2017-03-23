#!/bin/bash
trap 'clear && exit' SIGINT

function menüü {
	clear
	echo "======================="
	echo "|   >> Emulaatorid    |"
	echo "======================="
	echo "[1] > PlayStation 1   |"
	echo "[2] > PlayStation 2   |"
	echo "[3] > Super Famicom   |"
	echo "======================="
	read -p "> " valik
	if [[ $valik == ^C ]]
		then clear && exit
	elif [[ $valik == 1 ]]
		then ps1
	elif [[ $valik == 2 ]]
		then ps2
	elif [[ $valik == 3 ]]
		then snes
	else
		menüü
	fi
}

function ps1 {
	clear
	echo "=========================="
	echo "|   >> PlayStation 1     |"
	echo "=========================|"
	echo "[1] > Mängude nimistu    |"
	echo "[2] > Käivita emulaator  |"
	echo "[0] > Menüü              |"
	echo "=========================="
	read -p "> " valik
	if [[ $valik == 0 ]]
		then menüü
	elif [[ $valik == 1 ]]
		then ls (mängukaust)/PlayStation\ 1 | less
		clear && ps1
	elif [[ $valik == 2 ]]
		then epsxe >> (logikaust)epsxe.log && ps1
	else ps1
	fi
}

function ps2 {
	clear
	echo "=========================="
	echo "|   >> PlayStation 2     |"
	echo "=========================="
	echo "[1] > Mängude nimistu    |"
	echo "[2] > Käivita emulaator  |"
	echo "[0] > Menüü              |"
	echo "=========================="
	read -p "> " valik
	if [[ $valik == 0 ]]
		then menüü
	elif [[ $valik == 1 ]]
		then ls (mängukaust)/PlayStation\ 2 | less
		clear && ps2
	elif [[ $valik == 2 ]]
		then PCSX2 >> (logikaust)/PCSX2.log && ps2
	else ps2
	fi
}

function snes {
	clear
	echo "=========================="
	echo "|   >> Super Famicom     |"
	echo "=========================="
	echo "[1] > Mängude nimistu    |"
	echo "[2] > Käivita emulaator  |"
	echo "[0] > Menüü              |"
	echo "=========================="
	read -p "> " valik
	if [[ $valik == 0 ]]
		then menüü
	elif [[ $valik == 1 ]]
		then ls (mängukaust)/SNES | less
		clear && snes
	elif [[ $valik == 2 ]]
		then zsnes >> (logikaust)/zsnes.log && snes
	else zsnes
	fi
}

menüü