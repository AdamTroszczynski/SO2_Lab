#!/bin/bash

SOURCE_DIR=${1:-"lab_uno"}
RM_LIST=${2:-"2remove"}
TARGET_DIR=${3:-"bakap"}

COUNTER=0
DATE=$(date +'%F')


if [[ ! -d ${TARGET_DIR} ]]
then
    $(mkdir ${TARGET_DIR})
fi

while IFS= read -r line
do
    if [[ -f "${SOURCE_DIR}/${line}" ]]
    then
        $(rm -rf "${SOURCE_DIR}/${line}")
    fi
done < ${RM_LIST}


for file in "${SOURCE_DIR}"/*
do
    if [[ -f ${file} ]]
    then
        $(mv ${file} ${TARGET_DIR})
    elif [[ -d ${file} ]]
    then
        $(cp -r ${file} ${TARGET_DIR})
    else 
        ((COUNTER++))
    fi
done


if [[ ${COUNTER} -eq 0 ]]
then
    echo "Tu był Kononowicz"
else
    echo "Jeszcze coś zostało"
fi


if [[ ${COUNTER} -ge 2  &&  ${COUNTER} -le 4 ]]
then
    echo "Co najmniej 2, nie więcej niż 4"
else 
    if [[ ${COUNTER} -ge 2 ]]
    then
        echo "Zostały co najmniej 2 pliki"
    fi

    if [[ ${COUNTER} -gt 4 ]]
    then
        echo "Zostało więcej niż 4 pliki"
    fi
fi

zip -r "bakap_${DATE}.zip" "./lab_uno"



