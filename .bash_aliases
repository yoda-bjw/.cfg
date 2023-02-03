# ~/.bash-aliases -- Yoda's Bash-Shell Custom Aliases for Arch/Arcolinux
# # -------------------
# Format for aliases (note single quotes!:
# 	alias alias-name='command_to_perform'
# -------------------
# To use this file, the following statement must exist in ~/.bashrc:

	# if [-f $HOME/.bash_aliases]; then
	#   source $HOME/.bash_aliases
	# fi

# Vertical ist of directories, files, and hidden files in color, directories first.
# Uncomment if this line does not already exist in ~/.bashrc
	# alias ls='exa -la --color=always --group-directories-first'

# Pacman install/uninstall applications
	alias shitcan='sudo pacman -Rs'
	alias packin='sudo pacman -S'
	alias pacman='sudo pacman --color auto'
	alias update='sudo pacman -Syyu' #(sync repo databases and update)
	alias sps='sudo pacman -S' #(sync repos and install or update a package)
	alias spr='sudo pacman -R' #(remove a package and leave dependencies intact)
	alias sprdd='sudo pacman -Rdd'
	alias spqo='sudo pacman -Qo'
	alias spsii='sudo pacman -Sii'

# Generate a list of explicitly installed packages
	alias list="sudo pacman -Qqe"
# Generate a list of explicitly installed packages without dependencies
	alias listt="sudo pacman -Qqet"
# Generate a list of AUR packages
	alias listaur="sudo pacman -Qqem"
# add > desired-listname at the end to write to a file

# install packages from a list
# pacman -S --needed - < my-list-of-packages.txt

# paru as aur helper - updates everything
	alias pksyua="paru -Syu --noconfirm"
	alias upall="paru -Syu --noconfirm"

# show the list of packages that need this package - depends mpv as example
function_depends()  {
	search=$(echo "$1")
	sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By: //g" | sed -e "s/  /\n/g"
    }

alias depends='function_depends'

# Filesystem size report in cleahuman-readable output
alias df='df -h'

# Cleanup orphaned packages
	alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# Prevent file manipulation blunders with interactive confirmations.
	alias mv='mv -i'
	alias cp='cp -i'
	alias ln='ln -i'
	alias rm='rm -I --preserve-root'

# Start Emacs Client from the terminal
	alias emacs="emacsclient -c -a 'emacs'"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# More git aliases, using the bare master repository alias "config" for "git."
	alias gitstat='config status'  # 'status' is protected name so using 'stat' instead
	
	alias addup='config add -u' # <filename1 filename2> <*.txt>
    alias branch='config branch'
    alias checkout='config checkout'
    alias clone='config clone'
    alias diff='config diff' # Shows unstaged changes.
    alias diffs='config diff --staged' # Shows staged changes.
    alias commit='config commit -m'
    alias fetch='config fetch'
    alias pull='config pull origin'
    alias push='config push origin'
    alias tag='config tag'
    alias newtag='config tag -a'
 
# Got more? Add them below.

