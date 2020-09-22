#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#define MAX_LAENGE 15 /* exclusiv '/0' */
int main(int anzArg, char* args[])
{
  char* statArray;
  char** dynArray;
  int anzVornamen = anzArg-1;
  int i;
  
  statArray = (char*)malloc(anzVornamen*(MAX_LAENGE+1));
  for(i=0; i<anzVornamen; i++)
    strcpy(statArray+i*(MAX_LAENGE+1), args[i+1]);

  dynArray = (char**)malloc(anzVornamen * sizeof(char*));
  for(i=0; i<anzVornamen; i++) {
    /* Variante 1: gleiche Stringlaenge fuer alle */
    dynArray[i] = (char*)malloc((MAX_LAENGE+1) * sizeof(char));
    strcpy(dynArray[i], args[i+1]);
    /* Variante 2: passgenaue Stringlaenge 
    dynArray[i] = (char*)malloc((strlen(args[i+1])+1) * sizeof(char));
    strcpy(dynArray[i], args[i+1]);
    */
  }

  return 0;
}
