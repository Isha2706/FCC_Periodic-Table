#!/bin/bash

# PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

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