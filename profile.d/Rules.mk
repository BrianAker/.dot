# Standard things
#
sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

PROFILE_D_$(d) := $(foreach profile_d_file, $(wildcard $(d)/*.sh), $(notdir $(profile_d_file)))

ALL_PROFILE_D_$(d) := $(foreach base_file,$(PROFILE_D_$(d)), $(addprefix $(HOME)/.$(d)/, $(base_file)))

$(HOME)/.$(d)/%: $(d)/%.sh
	install $< $@

INSTALL_TARGETS+= $(ALL_PROFILE_D_$(d))
