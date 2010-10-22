#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <ctype.h>
#include "ssim.h"

const int rareg = 20;//return address
const int greg1 = 2;
const int greg2 = 3;
const int fgreg1 = 0;
const int fgreg2 = 1;
const int spreg = 0;
const int hpreg = 1;
const int sp_offset = 2048;
const int hp_offset = 4096;

bool cmpne;
bool cmpg;
bool cmpl;

FILE *out_fp;

/*stdinからfloatを読む*/
float read_float()
{
  char s[100];
  int a, i;
  bool f;

  for (i = 0, f = false; true; )
    {
      a = fgetc(stdin);
      if (f) {
	if (a == EOF || isspace(a))
	  {
	    s[i] = '\0';
	    return atof(s);
	  }
	else
	  {
	    s[i++] = (char) a;
	  }
      }
      else
	{
	  if (!(a == EOF || isspace(a)))
	    {
	      f = true;
	      s[i++] = (char) a;
	    }
	}
    }
}

/*stdinからintを読む*/
int read_int()
{
  char s[100];
  int a, i;
  bool f;

  for (i = 0, f = false; true; )
    {
      a = fgetc(stdin);
      if (f)
	{
	  if (a == EOF || isspace(a))
	    {
	      s[i] = '\0';
	      return atoi(s);
	    }
	  else
	    {
	      s[i++] = (char) a;
	    }
	}
      else
	{
	  if (!(a == EOF || isspace(a)))
	    {
	      f = true;
	      s[i++] = (char) a;
	    }
	}
    }
}

void print_int(int n)
{
  static int counter = 0;

  if(counter == 0)
    {
      fprintf(out_fp, "P3\n%d ", n);
    }
  else if((counter % 3) == 2)
    {
      fprintf(out_fp, "%d\n", n);
    }
  else
    {
      fprintf(out_fp, "%d ", n);
    }
  ++counter;
}

void simulate_extfunc(int n)
{
  int i, a, b, c;
  float d;
  
  if(n == 0)
    {
      //imul
      regs[greg1] = regs[greg1] * regs[greg2];
    }
  else if(n == 1)
    {
      //fiszero
      regs[greg1] = fregs[fgreg1] == 0.0 ? 1 : 0;
    }
  else if(n == 2)
    {
      //fispos
      regs[greg1] = fregs[fgreg1] > 0.0 ? 1 : 0;
    }
  else if(n == 3)
    {
      //fneg
      fregs[fgreg1] = - fregs[fgreg1];
    }
  else if(n == 4)
    {
      //fsqr
      fregs[fgreg1] = fregs[fgreg1] * fregs[fgreg1];
    }
  else if(n == 5)
    {
      //sqrt
      fregs[fgreg1] = sqrtf(fregs[fgreg1]);
    }
  else if(n == 6)
    {
      //read_float
      d = read_float();
      printf("read_float: %f\n", d);
      fregs[fgreg1] = d;
    }
  else if(n == 7)
    {
      //cos
      fregs[fgreg1] = cosf(fregs[fgreg1]);
    }
  else if(n == 8)
    {
      //sin
      fregs[fgreg1] = sinf(fregs[fgreg1]);
    }
  else if(n == 9)
    {
      //read_int
      a = read_int();
      printf("read_int: %d\n", a);
      regs[greg1] = a;
    }
  else if(n == 10)
    {
      //fisneg
      regs[greg1] = fregs[fgreg1] < 0.0 ? 1 : 0;
    }
  else if(n == 11)
    {
      //fabs
      fregs[fgreg1] = fregs[fgreg1] < 0.0 ? - fregs[fgreg1] : fregs[fgreg1];
    }
  else if(n == 12)
    {
      //fless
      regs[greg1] = fregs[fgreg1] < fregs[fgreg2] ? 1 : 0;
    }
  else if(n == 13)
    {
      //fhalf
      fregs[fgreg1] = fregs[fgreg1] * 0.5;
    }
  else if(n == 14)
    {
      //floor
      fregs[fgreg1] = floorf(fregs[fgreg1]);
    }
  else if(n == 15)
    {
      //atan
      fregs[fgreg1] = atanf(fregs[fgreg1]);
    }
  else if(n == 16)
    {
      //print_int
      print_int(regs[greg1]);
    }
  else if(n == 17)
    {
      //print_float
      print_int((int)fregs[fgreg1]);
    }
  else if(n == 18)
    {
      //float_of_int
      fregs[fgreg1] = (float)regs[greg1];
    }
  else if(n == 19)
    {
      //create_array
      a = regs[greg1];
      b = regs[hpreg];
      regs[greg1] = b;
      regs[hpreg] += a << 2;
      c = regs[greg2];
      for(i = 0; i < a; ++i)
	{
	  memory[(b + (i << 2)) >> 2].i = c;
	}
    }
  else
    {
      //create_float_array
      a = regs[greg1];
      b = regs[hpreg];
      regs[greg1] = b;
      regs[hpreg] += a << 3;
      d = fregs[fgreg1];
      for(i = 0; i < a; ++i)
	{
	  memory[(b + (i << 3)) >> 2].f = d;
	}
    }
}

int simulate_blanch_extfunc(int n)
{
  simulate_extfunc(-1 - n);
  return regs[rareg];
}

int simulate_instruction(instruction_fast *fist, int pc)
{
  int npc = pc + 1, nm, a1, a2, a3, a4, t;
  static long long clk = 0;
  
  nm = fist->name;
  a1 = fist->args[0];
  a2 = fist->args[1];
  a3 = fist->args[2];
  a4 = fist->args[3];

  //print_regs();
  //print_fregs();
  if(clk > 620000 && memory[2].i == 271504)
    {
      /*
      print_regs();
      //print_fregs();
      //printf("%lld %d\n", clk, pc);
      print_label(pc);
      print_instruction(pc);
      */
    }
  if(clk > 621000)
    {
      //print_regs();
      //print_fregs();
      //printf("%lld %d\n", clk, pc);
      //print_label(pc);
      //print_instruction(pc);
    }
  ++clk;
  if(nm == 0)
    {
      //nop
    }
  else if(nm == 1)
    {
      //add
      t = a2 < 0 ? a4 : regs[a2];
      regs[a3] = regs[a1] + t;
    }
  else if(nm == 2)
    {
      //sub
      t = a2 < 0 ? a4 : regs[a2];
      regs[a3] = regs[a1] - t;
    }
  else if(nm == 3)
    {
      //cmp
      t = a2 < 0 ? a4 : regs[a2];
      cmpne = regs[a1] != t;
      cmpg = regs[a1] > t;
      cmpl = regs[a1] < t;
    }
  else if(nm == 4)
    {
      //bne
      if(cmpne)
	{
	  simulate_instruction(&fprog.insts[npc], npc);
	  if(a1 < 0)
	    {
	      return simulate_blanch_extfunc(a1);
	    }
	  return a1;
	}
    }
  else if(nm == 5)
    {
      //ld
      t = a2 < 0 ? a4 : regs[a2];
      regs[a3] = memory[(regs[a1] + t) >> 2].i;
    }
  else if(nm == 6)
    {
      //ldd
      t = a2 < 0 ? a4 : regs[a2];
      fregs[a3] = memory[(regs[a1] + t) >> 2].f;
    }
  else if(nm == 7)
    {
      //st
      t = a3 < 0 ? a4 : regs[a3];
      memory[(regs[a2] + t) >> 2].i = regs[a1];
    }
  else if(nm == 8)
    {
      //set
      t = a1 < 0 ? a4 : a1;
      regs[a2] = t;
    }
  else if(nm == 9)
    {
      //retl
      simulate_instruction(&fprog.insts[npc], npc);
      return regs[rareg];
    }
  else if(nm == 10)
    {
      //b
      simulate_instruction(&fprog.insts[npc], npc);
      if(a1 < 0)
	{
	  return simulate_blanch_extfunc(a1);
	}
      return a1;
    }
  else if(nm == 11)
    {
      //mov
      regs[a2] = regs[a1];
    }
  else if(nm == 12)
    {
      //std
      t = a3 < 0 ? a4 : regs[a3];
      memory[(regs[a2] + t) >> 2].f = fregs[a1];
    }
  else if(nm == 13)
    {
      //call
      simulate_instruction(&fprog.insts[npc], npc);
      if(a1 < 0)
	{
	  simulate_extfunc(-1 - a1);
	  return npc + 1;
	}
      regs[rareg] = npc + 1;
      return a1;
    }
  else if(nm == 14)
    {
      //bl
      if(cmpl)
	{
	  simulate_instruction(&fprog.insts[npc], npc);
	  if(a1 < 0)
	    {
	      return simulate_blanch_extfunc(a1);
	    }
	  return a1;
	}
    }
  else if(nm == 15)
    {
      //fmovs
      if((a1 & 1) == 0)
	{
	  fregs[a2] = fregs[a1];
	}
    }
  else if(nm == 16)
    {
      //faddd
      fregs[a3] = fregs[a1] + fregs[a2];
    }
  else if(nm == 17)
    {
      //fmuld
      fregs[a3] = fregs[a1] * fregs[a2];
    }
  else if(nm == 18)
    {
      //fdivd
      fregs[a3] = fregs[a1] / fregs[a2];
    }
  else if(nm == 19)
    {
      //fsubd
      fregs[a3] = fregs[a1] - fregs[a2];
    }
  else if(nm == 20)
    {
      //sll
      t = a2 < 0 ? a4 : regs[a2];
      regs[a3] = regs[a1] << t;
    }
  else if(nm == 21)
    {
      //bg
      if(cmpg)
	{
	  simulate_instruction(&fprog.insts[npc], npc);
	  if(a1 < 0)
	    {
	      return simulate_blanch_extfunc(a1);
	    }
	  return a1;
	}
    }
  else if(nm == 22)
    {
      //fcmpd
      cmpg = fregs[a1] > fregs[a2];
    }
  else if(nm == 23)
    {
      //fbg
      if(cmpg)
	{
	  simulate_instruction(&fprog.insts[npc], npc);
	  if(a1 < 0)
	    {
	      return simulate_blanch_extfunc(a1);
	    }
	  return a1;
	}
    }
  else
    {
      //bp
      print_regs();
    }

  return npc;
}

void simulate(char *ofname)
{
  int pc = labeltoi("min_caml_start");
  //int i;
  //char str[1000];
  /*
    for(i = 0; i < prog.label_count; ++i)
    {
    printf("%s: %d\n", prog.labels[i].name, prog.labels[i].index);
    }
  */

  out_fp = fopen(ofname, "w");

  regs[spreg] = sp_offset << 2;
  regs[hpreg] = hp_offset << 2;
  init_memory();
  //print_memory();
  //printf("pc: %d\n", pc);
  while(true)
    {
      if((pc = simulate_instruction(&fprog.insts[pc], pc)) == prog.inst_count)
	{
	  break;
	}
    }

  fclose(out_fp);
}

int main(int argc, char *argv[])
{
  int result;
  FILE *fp;
  char ofname[1000] = "result";

  while ((result = getopt(argc, argv, "o:")) != -1)
    {
      switch (result)
	{
	case 'o':
	  strcpy(ofname, optarg);
	  break;
	}
    }
  argc -= optind;
  argv += optind;

  fp = fopen(argv[0], "r");
  init_reg_count();
  init_freg_count();
  init_extval();
  init_extfunc();
  init_inst_kind_count();
  parse(fp);
  simulate(ofname);
  //print_memory();

  return 0;
}
