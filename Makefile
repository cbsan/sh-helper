###############################################
# Install helpers for development environment #
###############################################

DIR_HELPERS=/opt/sh-helpers
DIR_BIN=/usr/local/bin
DIR_SH_PHP=./php
EXT_FILE=sh
VERSION=1

PHP=php
PHP5=php5
PHPCS=phpcs
PHPCBF=phpcbf
PHPCSFIXER=php-cs-fixer

info:
	-@echo "make install all -> Install all helpers"
	-@echo "make install php -> Install php helpers"

uninstall:
	rm -f $(DIR_BIN)/$(PHP)
	rm -f $(DIR_BIN)/$(PHP5)
	rm -f $(DIR_BIN)/$(PHPCS)
	rm -f $(DIR_BIN)/$(PHPCBF)
	rm -f $(DIR_BIN)/$(PHPCSFIXER)
	rm -rf $(DIR_HELPERS)

install:
	@echo "Configuring helpers..."
	rm -rf $(DIR_HELPERS) && mkdir -p $(DIR_HELPERS)
	cp -r $(DIR_SH_PHP)/$(PHP).$(EXT_FILE) $(DIR_HELPERS)/$(PHP).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHP5).$(EXT_FILE) $(DIR_HELPERS)/$(PHP5).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHPCS).$(EXT_FILE) $(DIR_HELPERS)/$(PHPCS).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHPCBF).$(EXT_FILE) $(DIR_HELPERS)/$(PHPCBF).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHPCSFIXER).$(EXT_FILE) $(DIR_HELPERS)/$(PHPCSFIXER).$(EXT_FILE).$(VERSION)
	rm -f $(DIR_BIN)/$(PHP)
	rm -f $(DIR_BIN)/$(PHP5)
	rm -f $(DIR_BIN)/$(PHPCS)
	rm -f $(DIR_BIN)/$(PHPCBF)
	rm -f $(DIR_BIN)/$(PHPCSFIXER)
	ln -sF $(DIR_HELPERS)/$(PHP).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHP)
	ln -sF $(DIR_HELPERS)/$(PHP5).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHP5)
	ln -sF $(DIR_HELPERS)/$(PHPCS).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHPCS)
	ln -sF $(DIR_HELPERS)/$(PHPCBF).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHPCBF)
	ln -sF $(DIR_HELPERS)/$(PHPCSFIXER).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHPCSFIXER)
	chmod a+x $(DIR_BIN)/$(PHP)
	chmod a+x $(DIR_BIN)/$(PHP5)
	chmod a+x $(DIR_BIN)/$(PHPCS)
	chmod a+x $(DIR_BIN)/$(PHPCBF)
	chmod a+x $(DIR_BIN)/$(PHPCSFIXER)
	@echo "Ok!"