DOCKERBUILD = sudo docker build

%: %/Dockerfile
	cd $@ && \
	$(DOCKERBUILD) -t attpc/$@ . && \
	touch $@

all: get daq eccserver
.PHONY: all

get: getbase

eccserver: get

daq: daqbase

build: getbuild daqbuild

