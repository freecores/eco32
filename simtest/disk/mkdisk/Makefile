#
# Makefile for disk creator
#

BUILD = ../../../build

CC = gcc -m32
CFLAGS = -g -Wall
LDFLAGS = -g
LDLIBS = -lm

SRCS = mkdisk.c
OBJS = $(patsubst %.c,%.o,$(SRCS))
BIN = mkdisk

.PHONY:		all install clean

all:		$(BIN)

install:	$(BIN)
		mkdir -p $(BUILD)/simtest
		cp $(BIN) $(BUILD)/simtest

$(BIN):		$(OBJS)
		$(CC) $(LDFLAGS) -o $(BIN) $(OBJS) $(LDLIBS)

%.o:		%.c
		$(CC) $(CFLAGS) -o $@ -c $<

depend.mak:
		$(CC) -MM -MG $(CFLAGS) $(SRCS) >depend.mak

-include depend.mak

clean:
		rm -f *~ $(OBJS) $(BIN) depend.mak
