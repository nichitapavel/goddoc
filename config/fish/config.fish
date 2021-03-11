# Old style to have aliases, now I use abbr (abbreviations)
# Keeping it for history reasons
#. ~/.config/fish/fish_aliases

# https://fishshell.com/docs/current/cmds/status.html
# status is-interactive: returns 0 if fish is interactive - that is, connected to a keyboard.
# status is-login: returns 0 if fish is a login shell - that is, if fish should perform login tasks such as setting up the PATH
# still don't know what's the real difference, physically with the pc "is-interactive" seems to work better.
# Based on my testing, you are safe to use "is-interactive" always. These are the casuistics:
# with GUI: login - no, interactive - yes
# terminal (ctrl + alt + f2): login - yes, interactive - yes
# ssh: login - yes, interactive - yes
# invoking child fish shells will only be "interactive"

# These cmd can be replaced with fish functions
# Why "--is-interactive" -> don't really know
if status is-interactive
  abbr --add ll "ls -hl --group-directories --color=auto"
  abbr --add la "ls -hlA --group-directories --color=auto"
  abbr --add update-dist "sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean"
end

# Add ~/.local/bin and ~/bin to PATH
# Why "--is-login" -> don't really know
if status is-login
  set HOME_BIN ~/bin
  set HOME_LOCAL_BIN ~/.local/bin
  if test -d "$HOME_BIN"
    set -x PATH "$HOME_BIN" $PATH
  end
  if test -d "$HOME_LOCAL_BIN"
    set -x PATH "$HOME_LOCAL_BIN" $PATH
  end
end

# Set ANDROID_SDK_ROOT environment variables
if status is-interactive
  set ANDROID_PATH /opt/android
  if test -d "$ANDROID_PATH"
    # is it empty?                 does it exist?
    if set -q -- $ANDROID_SDK_ROOT; or set -q ANDROID_SDK_ROOT
      set -x ANDROID_SDK_ROOT "$ANDROID_PATH"
    end
  end
end

# https://github.com/pyenv/pyenv/issues/32
# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:
set PYENV_PATH ~/.pyenv/bin
if test -d "$PYENV_PATH"
  set -x PATH "$PYENV_PATH" $PATH
  status is-interactive; and pyenv init - | source
  status is-interactive; and pyenv virtualenv-init - | source
end

# Load environment modules if available
# More information https://modules.readthedocs.io/en/latest/index.html
# Mostly used in hpc environments
if status is-interactive
  set ENV_MODULES /opt/Modules
  if test -d "$ENV_MODULES"
    source $ENV_MODULES/init/fish
  end
end
