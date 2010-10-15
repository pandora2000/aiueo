#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <ctype.h>

#define ARG_MAX_COUNT 3
#define NAME_SIZE 40

#define REG_MAX_COUNT 100

#define INST_MAX_COUNT 20000

#define LABEL_MAX_COUNT 10000

#define FPT_MAX_COUNT 100

#define  ACCESS_GOOD 0
#define  ACCESS_BAD -1

typedef struct
{
  int arg_count;
  char name[NAME_SIZE];
  char args[ARG_MAX_COUNT][NAME_SIZE];
} instruction;

typedef struct
{
  int index;
  char name[NAME_SIZE];
} label;

typedef struct
{
  int inst_count;
  int label_count;
  instruction insts[INST_MAX_COUNT];
  label labels[LABEL_MAX_COUNT];
} program;


typedef struct
{
  int name;
  int args[ARG_MAX_COUNT];
} instruction_fast;

typedef struct
{
  int inst_count;
  instruction_fast insts[INST_MAX_COUNT];
} program_fast;

typedef struct
{
  float val;
  char label[NAME_SIZE];
} fptelem;

typedef struct
{
  char name[NAME_SIZE];
  int index;
} t_extval;

typedef union
{
  float f;
  int i;
} conv;

program prog;
program_fast fprog;
fptelem fpt[FPT_MAX_COUNT];
int fpt_count = 0;
int extval_offset = 0;
int fpt_offset = 1024;
t_extval extval[] =
  {
    { "n_objects", 0 },
    { "objects", 1 },
    { "screen", 61 },
    { "viewpoint", 64 },
    { "light", 67 },
    { "beam", 70 },
    { "and_net", 71 },
    { "or_net", 121 },
    { "solver_dist", 122 },
    { "intsec_rectside", 123 },
    { "tmin", 124 },
    { "intersection_point", 125 },
    { "intersected_object_id", 128 },
    { "nvector", 129 },
    { "texture_color", 132 },
    { "diffuse_ray", 135 },
    { "rgb", 138 },
    { "image_size", 141 },
    { "image_center", 143 },
    { "scan_pitch", 145 },
    { "startp", 146 },
    { "startp_fast", 149 },
    { "screenx_dir", 152 },
    { "screeny_dir", 155 },
    { "screenz_dir", 158 },
    { "ptrace_dirvec", 161 },
    { "dirvecs", 164 },
    { "light_dirvec", 169 },
    { "reflections", 171 },
    { "n_reflections", 351 },
    { "", 0 },
  };
char extfunc[][NAME_SIZE] =
  {
    "imul",
    "fiszero",
    "fispos",
    "fneg",
    "fsqr",
    "sqrt",
    "read_float",
    "cos",
    "sin",
    "read_int",
    "fisneg",
    "fabs",
    "fless",
    "fhalf",
    "floor",
    "atan",
    "print_int",
    "print_float",
    "float_of_int",
    "create_array",
    "create_float_array",
    "",
  };
char reg_names[][NAME_SIZE] =
  {
    "%i0", "%i1", "%i2", "%i3", "%i4", "%i5",
    "%l0", "%l1", "%l2", "%l3", "%l4", "%l5", "%l6", "%l7", 
    "%o0", "%o1", "%o2", "%o3", "%o4", "%o5", "%o7", "",
  };
char freg_names[][NAME_SIZE] =
  {
    "%f0", "%f1", "%f2", "%f3", "%f4", "%f5", "%f6", "%f7", "%f8", "%f9", 
    "%f10", "%f11", "%f12", "%f13", "%f14", "%f15", "%f16", "%f17", "%f18", "%f19", 
    "%f20", "%f21", "%f22", "%f23", "%f24", "%f25", "%f26", "%f27", "%f28", "%f29", 
    "%f30", "%f31", "",
  };
int extval_count;
int extfunc_count;
int reg_count;
int freg_count;
int regs[REG_MAX_COUNT];
float fregs[REG_MAX_COUNT];
char inst_names[][NAME_SIZE] =
  {
    "nop", "add", "sub", "cmp", 
    "bne", "ld", "ldd", "st", 
    "set", "retl", "b", "mov", 
    "std", "call", "bl", "fmovs", 
    "faddd", "fmuld", "fdivd", "fsubd", 
    "sll", "bg", "fcmpd", "fbg", 
    "", "", "", "",
  };
int inst_kind_count;

void error(char *str)
{
  fprintf(stderr, "%s\n", str);
  exit(0);
}

bool is_separator(char c)
{
  return c == ' ' || c == '\r' || c == '\t';
}

bool is_name_letter(char c)
{
  return isalpha(c) || c == '.' || isdigit(c) || c == '-' || c == '_' || c == '%';
}

int regtoi(char *reg)
{
  int i;
  
  for(i = 0; i < reg_count; ++i)
    {
      if(strcmp(reg, reg_names[i]) == 0)
	{
	  return i;
	}
    }
  for(i = 0; i < freg_count; ++i)
    {
      if(strcmp(reg, freg_names[i]) == 0)
	{
	  return i;
	}
    }
  error("ca");
  return -1;
}

int labeltoi(char *name)
{
  int i;

  for(i = 0; i < prog.label_count; ++i)
    {
      if(strcmp(name, prog.labels[i].name) == 0)
	{
	  return prog.labels[i].index;
	}
    }
  return -1;
}

int insttoi(char *name)
{
  int i;

  for(i = 0; i < inst_kind_count; ++i)
    {
      if(strcmp(name, inst_names[i]) == 0)
	{
	  return i;
	}
    }
  return -1;
}

int extvaltoi(char *name)
{
  int i;

  for(i = 0; i < extval_count; ++i)
    {
      if(strcmp(extval[i].name, name) == 0)
	{
	  return i + extval_offset;
	}
    }
  return -1;
}

int extfunctoi(char *name)
{
  int i;

  for(i = 0; i < extfunc_count; ++i)
    {
      if(strcmp(extfunc[i], name) == 0)
	{
	  return i;
	}
    }
  return -1;
}

int fptlabeltoi(char *name)
{
  int i;

  for(i = 0; i < fpt_count; ++i)
    {
      if(strcmp(name, fpt[i].label) == 0)
	{
	  return i + fpt_offset;
	}
    }
  return -1;
}

void parse_fpt(FILE *fp)
{
  int c, state = 0, i = 0;
  char d, name[NAME_SIZE];
     
  while(true)
    {
      c = fgetc(fp);
      if(c == EOF)
	{
	  error("EOF at parse_fpt");
	}
      d = (char)c;
      if(state == 0)
	{
	  if(is_name_letter(d))
	    {
	      state = 1;
	      name[i++] = d;
	    }
	  else
	    {
	      error("aa");
	    }
	}
      else if(state == 1)
	{
	  if(is_name_letter(d))
	    {
	      name[i++] = d;
	    }
	  else if(d == ':')
	    {
	      name[i] = '\0';
	      strcpy(fpt[fpt_count].label, name);
	      i = 0;
	      state = 2;
	    }
	  else if(is_separator(d))
	    {
	      name[i] = '\0';
	      if(strcmp(name, ".section") == 0)
		{
		  state = 5;
		}
	    }
	  else
	    {
	      error("ab");
	    }
	}
      else if(state == 2)
	{
	  if(is_separator(d) || d == '!')
	    {
	      continue;
	    }
	  else if(is_name_letter(d))
	    {
	      name[i++] = d;
	    }
	  else if(d == '\n')
	    {
	      name[i] = '\0';
	      fpt[fpt_count++].val = atof(name);
	      i = 0;
	      state = 3;
	    }
	  else
	    {
	      error("ac");
	    }
	}
      else if(state == 3)
	{
	  if(d == '\n')
	    {
	      state = 4;
	    }
	  else
	    {
	      continue;
	    }
	}
      else if(state == 4)
	{
	  if(d == '\n')
	    {
	      state = 0;
	    }
	  else
	    {
	      continue;
	    }
	}
      else if(state == 5)
	{
	  if(d == '\n')
	    {
	      break;
	    }
	  else
	    {
	      continue;
	    }
	}
    }

  /*
  for(i = 0; i < fpt_count; ++i)
    {
      printf("%f\n", fpt[i].val);
      }
  */
}

void parse_prog(FILE *fp)
{
  instruction *ist;
  instruction_fast *fist;
  int c, state = 0, i = 0, j, k;
  char d, name[NAME_SIZE], *p;

  prog.inst_count = 0;
  prog.label_count = 0;
  while(true)
    {
      c = fgetc(fp);
      if(c == EOF)
	{
	  break;
	}
      d = (char)c;
      if(state == 0)
	{
	  if(is_separator(d))
	    {
	      continue;
	    }
	  else if(is_name_letter(d))
	    {
	      name[i++] = d;
	      state = 1;
	    }
	  else
	    {
	      error("ba");
	    }
	}
      else if(state == 1)
	{
	  if(is_name_letter(d))
	    {
	      name[i++] = d;
	    }
	  else if(d == ':')
	    {
	      name[i] = '\0';
	      strcpy(prog.labels[prog.label_count].name, name);
	      prog.labels[prog.label_count++].index = prog.inst_count;
	      i = 0;
	      fgetc(fp);
	      state = 0;
	    }
	  else if(d == '\n')
	    {
	      name[i] = '\0';
	      ist = &prog.insts[prog.inst_count++];
	      strcpy(ist->name, name);
	      ist->arg_count = 0;
	      i = 0;
	      state = 0;
	    }
	  else if(is_separator(d))
	    {
	      name[i] = '\0';
	      ist = &prog.insts[prog.inst_count];
	      strcpy(ist->name, name);
	      ist->arg_count = 0;
	      i = 0;
	      state = 2;
	    }
	  else
	    {
	      error("bb");
	    }
	}
      else if(state == 2 || state == 3 || state == 4)
	{
	  if(is_name_letter(d))
	    {
	      name[i++] = d;
	    }
	  else if(d == ',')
	    {
	      name[i] = '\0';
	      i = 0;
	      ist = &prog.insts[prog.inst_count];
	      strcpy(ist->args[ist->arg_count++], name);
	      fgetc(fp);
	      ++state;
	    }
	  else if(d == '\n')
	    {
	      name[i] = '\0';
	      i = 0;
	      ist = &prog.insts[prog.inst_count++];
	      strcpy(ist->args[ist->arg_count++], name);
	      state = 0;
	    }
	  else
	    {
	      error("bc");
	    }
	}
    }

  for(i = 0; i < prog.inst_count; ++i)
    {
      ist = &prog.insts[i];
      fist = &fprog.insts[i];
      if((k = insttoi(ist->name)) != -1)
	{
	  fist->name = k;
	}
      else
	{
	  printf("%s\n", ist->name);
	  error("da");
	}
      for(j = 0; j < ist->arg_count; ++j)
	{
	  p = ist->args[j];
	  d = *p;
	  if(isdigit(d) || d == '-')
	    {
	      fist->args[j] = atoi(p);
	    }
	  else if(d == '%')
	    {
	      fist->args[j] = regtoi(p);
	    }
	  else if(is_name_letter(d))
	    {
	      if((k = extvaltoi(p)) != -1)
		{
		  fist->args[j] = k * 4;
		}
	      else if((k = extfunctoi(p)) != -1)
		{
		  fist->args[j] = -1 - k;
		}
	      else if((k = labeltoi(p)) != -1)
		{
		  fist->args[j] = k;
		}
	      else if((k = fptlabeltoi(p)) != -1)
		{
		  fist->args[j] = k * 4;
		}
	      else
		{
		  printf("%s\n", p);
		  error("cc");
		}
	    }
	}
    }
}

void parse(FILE *fp)
{
  parse_fpt(fp);
  parse_prog(fp);
}

void init_reg_count()
{
  int i;

  for(i = 0; reg_names[i][0] != '\0'; ++i);

  reg_count = i;
}

void init_freg_count()
{
  int i;

  for(i = 0; freg_names[i][0] != '\0'; ++i);

  freg_count = i;
}

void init_extval()
{
  int i;
  char tmp[NAME_SIZE];

  for(i = 0; extval[i].name[0] != '\0'; ++i)
    {
      strcpy(tmp, extval[i].name);
      sprintf(extval[i].name, "%s%s", "min_caml_", tmp);
    }

  extval_count = i;
}

void init_extfunc()
{
  int i;
  char tmp[NAME_SIZE];

  for(i = 0; extfunc[i][0] != '\0'; ++i)
    {
      strcpy(tmp, extfunc[i]);
      sprintf(extfunc[i], "%s%s", "min_caml_", tmp);
    }

  extfunc_count = i;
}

void init_inst_kind_count()
{
  int i;

  for(i = 0; inst_names[i][0] != '\0'; ++i);

  inst_kind_count = i;
}

int main(int argc, char *argv[])
{
  FILE *fp;

  fp = fopen(argv[1], "r");
  init_reg_count();
  init_freg_count();
  init_extval();
  init_extfunc();
  init_inst_kind_count();
  parse(fp);

  return 0;
}
