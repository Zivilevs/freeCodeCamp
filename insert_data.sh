#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
# add winner team 
if [[ $WINNER != "winner" ]]
then
        TEAM_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$WINNER'")
        if [[ -z $TEAM_ID ]]
        then
		INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) values('$WINNER')")
        fi
# add opponent team
        TEAM_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$OPPONENT'")
        if [[ -z $TEAM_ID ]]
        then
                INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) values('$OPPONENT')")
        fi
# add other columns to games table
        WINNER_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$WINNER'")
        OPPONENT_ID=$($PSQL "SELECT team_id FROM TEAMS WHERE name='$OPPONENT'")
        GAME_ID=$($PSQL "select game_id from games where winner_id=$WINNER_ID and opponent_id=$OPPONENT_ID and round='$ROUND' and year=$YEAR")
        if [[ -z $GAME_ID ]]
        then
                INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)")
        fi
fi
done

