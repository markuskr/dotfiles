#!/usr/bin/env bash
# ls
alias ls='ls -G'
alias l='ls -Alh'
alias ll='ls -lh'
 
# grep
alias grep='grep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias egrep='egrep --colour=auto'
 
# misc
alias psi='echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND"; ps aux|grep -i'
alias ccat='source-highlight -f esc256 -o STDOUT -i'
alias xformat='pbpaste | xmllint -format -'
alias startpi='cd ~/Desktop/pi && qemu-system-arm -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" -kernel kernel-qemu -hda 2015-02-16-raspbian-wheezy.img'

# git
alias gst='git status'
alias gb='git branch'
alias rebase='git pull --rebase'
alias ci='git commit'
alias co='git checkout'
alias gd='git diff'

#docker 
alias docker_cleanup_container='docker ps -a -q | xargs docker rm'  
alias docker_cleanup_images="docker images -a | grep '<none>' | awk '{print \$3}' | xargs docker rmi"
alias docker_cleanup='docker_cleanup_container && docker_cleanup_images'

# puppet
alias pup-mgmt='vagrant destroy Centos6_64 && export VAGRANT_HOSTNAME=mgmt1prod-agent.oslo.kommune.no && vagrant up Centos6_64'

git-compare(){
  string=$(__git_ps1)
  string=${string%)}
  string=${string:2}
  repo=$(basename `git rev-parse --show-toplevel`)
  /usr/bin/open -a "/Applications/Google Chrome.app" "https://github.oslo.kommune.no/it/$repo/compare/$string"

}

# maven
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'
 
alias rbcc='rake build-changed-components[local]'

#f5
alias f5-pwd='grep F5 $OK_DIR/dokumentasjon/passord_dekryptert.txt | sed '\''s/F5 BIG-IP: itas //'\'' | pbcopy && exit'
