.POSIX:
.PHONY: help checkpoint backup


.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' 'Makefile' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@egrep -h 'h' 'Makefile' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

checkpoint:
	curl -O http://drummer.scripting.com/jackbaty/blog.opml
	curl -O http://drummer.scripting.com/jackbaty/about.opml
	curl -O http://drummer.scripting.com/jackbaty/glossary.opml
	curl -O http://drummer.scripting.com/jackbaty/microblog.opml
	git add .
	git diff-index --quiet HEAD || git commit -m "Publish checkpoint"

repo: 
	open https://github.com/jackbaty/drummer-opml

backup: checkpoint
	git push

