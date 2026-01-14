#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

services=$($PSQL "SELECT * from services")

main_menu (){
  if [[ -n $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?"
  fi
  
  echo "$services" | while IFS='|' read -r service_id service_name; do
    echo "$service_id) $service_name"
  done
  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED =~ ^[+-]?[0-9]+$ ]];
  then
    valid_choice=$($PSQL "SELECT name from services where service_id = $SERVICE_ID_SELECTED")
    if [[ -z $valid_choice ]]
    then
      main_menu "I could not find that service. What would you like today?"
    else
      book_appointment $valid_choice $SERVICE_ID_SELECTED
    fi
  else
    main_menu "I could not find that service. What would you like today?"
  fi
}

book_appointment()
{
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  customer_id=$($PSQL "SELECT customer_id from customers where phone = '$CUSTOMER_PHONE'")
  if [[ -z $customer_id ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    insert_customer_result=$($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    echo $insert_customer_result
    customer_id=$($PSQL "SELECT customer_id from customers where phone = '$CUSTOMER_PHONE'")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name from customers where phone = '$CUSTOMER_PHONE'")
  fi

  echo -e "\nWhat time would you like your $1, $CUSTOMER_NAME?"
  read SERVICE_TIME
  insert_appointment_result=$($PSQL "insert into appointments(customer_id, service_id, time) values ($customer_id, $2, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."
}

main_menu
