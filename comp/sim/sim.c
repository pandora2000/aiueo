#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <ctype.h>
#include <sys/time.h>

#define NAME_MAX_COUNT 4
#define NAME_SIZE 40

#define INPUT_FILE "input.txt"
#define OUTPUT_FILE "output.txt"
#define INST_MAX_COUNT 20000

#define LABEL_MAX_COUNT 10000

#define FPT_MAX_COUNT 100

#define  ACSESS_GOOD 0
#define  ACSESS_BAD -1

typedef struct {
  char name[NAME_MAX_COUNT][NAME_SIZE];
} instruction;

typedef struct {
  char name[NAME_SIZE];
  int index;
} label;

typedef struct {
  instruction insts[INST_MAX_COUNT];
  label *labels[LABEL_MAX_COUNT];
  int label_count;
  int inst_count;
} program;


typedef struct {
  int name[NAME_SIZE];
} instruction2;

typedef struct {
  instruction2 insts[INST_MAX_COUNT];
  int inst_count;
} program2;

/*スタックの実装*/
#define STACK_MAX_COUNT 10000

typedef struct tstack {
  int stack_count;
  int stack[STACK_MAX_COUNT];
} stack;


void push(stack * stack, int number)
{
  if (stack->stack_count >= STACK_MAX_COUNT) {
    perror("stack is full\n");
    exit(1);
  }
  stack->stack[stack->stack_count] = number;
  (stack->stack_count)++;
  return;
}

int pop(stack * stack)
{
  if (stack->stack_count == 0) {
    perror("stack is null");
    exit(1);
  }
  (stack->stack_count)--;
  return stack->stack[stack->stack_count];
}

bool is_seperator(char c)
{
  return c == ' ' || c == '\r' || c == '\t';
}


/*1line_instructionのparse (入力は\nで終わっていることを前提とする。）*/
instruction *parse_one_line_instruction(char *str, instruction * inst)
{

  int i = 0;
  int name_number = 0;
  int name_now = 0;
  int flag = 0;


  while (str[i] != '\n') {
    /*まずフラグが立っていない場合。最初のスペースは無視する */
    while (flag == 0 && is_seperator(str[i])) {
      i++;
    }

    if (is_seperator(str[i])) {
      inst->name[name_number][name_now] = '\0';
      name_number++;
      name_now = 0;
      flag = 0;
      i++;
    } else {
      if (name_number == NAME_MAX_COUNT) {
	printf("Error:operant is too many!: %s\n", str);
	exit(1);
      }
      inst->name[name_number][name_now] = str[i];
      name_now++;
      flag = 1;
      i++;
    }
  }
  inst->name[name_number][name_now] = '\0';
  name_number++;

  //オペラント数が少ない場合残りのオペラントをnullで埋めておく。
  for (i = name_number; i < NAME_MAX_COUNT; ++i) {
    inst->name[i][0] = '\0';
  }

  return inst;
}



void print_instruction(instruction inst)
{
  printf("%s | %s | %s | %s\n", inst.name[0], inst.name[1], inst.name[2],
	 inst.name[3]);
  return;
}


void print_label(label * label)
{
  printf("%s => %d\n", label->name, label->index);
  return;
}

void print_program(program * program)
{
  int i, j;

  for (i = 0; i < program->inst_count; ++i) {
    for (j = 0; j < program->label_count; ++j) {
      if (program->labels[j]->index == i) {
	printf("%s:\n", program->labels[j]->name);
      }
    }
    printf("%d ", i);
    print_instruction(program->insts[i]);
  }
  return;
}




program *parse_all(char buf[][100], int buf_size)
{
  int i, now = 0;
  int pc = 0;

  program *answer;

  answer = (program *) malloc(sizeof(program));
  answer->label_count = 0;
  answer->inst_count = 0;


  for (i = 0; i < buf_size; ++i) {
    /*colonが入っていればlabelそうでなければ、instruction */
    if (strstr(buf[i], ":") != NULL) {
      /*labelのparse */
      answer->labels[answer->label_count] = malloc(sizeof(label));
      now = 0;
      while (buf[i][now] != ' ') {
	answer->labels[answer->label_count]->name[now] =
	  buf[i][now];
	now++;
      }
      answer->labels[answer->label_count]->name[now + 1] = '\0';
      answer->labels[answer->label_count]->index = pc;
      answer->label_count = answer->label_count + 1;
    } else {
      /*instructionのparse */
      parse_one_line_instruction(buf[i], &(answer->insts[pc]));
      answer->inst_count = answer->inst_count + 1;;
      pc++;
    }
  }
  return answer;
}



#define REG_COUNT 32
#define FREG_COUNT 32


/*CPU の設定*/
int regist[REG_COUNT] =
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0
  };

float freg[FREG_COUNT] =
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0
  };
stack call_stack = { 0 };	/*call_stackのサイズを0で初期化 */

#define MEMORY_SIZE 1000000

union umemory {
  int i;
  float d;
};

union umemory memory[MEMORY_SIZE];

union buff{
  int i;
  float d;
};

union buff buffer;

/*メモリーの範囲内をアクセスしているか調べる*/
int check_memory(int num)
{
  if (0 <= num && num < MEMORY_SIZE) {
    return ACSESS_GOOD;
  }
  return ACSESS_BAD;
}

/*print系*/
void print_memory()
{
  int i;

  printf("===memory===\n");
  for (i = 0; i < MEMORY_SIZE; i++) {
    if (memory[i].i != 0) {
      printf("%d\t%d\t%20f\n", i, memory[i].i, memory[i].d);
    }
  }
  return;
}


void print_register()
{
  int i;

  printf("===register===\n");
  for (i = 0; i < REG_COUNT; ++i) {
    if (regist[i] != 0) {
      printf("%d\t%d\n", i, regist[i]);
    }
  }
  printf("===fpregister===\n");
  for (i = 0; i < FREG_COUNT; ++i) {
    if (freg[i] != 0.0) {
      printf("%d\t%f\n", i, freg[i]);
    }
  }
  return;
}




/*レジスターの番号をcharからintに変換する*/
int int_of_register(char *regist)
{
  if (regist[0] == 'r' || regist[0] == 'f') {
    return atoi(regist + 1);
  }
  //r f以外の場合
  printf("Error:register name is not iligal!\n");
  exit(1);
  return -1;
}



int new_label_trans(char *label, program * program)
{
  int i;
  /*number */
  if (label[0] == '-' || label[0] == '0' || label[0] == '1'
      || label[0] == '2' || label[0] == '3' || label[0] == '4'
      || label[0] == '5' || label[0] == '6' || label[0] == '7'
      || label[0] == '8' || label[0] == '9') {
    return atoi(label);
  }
  /*label */
  /*特殊ラベル*/

  for (i = 0; i < program->label_count; i++) {
    if (strcmp(label, program->labels[i]->name) == 0) {
      return program->labels[i]->index;
    }
  }
  fprintf(stderr, "%s\n", label);
  printf("label not found");
  exit(1);
  return -1;
}



int label_trans(char *label, program * program)
{
  int i;
  /*number */
  if (label[0] == '-' || label[0] == '0' || label[0] == '1'
      || label[0] == '2' || label[0] == '3' || label[0] == '4'
      || label[0] == '5' || label[0] == '6' || label[0] == '7'
      || label[0] == '8' || label[0] == '9') {
    return atoi(label);
  }
  /*label */
  for (i = 0; i < program->label_count; i++) {
    if (strcmp(label, program->labels[i]->name) == 0) {
      return program->labels[i]->index;
    }
  }
  fprintf(stderr, "%s\n", label);
  printf("label not found");
  exit(1);
  return -1;
}


/*ラベルを相対アドレスに書き換える*/
int label_trans_soutai(char *label, program * program, int nowpc)
{
  int i;
  /*number */
  if (label[0] == '-' || label[0] == '0' || label[0] == '1'
      || label[0] == '2' || label[0] == '3' || label[0] == '4'
      || label[0] == '5' || label[0] == '6' || label[0] == '7'
      || label[0] == '8' || label[0] == '9') {
    return atoi(label);
  }
  /*label */
  for (i = 0; i < program->label_count; i++) {
    if (strcmp(label, program->labels[i]->name) == 0) {
      return program->labels[i]->index - nowpc;
    }
  }
  printf("label not found");
  exit(1);
  return -1;
}


float read_float()
{
  char s[100];
  int a, i;
  bool f;

  for (i = 0, f = false; true;) {
    a = fgetc(stdin);
    if (f) {
      if (a == EOF || isspace(a)) {
	s[i] = '\0';
	printf("read_float %s\n", s);
	return atof(s);
      } else {
	s[i++] = (char) a;
      }
    } else {
      if (!(a == EOF || isspace(a))) {
	f = true;
	s[i++] = (char) a;
      }
    }
  }
}


int read_int()
{
  char s[100];
  int a, i;
  bool f;

  for (i = 0, f = false; true;) {
    a = fgetc(stdin);
    if (f) {
      if (a == EOF || isspace(a)) {
	s[i] = '\0';
	printf("read_int %s\n", s);
	return atoi(s);
      } else {
	s[i++] = (char) a;
      }
    } else {
      if (!(a == EOF || isspace(a))) {
	f = true;
	s[i++] = (char) a;
      }
    }
  }
}


/*レジスターの番号をcharからintに変換する*/
int int_of_regi(char *regist)
{
  if (regist[0] == 'r') {
    return atoi(regist + 1);
  }
  //r f以外の場合
  printf("Error:register name is iligal!:%s\n", regist);
  exit(1);
  return -1;
}

int int_of_fregi(char *regist)
{
  if (regist[0] == 'f') {
    return atoi(regist + 1);
  }
  //r f以外の場合
  printf("Error:register name is iligal!:%s\n", regist);
  exit(1);
  return -1;
}

int null_cal(char *null)
{
  return 0;
}

//マクロ
#define PARSE_INST(INST,INST_NUM,OP1,OP2,OP3)		\
  else if(strcmp(iname,INST) == 0){			\
    answer -> insts[i].name[0] = INST_NUM;		\
    answer -> insts[i].name[1] = OP1(ist.name[1]);	\
    answer -> insts[i].name[2] = OP2(ist.name[2]);	\
    answer -> insts[i].name[3] = OP3(ist.name[3]);	\
  }


#define PARSE_INST_1(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_regi,int_of_regi,int_of_regi)
#define PARSE_INST_2(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_regi,int_of_regi,atoi)
#define PARSE_INST_9(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_regi,atoi)
#define PARSE_INST_3(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_fregi,int_of_fregi)
#define PARSE_INST_4(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_fregi,null_cal)


#define PARSE_INST_5(INST,INST_NUM)					\
  else if(strcmp(iname,INST) == 0){					\
    answer -> insts[i].name[0] = INST_NUM;				\
    answer -> insts[i].name[1] = int_of_regi(ist.name[1]);		\
    answer -> insts[i].name[2] = int_of_regi(ist.name[2]);		\
    answer -> insts[i].name[3] =  label_trans_soutai(ist.name[3],program,i); \
  }

#define PARSE_INST_6(INST,INST_NUM)					\
  else if(strcmp(iname,INST) == 0){					\
    answer -> insts[i].name[0] = INST_NUM;				\
    answer -> insts[i].name[1] = int_of_fregi(ist.name[1]);		\
    answer -> insts[i].name[2] = int_of_fregi(ist.name[2]);		\
    answer -> insts[i].name[3] =  label_trans_soutai(ist.name[3],program,i); \
  }

#define PARSE_INST_7(INST,INST_NUM)					\
  else if(strcmp(iname,INST) == 0){					\
    answer -> insts[i].name[0] = INST_NUM;				\
    answer -> insts[i].name[1] = new_label_trans(ist.name[1],program);	\
    answer -> insts[i].name[2] = null_cal(ist.name[2]);			\
    answer -> insts[i].name[3] = null_cal(ist.name[3]);			\
  }

#define PARSE_INST_8(INST,INST_NUM)			\
  else if(strcmp (iname,INST) == 0){			\
    answer -> insts[i].name[0] = INST_NUM;		\
    answer -> insts[i].name[1] = null_cal(ist.name[1]);	\
    answer -> insts[i].name[2] = null_cal(ist.name[2]);	\
    answer -> insts[i].name[3] = null_cal(ist.name[3]); \
  }

#define PARSE_INST_10(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_regi,null_cal)

#define PARSE_INST_11(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_regi,int_of_regi)

#define PARSE_INST_12(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_regi,null_cal,null_cal)
#define PARSE_INST_13(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,null_cal,null_cal)

#define NOP 0
#define ADD 1
#define SUB 2
#define MUL 3
#define NOR 6
#define XOR 7
#define ADDI 9
#define SUBI 10
#define MULI 11
#define NORI 14
#define XORI 15

#define FADD 16
#define FSUB 17
#define FMUL 18
#define FSQRT 20
#define FDIV 19
#define FOI 21
#define FIO 23
#define FLR 22
#define LDR 24
#define STR 26
#define FLDR 28
#define FSTR 30
#define LDI 25
#define STI 27
#define FLDI 29
#define FSTI 31

#define BEQ 32
#define BNE 33
#define BGT 34
#define BLT 35
#define FBEQ 36
#define FBNE 37
#define FBGT 38
#define FBLT 39

#define JUMP 48
#define CALL 52
#define RETURN 56

#define PTC 4
#define PTF 5

#define RDI 12
#define RDF 13

program2 *parse_all2(program * program)
{
  int i;
  program2 *answer;
  char *iname;
  instruction ist;
  char *arg1, *arg2, *arg3;

  answer = malloc(sizeof(program2));
  answer->inst_count = program->inst_count;

  for (i = 0; i < program->inst_count; i++) {
    ist = program->insts[i];
    iname = ist.name[0];
    arg1 = ist.name[1];
    arg2 = ist.name[2];
    arg3 = ist.name[3];

    if (strcmp(iname, "nop") == 0) {
      answer->insts[i].name[0] = 0;
    }
    PARSE_INST_1("add", ADD)
      PARSE_INST_1("sub", SUB)
      PARSE_INST_1("mul", MUL)
      PARSE_INST_1("nor", NOR)
      PARSE_INST_1("xor", XOR)
      PARSE_INST_2("addi", ADDI)
      PARSE_INST_2("subi", SUBI)
      PARSE_INST_2("muli", MULI)
      PARSE_INST_2("nori", NORI)
      PARSE_INST_2("xori", XORI)
      PARSE_INST_3("fadd", FADD)
      PARSE_INST_3("fsub", FSUB)
      PARSE_INST_3("fmul", FMUL)
      PARSE_INST_3("fdiv", FDIV)
      PARSE_INST_4("fsqrt",FSQRT)
      PARSE_INST_4("flr",FLR)
      PARSE_INST_10("foi", FOI)
      PARSE_INST_2("ldi", LDI)
      PARSE_INST_2("sti", STI)
      PARSE_INST_9("fldi", FLDI)
      PARSE_INST_9("fsti", FSTI)
      PARSE_INST_1("ldr", LDR)
      PARSE_INST_1("str", STR)
      PARSE_INST_11("fldr", FLDR)
      PARSE_INST_11("fstr", FSTR)
      PARSE_INST_5("beq", BEQ)
      PARSE_INST_5("bne", BNE)
      PARSE_INST_5("bgt", BGT)
      PARSE_INST_5("blt", BLT)
      PARSE_INST_6("fbeq", FBEQ)
      PARSE_INST_6("fbne", FBNE)
      PARSE_INST_6("fbgt", FBGT)
      PARSE_INST_6("fblt", FBLT)
      PARSE_INST_7("jump", JUMP)
      PARSE_INST_7("call", CALL)
      PARSE_INST_8("return", RETURN)
      PARSE_INST_12("rdi", RDI)
      PARSE_INST_13("rdf", RDF)
      PARSE_INST_12("ptc", PTC)
      PARSE_INST_13("ptf", PTF)
    else {
      printf("Error : this is iligal inst!: %s\n", iname);
      exit(1);
    }
  }
  return answer;
}



#define DO_INST_1(INST_NUM,OP)						\
  else if(iname == INST_NUM){						\
    regist[ist.name[1]] = regist[ist.name[2]] OP regist[ist.name[3]];	\
  }

 

int do_assemble2(program2 * program2,program * program)
{
  int pc = 0;
  int nextpc = 0;
  instruction2 ist;
  int iname, arg1, arg2, arg3;
  int count = 0;
  FILE * input_fp;
  FILE * output_fp;

  if((input_fp = fopen(INPUT_FILE,"r")) == NULL){
    printf("%s が開けません\n","input.txt");
    exit(1);
  }

  if((output_fp = fopen(OUTPUT_FILE,"w")) == NULL){
    printf("%s が開けません\n","output.txt");
    exit(1);
  }


  while (1) {
    pc = nextpc;
    ist = program2->insts[pc];
    iname = ist.name[0];
    arg1 = ist.name[1];
    arg2 = ist.name[2];
    arg3 = ist.name[3];

    if (iname == NOP) {
      // printf("this is nop\n");
    }
    DO_INST_1(ADD, +)
      DO_INST_1(SUB, -)
      DO_INST_1(MUL, *)
      /*ALU命令 */
    else if (iname == NOR) {
      regist[ist.name[1]] = ~(regist[ist.name[2]] | regist[ist.name[3]]);
    }
    else if (iname == XOR) {
      regist[ist.name[1]] = regist[ist.name[2]] ^ regist[ist.name[3]];
    }
    else if (iname == ADDI) {
      regist[ist.name[1]] = regist[ist.name[2]] + ist.name[3];
    }
    else if (iname == SUBI) {
      regist[ist.name[1]] = regist[ist.name[2]] - ist.name[3];
    }
    else if (iname == MULI) {
      regist[ist.name[1]] = regist[ist.name[2]] * ist.name[3];
    }
    else if (iname == NORI) {
      regist[ist.name[1]] = ~(regist[ist.name[2]] | ist.name[3]);
    }
    else if (iname == XORI) {
      regist[ist.name[1]] = regist[ist.name[2]] ^ ist.name[3];
    }
    /*FPU命令 */
    else if (iname == FADD) {
      freg[ist.name[1]] = freg[ist.name[2]] + freg[ist.name[3]];
    }
    else if (iname == FSUB) {
      freg[ist.name[1]] = freg[ist.name[2]] - freg[ist.name[3]];
    }
    else if (iname == FMUL) {
      freg[ist.name[1]] = freg[ist.name[2]] * freg[ist.name[3]];
    }
    else if (iname == FDIV) {
      freg[ist.name[1]] = freg[ist.name[2]] / freg[ist.name[3]];
    }
    else if (iname == FSQRT) {
      freg[ist.name[1]] = sqrt(freg[ist.name[2]]);
    }
    else if (iname == FLR) {
      freg[ist.name[1]] = floor(freg[ist.name[2]]);
    }
    else if (iname == FOI) {
      freg[ist.name[1]] = (float) (regist[ist.name[2]]);
    }

    /*MEM ACSESS命令 */
    else if (iname == LDI) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + ist.name[3]) == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      regist[ist.name[1]] = memory[regist[ist.name[2]] + ist.name[3]].i;
    }

    else if (iname == STI) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + ist.name[3]) == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      memory[regist[ist.name[2]] + ist.name[3]].i =  regist[ist.name[1]];
    }

    else if (iname == FLDI) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + ist.name[3])
	  == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      freg[ist.name[1]] =
	memory[regist[ist.name[2]] + ist.name[3]].d;
    }

    else if (iname == FSTI) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + ist.name[3])
	  == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      memory[regist[ist.name[2]] + ist.name[3]].d =
	freg[ist.name[1]];
    }
    else if (iname == LDR) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + regist[ist.name[3]]) == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      regist[ist.name[1]] = memory[regist[ist.name[2]] + regist[ist.name[3]]].i;
    }

    else if (iname == STR) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + regist[ist.name[3]]) == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      memory[regist[ist.name[2]] + regist[ist.name[3]]].i =  regist[ist.name[1]];
    }

    else if (iname == FLDR) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + regist[ist.name[3]])
	  == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      freg[ist.name[1]] =
	memory[regist[ist.name[2]] + regist[ist.name[3]]].d;
    }

    else if (iname == FSTR) {
      //memory_check
      if (check_memory(regist[ist.name[2]] + regist[ist.name[3]])
	  == ACSESS_BAD) {
	printf("Error:ACSESS_BAD :\n");
	exit(1);
      }
      memory[regist[ist.name[2]] + regist[ist.name[3]]].d =
	freg[ist.name[1]];
    }


    /*BRANCH命令 */
    else if (iname == BEQ) {
      if (regist[ist.name[1]] == regist[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }

    else if (iname == BNE) {
      if (regist[ist.name[1]] != regist[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }
    else if (iname == BGT) {
      if (regist[ist.name[1]] > regist[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }

    else if (iname == BLT) {
      if (regist[ist.name[1]] < regist[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }
    else if (iname == FBEQ) {
      if (freg[ist.name[1]] == freg[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }
        
    else if (iname == FBNE) {
      if (freg[ist.name[1]] != freg[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }
        
    else if (iname == FBGT) {
      if (freg[ist.name[1]] > freg[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }
    else if (iname == FBLT) {
      if (freg[ist.name[1]] < freg[ist.name[2]]) {
	nextpc = pc + ist.name[3] - 1;
      }
    }
    /*JUMP命令 */
    else if (iname == JUMP) {
      nextpc = ist.name[1] - 1;
    }
        
        
    else if (iname == CALL) {
          
      nextpc = ist.name[1] - 1;
	push(&call_stack, (pc + 1));
      


    }

    else if (iname == RETURN) {
      nextpc = pop(&call_stack) - 1;
    }
    else if (iname == RDI) {
      regist[ist.name[1]] = read_int();
      //fscanf(input_fp,"%X",&regist[ist.name[1]]);
    }
    else if (iname == RDF) {
      freg[ist.name[1]] = read_float();
      //fscanf(input_fp,"%X",&buffer.i);
      //freg[ist.name[1]] = buffer.d;
    }
    else if (iname == PTC) {
	fprintf(output_fp,"%c",regist[ist.name[1]]);
    }
    else if (iname == PTF) {
      if(((int)freg[ist.name[1]]) > 255){
	fprintf(output_fp,"%d",255);
      }else if (((int)freg[ist.name[1]]) < 0){
	fprintf(output_fp,"%d",0);
      }else{
	fprintf(output_fp,"%d",(int)(freg[ist.name[1]]));
      }
    }
    //命令が存在しなかった場合error parseでやっているのでいらない。
    //printf("ist = %d\n",iname);


    /*デバック用*/
    //	        printf("%d  [%d] ",count,pc);
    //        print_instruction(program->insts[pc]);

    /*
      if(count  == 30038){
      //ifdoprintregs)
      print_register();
      //if(doprintmem)
      //print_memory();
      }*/

    count++;        
    nextpc++;


    /*命令がラストの行まで行けば処理を終了する */
    if (nextpc >= program2->inst_count) {
      break;
    }
  }
    
  fclose(input_fp);
  fclose(output_fp);
  return 0;
}


double gettimeofday_sec()
{
  struct timeval tv;
  gettimeofday(&tv, NULL);
  return tv.tv_sec + (double)tv.tv_usec*1e-6;
}


int main(int argc, char *argv[])
{
  FILE *fp, *fp2;
  char buf[100000][100];	/*命令 読み込み用バッファ */
  char fpt[FPT_MAX_COUNT][20] ;
  int i = 0, j, k;
  //メモリ上の浮動小数点テーブルの位置
  int fpmemoffset = 0;
  int result;
  bool doprintregs = false, doprintmem = false;
  program *answer;
  program2 *answer2;
  double t2, t1;
  int ll = 0;

  while ((result = getopt(argc, argv, "rm")) != -1) {
    switch (result) {

      /* 値をとらないオプション */
    case 'r':
      /* getoptの返り値は見付けたオプションである. */
      doprintregs = true;
      break;
    case 'm':
      doprintmem = true;
      break;

    case 'd':
    case 'e':
      /* 値を取る引数の場合は外部変数optargにその値を格納する. */
      //fprintf(stdout,"%c %s\n",result,optarg);
      break;

    /* 以下二つのcaseは意味がないようだ.
       getoptが直接エラーを出力してくれるから.
       プログラムを終了するなら意味があるかも知れない */
    case ':':
      /* 値を取る引数に値がなかった場合:を返す. */
      fprintf(stdout, "%c needs value\n", result);
      break;

      /* getoptの引数で指定されなかったオプションを受け取ると?を返す. */
    case '?':
      fprintf(stdout, "unknown\n");
      break;
    }
  }


  /*
    if (argc < 3) {
    fprintf(stderr, "<Useage>:%s assembler-file fp-table-file\n",
    argv[0]);
    return 1;
    }
  */


  /*assembler-file open and read */
  fp = fopen(argv[1], "r");
  if (fp == NULL) {
    printf("%sが開けません\n", argv[1]);
    return 1;
  }

  if (argc > 2) {
    fp2 = fopen(argv[2], "r");
    if (fp2 == NULL) {
      printf("%sが開けません\n", argv[2]);
      return 1;
    }
    for (i = 0; i < FPT_MAX_COUNT; ++i) {
      if (fgets(fpt[i], 20, fp2) == NULL) {	/* １行読み込み */
	break;		/* 末尾まで完了したか、エラー発生で終了 */
      }
    }

    for (j = 0; j < i; ++j) {
      //エラーが起こっても関係ない
      //printf("%s\n", fpt[j]);
      memory[j + fpmemoffset].i = (int) strtol(fpt[j], NULL, 16);
    }
    //print_memory();
  }

  i = 0;
  while (1) {
    if (fgets(buf[i], 81, fp) == NULL) {	/* 1行読み込み */
      break;		/* 末尾まで完了したか、エラー発生で終了 */
    }
    i++;
  }


  answer = parse_all(buf, i);

  answer2 = parse_all2(answer);
  print_program(answer);


  t1 = gettimeofday_sec();

  do_assemble2(answer2,answer);

  t2 = gettimeofday_sec();
  printf("%lf\n", t2 - t1);




    
  if (doprintregs)
  print_register();
  if (doprintmem)
  print_memory();

  fclose(fp);
  fclose(fp2);



  return 0;
}
