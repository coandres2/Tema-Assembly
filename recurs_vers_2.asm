section	.text
   global _start   
	_start:	
 		
   mov  rax,3      
   mov  rbx,0      
   mov  rcx, x     

top:  add  ebx, [ecx]

   add  rcx,1     
   dec  rax        
   jnz  top       

done: 

   add   rbx, '0'
   mov  [sum], ebx 
   
display:

   mov  rdx,1      
   mov  rcx, sum   
   mov  rbx, 1     
   mov  rax, 4     
   int  0x80; call kernel      
	
   mov  rax, 1    
   int  0x80       

section	.data
global x
x:     
   db  2
   db  4
   db  3

sum: 
   db  0