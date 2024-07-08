#!/bin/bash

# Prompt for user details
read -p "Enter your Git user name: " git_user_name
read -p "Enter your Git email: " git_email

# Configure Git with the provided user name and email
git config --global user.name "$git_user_name"
git config --global user.email "$git_email"

# Generate SSH key
ssh-keygen -t rsa -b 4096 -C "$git_email" -f ~/.ssh/id_rsa -N ""

# Start the SSH agent in the background
eval "$(ssh-agent -s)"

# Add SSH private key to the SSH agent
ssh-add ~/.ssh/id_rsa

# Display the SSH public key
echo "Your new SSH public key is:"
cat ~/.ssh/id_rsa.pub

