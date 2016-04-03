# vim:ft=make

.SUFFIXES:

dirstamp:= .dirstamp

ANSIBLE_PLAYBOOK:= ansible-playbook

BUILD:=
CHECK:=
DIR:= config iso build
DISTCLEAN:=
MAINTAINERCLEAN:=
PREREQ=

MKDIR_P:= mkdir -p
INSTALL_d:= install -d
INSTALL:= install
TOUCH:= touch

DIRECTORIES:=
INSTALL_TARGETS=

DIRECTORIES+= $(addsuffix /$(dirstamp), $(DIR))
INSTALL_TARGETS+= $(HOME)/.ansible.cfg
INSTALL_TARGETS+= $(HOME)/.localhost/localhost

# Subdirectories, in random order
dir	= profile.d
include	$(dir)/Rules.mk
dir	= files
include	$(dir)/Rules.mk

PREREQ+= $(DIRECTORIES)

$(DIRECTORIES):
	@$(MKDIR_P) $(@D)
	@$(TOUCH) $@

.PHONY: clean
clean:
	@rm -rf $(addsuffix /*, $(DIR))
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

$(HOME)/.ansible.cfg: ansible.cfg
	@$(INSTALL) $< $@
	
$(HOME)/.localhost/localhost: inventory/localhost
	@$(MKDIR_P) $(@D)
	@$(INSTALL) $< $@

.PHONY: install
install: all $(INSTALL_TARGETS)

all: $(PREREQ) $(BUILD)

.DEFAULT_GOAL:= all

.NOTPARALLEL:
