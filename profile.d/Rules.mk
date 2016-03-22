# Standard things
#
sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

TARGETS_$(d) := $(wildcard $(d)/*.sh)

ALL_TARGETS_$(d) := $(addprefix $(HOME)/., $(TARGETS_$(d)))

$(ALL_TARGETS_$(d)):
	install $(d)/$(@F)  $@

INSTALL_TARGETS+= $(ALL_TARGETS_$(d))

