CC?=gcc
CFLAGS?=-Wall -Werror
LDFLAGS?=

all:
	${CC} ${CFLAGS} -fPIC -c libsecret.c
	${CC} ${LDFLAGS} -shared -Wl,-soname,libsecret.so.1 -o libsecret.so.1.0 libsecret.o

install:
	mkdir -p ${DESTDIR}/usr/lib/
	install -m 0644 libsecret.so.1.0 ${DESTDIR}/usr/lib/
	ln -sf libsecret.so.1.0 ${DESTDIR}/usr/lib/libsecret.so.1
	ln -sf libsecret.so.1 ${DESTDIR}/usr/lib/libsecret.so

clean:
	rm -f libsecret.o libsecret.so.*
