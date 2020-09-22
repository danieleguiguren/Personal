#include <stdio.h>

char global[][5] = {"Hans", "Tim", "Pit"};

int main(int argc, char* argv[])
{
  int i = 0;
  char lokal[][8] = {"Lena", "Ina", "Iris"};
  char meinName[10] = "Andreas";
  char* ptr = "Andreas";
	
  if (meinName == ptr) 
    printf("1. Vgl. stimmt!\n");
  else
    printf("1. Vgl. fehlgeschlagen!\n");
		
  if (*meinName == *ptr)
    printf("2. Vgl. stimmt! - Nur was wird hier verglichen?\n");
  else
    printf("2. Vgl. ebenfalls fehlgeschlagen!\n");
		
  return 0;
}