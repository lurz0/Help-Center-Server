PORT=52858
CFLAGS = -DPORT=$(PORT) -Wall -g -std=gnu99

all: hcq_server #helpcentre

hcq_server: hcq_server.o hcq.o
	gcc $(CFLAGS) -o hcq_server hcq_server.o hcq.o

#helpcentre: helpcentre.o hcq.o 
#	gcc $(CFLAGS) -o helpcentre helpcentre.o hcq.o

#helpcentre.o: helpcentre.c hcq.h
#	gcc $(CFLAGS) -c helpcentre.c

hcq.o: hcq.c hcq.h
	gcc $(CFLAGS) -c hcq.c
	
%.o: %.c hcq.h
	gcc $(CFLAGS) -c $<

clean: 
	rm hcq_server helpcentre *.o
