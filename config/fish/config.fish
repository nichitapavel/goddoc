# Old style to have aliases, now I use abbr (abbreviations)
# Keeping it for history reasons
#. ~/.config/fish/fish_aliases

# These cmd can be replaced with fish functions
# Why "--is-interactive" -> don't really know
if status --is-interactive
  abbr --add ll "ls -hl --group-directories --color=auto"
  abbr --add la "ls -hlA --group-directories --color=auto"
  abbr --add update-dist "sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean"
end

# Add ~/.local/bin to PATH
# Why "--is-login" -> don't really know
if status --is-login
  set -x PATH ~/.local/bin $PATH
end

# Set ANDROID_HOME environment variables
if status --is-login
  # is it empty?                 does it exist?
  if set -q -- $ANDROID_HOME; or set -q ANDROID_HOME
    set -x ANDROID_HOME /opt/android
  end
end
