#/bin/bash

FROM_PATH=${1:-}
TO_PATH=${2:-}

if [[ -z "${1:-}" || -z "${2:-}" ]]
then
    echo -e "Nie podane drogi"
    exit 1
fi

if [[ ! -d ${FROM_PATH} ]]
then
    echo "Katalog 1 nie istnieje"
    exit 2
fi

if [[ ! -d ${TO_PATH} ]]
then 
    echo "Katalog 2 nie istnieje"
    exit 2
fi

for FILE in "${FROM_PATH}"/*
do
    if [[ -d ${FILE} ]]
    then
        FILENAME=${FILE%.*}
        FILENAME=${FILENAME#*/}
        FILENAME_UPPERCASE=$(echo ${FILENAME} | tr 'a-z' 'A-Z')
        echo "${FILENAME} - Plik jest katalogiem"
        $(ln -s "../${FILE}" "${TO_PATH}/${FILENAME_UPPERCASE}_ln")
    elif [[ -f ${FILE} ]]
    then
        FILENAME=${FILE%.*}
        FILENAME=${FILENAME#*/}
        FILENAME_UPPERCASE=$(echo ${FILENAME} | tr 'a-z' 'A-Z')
        FILEEX=${FILE#*.}
        echo "${FILENAME} - Plik jest plikiem regularnym"
        $(ln -s "../${FILE}" "${TO_PATH}/${FILENAME_UPPERCASE}_ln.${FILEEX}")
    elif [[ -h ${FILE} ]]
    then
        FILENAME=${FILE%.*}
        FILENAME=${FILENAME#*/}
        echo "${FILENAME} - Plik jest linkiem symbolicznym"
    fi
done