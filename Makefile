

getSubstring = $(word $2,$(subst -, ,$1))
getNotSubstring = $(subst $(word $2,$(subst -, ,$1))-,,$1)


.PHONY: prep-debian-common
prep-debian-common:
	sudo apt-get update
	sudo apt-get install -y git \
	build-essential linux-headers-$(uname -r) \
	php-dev libapache2-mod-php \
	libbz2-dev
	sudo systemctl restart apache2
	git submodule update --init --recursive

.PHONY: prep-debian-10
prep-debian-10: prep-debian-common

.PHONY: build-third-party
build-third-party:
	$(MAKE) $(call getSubstring,$@,1) -C $(call getNotSubstring,$@,1)

.PHONY: all
all: build-third-party
