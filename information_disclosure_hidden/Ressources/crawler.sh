#!/usr/bin/env bash

IP="http://192.168.56.101"
BASE_URL="${IP}/.hidden/"


global_rematch() {
  local str=$1 regex=$2
  while [[ ${str} =~ ${regex} ]]; do
    echo "${BASH_REMATCH[1]}"
    str=${str#*"${BASH_REMATCH[1]}"}
  done
}


recursive_search() {
  local URL=$1
  local text=$(curl ${URL} 2>/dev/null)
  local folders=$(global_rematch "${text}" '<a href="(.{3,30}/)">')

  regex="[0-9]"
  local README=$(curl "${URL}/README" 2>/dev/null)

  if [[ ${README} =~ ${regex} ]]; then
    echo -e '\nFINISH:' ${README}
    echo "At ${URL}"
    exit
  else
    printf '.'
  fi

  for folder in ${folders[@]}; do
    recursive_search "${URL}${folder}"
  done
}

recursive_search "${BASE_URL}"
