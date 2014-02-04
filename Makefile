#
# Makefile for ECO32 project
#

VERSION = 0.22

DIRS = doc binutils sim simtest
BUILD = `pwd`/build

.PHONY:		all compiler builddir clean dist

all:		compiler
		for i in $(DIRS) ; do \
		  $(MAKE) -C $$i install ; \
		done

compiler:	builddir
		$(MAKE) -C lcc BUILDDIR=$(BUILD)/bin \
		  HOSTFILE=etc/eco32-netbsd.c lcc
		$(MAKE) -C lcc BUILDDIR=$(BUILD)/bin all
		rm -f $(BUILD)/bin/*.c
		rm -f $(BUILD)/bin/*.o
		rm -f $(BUILD)/bin/*.a

builddir:
		mkdir -p $(BUILD)
		mkdir -p $(BUILD)/bin

clean:
		for i in $(DIRS) ; do \
		  $(MAKE) -C $$i clean ; \
		done
		rm -rf $(BUILD)
		rm -f *~

dist:		clean
		(cd .. ; \
		 tar --exclude-vcs -cvf \
		   eco32-$(VERSION).tar \
		   eco32-$(VERSION)/* ; \
		 gzip -f eco32-$(VERSION).tar)
