#Laboratory 3, Home Assigment 2
.data
A: .word 0,1,2,3,4,5,6,7,8,9
.text
li $s1, 0 #i = 0
la $s2, A #A[0]
li $s3, 10 #n = 10
li $s4,	2 #step = 2
li $s5, 0 #sum = 0
loop:
add $s1,$s1,$s4	#i=i+step
add $t1,$s1,$s1	#t1=2*s1
add $t1,$t1,$t1	#t1=4*s1
add $t1,$t1,$s2	#t1 store the address of A[i]
lw $t0,0($t1)	#load value of A[i] in $t0
add $s5,$s5,$t0	#sum=sum+A[i]
bne $s1,$s3,loop	#if i != n, goto loop