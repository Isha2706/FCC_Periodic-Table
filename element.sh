#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if argument was passed
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Determine input type
if [[ $1 =~ ^[0-9]+$ ]]; then
  CONDITION="atomic_number=$1"
elif [[ $1 =~ ^[A-Z][a-z]?$ ]]; then
  CONDITION="symbol='$1'"
else
  CONDITION="name='$1'"
fi

# Query the database
ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
  FROM elements 
  JOIN properties USING(atomic_number) 
  JOIN types USING(type_id) 
  WHERE $CONDITION;")

# Check result
if [[ -z $ELEMENT ]]; then
  echo "I could not find that element in the database."
else
  IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELT BOIL <<< "$ELEMENT"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
fi