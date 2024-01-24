#!/bin/bash
function abs() {
    [[ $1 -lt 0 ]] && echo $((-$1)) || echo $1
}

sum=$(($1 + $2))
sub=$(($1 - $2))
mul=$(($1 * $2))
if [[ $2 == 0 ]]; then
    div='#'
else
    int=$(abs $(($1 / $2)))
    frac=$(abs $(($1 * 100 / $2)))
    frac=$(($frac % 100 / 10))$(($frac % 10))
    sign=$([[ mul -lt 0 ]] && echo '-')
    div=$sign$int.$frac
fi

echo $sum $sub $mul $div
