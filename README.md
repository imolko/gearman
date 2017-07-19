# gearman
Imagen docker para gearman:

* Soporta libsqlite3, libmysql, libdrizzle, libmemcached
* Soporta ssl con openssl.

* CPP Flags:                  -fvisibility=hidden
* LIBS:                      
* LDFLAGS Flags:             
* Assertions enabled:        no
* Debug enabled:             no
* Warnings as failure:       no
* Building with hiredis      no
* Building with libsqlite3   no
* Building with libdrizzle   yes
* Building with libmemcached not found
* Building with libpq        no
* Building with tokyocabinet no
* Building with libmysql     yes
* SSL enabled:               yes
* wolfssl found:             no
* openssl found:             yes
* make -j:                   no
* VCS checkout:              no
* sphinx-build:              :

```
./configure \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--with-mysql=yes \
		--with-postgresql=no \
		--disable-libpq \
		--disable-libtokyocabinet \
		--disable-libdrizzle \
		--disable-libmemcached \
		--enable-ssl \
		--disable-hiredis \
		--enable-jobserver=no 
```
