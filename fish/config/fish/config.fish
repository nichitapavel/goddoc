# Old style to have aliases, now I use abbr (abbreviations)
# Keeping it for history reasons
#. ~/.config/fish/fish_aliases

# These cmd can be replaced with fish functions
if status --is-interactive
  abbr --add ll "ls -hl --group-directories --color=auto"
  abbr --add la "ls -hlA --group-directories --color=auto"
  abbr --add update-dist "sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean"
end

