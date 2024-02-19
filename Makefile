CC := clang

ifeq ($(DEBUG),1)
	CFLAGS := -Wall -O0 -g
else
	CFLAGS := -Wall -O3 -DNDEBUG 
endif

# LDFLAGS := -lrt -flto -fuse-ld=gold
LDFLAGS := -flto

all: clox 

clox.o: clox.c
	$(CC) $(CFLAGS) -c clox.c

clox: clox.o
	$(CC) -o clox clox.o $(LDFLAGS)

clean:
	rm -f clox *.o  *.gcda *.gcno *.gcov perf.data */perf.data cachegrind.out.*
