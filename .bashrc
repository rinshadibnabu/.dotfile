

export PATH="$HOME/.local/bin:$PATH"
# Docker Aliases
alias dps='docker ps'                           
alias dpsa='docker ps -a'                       
alias di='docker images'                        
alias dstart='docker start'                     
alias dstop='docker stop'                       
alias drm='docker rm $(docker ps -a -q)'        
alias drmi='docker rmi $(docker images -q)'     
alias dexec='docker exec -it'                   

# Git Aliases
alias gs='git status'                 
alias ga='git add'                  
alias gaa='git add --all'             
alias gc='git commit -m'              
alias gca='git commit --amend'        
alias gco='git checkout'              
alias gb='git branch'                 
alias gcm='git checkout main'         
alias gd='git diff'                   
alias gl='git log --oneline --graph'  
alias gpr='git pull --rebase'         
alias gph='git push'                  
alias grh='git reset --hard'          
alias gstash='git stash'              

# Navigation Aliases
alias ..='cd ..'                
alias ...='cd ../..'            
alias ~='cd ~'                  
alias projects='cd ~/projects'  
alias desktop='cd ~/Desktop'    

# File and Folder Management Aliases
alias ls='ls -ltr --color=auto '           
alias la='ls -lah'                   
alias mkdir='mkdir -p'               
alias cp='cp -i'                     
alias mv='mv -i'                     
alias rm='rm -i'                     

# NPM / Node.js Aliases
alias nr='npm run'                      
alias ni='npm install'                  
alias nun='npm uninstall'               
alias ncu='npm-check-updates'           

# System and Utility Aliases
alias c='clear'                        
alias update='sudo pacman -Syu' 
alias reload='source ~/.bashrc'        
alias h='history'                      
alias f='find . -name'                 
alias grep='grep --color=auto'         
alias top='htop'                       
alias df='df -h'                       

# Tmux Aliases (if you use tmux)
alias ta='tmux attach -t'        
alias tn='tmux new -s'           
alias tls='tmux list-sessions'   
alias t='tmux'
# Docker Completion (Bash)

