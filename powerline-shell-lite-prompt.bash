function set_fg()
{
    echo -n '\[\e[38;5;'$((16+36*${1:0:1}+6*${1:1:1}+${1:2:1}))'m\]'
}

function set_bg()
{
    echo -n '\[\e[48;5;'$((16+36*${1:0:1}+6*${1:1:1}+${1:2:1}))'m\]'
}

function print_section()
{
    set_fg $1
    set_bg $2
    if [[ $# -eq 4 ]]; then
        echo -n "$4"
        set_fg $2
        set_bg $3
        echo -e -n '\uE0B0'
    else
        echo -n "$3"
        set_fg $2
        echo -e -n '\[\e[49m\]'
        echo -e -n '\uE0B0'
        echo -e -n '\[\e[0m\] '
    fi
}

function print_sections()
{
    local fg=()
    local bg=()
    local txt=()
    local count=$(($#/3))
    for((i=0; $i<$count; i++)); do
        fg[$i]=$1; shift
        bg[$i]=$1; shift
        txt[$i]=$1; shift
    done
    local last=$(($count-1))
    for((i=0; $i<$count; i++)); do
        local next=$(($i+1))
        if [[ $i -eq $last ]]; then
            print_section ${fg[$i]} ${bg[$i]} "${txt[$i]}"
        else
            print_section ${fg[$i]} ${bg[$i]} ${bg[$next]} "${txt[$i]}"
        fi
    done
}

