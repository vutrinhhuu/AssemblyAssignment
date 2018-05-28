.data
A: .word 7, -2, 5, 1, 5,6,7,3,6,8,8,59,5
Aend: .word

.text
main:	la $a0,A	#$a0 = Address(A[0])
	la $a1,Aend
	addi $a1,$a1,-4	#$a1 = Address(A[n-1])
	addi $t0,$a0,0	#t0 = Address(A[0])
	j sort		#sort
after_sort: 	li	$v0, 10	#exit
		syscall
end_main:
for1:
	add $t0,$t0,4	#i = i+1
	j sort
sort:	addi $t1,$a1,0 # $t1 = Address(A[n-1])
	beq $t0,$a1,done	#if i = n-1 -> done
	loop:
		beq $t1,$a0,for1 # if j = 0 -> for1
		add $t2,$t1,-4	# $t2 = Address(A[j-1])
		lw $t3,0($t1)	# $t3 = A[j]
		lw $t4,0($t2)	# $t4 = A[i-1]
		slt $t5,$t3,$t4	
		beq $t5,$zero,for2	# if A[j] > A[j-1] -> for2
		swap:	sw $t4,0($t1)	#swap A[j] and A[j-1]
			sw $t3,0($t2)
		for2:
		add $t1,$t1,-4	# j = j-1
		j loop

done:	j after_sort

