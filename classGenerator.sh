###################################################################################################
#!/bin/bash
# Author: Ubu
###################################################################################################

########################################### DESCRIPTION ###########################################
# ClassGenerator
#	Script which allow to create quickly a new class in every language listed in ./Ressources/
#	This script create the base of the class:
#		- Header
#		- Source
#
# Install
#	The script and the Ressources directory should be copied in the ~/.bin directory
#
# Use
#	./ClassGenerator <className> <language>
#
# Problem/Remarks
#	Contact ubald2b@gmail.com
#
# Note
#	You can add new languages to this script by adding a new directory in "./Ressources"
#	You also need to add another line in this script to add extensions (for source file)
###################################################################################################

############################################ FUNCTIONS ############################################
# function red
#	Allow to write an alert/error message
red() 
{
	echo -e "\033[01;31m $1 \033[00m"
}

# function green
#	Allow to write an information message
green() 
{
	echo -e "\033[00;32m $1 \033[00m"
}
###################################################################################################

Path="$HOME/.bin"

# Check the position parameters
if [ $# -ne 2 ]
then
	red "Use: $0 <className> <language>"
	exit 1
fi

# Check the language asked
# TODO the language shouldn't be case sensitive...
temp=`ls $Path/Ressources/`
temp=`echo $temp | sed 's/ /,/g'`
if [[ $temp != *$2* ]]
then
	red "Error: Language not supported..."
	exit 1
fi

# Initialises some variables
date=`date "+%d\/%m\/%Y"`
typeset -u upperCase
upperCase=$1

# Operating the header file
green "== Generating Header..."
green "\t+ Copying standard file..."
	cp $Path/Ressources/$2/header ./
	mv ./header ./$1.h
green "\t+ Personalizing..."
	sed -i "s/className/$1/g" ./$1.h
	sed -i "s/DATE/$date/g" ./$1.h
	sed -i "s/CLASS_NAME/$upperCase/g" ./$1.h
green "\t Done."

# Operating the source file
green "== Generating source..."
case $2 in
	"c++" | "C++")
		fileExtension=".cpp"
		;;
# Type the new language here
# Example:
#	"java")
#		fileExtension=".jar"
#		;;
esac
green "\t+ Copying standard file..."
	cp $Path/Ressources/$2/code ./
	mv ./code ./$1$fileExtension
green "\t+ Personalizing..."
	sed -i "s/className/$1/g" ./$1$fileExtension
	sed -i "s/DATE/$date/g" ./$1$fileExtension
green "\t Done."

green "== ClassGeneration done."
