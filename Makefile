# vim:ft=make
MAKEFLAGS += --no-builtin-rules

.SUFFIXES:

dirstamp := .dirstamp

ANSIBLE_PLAYBOOK:= ansible-playbook

INSTALL_DIR_TARGETS=
PREREQ_DIR_TARGETS=
BUILD_DIR_TARGETS=
am_DIRECTORIES=
PREREQ=

INSTALL_DIR_TARGETS+= .profile_d
PROFILE_D= $(HOME)/.profile.d

PREREQ_DIR_TARGETS+= config iso
BUILD_DIR_TARGETS+= build

BUILD:=
CHECK:=
DISTCLEAN:=
MAINTAINERCLEAN:=

MKDIR_P:= mkdir -p
INSTALL_D:= install -d
INSTALL_CD:= install -d
INSTALL:= install
TOUCH:= touch
TOUCH_R:= touch -r

prereq__DIRECTORIES= $(addsuffix /$(dirstamp), $(PREREQ_DIR_TARGETS))

build__DIRECTORIES= $(addsuffix /$(dirstamp), $(BUILD_DIR_TARGETS))

am_install__DIRECTORIES= $(addprefix $(HOME)/, $(INSTALL_DIR_TARGETS))
install__DIRECTORIES= $(addsuffix /$(dirstamp), $(am_install__DIRECTORIES))

am_DIRECTORIES+= $(prereq__DIRECTORIES)
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

PREREQ_DIR+= $(build__DIRECTORIES)

%/.dirstamp:
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

profile_d_src := $(wildcard profile.d/*.sh)

TARGET_PROFILE_D = $(addprefix $(HOME)/., $(profile_d_src))
INSTALL_TARGETS += $(TARGET_PROFILE_D)

.PHONY: install_profile_d_am
install_profile_d_am: $(profile_d_src)
	$(INSTALL) $? $(PROFILE_D)

.PHONY: install
install: all $(install__DIRECTORIES) $(INSTALL_TARGETS)

all: $(prereq__DIRECTORIES) $(build__DIRECTORIES) $(PREREQ) $(BUILD)

$(INSTALL_PM): 
	echo "sudo cpan local::lib"
	exit 1

.DEFAULT_GOAL := all

.NOTPARALLEL:
