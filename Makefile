DOCKERBUILD = sudo docker build

%/timestamp: %/Dockerfile
	$(DOCKERBUILD) -t attpc/$* ./$* && \
	touch $@

all: narval rclog rcc rccgui eccserver
.PHONY: all
default: all

getbase: getbase/timestamp
getbase/timestamp: getbase/Dockerfile

get: get/timestamp
get/timestamp: get/Dockerfile getbase

eccserver: eccserver/timestamp
eccserver/timestamp: eccserver/Dockerfile get

daqbase: daqbase/timestamp
daqbase/timestamp: daqbase/Dockerfile

daq: daq/timestamp
daq/timestamp: daq/Dockerfile daqbase

narval: narval/timestamp
narval/timestamp: narval/Dockerfile daq

rclog: rclog/timestamp
rclog/timestamp: rclog/Dockerfile daq

rcc: rcc/timestamp
rcc/timestamp: rcc/Dockerfile daq

rccgui: rccgui/timestamp
rccgui/timestamp: rccgui/Dockerfile daq

clean:
	rm -f */timestamp
.PHONY: clean
