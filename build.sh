#!/usr/bin/env bash

# build all modules
ant -f "$(pwd)/MaleRegexTree" -Dnb.internal.action.name=rebuild clean jar
ant -f "$(pwd)/Random Regex Turtle" -Dnb.internal.action.name=rebuild clean jar
ant -f "$(pwd)/ConsoleRegexTurtle" -Dnb.internal.action.name=rebuild clean jar
