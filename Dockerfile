FROM openjdk:8-jdk AS build

# install dependencies
RUN apt-get update && apt-get install ant -y

ADD . /opt/regexgenerator

RUN /opt/regexgenerator/compile.sh
RUN mkdir -p /opt/regexgenerator/ConsoleRegexTurtle/dist/input
RUN mkdir -p /opt/regexgenerator/ConsoleRegexTurtle/dist/output

# This results in a single layer image
FROM openjdk:8-slim
COPY --from=build /opt/regexgenerator/ConsoleRegexTurtle/dist /opt/regexgenerator
RUN mkdir /input /output
VOLUME ["/input", "/output"]
ENTRYPOINT ["/opt/regexgenerator/regexturtle.sh", "-o", "/output"]
CMD ["-h"]