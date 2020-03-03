#!/usr/bin/env bash

readonly DIR_SCRIPT=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
  pwd -P
)

# build all modules
ant -f "${DIR_SCRIPT}/MaleRegexTree" -Dnb.internal.action.name=rebuild clean jar
ant -f "${DIR_SCRIPT}/Random Regex Turtle" -Dnb.internal.action.name=rebuild clean jar
ant -f "${DIR_SCRIPT}/ConsoleRegexTurtle" -Dnb.internal.action.name=rebuild clean jar
