#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXG (3000*3000)

/* 
convert tiff/0000.tiff -type grayscale i.txt
make && ./pgm2bov  i.pgm i.bin
*/

FILE* fd;
unsigned char gray[MAXG];
int lx, ly;

void read0() {
  fscanf(fd, "%*s %d %d %*d\n", &lx, &ly);
  fread(gray, lx*ly, sizeof(gray[0]), fd);
  printf("%d %d %d\n", gray[0], gray[lx*ly - 1], gray[lx*ly]);
}

void read(char* f) {
  fd = fopen(f, "r");
  read0();
  fclose(fd);
}

void write0() {
  fwrite(gray, lx*ly, sizeof(gray[0]), fd);
  fwrite(gray, lx*ly, sizeof(gray[0]), fd);
}

void write(char* f) {
  fd = fopen(f, "w");
  write0();
  fclose(fd);
}

void parts(char *p, /**/ char *b, char *d) { /* base name: dir/a.suf -> a, dir/ */
  char *lo = p, *hi, *i;
  for ( i =  p; *i; i++) if (*i == '/') lo = i + 1;
  for (hi = lo; *hi; hi++);
  for ( i = lo; *i; i++) if (*i == '.') hi = i;

  if (lo == p) {*d++ = '.'; *d++ = '/'; *d++ = '\0';} /* not '/' */
  else {
    for ( i =  p; i != lo; i++, d++) *d = *i;
    *d = '\0';
  }
  
  for ( i = lo; i != hi; i++, b++) *b = *i;
  *b = '\0';
}

void bov2bin(char *p, /**/ char *name, char *path) { /* bin file name */
  parts(p, name, path);
  strcat(name, ".bin");
  strncat(path, name, BUFSIZ);

  printf("b: %s\n", name);
  printf("p: %s\n", path);
}

int main(int argc, char *argv[]) {
  //  read(argv[1]);
  //  write(argv[2]);
  char name[BUFSIZ], path[BUFSIZ];
  bov2bin(argv[2], name, path);
  return 0;
}
