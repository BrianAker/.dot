# vim:ft=make
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

dirstamp:= .dirstamp

ANSIBLE_PLAYBOOK:= ansible-playbook

PROFILE_D:= $(HOME)/.profile.d

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

DIRECTORIES:= $(addsuffix /$(dirstamp), $(DIR))
INSTALL_PM:= $(HOME)/Library/Perl5/lib/perl5/install.pm

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

INSTALL_TARGETS += $(PROFILE_D)/README
$(PROFILE_D)/README:
	@$(MKDIR_P) $(@D)
	@$(TOUCH) $@

PROFILE_D_FILES_SRC := $(wildcard profile.d/*.sh)
PROFILE_D_FILES_DST := $(addprefix $(PROFILE_D)/,$(notdir $(PROFILE_D_FILES_SRC)))
INSTALL_TARGETS += $(PROFILE_D_FILES_DST)

$(PROFILE_D_FILES_DST): $(PROFILE_D_FILES_SRC)
	@$(INSTALL) $< $@

.PHONY: install
install: all $(INSTALL_TARGETS)

all: $(PREREQ) $(BUILD)

$(INSTALL_PM): 
	echo "sudo cpan local::lib"
	exit 1

.DEFAULT_GOAL:= all

.NOTPARALLEL:
