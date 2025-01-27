#!/usr/bin/bash
 
gracz_1="X"
gracz_2="O"
podejscie=1
ruchy=( - - - - - - - - - )
 
wiadomosc() 
{
    clear
    echo "------------------------"
    echo "--Gra w kolko krzyzyk--"
    echo "------------------------"
    read -p "Gra polega na zakreslaniu odpowiednich pol od 1-9, gracz pierwszy to X, gracz drugi to O, POWODZENIA!" 
}
init_board () 
{
         podejscie=1
         ruchy=( - - - - - - - - - )
}
tablica () {
    clear
    echo " ${ruchy[0]} | ${ruchy[1]} | ${ruchy[2]} "
    echo "-----------"
    echo " ${ruchy[3]} | ${ruchy[4]} | ${ruchy[5]} "
    echo "-----------"
    echo " ${ruchy[6]} | ${ruchy[7]} | ${ruchy[8]} "
    echo "-----------"
}
 
wybor_gracza(){
    if [[ $(( podejscie % 2 )) == 0 ]]
    then
        echo "Zaznacza kolko: "
        play=$gracz_2
    else
        play=$gracz_1
        echo "Zaznacza krzyzyk "
    fi
 
    read -r square
 
    if [[ ${ruchy[(square-1)]} == "-" ]] &&
       [[ $square == [1-9] ]]
    then
        ruchy[square -1]=$play
        (( podejscie += 1 ))
    else
        echo "Nieznana wartość!"
        wybor_gracza
    fi
}
 
sprawdzenie() {
    index1=$1
    index2=$2
    index3=$3
 
    if  [[ ${ruchy[$index1]} == "${ruchy[$index2]}" ]] &&
        [[ ${ruchy[$index1]} == "${ruchy[$index3]}" ]] &&
        [[ ${ruchy[$index1]} != "-" ]]
    then
        if [[ ${ruchy[$index1]} == 'X' ]]
        then
            echo "WYGRYWA KRZYZYK! GRATULACJE!"
            nowa_gra
        else
            echo "WYGRYWA KOLKO! GRATULACJE!"
            nowa_gra
        fi
    fi
}
 
sprawdzenie_wygranej(){
    if [[ $podejscie -gt 9 ]]
    then
        echo "REMIS!"
        nowa_gra
    fi
    sprawdzenie 0 1 2
    sprawdzenie 3 4 5
    sprawdzenie 6 7 8
    sprawdzenie 0 4 8
    sprawdzenie 2 4 6
    sprawdzenie 0 3 6
    sprawdzenie 1 4 7
    sprawdzenie 2 5 8
}
 
nowa_gra(){
    echo "Chcesz zagrac nowa gre? T/N?"
    read input
      if [ "$input" = "t" ] 
      then
      ruchy=( - - - - - - - - - )
    wiadomosc
    tablica
    podejscie=1
    while true
    do 
    wybor_gracza
    tablica
    sprawdzenie_wygranej
    done
     fi
     if [ "$input" = "n" ] 
     then
     exit
     fi
}
 
 
wiadomosc
tablica
while true
do
    wybor_gracza
    tablica
    sprawdzenie_wygranej
done