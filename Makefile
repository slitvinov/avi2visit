BIN = $(HOME)/bin

PROGS = pgm2bov0
SCRIPTS = avi2bov avi2tiff croptiff croptiff2 \
	fliptiff tiff2pgm pgm2bov
CFLAGS=-O2 -g -std=c99 -pedantic -Wall -Wextra

pgm2bov0: pgm2bov0.c
install: $(PROGS)
	@printf '%s\n' "installing files to $(BIN)"
	@mkdir -p $(BIN)
	cp $(SCRIPTS) $(PROGS) $(BIN)

.PHONY: clean
clean:; -rm -f pgm2bov0
