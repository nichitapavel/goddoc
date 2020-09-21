# Defined in - @ line 1
function la --wraps=ls --description 'alias la=ls -hlA --group-directories --color=auto'
  ls -hlA --group-directories --color=auto $argv;
end
