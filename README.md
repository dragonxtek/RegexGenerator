# RegexGenerator

This project contains the source code of a tool for generating regular expressions for text extraction and classification (flagging):

1. automatically,
2. based only on examples of the desired behavior,
3. without any external hint about how the target regex should look like.

An online, interactive version of this engine is accessible at: [http://regex.inginf.units.it/](http://regex.inginf.units.it/)

RegexGenerator was developed at the [Machine Learning Lab, University of Trieste, Italy] (http://machinelearning.inginf.units.it).

The provided engine is a developement release (1) that implements the algorithms published in our articles (2):

* Bartoli, De Lorenzo, Medvet, Tarlao, Inference of Regular Expressions for Text Extraction from Examples, IEEE Transactions on Knowledge and Data Engineering, 2016
* Bartoli, De Lorenzo, Medvet, Tarlao, Can a machine replace humans in building regular expressions? A case study, IEEE Intelligent Systems, 2016
* Bartoli, De Lorenzo, Medvet, Tarlao, Virgolin, Evolutionary Learning of Syntax Patterns for Genic Interaction Extraction, ACM Genetic and Evolutionary Computation Conference (GECCO), 2015, Madrid (Spain)

More details about the project can be found on [Machine Learning Lab news pages](http://machinelearning.inginf.units.it/news/newregexgeneratortoolonline).

We hope that you find this code instructive and useful for your research or study activity.

If you use our code in your reasearch please cite our work and please share back your enhancements, fixes and 
modifications.

## Project Structure

The RegexGenerator project is organized in three NetBeans Java subprojects:

* ConsoleRegexTurtle:  cli frontend for the GP engine
* MaleRegexTurtle:       provides the regular expression tree representation
* Random Regex Turtle:     GP search engine 

## Requirements

- Java 1.8
- [optional] Ant (for build)
- [optional] Docker

## Installation

There is a build script `build.sh` which is based on ant and creates the Java program which finally will be located at `ConsoleRegexTurtle/dist`.


## Run It
Either run it by 
```bash
java -jar ConsoleRegexTurtle -t 4 -p 500 -g 1000 -e 20.0 -c "interesting evolution" -x true -d dataset.json -o ./outputfolder/
```

or if you are in a Linux environment you can use the shell wrapper, which automatically estimates memory limits for Java based on the installed and available RAM:
```bash
regexturtle.sh -t 4 -p 500 -g 1000 -e 20.0 -c "interesting evolution" -d dataset.json -o ./outputfolder/
```

Alternatively, you can use the docker version (see below).


### Dockerized Version

We provide a dockerized version, which does not require any additional software. To run the example just run
```bash
# create output folder
mkdir output data

# download example file
wget https://raw.githubusercontent.com/uklfr/RegexGenerator/master/ConsoleRegexTurtle/testdataset/reduced.json -O data/example.json

# run
docker run -v "$(pwd)/output:/output" -v "$(pwd)/data:/input" uklfr/regex_generator:latest -t 4 -p 500 -g 1000 -e 20.0 -c "interesting evolution" -d /input/example.json
```

You are free to run the command whereever you'd like to. Just be aware, that the input folder is mapped to `/input` inside the container and relative to this structure the input file `-d /input/example.json` has to be chosen.

## Other Links

[Twitter account](https://twitter.com/MaleLabTs) of Machine Learning Lab

RegexGenerator [wiki](https://github.com/MaLeLabTs/RegexGenerator/wiki) with installation walkthrough and guide

---

(1) This is a developement version branch which *slightly* differs from the cited works.

(2) BibTeX format:
```BibTex
@article{bartoli2016inference, 
  author={A. Bartoli and A. De Lorenzo and E. Medvet and F. Tarlao}, 
  journal={IEEE Transactions on Knowledge and Data Engineering}, 
  title={Inference of Regular Expressions for Text Extraction from Examples}, 
  year={2016}, 
  volume={28}, 
  number={5}, 
  pages={1217-1230}, 
  doi={10.1109/TKDE.2016.2515587}, 
  ISSN={1041-4347}, 
  month={May},
}
@inproceedings{bartoli2015evolutionary,
  title={Evolutionary Learning of Syntax Patterns for Genic Interaction Extraction},
  author={Bartoli, Alberto and De Lorenzo, Andrea and Medvet, Eric and
  Tarlao, Fabiano and Virgolin, Marco},
  booktitle={Proceedings of the 2015 on Genetic and Evolutionary Computation Conference},
  pages={1183--1190},
  year={2015},
  organization={ACM}
}
@article{bartoli2016can,
  title={Can a machine replace humans in building regular expressions? A case study},
  author={Bartoli, Alberto and De Lorenzo, Andrea and Medvet, Eric and Tarlao, Fabiano},
  journal={IEEE Intelligent Systems},
  volume={31},
  number={6},
  pages={15--21},
  year={2016},
  publisher={IEEE}
}
```
