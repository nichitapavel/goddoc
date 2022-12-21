# Defined in - @ line 1
function update-dist --description 'Update, upgrade and clean OS.'
  sudo apt update && sudo apt upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean $argv;
end
