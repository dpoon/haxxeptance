#!/usr/bin/make -f

BINDIR = /usr/bin
DATADIR = /usr/share
MANDIR = $(DATADIR)/man

INSTALL = install
INSTALL_PROGRAM = $(INSTALL) -D -m 755
INSTALL_DATA = $(INSTALL) -D -m 644

all:

install: hxxp-open haxxeptance.desktop hxxp-open.1
	$(INSTALL_PROGRAM) hxxp-open '$(DESTDIR)$(BINDIR)/hxxp-open'
	$(INSTALL_DATA) haxxeptance.desktop '$(DESTDIR)$(DATADIR)/applications/haxxeptance.desktop'
	$(INSTALL_DATA) hxxp-open.1 '$(DESTDIR)$(MANDIR)/man1/hxxp-open.1'

.PHONY: all install
