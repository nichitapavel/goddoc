# Defined in - @ line 1
# To specify a list of hosts where to copy files do
#   pscp -h <hosts.txt> <file_to_copy> <path_where_to_copy_on_remote>
# For more info check http://manpages.ubuntu.com/manpages/focal/man1/parallel-scp.1.html
function ggrep --wraps=grep --description 'alias ggrep=grep -iR <something> ~/git/goddoc/* '
  grep -iR --exclude="signature*.html" --exclude='LICENSE' --exclude-dir="sources.list.d" $argv ~/git/goddoc/*;
end

