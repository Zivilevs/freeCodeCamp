#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=guess_game -t --no-align -c"

NUMBER=$(( $RANDOM % 1000 + 1))

CHECK_INT() {
  if [[ ! $1 =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      read GUESS
  fi
}

echo "Enter your username:"
read  USERNAME

COUNT=$($PSQL "SELECT COUNT(id) FROM guesses WHERE username='$USERNAME'")
if [ $COUNT -gt 0 ]
  then
    BEST_GAME=$($PSQL "SELECT MIN(num_guesses) FROM guesses WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $COUNT games, and your best game took $BEST_GAME guesses."
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
fi
echo "Guess the secret number between 1 and 1000:"
read GUESS
CHECK_INT $GUESS
counter=1
until [ $GUESS == $NUMBER ]
  do 
    if [ $GUESS -lt $NUMBER ]
      then
        echo "It's higher than that, guess again:"
        read GUESS
        CHECK_INT $GUESS
        let counter++
    elif [ $GUESS -gt $NUMBER ]
      then
        echo "It's lower than that, guess again:"
        read GUESS
        CHECK_INT $GUESS
        let counter++
    fi
  done
echo "You guessed it in $counter tries. The secret number was $NUMBER. Nice job!"
INSERT_RESULT=$($PSQL "INSERT INTO guesses(username, num_guesses) values('$USERNAME', $counter)")
if [[ ! -z $INSERT_RESULT ]]
  then
    exit 0
  else
    exit 1
fi

