#!/bin/bash

# PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if argument was passed
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi