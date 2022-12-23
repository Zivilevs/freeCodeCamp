#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN_QUERY() {
	ELEMENT_INFO=$($PSQL "select properties.atomic_number, symbol, type, name, atomic_mass, melting_point_celsius, boiling_point_celsius
											 from properties join elements on properties.atomic_number=elements.atomic_number 
											 join types on properties.type_id=types.type_id where $1='$2'")
	if [[ ! -z $ELEMENT_INFO ]]
		then
						echo $ELEMENT_INFO | while IFS='|' read atomic_number symbol type name atomic_mass melting_point boiling_point
							do
								echo -n "The element with atomic number $atomic_number is $name ("$symbol"). "
								echo -n "It's a $type, with a mass of $atomic_mass amu. $name has a melting point "
								echo "of $melting_point celsius and a boiling point of $boiling_point celsius."
							done
		else
					echo "I could not find that element in the database."
	fi
}


if [ -z "$1" ]
	then
		echo "Please provide an element as an argument."
	else
		# check if it is an atomic_number
		if [[ $1 =~ ^[0-9]{1,2}$ ]]
			then
				MAIN_QUERY "properties.atomic_number" "$1"
		# check if it is a symbol
		elif [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
			then
				MAIN_QUERY "symbol" "$1"
		# check if it is a name
		else
			MAIN_QUERY "name" "$1"
		fi
fi

