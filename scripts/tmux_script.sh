#!/bin/bash
function tmux_web {
 SESSION_NAME=$1
 FIRST_WINDOW_NAME=terminal
 SECOND_WINDOW_NAME=console
 THIRD_WINDOW_NAME=frontend_server

 #echo "Create.."
 tmux new -s $SESSION_NAME -n $FIRST_WINDOW_NAME -d
 #echo "Creat first window.."
 tmux new-window -n $SECOND_WINDOW_NAME -t $SESSION_NAME
 #echo "Split second window.."
 tmux send-keys -t $SESSION_NAME:$SECOND_WINDOW_NAME 'docker compose down && docker compose up backend --build' C-m
 #echo "Run Docker in Second Window.."
 tmux new-window -n $THIRD_WINDOW_NAME -t $SESSION_NAME
 #echo "Create third window.."
 tmux send-keys -t $SESSION_NAME:$THIRD_WINDOW_NAME 'cd frontend && npm start' C-m
 #echo "Run NPM Server in Third Window.."
 tmux select-window -t $SESSION_NAME:1
 tmux attach -t $SESSION_NAME
 #echo "Start tmux session $SESSION_NAME."
}

#new session base name is current directory name
DIR_NAME=${PWD##*/}

echo "Trying to create new Tmux session with name '$DIR_NAME'."
tmux has-session -t $DIR_NAME 2>/dev/null
if [ $? -eq 1 ]
then
  echo "Session not found. Create Session '$DIR_NAME'."
  tmux_web $DIR_NAME
else
  #random string as new session suffix
  RAND_NUMB=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 2 | head -n 1)
  echo "Session found. Create session with name '$DIR_NAME$RAND_NUMB'"
  tmux_web "$DIR_NAME$RAND_NUMB"
fi

echo "Start tmux session $DIR_NAME."
