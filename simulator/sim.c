#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

int main(int argc, char *argv[])
{
  FILE *fp;

  if(argc != 2)
    {
      fprintf(stderr, "invalid arguments.\n");
      return 0;
    }

  fp = fopen(argv[1], "r");
  if(fp == NULL)
    {
      fprintf(stderr, "cannot open the file.\n");
      return 0;
    }
}
