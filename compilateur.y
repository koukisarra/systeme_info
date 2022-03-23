%{
#include <stdlib.h>
#include <stdio.h>
%}


%union {int nb; char var; }
%token tEQ tMUL tSOUS tADD tDIV tUS
%token tOB tCB tOP tCP 
%token tINT tCHAR tVoid tCONST tNB tVar
%token tDOT tSC tComa
%token tWHILE tIF tRETURN tELSE tMAIN tPRINTF
%token tSUP tINF tSUPEQ tINFEQ  

%left tComa
%right tEQ tADD tSOUS tMUL tDIV 
%left tINF tSUP tINFEQ tSUPEQ
%start Program

%%

Program : main {printf ("main \n");} 
        ; 
main : tMAIN  {printf ("tMAIN \n");} tOP {printf ("tOP");} tCP {printf ("tCP");} tOB {printf ("tOB \n");} body tCB {printf ("tCB");}
     |  
     ; 
Vide:      ; 

Arg: Type tVar Args 
   |Vide 
   ; 
     
Args : tComa Arg 
     |Vide
     ;  
     
Type : tINT {printf ("int ");} 
     |tCHAR {printf ("char "); } 
     ; 
body : content 
     ;
content : ligne content 
        |ligne 
        ; 
ligne : Declaration 
      |Print 
      |Execution 

      ;
Declaration : Type tVar Variable tSC {printf ("Declaration \n");}
            ; 
Variable : tComa tVar Variable
         |Vide 
         ; 

Print : tPRINTF tOP tVar tCP tSC {printf ("tPrintf \n");}   
      ; 

Execution : tVar tEQ Value tSC {printf ("Execution \n");}
          ; 
Value : tNB {printf ("tNB \n");}
      | tVar {printf ("tVar \n");}
      | tOP Value tCP 
      | Expression 
      ; 
Expression : Value tADD Value {printf ("+");}
           | Value tSOUS Value {printf ("-");}
           | Value tMUL Value {printf ("*");}
           | Value tDIV Value {printf ("/");}
           ; 
;

%% 
void yyerror(char *s) { 
    printf(stderr,"%s\n",s); }
    
int main(void) { 
    yyparse();
    return 0; 
}         
            
            
       

        







