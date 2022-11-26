#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~ At Your Service ~~~\n"

MAIN_MENU() {
	if [[ $1 ]]
	then
		echo -e "\n$1"
	fi
	SERVICES_LIST=$($PSQL "select * from services order by service_id")
	# display services
	echo -e "Here are services we offer:\n"
	echo  "Please choose your service, enter service id, your phone and desired time."
	echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE_NAME
	do
		echo "$SERVICE_ID) $SERVICE_NAME"
	done
	SERVICE_SELECTION
}

SERVICE_SELECTION() {
		read SERVICE_ID_SELECTED
		SELECTED_SERVICE_RESULT=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
		if  [[ -z $SELECTED_SERVICE_RESULT ]]
		then 
			MAIN_MENU
		else
			echo -e "\nWhat's your phone?"
			read CUSTOMER_PHONE
			# check customer name
			CUSTOMER_NAME=$($PSQL "SELECT name FROM CUSTOMERS WHERE phone='$CUSTOMER_PHONE'")
			CUSTOMER_ID=$($PSQL "SELECT customer_id FROM CUSTOMERS WHERE phone='$CUSTOMER_PHONE'")
			# if not exists
			if [[ -z $CUSTOMER_NAME ]]
			then
				echo "Please enter your name."
				read CUSTOMER_NAME
				INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
				CUSTOMER_ID=$($PSQL "SELECT CUSTOMER_ID FROM CUSTOMERS WHERE phone='$CUSTOMER_PHONE'")
			fi
			# choose time
			echo -e "\nWhen do you want the service?"
			read SERVICE_TIME
			SELECTED_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
			SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
			echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
			
		fi
}
MAIN_MENU

