
D [0-9]+

EXP [eE][+-]?{D}
REAL {D}("."{D})?{EXP}? 


%option noyywrap
 
%%
{D} printf("tINTEGER\n"); 
"=" printf("tEQ\n");
"*" printf("tMUL\n"); 
"-" printf("SOUS\n"); 
"{" printf("tOB\n");
"}" printf("tCB\n");
"+" printf("tADD\n"); 
";" printf("tSC\n"); 
">" printf("tSUP\n");
"<" printf("tINF\n");  
while printf("tWHILE"); 
if printf("tIF\n"); 
return printf("tRETURN\n");
else printf("tELSE\n"); 
const  printf("tCONST\n"); 
int  printf("tINT\n"); 
"main()"  printf("tMAIN\n");
"_"  printf("tUS\n"); 
"/"  printf("tDIV\n"); 
"("  printf("tOP\n");
")"  printf("tCP\n");
printf  printf("tPRINTF\n");
"."  printf("tDOT\n");
[\n]+  printf("tNL\n"); 
[" "]+ printf(" tSpace\n "); 
[\t]+  printf("tTAB\n");
[a-zA-Z][a-zA-Z0-9_]* printf("tVariable\n"); 

 

%% 

    int main() 
    { yylex(); 
    return 1; 
    }
