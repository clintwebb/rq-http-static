## make file for rq-http-static.

all: rq-http-static

DEBUG_LIBS=
# DEBUG_LIBS=-lefence -lpthread


ARGS=-Wall -O2 -g
RQ_LIBS=-lrq-service -lrispbuf -lrisp -levent_core -lexpbufpool -lexpbuf -lrq -llinklist
LIBS=$(RQ_LIBS) -lrq-http -lparsehttp $(DEBUG_LIBS)
#LIBS=$(RQ_LIBS) -lrq-http -lsqlite3  $(DEBUG_LIBS)
OBJS=rq-http-static.o event-compat.o


rq-http-static: $(OBJS)
	gcc -o $@ $(OBJS) $(LIBS) $(ARGS)

rq-http-static.o: rq-http-static.c event-compat.h
	gcc -c -o $@ rq-http-static.c $(ARGS)

event-compat.o: event-compat.c event-compat.h
	gcc -c -o $@ event-compat.c $(ARGS)



install: rq-http-static
	@cp rq-http-static /usr/bin

clean:
	@-rm rq-http-static
	@-rm $(OBJS)
