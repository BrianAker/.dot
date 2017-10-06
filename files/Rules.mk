# Standard things
sp 		:= $(sp).x
dirstack_$(sp)	:= $(d)
d		:= $(dir)

DOT_FILES_$(d) := $(foreach dot_file, $(wildcard $(d)/*.sh), $(basename $(notdir $(dot_file))))
ALL_DOT_FILES_$(d) := $(foreach base_file,$(DOT_FILES_$(d)),$(addprefix $(HOME)/., $(base_file)))

# ALL_DOT_FILES_$(d): $(addprefix $(d)/, $(DOT_FILES_$(d)))
# 	install $(d)/$(@F)  $@
$(HOME)/.%: $(d)/%.sh
	install $< $@

INSTALL_TARGETS+=$(HOME)/.customrc

INSTALL_TARGETS+= $(ALL_DOT_FILES_$(d))

.PHONY: dot_file_print
dot_file_print:
	@echo $(ALL_DOT_FILES_$(d))
	@echo $(DOT_FILES_$(d))
