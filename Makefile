#!/usr/bin/make -f
.PHONY: all install uninstall dist man

prefix?=/usr/local

VERSION=`cat VERSION`
docdir?=$(prefix)/share/doc/git-changelog-$(VERSION)

all:
	@echo "There is nothing to compile."
	@echo "Run 'make install' to install in /usr/local,"
	@echo "or 'make prefix=<path> install' to install in <path>."

install: install-doc
	@echo Installing git-changelog $(VERSION) to $(prefix)...
	mkdir -p $(DESTDIR)$(prefix)/bin
	install -m 755 git-changelog $(DESTDIR)$(prefix)/bin
	mkdir -p $(DESTDIR)$(prefix)/share/man/man1
	cp -d -r git-changelog.1 $(DESTDIR)$(prefix)/share/man/man1

uninstall: uninstall-doc
	@echo "Uninstalling previously installed git-changelog..."
	rm -f $(DESTDIR)$(prefix)/bin/git-changelog
	rm -f $(DESTDIR)$(prefix)/share/man/man1/git-changelog.1

uninstall-doc:
	rm -rf $(DESTDIR)$(docdir)

install-doc:
	mkdir -p $(DESTDIR)$(docdir)
	install -m 644 Changelog.markdown README.markdown LICENSE $(DESTDIR)$(docdir)

# This is meant for creating a distribution tarball from the repository and
# not for the use by end users
dist:
	mkdir -p "../git-changelog-$(VERSION)"
	rsync -a . "../git-changelog-$(VERSION)" --exclude '.*'
	tar czf "../git-changelog-$(VERSION).tar.gz" "../git-changelog-$(VERSION)"
	rm -rf "../git-changelog-$(VERSION)"

# If you made changes into git-changelog and updated the ascci file accordingly:
man:
	a2x -vf manpage git-changelog.ascii
