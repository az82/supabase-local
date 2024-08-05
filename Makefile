SUPABASE_DIR := supabase
SUPABASE_DOCKER_DIR := $(SUPABASE_DIR)/docker

.PHONY: help
help: ## Show this help
	@echo "Makefile goals:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-24s\033[0m %s\n", $$1, $$2}'


.PHONY: install
install: $(SUPABASE_DOCKER_DIR)/.env ## Initialize Supabase


$(SUPABASE_DOCKER_DIR)/.env:
	git clone --depth 1 https://github.com/supabase/supabase $(SUPABASE_DIR)
	cp $(SUPABASE_DOCKER_DIR)/.env.example $(SUPABASE_DOCKER_DIR)/.env
	# Apply patches to the supabase setup
	for p in patches/*; do patch -r --forward --batch -d supabase < $$p; done
	cd $(SUPABASE_DIR) && git config --local commit.gpgsign false && git add --all && git commit -m "Apply patches"

.PHONY: clean
clean:  ## Clean Supabase
	rm -rf $(SUPABASE_DIR)
