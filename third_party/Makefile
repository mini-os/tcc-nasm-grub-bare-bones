UNIFONT_VERSION=10.0.05

.PHONY: clean all grub nasm tcc

all: nasm tcc grub clean

clean:
	rm -rf grub nasm tcc build-grub unifont-$(UNIFONT_VERSION) unifont*.tar.gz

grub:
	curl ftp://ftp.gnu.org/gnu/grub/grub-2.02.tar.xz > grub.tar.xz
	tar -xvf grub.tar.xz -C grub --strip-components=1
	cd grub && sh autogen.sh
	cd grub && sh configure --disable-werror \
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
	curl https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03-xdoc.tar.xz > nasm.tar.xz
	tar -xvf nasm.tar.xz -C nasm --strip-components=1
	cd nasm && sh autogen.sh
	cd nasm && sh configure --prefix=$(PREFIX)
	$(MAKE) -C nasm
	$(MAKE) -C nasm install

tcc:
	curl http://download.savannah.gnu.org/releases/tinycc/tcc-0.9.26.tar.bz2 > tcc.tar.bz2
	tar -xvjf tcc.tar.bz2 -C tcc --strip-components=1
	cd tcc && sh configure  --prefix=$(PREFIX) --enable-cross
	$(MAKE) -C tcc
	$(MAKE) -C tcc install