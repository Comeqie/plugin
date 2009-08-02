# npsimple version
VERSION = 0.3

# Customize below to fit your system

ifeq (${shell uname}, Darwin)
CPPFLAGS = -DVERSION=\"${VERSION}\" -DWEBKIT_DARWIN_SDK
LDFLAGS = -dynamiclib #-framework Carbon -framework CoreFoundation -framework WebKit
else
INCS = -I/usr/include/xulrunner-1.9/stable # apt-get install xulrunner-dev
CPPFLAGS = -DVERSION=\"${VERSION}\" -DXULRUNNER_SDK -lXpm `pkg-config --libs --cflags xulrunner-plugin`
#LDFLAGS = -L/usr/lib -lc
LDFLAGS = -lXpm
endif
#CFLAGS = -g -pedantic -Wall -O2 ${INCS} ${CPPFLAGS} -DDEBUG
CFLAGS = -g -O2 ${INCS} ${CPPFLAGS} -DDEBUG

# compiler and linker
CC = gcc
