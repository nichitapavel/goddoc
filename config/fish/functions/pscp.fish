# Defined in - @ line 1
# To specify a list of hosts where to copy files do
#   pscp -h <hosts.txt> <file_to_copy> <path_where_to_copy_on_remote>
# For more info check http://manpages.ubuntu.com/manpages/focal/man1/parallel-scp.1.html
function pscp --wraps=parallel-scp --description 'alias pscp=parallel-scp -o stdout -e stderr '
  parallel-scp -o stdout -e stderr $argv;
end

