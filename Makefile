PACKAGE := VirtualGL
VERSION := $(shell grep VERSION= $(PACKAGE).cygport | sed 's/.*=//g')
RELEASE := $(shell grep RELEASE= $(PACKAGE).cygport | sed 's/.*=//g')
ARCH := $(shell uname -m)

all: $(PACKAGE)-$(VERSION)-$(RELEASE).$(ARCH)

clean:
	$(RM) -r $(PACKAGE)-[0-9]*

$(PACKAGE)-$(VERSION)-$(RELEASE).$(ARCH): $(PACKAGE).cygport \
	$(PACKAGE)-$(VERSION).tar.gz
	cygport $(PACKAGE).cygport all

$(PACKAGE)-$(VERSION).tar.gz:
	cygport $(PACKAGE).cygport fetch
