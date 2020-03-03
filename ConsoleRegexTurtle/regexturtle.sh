#!/bin/bash

readonly CURRENT_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
  pwd -P
)

# Executes the command-line version of RegextTurtle; 
# automatically sets the JAVA VM memory size based on the total and available system memory
MEMSYSTEM=$(cat /proc/meminfo | grep MemTotal: | tr -s " " | cut -d" " -f2)
MEMAVAILABLE=$(cat /proc/meminfo | grep MemAvailable: | tr -s " " | cut -d" " -f2)

# set max mem to total system memory-512000 in kB
MAXMEM=$(( MEMSYSTEM-512000 ))

# set max mem to available (unused) memory/2 in kB
XMSMEM=$(( MEMAVAILABLE/2 ))

echo "System memory:"$MEMSYSTEM "Mbytes"
echo "RegexTurtle is going to use this amount of the system memory (min/max): ${XMSMEM}/${MAXMEM} Kbytes"

# execute jar
java -Xmx${MAXMEM}k -Xms${XMSMEM}k -jar "${CURRENT_DIR}/ConsoleRegexTurtle.jar" "$@"
