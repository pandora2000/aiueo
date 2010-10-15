#ifndef _UTIL_H_
#define _UTIL_H_

#define N_ELEMS(A) (sizeof(A)/sizeof((A)[0]))
#define IS_IN_RANGE(X,MIN,MAX) (((unsigned int)((X)-MIN)) <= ((MAX)-(MIN)))

extern void error(char *fmt, ...);
extern int is_error();

extern void warning(char *fmt, ...);
extern int is_warning();

extern int ec_strtol(char *arg, int base);
extern void windows_error(char* fmt, ...);
#endif /* _UTIL_H_ */
