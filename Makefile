# Variables
ANT ?= ant
JDBC = jdbc
SAMPLE = samples/PostPicSQL

# Targets
jdbc: check
	@${ANT} -f ${JDBC}/build.xml

samples: jdbc
	@${ANT} -f ${SAMPLE}/build.xml

clean:
	@${ANT} -f ${JDBC}/build.xml clean
	@${ANT} -f ${SAMPLE}/build.xml clean

all: jdbc samples

check:
	@echo " *** Checking for required programs"
	@(echo -n " ant                  :" && which ant) || (echo " missing!"  && exit 1)

.PHONY:	jdbc clean check

