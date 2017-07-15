# Makefile for cygwin gcc
# Nate Lawson <nate@rootlabs.com>

PCAP_PATH = e:/WpdPack/Lib
CFLAGS = -Wall -g -O -mno-cygwin -D HAVE_REMOTE -Ie:/WpdPack/Include `pkg-config --cflags gtk+-2.0`

OBJS = dump.o get_adapter.o main.o menu.o window.o arp.o ip.o icmp.o tcp.o udp.o crc.o capture_pak.o checksum.o link_layer.o igmp.o

LIBS = -L${PCAP_PATH} `pkg-config --libs gtk+-2.0` -lwpcap

CC = gcc

all: ${OBJS}
	${CC} ${CFLAGS} -o main.exe ${OBJS} ${LIBS}

clean:
	rm -f ${OBJS} main.exe

.c.o:
	${CC} ${CFLAGS} -c -o $*.o $<
