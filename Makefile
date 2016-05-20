DOCKERBUILD = sudo docker build

%/timestamp: %/Dockerfile
	$(DOCKERBUILD) -t attpc/$* ./$* && \
	touch $@

all: polyorb narval_naming aws_shell rclog rcc rccgui eccserver
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

polyorb: polyorb/timestamp
polyorb/timestamp: polyorb/Dockerfile polyorb/launch_naming.sh daq

narval_naming: narval_naming/timestamp
narval_naming/timestamp: narval_naming/Dockerfile daq

aws_shell: aws_shell/timestamp
aws_shell/timestamp: aws_shell/Dockerfile daq

rccbase: rccbase/timestamp
rccbase/timestamp: rccbase/Dockerfile daq

rclog: rclog/timestamp
rclog/timestamp: rclog/Dockerfile rccbase

rcc: rcc/timestamp
rcc/timestamp: rcc/Dockerfile rccbase

rccgui: rccgui/timestamp
rccgui/timestamp: rccgui/Dockerfile rccbase

clean:
	rm -f */timestamp
.PHONY: clean
