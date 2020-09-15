
.PHONY: build
build: build-bsdiff-php


.PHONY: build-bsdiff-php
build-bsdiff-php:
	cd bsdiff-php && phpize
	cd bsdiff-php && ./configure --with-php-config=/usr/bin/php-config
	$(MAKE) -C bsdiff-php
	sudo $(MAKE) -C bsdiff-php install
