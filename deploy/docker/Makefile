# By Dan Chalmers <dan@danchalmers.me.uk>
# January 2016

DIRS := $(shell find . -mindepth 1 -maxdepth 1 -type d)
DOCKERFILES := $(addsuffix /Dockerfile,$(DIRS))
IMAGES := $(subst /,,$(subst ./,,$(dir $(DOCKERFILES))))
FLAG_FILES := $(addprefix ., $(addsuffix .docker, $(IMAGES)))
PWD := $(shell pwd)


# Docker images can depend on each other.
# A changed base image ought to trigger a rebuild of its children.
define image_dep_search
	@echo "checking dependencies of $1"
	@for d in $(IMAGES); do \
		from=`grep FROM $$d/Dockerfile | cut -d ' ' -f 2`; \
		if [ $1 = $$from ]; then \
			echo "dependent image $$d"; \
			touch $$d; \
			make .$$d.docker; \
		fi\
	done
endef

# Consider all docker image directories for building
# Manually putting deb_base first is nasty, but ensures that it is built first on first use.
images: .deb_base.docker $(FLAG_FILES)
	@echo "Done making images."

# Build images where the directory or contents have changed since flag last set
.%.docker: % %/*
	$(eval IMAGE = $(subst .,,$(basename $@)))
	$(eval BASE = $(word 2,$(shell grep FROM $(addsuffix /Dockerfile,$(IMAGE)))))
	$(eval HAS_DEP = $(filter $(BASE),$(IMAGES)))
	@echo "building $(IMAGE)"
	@cd $(IMAGE) && docker build -t $(IMAGE) .
	@touch $@
	$(call image_dep_search,$(IMAGE))

all: images

clean:
	@rm -f $(FLAG_FILES)

