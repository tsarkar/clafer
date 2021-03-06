SRC_DIR  = src
TEST_DIR = test
TOOL_DIR = tools

all: build

install:  
	mkdir -p $(to)
	mkdir -p $(to)/tools
	cp -f tools/alloy4.jar $(to)/tools
	cp -f tools/alloy4.2-rc.jar $(to)/tools
	cabal install --bindir=$(to)
	cp -f README.md $(to)/clafer-README.md
	cp -f tools/XsdCheck.class $(to)/tools


build:
	$(MAKE) -C $(TOOL_DIR)
	cabal install --only-dependencies
	cabal configure
	cabal build
	cp dist/build/clafer/clafer .

# build Schema.hs from ClaferIG.xsd, call after .xsd changed
Schema.hs:
	$(MAKE) -C $(SRC_DIR)

# enable profiler
prof:
	$(MAKE) -C $(SRC_DIR)
	$(MAKE) -C $(TOOL_DIR)
	ghc -isrc -prof -auto-all -rtsopts -O -outputdir dist/build --make src/clafer -o clafer

.PHONY : test

test:
	$(MAKE) -C $(TEST_DIR) test

reg:
	$(MAKE) -C $(TEST_DIR) reg

newVersion:
	$(MAKE) -C $(SRC_DIR) newVersion

clean:
	$(MAKE) -C $(TEST_DIR) clean
	$(MAKE) -C $(SRC_DIR) clean
	$(MAKE) -C $(TOOL_DIR) clean
	rm -rf dist
	rm -f clafer
	find . -type f -name '*.o' -print0 | xargs -0 rm -f
	find . -type f -name '*.hi' -print0 | xargs -0 rm -f
	find . -type f -name '*~' -print0 | xargs -0 rm -f
