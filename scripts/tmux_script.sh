#!/bin/bash
function tmux_web {
 SESSION_NAME=$1
 #echo "Create.."
 tmux new -s $SESSION_NAME -n editor -d
 #echo "Creat first pane (editor).."
 tmux send-keys -t $SESSION_NAME 'vim' C-m
 #echo "Run vim in first pane.."
 tmux new-window -n console -t $SESSION_NAME
 #echo "Create second pane (console).."
 tmux split-window -v -t $SESSION_NAME:2
 #echo "Split second pane.."
 tmux new-window -n server -t $SESSION_NAME
 #echo "Create third pane (server).."
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
