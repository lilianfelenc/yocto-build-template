include .env
export

KAS := ./kas-container
CONF := project-config.yml

.PHONY: shell build clean menuconfig

# Drop into an interactive dev shell inside the container,
# with the BitBake environment already sourced.
shell:
	$(KAS) shell $(CONF)

# Non-interactive build
build:
	$(KAS) build $(CONF)

# Wipe local build output (not the shared caches)
clean:
	rm -rf build

# wipe cache
cleanall:
	rm -rf $(DL_DIR)
	rm -rf $(SSTATE_DIR)
