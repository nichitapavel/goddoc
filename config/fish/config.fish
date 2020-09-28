# Old style to have aliases, now I use abbr (abbreviations)
# Keeping it for history reasons
#. ~/.config/fish/fish_aliases

# https://fishshell.com/docs/current/cmds/status.html
# status is-interactive: returns 0 if fish is interactive - that is, connected to a keyboard.
# status is-login: returns 0 if fish is a login shell - that is, if fish should perform login tasks such as setting up the PATH
# still don't know what's the real difference, physically with the pc "is-interactive" seems to work better.

# These cmd can be replaced with fish functions
# Why "--is-interactive" -> don't really know
if status is-interactive
  abbr --add ll "ls -hl --group-directories --color=auto"
  abbr --add la "ls -hlA --group-directories --color=auto"
  abbr --add update-dist "sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean"
end

# Add ~/.local/bin to PATH
# Why "--is-login" -> don't really know
if status is-login
  set -x PATH ~/.local/bin $PATH
end

# Set ANDROID_SDK_ROOT environment variables
if status is-interactive
  # is it empty?                 does it exist?
  if set -q -- $ANDROID_SDK_ROOT; or set -q ANDROID_SDK_ROOT
    set -x ANDROID_SDK_ROOT /opt/android
  end
end

# https://github.com/pyenv/pyenv/issues/32
# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:
set -x PATH "$HOME/.pyenv/bin" $PATH
status is-interactive; and pyenv init - | source
status is-interactive; and pyenv virtualenv-init - | source
