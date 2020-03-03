FROM openjdk:8-jdk AS build

# install dependencies
RUN apt-get update && apt-get install ant -y

ADD . /opt/regexgenerator

RUN /opt/regexgenerator/compile.sh

# This results in a single layer image
FROM openjdk:8-slim
COPY --from=build /opt/regexgenerator/ConsoleRegexTurtle/dist /opt/regexgenerator
ENTRYPOINT ["/opt/regexgenerator/regexturtle.sh"]
CMD ["-h"]