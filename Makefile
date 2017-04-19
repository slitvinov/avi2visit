BIN = $(HOME)/bin

PROGS = pgm2bov0
SCRIPTS = avi2bov avi2tiff croptiff \
	fliptiff tiff2pgm pgm2bov

pgm2bov0: pgm2bov0.c
install: $(PROGS)
	mkdir -p $(BIN)
	cp $(SCRIPTS) $(PROGS) $(BIN)

.PHONY: clean
clean:; -rm -f pgm2bov0
