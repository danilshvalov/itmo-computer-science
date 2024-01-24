export LANG=en_US.UTF-8

nbspace='\u00A0'
space='\u0020'
vline='\u2502'
hline='\u2500\u2500'
corner='\u2514'
branch='\u251c'

dir_count=0
files_count=0

function print_tree() {
    local subdirs=($1/*)
    local counter=0

    for obj in ${subdirs[@]}; do

        ((counter++))

        local branch_type
        local line_type
        if [[ $counter -lt ${#subdirs[@]} ]]; then
            branch_type=$branch
            line_type="$vline$nbspace$nbspace$space"
        else
            branch_type=$corner
            line_type="$space$space$space$space"
        fi

        if [[ -d $obj ]]; then
            ((dir_count++))
            printf "$2$branch_type$hline ${obj##*/}\n"
            print_tree $obj "$2$line_type"
        elif [[ -f $obj ]]; then
            ((files_count++))
            printf "$2$branch_type$hline ${obj##*/}\n"
        fi
    done
}

path=$([[ $# -ne 0 ]] && echo $1 || echo .)

echo $path
print_tree $path

file_text=$([[ $files_count -eq 1 ]] && echo "file" || echo "files")
dir_text=$([[ $dir_count -eq 1 ]] && echo "directory" || echo "directories")

printf "\n$dir_count $dir_text, $files_count $file_text\n"
