# vim:ft=make

.SUFFIXES:

dirstamp:= .dirstamp

ANSIBLE_PLAYBOOK:= ansible-playbook

BUILD:=
CHECK:=
DIR:= config iso
DISTCLEAN:=
MAINTAINERCLEAN:=
PREREQ=

MKDIR_P:= mkdir -p
TOUCH:= touch

DIRECTORIES:= $(addsuffix /$(dirstamp), $(DIR))
INSTALL_PM:= $(HOME)/Library/Perl5/lib/perl5/install.pm

PREREQ+= $(DIRECTORIES)

$(DIRECTORIES):
	@$(MKDIR_P) $(@D)
	@$(TOUCH) $@

.PHONY: clean
clean:
	@rm -rf $(BUILD)

.PHONY: distclean
distclean: clean distclean-am

.PHONY: distclean-am
distclean-am:
	@rm -rf $(PREREQ)
	@rm -rf $(DISTCLEAN)

.PHONY: maintainer-clean
maintainer-clean: distclean
	@rm -rf $(MAINTAINERCLEAN)

.PHONY: check
check: all $(CHECK)

.PHONY: install
install: all

all: $(PREREQ) $(BUILD)
	@$(ANSIBLE_PLAYBOOK) go.yaml

$(INSTALL_PM): 
	echo "sudo cpan local::lib"
	exit 1

.DEFAULT_GOAL:= all

.NOTPARALLEL:
