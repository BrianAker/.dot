# vim:ft=make
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

dirstamp:= .dirstamp

ANSIBLE_PLAYBOOK:= ansible-playbook

INSTALL_DIR_TARGETS=
PREREQ_DIR=

INSTALL_DIR_TARGETS+= $(PROFILE_D)
PROFILE_D:= $(HOME)/.profile.d

PREREQ_DIR+= config iso build

BUILD:=
CHECK:=
DISTCLEAN:=
MAINTAINERCLEAN:=
PREREQ=

MKDIR_P:= mkdir -p
INSTALL_d:= install -d
INSTALL:= install
TOUCH:= touch

build_DIRECTORIES:= $(addsuffix /$(dirstamp), $(PREREQ_DIR))
install__DIRECTORIES:= $(addsuffix /$(dirstamp), $(INSTALL_DIR_TARGETS))
INSTALL_PM:= $(HOME)/Library/Perl5/lib/perl5/install.pm

INSTALL_TARGETS+= $(HOME)/.ansible.cfg
INSTALL_TARGETS+= $(HOME)/.localhost/localhost

# Subdirectories, in random order
dir	= profile.d
include	$(dir)/Rules.mk
dir	= files
include	$(dir)/Rules.mk

PREREQ+= $(build_DIRECTORIES)

$(INSTALL_DIR_TARGETS)/$(dirstamp):
	@$(MKDIR_P) $(@D)
	@$(TOUCH) $@

.PHONY: install_dir_am
install_dir_am: $(install__DIRECTORIES)

$(PREREQ_DIR)/$(dirstamp):
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
	@rm -rf $(INSTALL_DIR_TARGETS)
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

PROFILE_D_FILES_SRC := $(wildcard profile.d/*.sh)
PROFILE_D_FILES_DST := $(addprefix $(PROFILE_D)/,$(notdir $(PROFILE_D_FILES_SRC)))
INSTALL_TARGETS += $(PROFILE_D_FILES_DST)

$(PROFILE_D_FILES_DST): $(PROFILE_D_FILES_SRC)
	@$(INSTALL) $< $@

.PHONY: install
install: all $(install__DIRECTORIES) $(INSTALL_TARGETS)

all: $(PREREQ) $(BUILD)

$(INSTALL_PM): 
	echo "sudo cpan local::lib"
	exit 1

.DEFAULT_GOAL:= all

.NOTPARALLEL:
