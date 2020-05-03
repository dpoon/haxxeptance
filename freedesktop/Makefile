#!/usr/bin/make -f

BINDIR = /usr/bin
DATADIR = /usr/share
MANDIR = $(DATADIR)/man

INSTALL = install
INSTALL_PROGRAM = $(INSTALL) -D -o root -g root -m 755
INSTALL_DATA = $(INSTALL) -D -o root -g root -m 644

install: hxxp-open haxxeptance.desktop hxxp-open.1
	$(INSTALL_PROGRAM) hxxp-open '$(DESTDIR)$(BINDIR)/hxxp-open'
	$(INSTALL_PROGRAM) haxxeptance.desktop '$(DESTDIR)$(DATADIR)/applications/haxxeptance.desktop'
	$(INSTALL_PROGRAM) hxxp-open.1 '$(DESTDIR)$(MANDIR)/man1/hxxp-open.1'
