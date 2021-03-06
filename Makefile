.PHONY: all test clean

all: test

test: # @HELP run the integration tests
test:
	helmit test ./test -c .

publish: # @HELP publish version on github
	./../build-tools/publish-version ${VERSION}

bumponosdeps: # @HELP update "onosproject" go dependencies and push patch to git.
	./../build-tools/bump-onos-deps ${VERSION}

help:
	@grep -E '^.*: *# *@HELP' $(MAKEFILE_LIST) \
    | sort \
    | awk ' \
        BEGIN {FS = ": *# *@HELP"}; \
        {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}; \
    '
