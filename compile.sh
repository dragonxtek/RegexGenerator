#!/usr/bin/env bash

readonly CURRENT_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
  pwd -P
)

# build all modules
ant -f "${CURRENT_DIR}/MaleRegexTree" -Dnb.internal.action.name=rebuild clean jar
ant -f "${CURRENT_DIR}/Random Regex Turtle" -Dnb.internal.action.name=rebuild clean jar
ant -f "${CURRENT_DIR}/ConsoleRegexTurtle" -Dnb.internal.action.name=rebuild clean jar

chmod +x "${CURRENT_DIR}/ConsoleRegexTurtle/dist/regexturtle.sh"