#!/bin/bash

Generate SSH keyssh-keygen -t rsa -b 4096 -C "$git_email" -f ~/.ssh/id_rsa -N ""

# Start the SSH agent in the background
eval "$(ssh-agent -s)"

# Add SSH private key to the SSH agent
ssh-add ~/.ssh/id_rsa

# Display the SSH public key
echo "Your new SSH public key is:"
cat ~/.ssh/id_rsa.pub
