#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

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

#define  ACSESS_GOOD 0
#define  ACSESS_BAD -1

/*CPU の設定*/
int regist[REG_COUNT] =
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0
};

float freg[FREG_COUNT] =
    { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0
};
stack call_stack = { 0 };       /*call_stackのサイズを0で初期化 */

#define MEMORY_SIZE 1000000

union umemory {
    int i;
    float d;
};

union umemory memory[MEMORY_SIZE];


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
    printf("Error:register name is iligal!:%s\n", regist);
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
#define PARSE_INST(INST,INST_NUM,OP1,OP2,OP3) \
    else if(strcmp(iname,INST) == 0){ \
      answer -> insts[i].name[0] = INST_NUM; \
      answer -> insts[i].name[1] = OP1(ist.name[1]); \
      answer -> insts[i].name[2] = OP2(ist.name[2]); \
      answer -> insts[i].name[3] = OP3(ist.name[3]); \
      puts(INST); \
    }


#define PARSE_INST_1(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_regi,int_of_regi,int_of_regi)
#define PARSE_INST_2(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_regi,int_of_regi,atoi)
#define PARSE_INST_9(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_regi,atoi)
#define PARSE_INST_3(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_fregi,int_of_fregi)
#define PARSE_INST_4(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_fregi,null_cal)


#define PARSE_INST_5(INST,INST_NUM) \
      else if(strcmp(iname,INST) == 0){             \
      answer -> insts[i].name[0] = INST_NUM;\
      answer -> insts[i].name[1] = int_of_regi(ist.name[1]);                    \
      answer -> insts[i].name[2] = int_of_regi(ist.name[2]);                    \
      answer -> insts[i].name[3] = i + label_trans_soutai(ist.name[3],program,i); \
      puts(INST); \
        }

#define PARSE_INST_6(INST,INST_NUM) \
      else if(strcmp(iname,INST) == 0){             \
      answer -> insts[i].name[0] = INST_NUM;\
      answer -> insts[i].name[1] = int_of_fregi(ist.name[1]);                    \
      answer -> insts[i].name[2] = int_of_fregi(ist.name[2]);                    \
      answer -> insts[i].name[3] = i + label_trans_soutai(ist.name[3],program,i); \
      puts(INST); \
        }

#define PARSE_INST_7(INST,INST_NUM) \
      else if(strcmp(iname,INST) == 0){             \
      answer -> insts[i].name[0] = INST_NUM;\
      answer -> insts[i].name[1] = label_trans(ist.name[1],program);    \
      puts(INST); \
        }

#define PARSE_INST_8(INST,INST_NUM)             \
 else if(strcmp (iname,INST) == 0){             \
   answer -> insts[i].name[0] = INST_NUM;        \
      puts(INST); \
 }

#define PARSE_INST_10(INST,INST_NUM) PARSE_INST(INST,INST_NUM,int_of_fregi,int_of_regi,null_cal)

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
            puts("nop");
        }
        PARSE_INST_1("add", 1)
            PARSE_INST_1("sub", 2)
            PARSE_INST_1("mul", 3)
            PARSE_INST_1("and", 4)
            PARSE_INST_1("or", 5)
            PARSE_INST_1("nor", 6)
            PARSE_INST_1("xor", 7)
            PARSE_INST_2("addi", 8)
            PARSE_INST_2("subi", 9)
            PARSE_INST_2("muli", 10)
            PARSE_INST_2("andi", 11)
            PARSE_INST_2("ori", 12)
            PARSE_INST_2("nori", 13)
            PARSE_INST_2("xori", 14)
            PARSE_INST_3("fadd", 15)
            PARSE_INST_3("fsub", 16)
            PARSE_INST_3("fmul", 17)
            PARSE_INST_3("fdiv", 18)
            PARSE_INST_4("finv", 19)
            PARSE_INST_4("fsqrt", 20)
            PARSE_INST_4("floor", 21)
            PARSE_INST_10("foi", 22)
            PARSE_INST_2("load", 23)
            PARSE_INST_2("store", 24)
            PARSE_INST_9("fload", 25)
            PARSE_INST_9("fstore", 26)
            PARSE_INST_5("beq", 27)
            PARSE_INST_5("bne", 28)
            PARSE_INST_5("bgt", 29)
            PARSE_INST_5("blt", 30)
            PARSE_INST_5("bge", 31)
            PARSE_INST_5("ble", 32)
            PARSE_INST_6("beq", 33)
            PARSE_INST_6("fbne", 34)
            PARSE_INST_6("fbgt", 35)
            PARSE_INST_6("fblt", 36)
            PARSE_INST_6("fbge", 37)
            PARSE_INST_6("fble", 38)
            PARSE_INST_7("jump", 39)
            PARSE_INST_7("call", 40)
            PARSE_INST_8("return", 41)
            else {
            printf("Error : this is iligal inst!: %s\n", iname);
            exit(1);
        }
    }
    return answer;
}


#define DO_INST_1(INST_NUM,OP)                  \
    else if(iname == INST_NUM){ \
      regist[ist.name[1]] = regist[ist.name[2]] OP regist[ist.name[3]]; \
    }

int do_assemble2(program2 * program2)
{
    int pc = 0;
    int nextpc = 0;
    instruction2 ist;
    int iname, arg1, arg2, arg3;

    while (1) {
        pc = nextpc;

        ist = program2->insts[pc];
        iname = ist.name[0];
        arg1 = ist.name[1];
        arg2 = ist.name[2];
        arg3 = ist.name[3];

        if (iname == 0) {
          // printf("this is nop\n");
        }
        DO_INST_1(1, +)
            DO_INST_1(2, -)
            DO_INST_1(3, *)
            DO_INST_1(4, &)
            DO_INST_1(5, |)
          /*ALU命令 */
        else if (iname == 6) {
          regist[ist.name[1]] = ~(regist[ist.name[2]] | regist[ist.name[3]]);
        }
        else if (iname == 7) {
            regist[ist.name[1]] = regist[ist.name[2]] ^ regist[ist.name[3]];
        }
        else if (iname == 8) {
            regist[ist.name[1]] = regist[ist.name[2]] + ist.name[3];
        }
        else if (iname == 9) {
            regist[ist.name[1]] = regist[ist.name[2]] - ist.name[3];
        }
        else if (iname == 10) {
            regist[ist.name[1]] = regist[ist.name[2]] * ist.name[3];
        }
        else if (iname == 11) {
            regist[ist.name[1]] = regist[ist.name[2]] & ist.name[3];
        }
        else if (iname == 12) {
            regist[ist.name[1]] = regist[ist.name[2]] | ist.name[3];
        }
        else if (iname == 13) {
            regist[ist.name[1]] = ~(regist[ist.name[2]] | ist.name[3]);
        }
        else if (iname == 14) {
            regist[ist.name[1]] = regist[ist.name[2]] ^ ist.name[3];
        }
        /*FPU命令 */
        else if (iname == 15) {
            freg[ist.name[1]] = freg[ist.name[2]] + freg[ist.name[3]];
        }
        else if (iname == 16) {
            freg[ist.name[1]] = freg[ist.name[2]] - freg[ist.name[3]];
        }
        else if (iname == 17) {
            freg[ist.name[1]] = freg[ist.name[2]] * freg[ist.name[3]];
        }
        else if (iname == 18) {
            freg[ist.name[1]] = freg[ist.name[2]] / freg[ist.name[3]];
        }
        else if (iname == 19) {
            freg[ist.name[1]] = 1 / freg[ist.name[2]];
        }
        else if (iname == 20) {
            freg[ist.name[1]] = sqrt(freg[ist.name[2]]);
        }
        else if (iname == 21) {
            freg[ist.name[1]] = floor(freg[ist.name[2]]);
        }
        else if (iname == 22) {
            freg[ist.name[1]] = (float) (regist[ist.name[2]]);
        }

        /*MEM ACSESS命令 */
        else if (iname == 23) {
            //memory_check
            if (check_memory(regist[ist.name[2]] + ist.name[3]) == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                exit(1);
            }
            regist[ist.name[1]] = memory[regist[ist.name[2]] + ist.name[3]].i;
        }

        else if (iname == 24) {
            //memory_check
            if (check_memory(regist[ist.name[2]] + ist.name[3]) == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                exit(1);
            }
            memory[regist[ist.name[2]] + ist.name[3]].i =  regist[ist.name[1]];
        }

        else if (iname == 25) {
            //memory_check
            if (check_memory(regist[ist.name[2]] + ist.name[3])
                == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                exit(1);
            }
            freg[ist.name[1]] =
                memory[regist[ist.name[2]] + ist.name[3]].d;
        }

        else if (iname == 26) {
            //memory_check
            if (check_memory(regist[ist.name[2]] + ist.name[3])
                == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                exit(1);
            }
            memory[regist[ist.name[2]] + ist.name[3]].d =
                freg[ist.name[1]];
        }


        /*BRANCH命令 */
        else if (iname == 27) {
            if (regist[ist.name[1]] == regist[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 28) {
            if (regist[ist.name[1]] != regist[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }
        else if (iname == 29) {
            if (regist[ist.name[1]] > regist[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 30) {
            if (regist[ist.name[1]] < regist[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 31) {
            if (regist[ist.name[1]] >= regist[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 32) {
            if (regist[ist.name[1]] <= regist[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }

        } else if (iname == 33) {
            if (freg[ist.name[1]] == freg[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 34) {
            if (freg[ist.name[1]] != freg[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 35) {
            if (freg[ist.name[1]] > freg[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 36) {
            if (freg[ist.name[1]] < freg[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 37) {
            if (freg[ist.name[1]] >= freg[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }

        else if (iname == 38) {
            if (freg[ist.name[1]] <= freg[ist.name[2]]) {
                nextpc = ist.name[3] - 1;
            }
        }


        /*JUMP命令 */
        else if (iname == 39) {
            nextpc = ist.name[1] - 1;
        }

        else if (iname == 40) {
            push(&call_stack, (pc + 1));
            nextpc = ist.name[1] - 1;
        }

        else if (iname == 41) {
            nextpc = pop(&call_stack) - 1;
        }
        //命令が存在しなかった場合error parseでやっているのでいらない。
        //printf("ist = %d\n",iname);

        nextpc++;


        /*命令がラストの行まで行けば処理を終了する */
        if (nextpc >= program2->inst_count) {
            break;
        }
    }

    return 0;
}

int do_assemble(program * program)
{
    int pc = 0;
    int nextpc = 0;
    int stop = 0, j;
    char *iname;
    instruction ist;
    char *arg1, *arg2, *arg3;
    int count = 0;
    union umemory tmp;
    int a;
    while (1) {
        pc = nextpc;

        /*途中で操作を止める際のコード 
           print_register();
           printf("pc = %d\n",pc);
           if(stop>=100){exit(1);}else{stop++;}
         */
        ++count;
        ist = program->insts[pc];
        iname = ist.name[0];
        arg1 = ist.name[1];
        arg2 = ist.name[2];
        arg3 = ist.name[3];

        /*ALU命令 */
        if (strcmp(iname, "nop") == 0) {
        }

        else if (strcmp(iname, "add") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] +
                regist[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "sub") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] -
                regist[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "mul") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] *
                regist[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "and") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] &
                regist[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "or") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] |
                regist[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "nor") == 0) {
            regist[int_of_register(ist.name[1])] =
                ~(regist[int_of_register(ist.name[2])] |
                  regist[int_of_register(ist.name[3])]);

        }

        else if (strcmp(iname, "xor") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] ^
                regist[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "addi") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] + atoi(ist.name[3]);

        }

        else if (strcmp(iname, "subi") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] - atoi(ist.name[3]);

        }

        else if (strcmp(iname, "muli") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] * atoi(ist.name[3]);

        }

        else if (strcmp(iname, "andi") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] & atoi(ist.name[3]);

        }

        else if (strcmp(iname, "ori") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] | atoi(ist.name[3]);

        }

        else if (strcmp(iname, "nori") == 0) {
            regist[int_of_register(ist.name[1])] =
                ~(regist[int_of_register(ist.name[2])] |
                  atoi(ist.name[3]));

        }

        else if (strcmp(iname, "xori") == 0) {
            regist[int_of_register(ist.name[1])] =
                regist[int_of_register(ist.name[2])] ^ atoi(ist.name[3]);

        }


        /*FPU命令 */
        else if (strcmp(iname, "fadd") == 0) {
            freg[int_of_register(ist.name[1])] =
                freg[int_of_register(ist.name[2])] +
                freg[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "fsub") == 0) {
            freg[int_of_register(ist.name[1])] =
                freg[int_of_register(ist.name[2])] -
                freg[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "fmul") == 0) {
            freg[int_of_register(ist.name[1])] =
                freg[int_of_register(ist.name[2])] *
                freg[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "fdiv") == 0) {
            freg[int_of_register(ist.name[1])] =
                freg[int_of_register(ist.name[2])] /
                freg[int_of_register(ist.name[3])];

        }

        else if (strcmp(iname, "finv") == 0) {
            freg[int_of_register(ist.name[1])] =
                1 / freg[int_of_register(ist.name[2])];

        }

        else if (strcmp(iname, "fsqrt") == 0) {
            freg[int_of_register(ist.name[1])] =
                sqrt(freg[int_of_register(ist.name[2])]);

        }

        else if (strcmp(iname, "floor") == 0) {
            freg[int_of_register(ist.name[1])] =
                floor(freg[int_of_register(ist.name[2])]);

        }

        else if (strcmp(iname, "foi") == 0) {
            freg[int_of_register(ist.name[1])] =
                (float) (regist[int_of_register(ist.name[2])]);

        }




        /*MEM ACSESS命令 */
        else if (strcmp(iname, "load") == 0) {

            //memory_check
            if (check_memory
                (regist[int_of_register(ist.name[2])] +
                 atoi(ist.name[3])) == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                print_instruction(ist);
                exit(1);
            }

            regist[int_of_register(ist.name[1])] =
                memory[regist[int_of_register(ist.name[2])]
                       + atoi(ist.name[3])].i;


        }

        else if (strcmp(iname, "store") == 0) {
            //memory_check
            if (check_memory
                (regist[int_of_register(ist.name[2])] +
                 atoi(ist.name[3])) == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                print_instruction(ist);
                exit(1);
            }

            memory[regist[int_of_register(ist.name[2])] +
                   atoi(ist.name[3])].i =
                regist[int_of_register(ist.name[1])];


            if ((regist[int_of_register(ist.name[2])]
                 + atoi(ist.name[3])) == 6144) {
                //printf("store %d\n", regist[int_of_register(ist.name[1])]);
                //printf("at %d\n", pc);
            }
        }

        else if (strcmp(iname, "fload") == 0) {

            //memory_check
            if (check_memory
                (regist[int_of_register(ist.name[2])] +
                 atoi(ist.name[3])) == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                print_instruction(ist);
                exit(1);
            }


            freg[int_of_register(ist.name[1])] =
                memory[regist[int_of_register(ist.name[2])] +
                       atoi(ist.name[3])].d;

        }

        else if (strcmp(iname, "fstore") == 0) {

            //memory_check
            if (check_memory
                (regist[int_of_register(ist.name[2])] +
                 atoi(ist.name[3])) == ACSESS_BAD) {
                printf("Error:ACSESS_BAD :\n");
                print_instruction(ist);
                exit(1);
            }

            memory[regist[int_of_register(ist.name[2])] +
                   atoi(ist.name[3])].d =
                freg[int_of_register(ist.name[1])];

        }


        /*BRANCH命令 */
        else if (strcmp(iname, "beq") == 0) {
            if (regist[int_of_register(ist.name[1])] ==
                regist[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "bne") == 0) {
            if (regist[int_of_register(ist.name[1])] !=
                regist[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "bgt") == 0) {
            if (regist[int_of_register(ist.name[1])] >
                regist[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "blt") == 0) {
            if (regist[int_of_register(ist.name[1])] <
                regist[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "bge") == 0) {
            if (regist[int_of_register(ist.name[1])] >=
                regist[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "ble") == 0) {
            if (regist[int_of_register(ist.name[1])] <=
                regist[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        } else if (strcmp(iname, "fbeq") == 0) {
            if (freg[int_of_register(ist.name[1])] ==
                freg[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "fbne") == 0) {
            if (freg[int_of_register(ist.name[1])] !=
                freg[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "fbgt") == 0) {
            if (freg[int_of_register(ist.name[1])] >
                freg[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "fblt") == 0) {
            if (freg[int_of_register(ist.name[1])] <
                freg[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "fbge") == 0) {
            if (freg[int_of_register(ist.name[1])] >=
                freg[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }

        else if (strcmp(iname, "fble") == 0) {
            if (freg[int_of_register(ist.name[1])] <=
                freg[int_of_register(ist.name[2])]) {
                nextpc =
                    pc + label_trans_soutai(ist.name[3], program, pc) - 1;
            }

        }


        /*JUMP命令 */
        else if (strcmp(iname, "jump") == 0) {
            nextpc = label_trans(ist.name[1], program) - 1;

        }


        else if (strcmp(iname, "call") == 0) {
            push(&call_stack, (pc + 1));
            nextpc = label_trans(ist.name[1], program) - 1;

            if (nextpc == 1486) {
                printf("%s\n", ist.name[1]);
            }
            if (strcmp(ist.name[1], "min_caml_read_int") == 0) {
                a = memory[6144].i;
                printf("read_int1 %d\n", a);
                a = memory[a].i;
                printf("read_int2 %d\n", a);
            }
            if (strcmp(ist.name[1], "min_caml_print_int") == 0) {
                //printf("print_int %d\n", regist[4]);
            }
            if (strcmp(ist.name[1], "min_caml_print_float") == 0) {
            }
        }


        else if (strcmp(iname, "return") == 0) {
            nextpc = pop(&call_stack) - 1;

        }
        //命令が存在しなかった場合error
        else {
            printf("Error:this is iligal instruction!:%s\n",
                   program->insts[pc].name[0]);
            exit(1);
        }

        //printf("%d\n", regist[3]);

        nextpc++;

        printf("%d", pc);
        print_instruction(ist);
        //                                                                                                                                                                                                                                                             printf("%d\n", count);
        print_register();


        if (count > 817757) {
            for (j = 0; j < program->label_count; ++j) {
                if (program->labels[j]->index == pc) {
                    printf("%s:\n", program->labels[j]->name);
                }
            }

            printf("%d", pc);
            print_instruction(ist);
            //                                                                                                                                                                                                                                                             printf("%d\n", count);
            printf("%d\n", memory[4062].i);
            print_register();
        }
        /*命令がラストの行まで行けば処理を終了する */
        if (nextpc >= program->inst_count) {
            break;
        }

    }



    return 0;
}


int main(int argc, char *argv[])
{
    FILE *fp, *fp2;
    char buf[100000][100];      /*命令 読み込み用バッファ */
    char fpt[FPT_MAX_COUNT][20] = {
        0
    };
    int i = 0, j;
    //メモリ上の浮動小数点テーブルの位置
    int fpmemoffset = 0;
    program *answer;
    program2 *answer2;



    if (argc < 3) {
        fprintf(stderr, "<Useage>:%s assembler-file fp-table-file\n",
                argv[0]);
        return 1;
    }


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
                break;          /* 末尾まで完了したか、エラー発生で終了 */
            }
        }

        for (j = 0; j < i; ++j) {
            //エラーが起こっても関係ない
            //printf("%s\n", fpt[j]);
            memory[j + fpmemoffset].i = strtoll(fpt[j], NULL, 16);
        }
        print_memory();
    }

    i = 0;
    while (1) {
        if (fgets(buf[i], 81, fp) == NULL) {	/* １行読み込み */
            break;              /* 末尾まで完了したか、エラー発生で終了 */
        }
        i++;
    }


    answer = parse_all(buf, i);

    answer2 = parse_all2(answer);

    print_program(answer);


    //fprintf(stderr, "aa\n");
    do_assemble2(answer2);
    //fprintf(stderr, "aad\n");
    print_register();
    //fprintf(stderr, "aas\n");
    print_memory();

    fclose(fp);
    return 0;
}
