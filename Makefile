# vim:ft=make
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

dirstamp:= .dirstamp

ANSIBLE_PLAYBOOK:= ansible-playbook

INSTALL_DIR_TARGETS=
PREREQ_DIR=
am_DIRECTORIES=

INSTALL_DIR_TARGETS+= $(PROFILE_D)
PROFILE_D:= $(HOME)/.profile.d

PREREQ_DIR+= config iso build

BUILD:=
CHECK:=
DISTCLEAN:=
MAINTAINERCLEAN:=
PREREQ=

MKDIR_P:= mkdir -p
INSTALL_D:= install -d
INSTALL:= install
TOUCH:= touch
TOUCH_R:= touch -r

am_build__DIRECTORIES= $(addprefix $(VIM_DIR)/, $(INSTALL_DIR_TARGETS))
build__DIRECTORIES= $(addsuffix /$(dirstamp), $(am_install__DIRECTORIES))

am_install__DIRECTORIES= $(addprefix $(VIM_DIR)/, $(INSTALL_DIR_TARGETS))
install__DIRECTORIES= $(addsuffix /$(dirstamp), $(am_install__DIRECTORIES))

am_DIRECTORIES+= $(build__DIRECTORIES)
am_DIRECTORIES+= $(install__DIRECTORIES)

INSTALL_PM:= $(HOME)/Library/Perl5/lib/perl5/install.pm

INSTALL_TARGETS+= $(HOME)/.ansible.cfg
INSTALL_TARGETS+= $(HOME)/.localhost/localhost

# Subdirectories, in random order
dir	= profile.d
include	$(dir)/Rules.mk
dir	= files
include	$(dir)/Rules.mk

PREREQ+= $(build__DIRECTORIES)

$(am_DIRECTORIES):
	@$(INSTALL_D) $(@D)
	@$(TOUCH) $@

.PHONY: install_dir_am
install_dir_am: $(install__DIRECTORIES)

.PHONY: clean
clean:
	@rm -rf $(addsuffix /*, $(DIR))
	@rm -rf $(BUILD)

.PHONY: distclean
distclean: clean distclean-am

.PHONY: distclean-am
distclean-am:
	@rm -rf $(INSTALL_DIR_TARGETS)
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
