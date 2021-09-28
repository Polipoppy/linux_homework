#!/bin/bash

checkInput()
{
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "Both parameters needs to be integers"
        exit 1
    fi
}

exitUsage()
{
    echo "Please enter the parameters of the multiplication" >&2
    echo "Ex: ./multi-table.sh 4 5" >&2
    exit 1
}


check_every_input()
{
    if [ $# -ne 2 ]
    then
        exitUsage
    fi
    checkInput "$1"
    checkInput "$2"
}

do_the_maths()
{
    # echo -n "$1"
    x=1
    while [ $x -le $1 ]
    do
        y=1
        # echo "$x"
        while [ $y -le $2 ]
        do
            echo -n "$x*$y=`expr $x \* $y` "
            y=`expr $y + 1`
        done
        echo ""
        x=`expr $x + 1`
    done
}

main() {
    check_every_input "$@"
    do_the_maths "$1" "$2"
}

main "$@"