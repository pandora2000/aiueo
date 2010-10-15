#ifndef _COM_H_
#define _COM_H_

typedef struct {
  int comport_id; /* 1-4 */
  int baud;       /* bits/s */
  int stopbit_len; /* 0->1bit, 1->1.5bit, 2->2bit */
  int parity_type; /* */
  int n_databits;  
  int do_cts_control; /* nonzero->do cts control */
                      
} com_settings;

void setup_comm(const com_settings* cs);
int com_getc();
void com_putc(char c);
void com_write(char* buf, DWORD size);
void close_comm();

#endif /* _COM_H_ */
