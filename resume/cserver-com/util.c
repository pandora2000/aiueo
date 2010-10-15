#include <stdio.h>
#include <stdlib.h>
#include <windows.h>
#include "util.h"

static int error_flag = 0;
static int warning_flag = 0;

void warning(char*fmt, ...)
{
  va_list ap;
  va_start(ap,fmt);
  vfprintf(stderr, fmt, ap);
  va_end(ap);
  warning_flag = 1;
}

int is_warning()
{
  return warning_flag;
}


void error(char *fmt, ...)
{
  va_list ap;
  va_start(ap,fmt);
  vfprintf(stderr, fmt, ap);
  va_end(ap);
  error_flag = 1;
}

int is_error()
{
  return error_flag;
}

int ec_strtol(char *arg, int base)
{
  int i;
  char *p;
  if(arg == NULL)
    error("ec_strtol : internal error : NULL argument.\n");
  if(*arg == '\0')
    error("error : empty number string\n");
  i = strtol(arg, &p, base);
  if(*p)
    error("%s : invalid number expression\n", arg);
  return i;
}


void windows_error(char* fmt, ...)
{
  va_list ap;
  LPVOID lpMsgBuf;
  
  va_start(ap,fmt);
  vfprintf(stderr, fmt, ap);
  va_end(ap);

  
  FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |
                FORMAT_MESSAGE_FROM_SYSTEM |
                FORMAT_MESSAGE_IGNORE_INSERTS,
                NULL,
                GetLastError(),
                MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
                (LPTSTR)&lpMsgBuf,
                0,
                NULL);
  fprintf(stderr, ": %s\n", (char*)lpMsgBuf);
  LocalFree(lpMsgBuf);

  error_flag = 1;
}
