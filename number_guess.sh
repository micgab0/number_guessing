#!/bin/bash

# Function to check if a string is an integer
is_integer() {
    [[ $1 =~ ^[0-9]+$ ]]
}

# Function to generate a random number between 1 and 1000
generate_secret_number() {
    echo $((RANDOM % 1000 + 1))
}


echo "Enter your username:"
read username

user_count=$(psql -U freecodecamp -d number_guessing -t -c \
          "SELECT COUNT(*) FROM users WHERE username = '$username';")

games_played=0
if [ "$user_count" -gt 0 ]; then
    result=$(psql -U freecodecamp -d number_guessing -t -c \
          "SELECT games_played, MIN(n_guesses) as max_score FROM users INNER JOIN scores on users.user_id = scores.user_id WHERE users.username = '$username' GROUP BY users.username, users.games_played")
    IFS='|' read -r games_played max_score <<< "$result"

    games_played=$(echo "$games_played" | tr -d '[:space:]')
    max_score=$(echo "$max_score" | tr -d '[:space:]')

    echo "Welcome back, $username! You have played $games_played games, and your best game took $max_score guesses."
else
    echo "Welcome, $username! It looks like this is your first time here."
    psql -U "freecodecamp" -d "number_guessing" -c \
    "INSERT INTO users (username, games_played) VALUES ('$username', 0);" > /dev/null 2>&1

fi

secret_number=$(generate_secret_number)
n_guess=0
echo "Guess the secret number between 1 and 1000:"

while true; do
    read -p "Your guess: " user_guess
    if ! is_integer "$user_guess"; then
        echo "That is not an integer, guess again:"
        continue
    fi
    ((n_guess++))
    if [ "$user_guess" -eq "$secret_number" ]; then
        echo "You guessed it in $n_guess tries. The secret number was $secret_number. Nice job!"
        result=$(psql -U freecodecamp -d number_guessing -t -c \
          "SELECT user_id FROM users WHERE username = '$username'")
        IFS='|' read -r user_id <<< "$result"
        user_id=$(echo "$user_id" | tr -d '[:space:]')
        ((games_played++))
        psql -U "freecodecamp" -d "number_guessing" -c \
        "Update users SET games_played=$games_played WHERE username='$username';" > /dev/null 2>&1
        psql -U "freecodecamp" -d "number_guessing" -c \
        "INSERT INTO scores (user_id, n_guesses) VALUES ($user_id, $n_guess);" > /dev/null 2>&1
        break
    elif [ "$user_guess" -lt "$secret_number" ]; then
        echo "It's higher than that, guess again:"
    else
        echo "It's lower than that, guess again:"
    fi
done