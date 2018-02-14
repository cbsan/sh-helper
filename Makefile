###############################################
# Install helpers for development environment #
###############################################

DIR_HELPERS=/opt/sh-helpers
DIR_BIN=/usr/local/bin
DIR_SH_PHP=./php
DIR_SH_NODE=./node
DIR_SH_MONGO=./mongo
EXT_FILE=sh
VERSION=1

PHP=php
PHP5=php5
PHPCS=phpcs
PHPCBF=phpcbf
PHPCSFIXER=php-cs-fixer

NG=ng
NPM=npm
NODE=node
GULP=gulp
BOWER=bower

MONGO=mongo

info:
	-@echo "make install all -> Install all helpers"

uninstall:
	rm -f $(DIR_BIN)/$(PHP)
	rm -f $(DIR_BIN)/$(PHP5)
	rm -f $(DIR_BIN)/$(PHPCS)
	rm -f $(DIR_BIN)/$(PHPCBF)
	rm -f $(DIR_BIN)/$(PHPCSFIXER)
	rm -f $(DIR_BIN)/$(NG)
	rm -f $(DIR_BIN)/$(NPM)
	rm -f $(DIR_BIN)/$(NODE)
	rm -f $(DIR_BIN)/$(GULP)
	rm -f $(DIR_BIN)/$(MONGO)
	rm -f $(DIR_BIN)/$(BOWER)
	rm -rf $(DIR_HELPERS)

install:
	@echo "Configuring helpers..."
	rm -rf $(DIR_HELPERS) && mkdir -p $(DIR_HELPERS)
	cp -r $(DIR_SH_PHP)/$(PHP).$(EXT_FILE) $(DIR_HELPERS)/$(PHP).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHP5).$(EXT_FILE) $(DIR_HELPERS)/$(PHP5).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHPCS).$(EXT_FILE) $(DIR_HELPERS)/$(PHPCS).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHPCBF).$(EXT_FILE) $(DIR_HELPERS)/$(PHPCBF).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHPCSFIXER).$(EXT_FILE) $(DIR_HELPERS)/$(PHPCSFIXER).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_NODE)/$(NG).$(EXT_FILE) $(DIR_HELPERS)/$(NG).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_NODE)/$(NPM).$(EXT_FILE) $(DIR_HELPERS)/$(NPM).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_NODE)/$(NODE).$(EXT_FILE) $(DIR_HELPERS)/$(NODE).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_NODE)/$(GULP).$(EXT_FILE) $(DIR_HELPERS)/$(GULP).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_NODE)/$(BOWER).$(EXT_FILE) $(DIR_HELPERS)/$(BOWER).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_MONGO)/$(MONGO).$(EXT_FILE) $(DIR_HELPERS)/$(MONGO).$(EXT_FILE).$(VERSION)
	rm -f $(DIR_BIN)/$(PHP)
	rm -f $(DIR_BIN)/$(PHP5)
	rm -f $(DIR_BIN)/$(PHPCS)
	rm -f $(DIR_BIN)/$(PHPCBF)
	rm -f $(DIR_BIN)/$(PHPCSFIXER)
	rm -f $(DIR_BIN)/$(NG)
	rm -f $(DIR_BIN)/$(NPM)
	rm -f $(DIR_BIN)/$(NODE)
	rm -f $(DIR_BIN)/$(GULP)
	rm -f $(DIR_BIN)/$(BOWER)
	rm -f $(DIR_BIN)/$(MONGO)
	ln -sF $(DIR_HELPERS)/$(PHP).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHP)
	ln -sF $(DIR_HELPERS)/$(PHP5).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHP5)
	ln -sF $(DIR_HELPERS)/$(PHPCS).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHPCS)
	ln -sF $(DIR_HELPERS)/$(PHPCBF).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHPCBF)
	ln -sF $(DIR_HELPERS)/$(PHPCSFIXER).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHPCSFIXER)
	ln -sF $(DIR_HELPERS)/$(NG).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(NG)
	ln -sF $(DIR_HELPERS)/$(NPM).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(NPM)
	ln -sF $(DIR_HELPERS)/$(NODE).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(NODE)
	ln -sF $(DIR_HELPERS)/$(GULP).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(GULP)
	ln -sF $(DIR_HELPERS)/$(BOWER).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(BOWER)
	ln -sF $(DIR_HELPERS)/$(MONGO).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(MONGO)
	chmod a+x $(DIR_BIN)/$(PHP)
	chmod a+x $(DIR_BIN)/$(PHP5)
	chmod a+x $(DIR_BIN)/$(PHPCS)
	chmod a+x $(DIR_BIN)/$(PHPCBF)
	chmod a+x $(DIR_BIN)/$(PHPCSFIXER)
	chmod a+x $(DIR_BIN)/$(NG)
	chmod a+x $(DIR_BIN)/$(NPM)
	chmod a+x $(DIR_BIN)/$(NODE)
	chmod a+x $(DIR_BIN)/$(GULP)
	chmod a+x $(DIR_BIN)/$(BOWER)
	chmod a+x $(DIR_BIN)/$(MONGO)
	@echo "Ok!"