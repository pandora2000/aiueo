#include <stdio.h>
#include <windows.h>
#include "util.h"
#include "com.h"

static HANDLE hCom = 0;

static void setup_comm_parameters(HANDLE hcom, const com_settings *cs)
{
  DCB dcb;
  
  dcb.DCBlength = sizeof(DCB);

  if(!GetCommState(hcom, &dcb)){
    windows_error("Cannot get COM port status");
    exit(1);
  }

  /*printf("%d %d %d %d\n", dcb.DCBlength, dcb.BaudRate, dcb.fBinary, dcb.fParity);
  printf("%d %d %d %d\n", dcb.fOutxCtsFlow, dcb.fOutxDsrFlow, dcb.fDtrControl, dcb.fDsrSensitivity);
  
  printf("%d %d %d %d\n", dcb.fTXContinueOnXoff, dcb.fOutX, dcb.fInX, dcb.fErrorChar);
  printf("%d %d %d %d\n", dcb.fNull, dcb.fRtsControl, dcb.fAbortOnError, dcb.fDummy2);
  printf("%d %d %d %d\n", dcb.wReserved, dcb.XonLim, dcb.XoffLim, dcb.ByteSize);
  printf("%d %d %d %d\n", dcb.Parity, dcb.StopBits, dcb.XonChar, dcb.XoffChar);
  printf("%d %d %d %d\n", dcb.ErrorChar, dcb.EofChar, dcb.EvtChar, dcb.wReserved1);
   */
  dcb.BaudRate = cs->baud;
  dcb.fBinary = TRUE;
  dcb.fParity = (cs->parity_type != NOPARITY);
  dcb.fOutxCtsFlow = cs->do_cts_control;
  dcb.fOutxDsrFlow = FALSE;
  dcb.fDtrControl = DTR_CONTROL_ENABLE;
  dcb.fDsrSensitivity = FALSE;
  dcb.fTXContinueOnXoff = FALSE;
  dcb.fOutX = FALSE;
  dcb.fInX = FALSE;
  dcb.fErrorChar = FALSE;
  
  dcb.fNull = FALSE;
  dcb.fRtsControl = RTS_CONTROL_ENABLE;
  dcb.fAbortOnError = FALSE;
          
  dcb.XonLim = 2048;
  dcb.XoffLim = 512;
  dcb.ByteSize = cs->n_databits;
  dcb.Parity = cs->parity_type;
  dcb.StopBits = cs->stopbit_len;
  dcb.XonChar = 0x11;
  dcb.XoffChar = 0x13;
  dcb.ErrorChar= 0x00;
  dcb.EofChar = 0x00;
  dcb.EvtChar = 0x00;
  if(!SetCommState(hCom,&dcb)){
    windows_error("Cannot set COM port status");
    exit(1);
  }
}

static void setup_comm_timeout(HANDLE hcom)
{
  
  COMMTIMEOUTS cto;
  cto.ReadIntervalTimeout = MAXDWORD;
  cto.ReadTotalTimeoutMultiplier = MAXDWORD;
  cto.ReadTotalTimeoutConstant = 900*1000;  /* 900 sec */
  cto.WriteTotalTimeoutMultiplier = 0;
  cto.WriteTotalTimeoutConstant = 0;

  if(!SetCommTimeouts(hcom, &cto)){
    windows_error("Cannot set COM timeout");
    exit(1);
  }
}

void setup_comm(const com_settings* cs)
{
  char comport_name[16];
  if(!IS_IN_RANGE(cs->comport_id, 1, 4)){
    error("%d : illegal COM port ID\n", cs->comport_id);
    exit(1);
  }
  
  sprintf(comport_name, "COM%c", cs->comport_id + '0');
  
  hCom = CreateFile(comport_name, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
  if (hCom == INVALID_HANDLE_VALUE) {
    windows_error("Cannot Open COM%d port : ", cs->comport_id);
    exit(1);
  }
  setup_comm_parameters(hCom, cs);
  setup_comm_timeout(hCom);
  atexit(close_comm);
}

int com_getc()
{
  static char buf[256];
  static int buffer_start = 0;
  static int buffer_end = 0;

  if(buffer_start >= buffer_end){

    DWORD len;
    if(ReadFile(hCom, buf, sizeof(buf), &len, NULL)){
      if(len != 0){
        buffer_start = 0;
        buffer_end = len;
      } else { /* no error, but the length == 0 */
        return EOF;
      }
    } else {
      windows_error("Cannot read byte data : ");
      exit(1);
    }
  }
  return buf[buffer_start++] & 0xff;
  
}

void com_putc(char c)
{
  DWORD len;
  if(WriteFile(hCom, &c, 1, &len, NULL)){
    if(len != 1)
      warning("Warning : com_putc : write length != 1\n");
    return;
  }
  
  windows_error("Cannot write byte data : ");
  exit(1);
}

void com_write(char* buf, DWORD size)
{
  DWORD len;
  DWORD index = 0;
  while(index < size){
    WriteFile(hCom, buf + index, size - index, &len, NULL);
    if(len == 0){
      warning("Warning : com_write : only %d/%d bytes written\n");
      return;
    }
    index += len;
  }
}

void close_comm()
{
  if(hCom){
    CloseHandle(hCom);
    hCom = 0;
  }
}
