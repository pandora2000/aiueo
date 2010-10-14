#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

#define NAME_MAX_COUNT 4
#define NAME_SIZE 40

#define INST_MAX_COUNT 20000

#define LABEL_MAX_COUNT 10000

#define FPT_MAX_COUNT 100

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
    int len = strlen(str);
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
    int label_i = 0;
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

#define memory_size 1000000

union umemory {
    int i;
    float d;
};

union umemory memory[memory_size];



/*print系*/
print_memory()
{
    int i;

    printf("===memory===\n");
    for (i = 0; i < memory_size; i++) {
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


int do_assemble(program * program)
{
    int pc = 0;
    int nextpc = 0;
    int stop = 0, i, j, k, l;
    char *iname;
    instruction ist;
    char *arg1, *arg2, *arg3;
    int count = 0;
    int r3;
    union umemory tmp;
    int a;
    float b;
    int cnt[100];

    for (i = 0; i < 100; ++i) {
	cnt[i] = 0;
    }

    while (1) {
	pc = nextpc;

	/*
	   途中で操作を止める際のコード 
	   print_register();
	   printf("pc = %d\n",pc);
	   if(stop>=100){exit(1);}else{stop++;}
	 */

	r3 = regist[3];
	++count;
	ist = program->insts[pc];
	iname = ist.name[0];
	arg1 = ist.name[1];
	arg2 = ist.name[2];
	arg3 = ist.name[3];

	/*ALU命令 */
	if (strcmp(iname, "nop") == 0) {
	    ++cnt[0];
	}

	else if (strcmp(iname, "add") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] +
		regist[int_of_register(ist.name[3])];

	    ++cnt[1];
	}

	else if (strcmp(iname, "sub") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] -
		regist[int_of_register(ist.name[3])];

	    ++cnt[2];
	}

	else if (strcmp(iname, "mul") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] *
		regist[int_of_register(ist.name[3])];

	    ++cnt[3];
	}

	else if (strcmp(iname, "and") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] &
		regist[int_of_register(ist.name[3])];

	    ++cnt[4];
	}

	else if (strcmp(iname, "or") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] |
		regist[int_of_register(ist.name[3])];

	    ++cnt[5];
	}

	else if (strcmp(iname, "nor") == 0) {
	    regist[int_of_register(ist.name[1])] =
		~(regist[int_of_register(ist.name[2])] |
		  regist[int_of_register(ist.name[3])]);

	    ++cnt[6];
	}

	else if (strcmp(iname, "xor") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] ^
		regist[int_of_register(ist.name[3])];

	    ++cnt[7];
	}

	else if (strcmp(iname, "addi") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] + atoi(ist.name[3]);

	    ++cnt[8];
	}

	else if (strcmp(iname, "subi") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] - atoi(ist.name[3]);

	    ++cnt[9];
	}

	else if (strcmp(iname, "muli") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] * atoi(ist.name[3]);

	    ++cnt[10];
	}

	else if (strcmp(iname, "andi") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] & atoi(ist.name[3]);

	    ++cnt[11];
	}

	else if (strcmp(iname, "ori") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] | atoi(ist.name[3]);
	    ++cnt[12];
	}

	else if (strcmp(iname, "nori") == 0) {
	    regist[int_of_register(ist.name[1])] =
		~(regist[int_of_register(ist.name[2])] |
		  atoi(ist.name[3]));
	    ++cnt[13];
	}

	else if (strcmp(iname, "xori") == 0) {
	    regist[int_of_register(ist.name[1])] =
		regist[int_of_register(ist.name[2])] ^ atoi(ist.name[3]);

	    ++cnt[14];
	}


	/*FPU命令 */
	else if (strcmp(iname, "fadd") == 0) {
	    freg[int_of_register(ist.name[1])] =
		freg[int_of_register(ist.name[2])] +
		freg[int_of_register(ist.name[3])];

	    ++cnt[15];
	}

	else if (strcmp(iname, "fsub") == 0) {
	    freg[int_of_register(ist.name[1])] =
		freg[int_of_register(ist.name[2])] -
		freg[int_of_register(ist.name[3])];

	    ++cnt[16];
	}

	else if (strcmp(iname, "fmul") == 0) {
	    freg[int_of_register(ist.name[1])] =
		freg[int_of_register(ist.name[2])] *
		freg[int_of_register(ist.name[3])];

	    ++cnt[17];
	}

	else if (strcmp(iname, "fdiv") == 0) {
	    freg[int_of_register(ist.name[1])] =
		freg[int_of_register(ist.name[2])] /
		freg[int_of_register(ist.name[3])];

	    ++cnt[18];
	}

	else if (strcmp(iname, "finv") == 0) {
	    freg[int_of_register(ist.name[1])] =
		1.0 / freg[int_of_register(ist.name[2])];
	    ++cnt[19];
	}

	else if (strcmp(iname, "fsqrt") == 0) {
	    freg[int_of_register(ist.name[1])] =
		sqrt(freg[int_of_register(ist.name[2])]);
	    ++cnt[20];
	}

	else if (strcmp(iname, "floor") == 0) {
	    /*
	       i = int_of_register(ist.name[1]);
	       j = int_of_register(ist.name[2]);
	       if (i == 2 && j == 2) {
	       printf("%f\n", freg[2]);
	       }
	     */
	    freg[int_of_register(ist.name[1])] =
		floor(freg[int_of_register(ist.name[2])]);
	    ++cnt[21];
	}

	else if (strcmp(iname, "foi") == 0) {
	    freg[int_of_register(ist.name[1])] =
		(float) (regist[int_of_register(ist.name[2])]);
	    ++cnt[22];
	}

	else if (strcmp(iname, "iof") == 0) {
	    a = (int) (freg[int_of_register(ist.name[2])]);
	    b = ((float) a) + 0.5;
	    if (freg[int_of_register(ist.name[2])] >= b) {
		++a;
	    }
	    //printf("%f %d\n", freg[int_of_register(ist.name[2])], a);
	    regist[int_of_register(ist.name[1])] = a;
	    ++cnt[23];
	}




	/*MEM ACSESS命令 */
	else if (strcmp(iname, "load") == 0) {
	    //      fprintf(stderr, "%d\n", regist[4]);
	    regist[int_of_register(ist.name[1])] =
		memory[regist[int_of_register(ist.name[2])]
		       + atoi(ist.name[3])].i;
	    ++cnt[24];
	}

	else if (strcmp(iname, "store") == 0) {
	    memory[regist[int_of_register(ist.name[2])] +
		   atoi(ist.name[3])].i =
		regist[int_of_register(ist.name[1])];

	    if ((regist[int_of_register(ist.name[2])]
		 + atoi(ist.name[3])) == 6144) {
		//printf("store %d\n", regist[int_of_register(ist.name[1])]);
		//printf("at %d\n", pc);
	    }
	    ++cnt[25];
	}

	else if (strcmp(iname, "fload") == 0) {
	    //    fprintf(stdout, "aa\n");
	    //            fprintf(stdout, "%d\n", tmp.i = regist[int_of_register(ist.name[2])] + atoi(ist.name[3]));
	    //    fprintf(stdout, "%f\n", tmp.d);
	    freg[int_of_register(ist.name[1])] =
		memory[regist[int_of_register(ist.name[2])] +
		       atoi(ist.name[3])].d;
	    //      fprintf(stdout, "bb\n");

	    ++cnt[26];
	}

	else if (strcmp(iname, "fstore") == 0) {
	    memory[regist[int_of_register(ist.name[2])] +
		   atoi(ist.name[3])].d =
		freg[int_of_register(ist.name[1])];

	    ++cnt[27];
	}


	/*BRANCH命令 */
	else if (strcmp(iname, "beq") == 0) {
	    if (regist[int_of_register(ist.name[1])] ==
		regist[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }

	    ++cnt[28];
	}

	else if (strcmp(iname, "bne") == 0) {
	    if (regist[int_of_register(ist.name[1])] !=
		regist[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }

	    ++cnt[29];
	}

	else if (strcmp(iname, "bgt") == 0) {
	    if (regist[int_of_register(ist.name[1])] >
		regist[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }

	    ++cnt[30];
	}

	else if (strcmp(iname, "blt") == 0) {
	    if (regist[int_of_register(ist.name[1])] <
		regist[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }

	    ++cnt[31];
	}

	else if (strcmp(iname, "bge") == 0) {
	    if (regist[int_of_register(ist.name[1])] >=
		regist[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }

	    ++cnt[32];
	}

	else if (strcmp(iname, "ble") == 0) {
	    if (regist[int_of_register(ist.name[1])] <=
		regist[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[33];

	} else if (strcmp(iname, "fbeq") == 0) {
	    if (freg[int_of_register(ist.name[1])] ==
		freg[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[34];

	}

	else if (strcmp(iname, "fbne") == 0) {
	    if (freg[int_of_register(ist.name[1])] !=
		freg[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[35];

	}

	else if (strcmp(iname, "fbgt") == 0) {
	    if (freg[int_of_register(ist.name[1])] >
		freg[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[36];

	}

	else if (strcmp(iname, "fblt") == 0) {
	    if (freg[int_of_register(ist.name[1])] <
		freg[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[37];

	}

	else if (strcmp(iname, "fbge") == 0) {
	    if (freg[int_of_register(ist.name[1])] >=
		freg[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[38];

	}

	else if (strcmp(iname, "fble") == 0) {
	    if (freg[int_of_register(ist.name[1])] <=
		freg[int_of_register(ist.name[2])]) {
		nextpc =
		    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
	    }
	    ++cnt[39];

	}


	/*JUMP命令 */
	else if (strcmp(iname, "jump") == 0) {
	    nextpc = label_trans(ist.name[1], program) - 1;

	    ++cnt[40];
	}


	else if (strcmp(iname, "call") == 0) {
	    nextpc = label_trans(ist.name[1], program) - 1;


/*
  if (strncmp(ist.name[1], "L_sin", 5) == 0) {
  //printf("%f\n", freg[2]);
  freg[2] = sinf(freg[2]);
  nextpc = pc;
  } else if (strncmp(ist.name[1], "L_cos", 5) == 0) {
  //printf("%f\n", freg[2]);
  freg[2] = cosf(freg[2]);
  nextpc = pc;
*/
	    /*} else */ if (strncmp(ist.name[1], "L_atan", 6) == 0) {
		//printf("%f\n", freg[2]);
		freg[2] = atanf(freg[2]);
		nextpc = pc;

	    } else if (strncmp(ist.name[1], "L_sqrt", 6) == 0) {
		//printf("%f\n", freg[2]);
		freg[2] = sqrtf(freg[2]);
		nextpc = pc;

	    } else if (strcmp(ist.name[1], "min_caml_read_int") == 0) {
		regist[4] = read_int();
		printf("read_int: %d\n", regist[4]);
		nextpc = pc;
	    } else if (strcmp(ist.name[1], "min_caml_read_float") == 0) {
		freg[2] = read_float();
		printf("read_float: %f\n", freg[2]);
		nextpc = pc;
	    } else {
	    ++cnt[41];
		push(&call_stack, (pc + 1));
	    }
	}


	else if (strcmp(iname, "return") == 0) {
	    nextpc = pop(&call_stack) - 1;

	    ++cnt[42];
	}
	//命令が存在しなかった場合error
	else {
	    printf("Error:this is legal instruction!:%s\n",
		   program->insts[pc].name[0]);
	    exit(1);
	}

	//printf("%d\n", regist[3]);

	nextpc++;
	/*
	   if(count > 817757)
	   {
	   for(j = 0; j < program->label_count; ++j)
	   {
	   if(program->labels[j]->index == pc)
	   {
	   printf("%s:\n", program->labels[j]->name);
	   }
	   }

	   printf("%d", pc);
	   print_instruction(ist);
	   //                                                                                                                                                                                                                                                      printf("%d\n", count);
	   printf("%d\n", memory[4062].i);
	   print_register();
	   } */
	/*
	   if((count % 1000000) == 0)
	   {
	   printf("%d\n", count);
	   }
	 */


	/*命令がラストの行まで行けば処理を終了する */
	if (nextpc >= program->inst_count) {
	    break;
	}

    }

    for (i = 0; i < 100; ++i) {
	printf("%d: %d\n", i, cnt[i]);
    }



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
    char fpt[FPT_MAX_COUNT][20] = { 0 };
    int i = 0, j, k;
    //メモリ上の浮動小数点テーブルの位置
    int fpmemoffset = 0;
    int result;
    bool doprintregs = false, doprintmem = false;
    program *answer;
    double t2, t1;
    int ll = 0;

    while ((result = getopt(argc, argv, "r")) != -1) {
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
	    memory[j + fpmemoffset].i = (int) strtoll(fpt[j], NULL, 16);
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

    //print_program(answer);

    t1 = gettimeofday_sec();
    do_assemble(answer);
    t2 = gettimeofday_sec();
    printf("%lf\n", t2 - t1);
    
    if (doprintregs)
	print_register();
    if (doprintmem)
	print_memory();

    fclose(fp);
    fclose(fp2);

    fp = fopen("res", "w");
    fprintf(fp, "P3\n");
    fprintf(fp, "%d %d %d\n", memory[8193].i, memory[8194].i,
	    memory[8195].i);
    /*
       k = 8196;
       for(i = 3; i <= 16386; ++i)
       {
       j = (i - 3) * 3 + k;
       fprintf(fp, "%d %d %d\n", (int)memory[j].d,
       (int)memory[j + 1].d, (int)memory[j + 2].d);
       }
     */
    for (i = 8196; i < memory[8192].i; i = i + 3) {
	fprintf(fp, "%d %d %d\n", (int) memory[i].d,
		(int) memory[i + 1].d, (int) memory[i + 2].d);
    }


    fclose(fp);
    return 0;
}
