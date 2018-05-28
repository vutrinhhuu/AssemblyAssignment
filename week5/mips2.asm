.data
Message1:	.asciiz "Enter first number: "
Message2:	.asciiz "Enter sencond number: "
Part1: 		.asciiz "The sum of "
Part2:		.asciiz " and "
Part3:		.asciiz " is "
.text
li $v0, 51
la $a0, Message1	# HIen hop thoai nhap so
syscall
addi $s0, $a0, 0	# Luu gia tri nhap vao $s0

li $v0, 51
la $a0, Message2
syscall
addi $s1, $a0, 0	# Luu gia tri nhap vao $s1

add $s2, $s0, $s1 	# $s2 = $s0 + $s1

li $v0, 4		# in ra ket qua
la $a0, Part1
syscall

li $v0, 1
la $a0,($s0)
syscall

li $v0, 4
la $a0, Part2
syscall

li $v0, 1
la $a0,($s1)
syscall

li $v0, 4
la $a0, Part3
syscall

li $v0, 1
la $a0,($s2)
syscall