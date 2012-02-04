CLASS GENERATOR
===============

You need a script to create quickly new classes in C++, Java...etc?
classGenerator is designed for you !

1- Install
----------
The script and the Ressources directory should be copied in the ~/.bin directory
And the ~/.bin directory should be added to the $PATH
Finally, you can create an alias in the bashrc file:
	>alias <commande>='classGenerator.sh'
			
2- Use
------
classGenerator <className> <language>
It will generate the header and source corresponding
	
3- Improvement
--------------
You can add new languages to this script by adding a new directory in "./Ressources"
You probably need to personnalize architecture files too.
You also need to add another line in the script to add extensions (for source file)
		
String reserved in architecture files:
*		"className"
*		"DATE"
*		"CLASS_NAME"
			
4- Working on
-------------
Adding new languages in the Ressources directory.
Allow the user to not personnalize the architecture files.
		
5- Problem/Remarks
------------------
Ubu: ubald2b@gmail.com
