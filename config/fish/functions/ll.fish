# Defined in - @ line 1
function ll --wraps=ls --description 'alias ll=ls -hl --group-directories --color=auto'
  ls -hl --group-directories --color=auto $argv;
end
