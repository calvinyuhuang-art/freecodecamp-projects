#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"



while true; do
  echo Enter your username:
  read username

  if [[ ${#username} -lt 23 ]]; 
  then
    break 
  fi
done

user=$($PSQL "SELECT best_game, num_game_played from players where name = '$username'")

if [[ -z $user ]]
then
  echo -e "Welcome, $username! It looks like this is your first time here.\n"
else
  IFS='|' read -r best_game num_game_played <<< "$user"
  echo -e "Welcome back, $username! You have played $num_game_played games, and your best game took $best_game guesses.\n"
fi

random_number=$(( 1 + RANDOM % 1000 ))
echo "Guess the secret number between 1 and 1000:"
read guessed_number
counter=0


while true; do
  if [[ -n $guessed_number ]]; 
  then
    if [[ $guessed_number =~ ^[+-]?[0-9]+$ ]];
    then
      if  [[ $guessed_number -lt $random_number ]];
      then
        ((counter++))
        echo "It's higher than that, guess again:"
        read guessed_number
      elif [[ $guessed_number -gt $random_number ]];
      then
        ((counter++))
        echo "It's lower than that, guess again:"
        read guessed_number
      else
        ((counter++))
        echo "You guessed it in $counter tries. The secret number was $random_number. Nice job!"
        if [[ -z $user ]]
        then
          insert_result=$($PSQL "insert into players(name, best_game, num_game_played) values ('$username', $counter, 1)")
        else
          if [[ $best_game -gt $counter ]]
          then
            best_game=$counter
          fi
          update_result=$($PSQL "update players set best_game = $best_game, num_game_played = $num_game_played + 1 where name = '$username'")
        fi 
        break
      fi
    else
      echo "That is not an integer, guess again:"
      read guessed_number
    fi
  else
    echo "That is not an integer, guess again:"
    read guessed_number
  fi
done