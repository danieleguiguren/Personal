#include "stdio.h"
#include "string.h"

int main(int anzArg, char* args[])
{
  int i;
  for (i=0; i <= anzArg; i++) {
    printf("%d. Arg: Wert=%X, als Str=%s\n", i, args[i], args[i]);
    printf("%d. Arg: Wert=%X, als Str=%s\n", i, *(args+i), *(args+i));
  }
  return 0;
}
