#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#define name_size 20

#define fp_table_max_size 100

typedef struct{
  char name[name_size][6];
}instruction;

typedef struct{
  char name[100];
  int program_number;
}label;

typedef struct{
  instruction* instructions[10000];
  label* labels[1000];
  int label_size;
  int instruction_size;
}instruction_set;


/*スタックの実装*/
#define stack_max 1000

typedef struct tstack{
  int stack_size;
  int stack[stack_max];
}stack;


void push(stack* stack,int number){
  if(stack->stack_size >= stack_max){
    perror("stack is full\n");
    exit(1);
  }
  stack->stack[stack->stack_size] = number;
  (stack->stack_size)++;
  return;
}

int pop(stack* stack){
  if(stack->stack_size == 0){
    perror("stack is null");
    exit(1);
  }
  (stack->stack_size)--;
  return stack->stack[stack->stack_size];
}


/*1line_instructionのparse (入力は\nで終わっていることを前提とする。）*/
instruction *parse_one_line_instruction(char *str){
  int len = strlen(str);
  int i=0;
  int name_number=0;
  int name_now=0;
  instruction* answer = malloc(sizeof(instruction));
  int flag = 0;


  while(str[i] != '\n'){
    /*まずフラグが立っていない場合。最初のスペースは無視する*/
    while(flag == 0 && (str[i] == ' ' || str[i] == '\r' || str[i] == '\t')){
      i++;
    }

    if(str[i] == ' ' || str[i] == '\r' || str[i] == '\t'){
      answer->name[name_number][name_now] == '\0';
      name_number++;
      name_now = 0;
      flag = 0;
      i++;
    }
    else{
      answer->name[name_number][name_now] = str[i];
      name_now++;
      flag = 1;
      i++;
    }
  }
  answer->name[name_number][name_now] = '\0';
  name_number++;

  for(i=name_number;i<name_size;i++){
    answer->name[i][0] = '\0';
  }

  return answer;
}



void print_instruction(instruction* inst){
  printf("%s %s %s %s\n",inst->name[0],inst->name[1],inst->name[2],inst->name[3]);
  return;
}

void print_label(label* label){
  printf("%s => %d\n",label->name,label->program_number);
  return;
}


void print_instruction_set(instruction_set* instruction_set){
  int i;
  for(i=0;i<instruction_set-> instruction_size;i++){
    printf("%d ",i);
    print_instruction(instruction_set->instructions[i]);
  }

  printf("\n=== label ===\n");
  for(i=0;i< instruction_set-> label_size;i++){
    print_label(instruction_set -> labels[i]);
  }
  return;
}



instruction_set* parse_all(char buf[][100],int buf_size){
  int i,now=0;
  int pc=0;
  
  instruction_set * answer;

  answer = (instruction_set *)malloc(sizeof(instruction_set));
  answer -> label_size = 0;
  answer -> instruction_size = 0;

  
  for(i=0;i<buf_size;i++){
    /*colonが入っていればlabelそうでなければ、instruction*/
    if(strstr(buf[i],":") != NULL){
      /*labelのparse*/
      answer->labels[answer->label_size] = malloc(sizeof(label));
      now = 0;
      while(buf[i][now] != ' '){
        answer->labels[answer->label_size]->name[now] = buf[i][now];
        now ++;
      }
      answer->labels[answer->label_size]->name[now+1] = '\0';
      answer->labels[answer->label_size]->program_number = pc;
      answer->label_size = answer->label_size + 1;
    }else{
      /*instructionのparse*/
      answer->instructions[pc] = parse_one_line_instruction(buf[i]);
      answer -> instruction_size =   answer -> instruction_size + 1;;
      pc++;
    }
  }
  return answer;
}


/*CPU の設定*/
int regist[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
float dregist[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
stack call_stack = {0};/*call_stackのサイズを0で初期化*/

#define memory_size 1000000

union umemory{
  int i;
  float d;
};
union umemory memory[memory_size];



/*print系*/
print_memory(){
  int i;
  printf("===memory===\n");
  for(i=0;i<memory_size;i++){
    if(memory[i].i != 0)
      {
	printf("%d\t%d\t%f\n",i,memory[i].i,memory[i].d);
      }
  }
  return;
}


void print_register(){
  int i;
  printf("===register===\n");
  for(i=0;i<16;i++){
    if(regist[i] != 0)
      {
	printf("%d\t%d\n",i,regist[i]);
      }
  }
  printf("===fpregister===\n");
  for(i=0;i<16;i++){
    if(dregist[i] != 0.0)
      {
	printf("%d\t%f\n",i,dregist[i]);
      }
  }
  return;
}




/*レジスターの番号をcharからintに変換する*/
int int_of_register(char *regist){
  if(regist[0] == 'r' || regist[0] == 'f'){
    return atoi(regist+1);
  } 
  return -1;
}


int label_trans(char *label,instruction_set * instruction_set){
  int i;
  /*number*/
  if(label[0] == '-' ||label[0] == '0' || label[0] == '1' || label[0] == '2' || label[0] == '3' || label[0] == '4' || label[0] == '5' || label[0] == '6' || label[0] == '7' || label[0] == '8' || label[0] == '9'){
    return atoi(label);
  }
  /*label*/
  for(i=0;i<instruction_set->label_size;i++){
    if(strcmp(label,instruction_set->labels[i]->name) == 0){
      return instruction_set->labels[i]->program_number;
    }   
  }
  perror("label not found");
  return -1;
}


/*ラベルを相対アドレスに書き換える*/
int label_trans_soutai(char *label,instruction_set * instruction_set,int nowpc){
  int i;
  /*number*/
  if(label[0] == '-' || label[0] == '0' || label[0] == '1' || label[0] == '2' || label[0] == '3' || label[0] == '4' || label[0] == '5' || label[0] == '6' || label[0] == '7' || label[0] == '8' || label[0] == '9'){
    return atoi(label);
  }
  /*label*/
  for(i=0;i<instruction_set->label_size;i++){
    if(strcmp(label,instruction_set->labels[i]->name) == 0){
      return instruction_set->labels[i]->program_number - nowpc;
    }   
  }
  perror("label not found");
  return -1;
}



int do_assemble(instruction_set * instruction_set){
  int pc=0;
  int nextpc=0;
  int stop = 0;
  while(1){
    pc = nextpc;
    /*途中で操作を止める際のコード 
      print_register();
      printf("pc = %d\n",pc);
      if(stop>=100){exit(1);}else{stop++;}
    */
    
    /*ALU命令*/
    if(strcmp(instruction_set->instructions[pc]->name[0],"nop") == 0){}

    if(strcmp(instruction_set->instructions[pc]->name[0],"add") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] + regist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"sub") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] - regist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"mul") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] * regist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"and") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] & regist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"or") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] | regist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"nor") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = ~(regist[int_of_register(instruction_set->instructions[pc]->name[2])] | regist[int_of_register(instruction_set->instructions[pc]->name[3])]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"xor") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] ^ regist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"addi") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] + atoi(instruction_set->instructions[pc]->name[3]);
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"subi") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] - atoi(instruction_set->instructions[pc]->name[3]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"muli") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] * atoi(instruction_set->instructions[pc]->name[3]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"andi") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] & atoi(instruction_set->instructions[pc]->name[3]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"ori") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] | atoi(instruction_set->instructions[pc]->name[3]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"nori") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = ~(regist[int_of_register(instruction_set->instructions[pc]->name[2])] | atoi(instruction_set->instructions[pc]->name[3]));
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"xori") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = regist[int_of_register(instruction_set->instructions[pc]->name[2])] ^ atoi(instruction_set->instructions[pc]->name[3]);
    }


    /*FPU命令*/
    if(strcmp(instruction_set->instructions[pc]->name[0],"fadd") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = dregist[int_of_register(instruction_set->instructions[pc]->name[2])] + dregist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"fsub") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = dregist[int_of_register(instruction_set->instructions[pc]->name[2])] - dregist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fmul") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = dregist[int_of_register(instruction_set->instructions[pc]->name[2])] * dregist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fdiv") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = dregist[int_of_register(instruction_set->instructions[pc]->name[2])] / dregist[int_of_register(instruction_set->instructions[pc]->name[3])];
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"finv") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = 1 / dregist[int_of_register(instruction_set->instructions[pc]->name[2])];
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"fsqrt") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = sqrt(dregist[int_of_register(instruction_set->instructions[pc]->name[2])]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"floor") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = floor(dregist[int_of_register(instruction_set->instructions[pc]->name[2])]);
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"foi") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = (int)(dregist[int_of_register(instruction_set->instructions[pc]->name[2])]);
    }
    



    /*MEM ACSESS命令*/
    if(strcmp(instruction_set->instructions[pc]->name[0],"load") == 0){
      regist[int_of_register(instruction_set->instructions[pc]->name[1])] = memory[regist[int_of_register(instruction_set->instructions[pc]->name[2])] + atoi(instruction_set->instructions[pc]->name[3])].i;
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"store") == 0){
      memory[regist[int_of_register(instruction_set->instructions[pc]->name[2])] + atoi(instruction_set->instructions[pc]->name[3])].i = regist[int_of_register(instruction_set->instructions[pc]->name[1])];
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"fload") == 0){
      dregist[int_of_register(instruction_set->instructions[pc]->name[1])] = memory[regist[int_of_register(instruction_set->instructions[pc]->name[2])] + atoi(instruction_set->instructions[pc]->name[3])].d;
    }
    
    if(strcmp(instruction_set->instructions[pc]->name[0],"fstore") == 0){
      memory[regist[int_of_register(instruction_set->instructions[pc]->name[2])] + atoi(instruction_set->instructions[pc]->name[3])].d = dregist[int_of_register(instruction_set->instructions[pc]->name[1])];
    }
    

    /*BRANCH命令*/
    if(strcmp(instruction_set->instructions[pc]->name[0],"beq") == 0){
      if(regist[int_of_register(instruction_set->instructions[pc]->name[1])] == regist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"bne") == 0){
      if(regist[int_of_register(instruction_set->instructions[pc]->name[1])] != regist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"bgt") == 0){
      if(regist[int_of_register(instruction_set->instructions[pc]->name[1])] > regist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"blt") == 0){
      if(regist[int_of_register(instruction_set->instructions[pc]->name[1])] < regist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"bge") == 0){
      if(regist[int_of_register(instruction_set->instructions[pc]->name[1])] >= regist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"ble") == 0){
      if(regist[int_of_register(instruction_set->instructions[pc]->name[1])] <= regist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }
    if(strcmp(instruction_set->instructions[pc]->name[0],"fbeq") == 0){
      if(dregist[int_of_register(instruction_set->instructions[pc]->name[1])] == dregist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fbne") == 0){
      if(dregist[int_of_register(instruction_set->instructions[pc]->name[1])] != dregist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fbgt") == 0){
      if(dregist[int_of_register(instruction_set->instructions[pc]->name[1])] > dregist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fblt") == 0){
      if(dregist[int_of_register(instruction_set->instructions[pc]->name[1])] < dregist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fbge") == 0){
      if(dregist[int_of_register(instruction_set->instructions[pc]->name[1])] >= dregist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }

    if(strcmp(instruction_set->instructions[pc]->name[0],"fble") == 0){
      if(dregist[int_of_register(instruction_set->instructions[pc]->name[1])] <= dregist[int_of_register(instruction_set->instructions[pc]->name[2])]){
        nextpc = pc + label_trans_soutai(instruction_set->instructions[pc]->name[3],instruction_set,pc) -1;
      }
    }


    /*JUMP命令*/
    if(strcmp(instruction_set->instructions[pc]->name[0],"jump") == 0){
      nextpc = label_trans(instruction_set->instructions[pc]->name[1],instruction_set) - 1;
    }


    if(strcmp(instruction_set->instructions[pc]->name[0],"call") == 0){
      push(&call_stack,(pc+1));
      nextpc = label_trans(instruction_set->instructions[pc]->name[1],instruction_set) - 1;
    }
    

    if(strcmp(instruction_set->instructions[pc]->name[0],"return") == 0){
      nextpc = pop(&call_stack) - 1;    
    }


    nextpc++;
    
    printf("%d\n", nextpc);
    /*命令がラストの行まで行けば処理を終了する*/
    if(nextpc >= instruction_set->instruction_size){
      break;
    }

  }


  return 0;
}


int main(int argc,char * argv[])
{
  FILE *fp, *fp2;
  char buf[100000][100];  /*命令 読み込み用バッファ */
  char fpt[fp_table_max_size][20] = { 0 };
  int i = 0, j;
  //メモリ上の浮動小数点テーブルの位置
  int fpmemoffset = 0;
  instruction_set* answer;


  
  if(argc < 3){
    fprintf(stderr,"<Useage>:%s assembler-file fp-table-file\n",argv[0]);
    return 1;
  }
  

  /*assembler-file open and read*/
  fp = fopen( argv[1], "r" );
  if( fp == NULL )
    {
      printf( "%sが開けません\n",argv[1] );
      return 1;
    }

  if(argc > 2)
    {
      fp2 = fopen( argv[2], "r");
      if( fp2 == NULL )
	{
	  printf( "%sが開けません\n",argv[2] );
	  return 1;
	}
      for(i = 0; i < fp_table_max_size; ++i)
	{
	  if( fgets( fpt[i], 20, fp2 ) == NULL )   /* １行読み込み */
	    {
	      break;  /* 末尾まで完了したか、エラー発生で終了 */
	    }
	}
      
      for(j = 0; j < i; ++j)
	{
	  //エラーが起こっても関係ない
	  printf("%s\n", fpt[j]);
	  memory[j + fpmemoffset].i = strtol(fpt[j], NULL, 16);
	}
      print_memory();
    }


  while( 1 )
    {
      if( fgets( buf[i], 81, fp ) == NULL )   /* １行読み込み */
        {
          break;  /* 末尾まで完了したか、エラー発生で終了 */
        }
      i++;
    }


  answer = parse_all(buf,i);

  print_instruction_set(answer);



  //fprintf(stderr, "aa\n");
  do_assemble(answer);
  //fprintf(stderr, "aad\n");
  print_register();
  //fprintf(stderr, "aas\n");
  print_memory();

  fclose( fp );
  return 0;
}
