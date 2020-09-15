
.PHONY: build
build: build-php-bsdiff build-php-xz


.PHONY: build-php-bsdiff
build-php-bsdiff:
	cd php-bsdiff && phpize
	cd php-bsdiff && ./configure --with-php-config=/usr/bin/php-config
	$(MAKE) -C php-bsdiff
	sudo $(MAKE) -C php-bsdiff install

.PHONY: build-php-xz
build-php-xz:
	cd php-xz && phpize
	cd php-xz && ./configure --with-php-config=/usr/bin/php-config
	$(MAKE) -C php-xz
	sudo $(MAKE) -C php-xz install
