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

.DEFAULT_GOAL:= all

.NOTPARALLEL:
