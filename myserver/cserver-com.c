#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>
#include <memory.h>
#include <string.h>
#include <unistd.h>

#include <windows.h>
#include <time.h>
#include "util.h"
#include "com.h"


/* PPM header information */
typedef struct {
  int version; /* must be 3 or 6 */
  int width;
  int height;
  int max;     /* defined but not used */
} ppm_info;

/* for SLD tata stream */
typedef union {
  int i;
  float f;
} fi_union;

/* Application parameters */
typedef struct{
  com_settings cs;
  const char* ppm_filename;
  const char* sld_filename;
  BOOL sld_big_endian;
  
} app_settings;



/* ungetc data for my_ungetc() function */
static int ungetc_char = EOF;

/* output PPM file stream */
static FILE* ppmout = NULL;   

/* the binary image of the input SLD data */
#define MAX_N_WORDS 4096
static fi_union sld_words[MAX_N_WORDS];
static unsigned sld_n_words = 0;

/* for computation time measurement */
static DWORD startTime;
static DWORD endTime;



/*******************************************************************************
 * COM I/O
 ******************************************************************************/

/*-----------------------------------------------------------------------------
 * receive a character from COM port
 * RETURN value: the next character from the COM port
 */

static int my_getc(void)
{
  int c;
  if(ungetc_char != EOF){
    c = ungetc_char;
    ungetc_char = EOF;
    return c;
  }
  c = com_getc();
  if(c == EOF){
    error("COM read failed for unknown reason\n");
    exit(1);
  }
  /*
   * write the received character to the output PPM file stream when it is active
   */
  if(ppmout)
    fputc(c, ppmout);
  
  return c;
}

/*-----------------------------------------------------------------------------
 *  push a character back onto the COM input stream
 *  c : the character to be pushed back.
 */
static void my_ungetc(int c)
{
  ungetc_char = c;
}



/*****************************************************************************
 * PPM parser
 ****************************************************************************/


/*-----------------------------------------------------------------------------
 * receive an integer value in text format
 * RETURN value : -1     -> error
 *                others -> the integer read from the USB device
 */

static int ppm_recv_text_number()
{
  int n = 0;
  int c = EOF;
  int prev;
  BOOL integer_detected = FALSE;
  
  /* skip preceding characters */
  for(;;){
    
    do {  /* skip spaces */
      prev = c;
      c = my_getc();
    } while(isspace(c));

    if(c == '#') {  /* skip a comment line*/
      do {
        c = my_getc();
        if(c == EOF)
          return -1;
      } while(c != '\n');
    } else
      break;
  }
  /* parse an integer */
  while(isdigit(c)){
    n = n*10 + (c - '0');
    c = my_getc();
    integer_detected = TRUE;
  }
  my_ungetc(c);
  return integer_detected ? n : -1;
}

/*-----------------------------------------------------------------------------
 * receive a PPM header
 * pi : ptr to a ppm_info struct where the header information will be stored.
 * RETURN value : true  -> success
 *                false -> error
 */
static BOOL ppm_recv_header(ppm_info* pi)
{
  ppm_info p;

  /* version (must be P3 or P6) */
  if(my_getc() != 'P') return FALSE;

  switch(my_getc()){
  case '3': p.version = 3; break;
  case '6': p.version = 6; break;
  default: return FALSE;
  }
  /* width */
  if((p.width = ppm_recv_text_number()) < 0)
    return FALSE;
  /* height */
  if((p.height = ppm_recv_text_number()) < 0)
    return FALSE;
  /* max value (read but not used) */
  if((p.max = ppm_recv_text_number()) < 0)
    return FALSE;
  /* header must end with a space character */
  if(!isspace(my_getc()))
    return FALSE;
  *pi = p;
  return TRUE;
}

/*-----------------------------------------------------------------------------
 * receive a RGB pixel in text format
 * buf[3] : an array where the RGB value is stored.
 * RETURN value : true  -> success
 *                false -> error
 */
static BOOL ppm_recv_text_pixel(unsigned char buf[])
{
  int r, g, b;
  if((r = ppm_recv_text_number()) < 0) return FALSE;
  if((g = ppm_recv_text_number()) < 0) return FALSE;
  if((b = ppm_recv_text_number()) < 0) return FALSE;
  buf[0] = (unsigned char)r;
  buf[1] = (unsigned char)g;
  buf[2] = (unsigned char)b;
  return TRUE;
}

/*-----------------------------------------------------------------------------
 * receive a RGB pixel in binary format
 * buf[3] : an array where the RGB value is stored.
 * RETURN value : true  -> success
 *                false -> error
 */
static BOOL ppm_recv_bin_pixel(unsigned char buf[])
{
  int i;
  unsigned char buf2[3];
  
  for(i = 0; i < 3; i++){
    int c = my_getc();
    buf2[i] = (unsigned char)c;
  }
  memcpy(buf, buf2, 3);
  return TRUE;
}

/*-----------------------------------------------------------------------------
 * receive a RGB pixel
 * buf[3] : an array where the RGB value is stored.
 * version : PPM version; must be 3 or 6.
 * RETURN value : true  -> success
 *                false -> error
 */
static BOOL ppm_recv_pixel(unsigned char buf[], int version)
{
  switch(version){
  case 3: return ppm_recv_text_pixel(buf);
  case 6: return ppm_recv_bin_pixel(buf);
  default: return FALSE;
  }
}


/*****************************************************************************
 * SLD Reader : convert the input SLD text file into a binary format
 ****************************************************************************/

/*-----------------------------------------------------------------------------
 * read a float in the SLD file and append it to the array sld_words.
 * fp : input SLD file stream
 * RETURN value : the float read from the file
 */
static float read_float(FILE* fp)
{
  float f;

  if(sld_n_words >= MAX_N_WORDS){
    error("read_float : too many sld words.\n");
    exit(1);
  }
  
  if(fscanf(fp, "%f", &f) != 1){
    error("failed to read a float\n");
    exit(1);
  }

  return (sld_words[sld_n_words++].f = f);
}

/*-----------------------------------------------------------------------------
 * read an integer in the SLD file and append it to the array sld_words.
 * fp : input SLD file stream
 * RETURN value : the integer read from the file
 */
static int read_int(FILE* fp)
{
  int i;
  if(sld_n_words >= MAX_N_WORDS){
    error("read_int : too many sld words.\n");
    exit(1);
  }

  if(fscanf(fp, "%d", &i) != 1){
    error("failed to read an int\n");
    exit(1);
  }
  
  return (sld_words[sld_n_words++].i = i);
}

/*-----------------------------------------------------------------------------
 * read a 3D float vector and append it to the array sld_words.
 * fp : input SLD file stream
 */
static void read_vec3(FILE* fp)
{
  read_float(fp);
  read_float(fp);
  read_float(fp);
}

/*-----------------------------------------------------------------------------
 * read the scene environments
 * fp : input SLD file stream
 */
static void read_sld_env(FILE* fp)
{
  /* screen pos */
  read_vec3(fp);
  /* screen rotation */
  read_float(fp);  read_float(fp); 
  /* n_lights : Actually, it should be an int value ! */
  read_float(fp);
  /* light rotation */
  read_float(fp);  read_float(fp);
  /* beam  */
  read_float(fp);
}

/*-----------------------------------------------------------------------------
 * read all the objects
 * fp : input SLD file stream
 */
static void read_objects(FILE* fp)
{

  while (read_int(fp) != -1) {  /* texture : -1 -> end */
    /* form */
    read_int(fp);
    /* refltype */
    read_int(fp);
    /* isrot_p*/
    int is_rot = read_int(fp);
    /* abc */
    read_vec3(fp);
    /* xyz */
    read_vec3(fp);
    /* is_invert */
    read_float(fp);
    /* refl_param */
    read_float(fp); read_float(fp);
    /* color */
    read_vec3(fp);
    /* rot */
    if(is_rot){
      read_vec3(fp);
    }
  }
}

/*-----------------------------------------------------------------------------
 * read the AND-network
 * fp : input SLD file stream
 */
static void read_and_network(FILE* fp)
{
  while(read_int(fp) != -1){
    while(read_int(fp) != -1);
  }
}

/*-----------------------------------------------------------------------------
 * read the OR-network
 * fp : input SLD file stream
 */
static void read_or_network(FILE* fp)
{
  while(read_int(fp) != -1){
    while(read_int(fp) != -1);
  }
}

/*-----------------------------------------------------------------------------
 * read the SLD file
 * fp : input SLD file stream
 */
static void read_sld(FILE* fp, BOOL conv_to_big_endian)
{
  read_sld_env(fp);
  read_objects(fp);
  read_and_network(fp);
  read_or_network(fp);
  if(conv_to_big_endian){
    unsigned u;
    for(u = 0; u < sld_n_words; u++){
      int i = sld_words[u].i;
      sld_words[u].i = 
        ((i & 0xff) << 24) | ((i & 0xff00) << 8) |
          ((i >> 8) & 0xff00) | ((i >> 24) & 0xff);
    }
  }
}

/*****************************************************************************
 * Each step of the server
 *****************************************************************************/

/*-----------------------------------------------------------------------------
 * read the SLD file and convert into a binary format.
 * sld_file_name : name of the SLD data file
 */
static void load_sld_file(const char* sld_file_name, BOOL conv_to_big_endian)
{
  FILE* fp = sld_file_name ? fopen(sld_file_name, "rb") : stdin;
  if(fp == NULL) {
    error("cannot open SLD file %s\n", sld_file_name);
    exit(1);
  }
  read_sld(fp, conv_to_big_endian);
  
  fclose(fp);
}

/*-----------------------------------------------------------------------------
 * wait until a 0xaa byte is received
 */
static void wait_for_0xaa(void)
{
  fprintf(stderr, "waiting for a 0xaa byte:\n");
  while(my_getc() != 0xaa);
  fprintf(stderr, "\treceived.\n");
}


/*-----------------------------------------------------------------------------
 * send the SLD data in a binary format.
 */
static void send_sld_data(void)
{
  fprintf(stderr, "sending SLD data:\n");
  startTime = GetTickCount();
  com_write((char*)sld_words, sld_n_words*sizeof(sld_words[0]));
  
}

/*-----------------------------------------------------------------------------
 * receive the resulting PPM image from the USB device
 * out : output PPM file stream
 */
static void recv_ppm_data(FILE* out)
{
  ppm_info pi;
  fprintf(stderr, "receiving PPM data:\n");
  
  ppmout = out;
  
  if(!ppm_recv_header(&pi)){
    error("error in PPM header\n");
    exit(1);
  }
  
  unsigned n_pixels = pi.width * pi.height;
  unsigned u;
  
  fprintf(stderr, "\tversion: %d       size: %dx%d\n",
          pi.version, pi.width, pi.height);
  
  for(u = 0; u < n_pixels; u++){
    unsigned char buf[3];
    if(!ppm_recv_pixel(buf, pi.version)){
      error("error in receiving pixels(%d more pixel(s) expected).\n",
            n_pixels - u);
      exit(1);
    }
    if(((u + 1) & 127) == 0)
      fprintf(stderr, "\treceived %u/%u pixels.\r", u + 1, n_pixels);
  }
  endTime = GetTickCount();
  fprintf(stderr, "\n\tdone.\n");
}

/******************************************************************************
 *  main part
 ******************************************************************************/

static int parse_parity_type(const char* optarg)
{
  if(!strcmp(optarg, "odd"))
    return ODDPARITY;
  else if(!strcmp(optarg, "even"))
    return EVENPARITY;
  else if(!strcmp(optarg, "none"))
    return NOPARITY;
  else if(!strcmp(optarg, "mark"))
    return MARKPARITY;
  else if(!strcmp(optarg, "space"))
    return SPACEPARITY;
  else
    error("%s : no such parity mode\n", optarg);
  return NOPARITY;
}

static int parse_stopbit_len(const char* optarg)
{
  if(!strcmp(optarg, "1"))
    return ONESTOPBIT;
  else if(!strcmp(optarg, "1.5"))
    return ONE5STOPBITS;
  else if(!strcmp(optarg, "2"))
    return TWOSTOPBITS;
  else
    error("%s : not such stopbit length\n", optarg);
  return ONESTOPBIT;
}

static int parse_options(int argc, char* argv[], app_settings* as)
{
  int c;
  int tmp;
  opterr = 0;
  while ((c = getopt(argc, argv, "bB:c:Cp:s:")) != EOF)
    switch (c) {
    case 'b':
      as->sld_big_endian = TRUE;
      break;
      
    case 'B':
      as->cs.baud = ec_strtol(optarg, 10);
      break;
      
    case 'c':
      tmp = ec_strtol(optarg, 10);
      if(IS_IN_RANGE(tmp, 1, 4)){
        as->cs.comport_id = tmp;
      } else {
        error("%d : invalid comport ID\n", tmp);
      }
      break;

    case 'C':
      as->cs.do_cts_control = TRUE;
      break;
      
    case 'p':
      as->cs.parity_type = parse_parity_type(optarg);
      break;
      
    case 's':
      as->cs.stopbit_len = parse_stopbit_len(optarg);
      break;
      
    case '?':
      error("%c : unknown option character\n", optopt);
      break;
    }
  return argc;
}

static void parse_arguments(int argc, char* argv[], app_settings* as)
{
  /*  extern char *optarg;
  extern int optind, opterr, optopt;*/

  as->cs.comport_id = 1;
  as->cs.baud = 115200;
  as->cs.stopbit_len = ONESTOPBIT;
  as->cs.parity_type = NOPARITY;
  as->cs.n_databits = 8;
  as->cs.do_cts_control = FALSE;
  
  as->ppm_filename = NULL;
  as->sld_filename = NULL;
  as->sld_big_endian = FALSE;
  
  argc = parse_options(argc, argv, as);
  
  switch(argc - optind){
    
  case 0:
    error("missing input sld file name\n");
  case 1:
    error("missing output ppm file name\n");
    break;
    
  case 2:
    as->ppm_filename = argv[optind + 1];
    as->sld_filename = argv[optind];
    break;
    
  default:
    error("too many arguments\n");
    break;
    
  }
  
  if(is_error()){
    fprintf(stderr,
            "usage: %s \n"
            "          [-b]                ; send SLD in big endian format\n"
            "          [-B <baud>]         ; BAUD, default 115200\n"
            "          [-c <port id>]      ; COMport ID, 1-4, default 1\n"
            "          [-C]                ; enable CTS flow control\n"
            "          [-p <parity_type>]  ; parity type : odd | even | none | mark | space\n"
            "                              ; default : none\n"
            "          [-s <stop bit len>] ; Stop bit length : 1 or 1.5 or 2, default : 1\n"
            "          <input sld>         ; input sld file name\n"
            "          <output ppm>        ; output ppm file name\n",
            argv[0]);
    exit(1);
  }
}

int main(int argc, char* argv[])
{

  app_settings as;
  parse_arguments(argc, argv, &as);
  setup_comm(&as.cs);
  
  /* open the output PPM file */
  FILE* out = fopen(as.ppm_filename, "wb");
  if(!out){
    error("cannot open PPM output file %s\n", as.ppm_filename);
    exit(1);
  }

  /* load SLD data */
  load_sld_file(as.sld_filename, as.sld_big_endian);
  
  /* wait for a 0xaa byte */
  wait_for_0xaa();

  /* send the SLD data */
  send_sld_data();

  /* receive the PPM image */
  recv_ppm_data(out);


  DWORD elapsedTime = endTime - startTime;
  fprintf(stderr, "elapsed time : %lu.%03lu s\n",
          elapsedTime/1000, elapsedTime%1000);
  fclose(out);
  
  return 0;
}

