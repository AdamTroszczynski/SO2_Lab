#!/bin/bash -eu

$(rm -rf ./lab_uno)
$(rm -rf ./2remove)
$(rm -rf ./bakap)
$(rm -rf ./*.zip)


if [[ -z "${1:-}" ]]; then
    echo -e "Podaj nazwe katalogu, jaki mam utworzyc, np.:\n\n\t./kanai_cube.sh lab_uno\n"
    exit 1
fi

mkdir "${1}"
cd "${1}"

RECIPES=(skill_of_nilfur hope_of_datco
    work_of_angered seraphin_despair shandala_prayer
    law_of_kulle blessing_of_caban darkness_of_radament
    archive_of_iron_man not_the_cow_level)

for RECIPE in ${RECIPES[@]}; do
    [[ $((RANDOM % 2)) -eq 0 ]] && { mkdir "${RECIPE}"; touch "${RECIPE}/some_content"; } || touch "${RECIPE}"
    [[ $((RANDOM % 10)) -lt 4 ]] || echo "${RECIPE}" >> 2remove
done

mv 2remove ../