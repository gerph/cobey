#
#

CC = gcc
CMHG = cmunge -tgcc -32bit -zbase -zoslib
CCFLAGS = -mhard-float -mlibscl -std=c99 -mmodule 
AS = as -mfloat-abi=hard -mfpu=fpa

all: cobey

cobey: main.o module.o veneer.o
	$(CC) $(CCFLAGS) -LOSLib: -lOSLib32 -LOSLibSupport: -lOSLibSupport32 -o CObey module.o main.o veneer.o

module.o: module.cmhg
	$(CMHG) cmhg/module -s module.s -d module.h -o module.o

%.o: %.c 
	$(CC) $(CCFLAGS) -IOSLib: -IOSLibSupport: -o $@ -c $<

veneer.o: veneer.s
	$(AS) -o veneer.o veneer.s

main.c:
