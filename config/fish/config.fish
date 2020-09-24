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

# TODO there seems to be a problem with desktop session
# at my work pc, maybe it should be --is-interactive?
# Set ANDROID_SDK_ROOT environment variables
if status --is-login
  # is it empty?                 does it exist?
  if set -q -- $ANDROID_SDK_ROOT; or set -q ANDROID_SDK_ROOT
    set -x ANDROID_SDK_ROOT /opt/android
  end
end
