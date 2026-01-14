#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
    
    if [[ $year != "year" ]]
    then
      team_id=$($PSQL "select team_id from teams where name = '$winner'")
      if [[ -z $team_id ]]
      then
        insert_winner_result=$($PSQL "insert into teams(name) values ('$winner')")
        team_id=$($PSQL "select team_id from teams where name = '$winner'")
      fi

      opponent_id=$($PSQL "select team_id from teams where name = '$opponent'")
      if [[ -z $opponent_id ]]
      then
        insert_opponent_result=$($PSQL "insert into teams(name) values ('$opponent')")
        opponent_id=$($PSQL "select team_id from teams where name = '$opponent'")
      fi

      insert_game_result=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($year, '$round', $team_id, $opponent_id, $winner_goals, $opponent_goals)")
    fi
    
done
