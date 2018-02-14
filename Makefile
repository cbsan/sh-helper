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

info:
	-@echo "make install all -> Install all helpers"
	-@echo "make install php -> Install php helpers"

uninstall:
	rm -f $(DIR_BIN)/$(PHP)
	rm -f $(DIR_BIN)/$(PHP5)
	rm -rf $(DIR_HELPERS)

install:
	@echo "Configuring helpers..."
	rm -rf $(DIR_HELPERS) && mkdir -p $(DIR_HELPERS)
	cp -r $(DIR_SH_PHP)/$(PHP).$(EXT_FILE) $(DIR_HELPERS)/$(PHP).$(EXT_FILE).$(VERSION)
	cp -r $(DIR_SH_PHP)/$(PHP5).$(EXT_FILE) $(DIR_HELPERS)/$(PHP5).$(EXT_FILE).$(VERSION)
	rm -f $(DIR_BIN)/$(PHP)
	rm -f $(DIR_BIN)/$(PHP5)
	ln -sF $(DIR_HELPERS)/$(PHP).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHP)
	ln -sF $(DIR_HELPERS)/$(PHP5).$(EXT_FILE).$(VERSION) $(DIR_BIN)/$(PHP5)
	chmod a+x $(DIR_BIN)/$(PHP)
	chmod a+x $(DIR_BIN)/$(PHP5)
	@echo "Ok!"