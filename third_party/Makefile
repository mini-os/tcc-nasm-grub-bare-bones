UNIFONT_VERSION=10.0.05

.PHONY: clean all grub nasm tcc

all: nasm tcc grub

clean:
	rm -rf grub nasm tcc build-grub unifont-$(UNIFONT_VERSION) unifont*.tar.gz \
	*.tar.xz *.tar.bz2

grub:
	cd grub && sh autogen.sh
	cd grub && sh ./configure --disable-werror \
	--prefix=$(PREFIX) --with-platform=$(ARCH) --target=$(TARGET) 
	$(MAKE) -C grub
	$(MAKE) -C grub install
	mkdir -p $(PREFIX)/share/locale
	curl -LO http://unifoundry.com/pub/unifont-$(UNIFONT_VERSION)/unifont-$(UNIFONT_VERSION).tar.gz
	tar xf unifont-$(UNIFONT_VERSION).tar.gz
	$(PREFIX)/bin/grub-mkfont \
	-o $(PREFIX)/share/grub/unicode.pf2 \
	unifont-$(UNIFONT_VERSION)/font/precompiled/unifont-$(UNIFONT_VERSION).ttf

nasm:
	cd nasm && sh autogen.sh
	cd nasm && sh ./configure --prefix=$(PREFIX)
	$(MAKE) -C nasm
	$(MAKE) -C nasm install

tcc:
	cd tcc && sh ./configure  --prefix=$(PREFIX) --enable-cross
	$(MAKE) -C tcc
	$(MAKE) -C tcc install