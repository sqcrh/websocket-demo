#!/bin/bash

# create matching user if user does not exist (just do this once per user)
if ! id "$1" > /dev/null 2>&1; then

    # create user
    useradd -s /bin/bash -u $2 $1 -m
    adduser $1 sudo
    echo "$1 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

    # specify xterm-color as terminal
    su $1 -c 'echo -e "export TERM=xterm-color\n$(cat ~/.bashrc)" > ~/.bashrc'

    # install node packages
    su $1 -c 'cd /app/frontend && npm install'
    # su $1 -c 'cd /app/backend && npm install && npm run resetdb'
    # su $1 -c 'cd /app/sample-plugin && npm install'
fi

# switch users to dev user
su $1
