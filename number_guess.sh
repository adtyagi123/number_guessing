#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN()
{
  #Username input
  echo Enter your username:
  read USERNAME

  USERNAME_ID=$($PSQL " SELECT user_id FROM users WHERE username = '$USERNAME' ")

  #Check if the user is in database already: 
  if [[ -z $USERNAME_ID ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
    #Add username to the table
    USERNAME_INSERT=$($PSQL " INSERT INTO users (username) VALUES ('$USERNAME') ")
    USERNAME_ID=$($PSQL " SELECT user_id FROM users WHERE username = '$USERNAME' ")

  #If username if in the table: 
  else
    GAMES_PLAYED=$($PSQL " SELECT COUNT(user_id) FROM games WHERE user_id = '$USERNAME_ID' ")
    BEST_GAME=$($PSQL " SELECT MIN(guess) FROM games WHERE user_id = '$USERNAME_ID' ")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    
  fi

  #Call function to start guessing game
  GUESS
}

GUESS()
{
  #Random Number Generator: 
  SECRET=$((1 + $RANDOM % 1000))
  #echo $SECRET

  echo -e "\nGuess the secret number between 1 and 1000:"
  read INPUT

  GUESSED=0
  GUESS_TRIES=0

  while [[ $GUESSED != 1 ]]
  do
    #Confirm if the input is a number:
    if [[ $INPUT =~ ^[0-9]+$ ]]
    then
      GUESS_TRIES=$(($GUESS_TRIES + 1))
      #Check if it is lower
      if [[ $INPUT < $SECRET ]] 
      then
        echo -e "\nIt's higher than that, guess again:"
        read INPUT
      
      elif [[ $INPUT > $SECRET ]]
      then
      #Check if it is higher
        echo -e "\nIt's lower than that, guess again:"
        read INPUT
      
      elif [[ $INPUT = $SECRET ]] 
      then
        GUESSED=1

        #Insert the guess tries to the table: 
        GUESS_INSERT=$($PSQL " INSERT INTO games (user_id, guess) VALUES ('$USERNAME_ID', $GUESS_TRIES) ")
        echo -e "\nYou guessed it in $GUESS_TRIES tries. The secret number was $SECRET. Nice job!"

      fi

    else
      #If not a number:
      echo -e "\nThat is not an integer, guess again:"
      read INPUT
    fi

  done
}

MAIN 