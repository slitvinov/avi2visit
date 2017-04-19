BIN = $(HOME)/bin

PROGS = pgm2bov0
SCRIPTS = avi2tiff  croptiff  fliptiff tiff2pgm pgm2bov

install: $(PROGS)
	mkdir -p $(BIN)
	cp $(SCRIPTS) $(PROGS) $(BIN)

pgm2bov0: pgm2bov0.c

.PHONY: clean
clean:; -rm -f pgm2bov0
