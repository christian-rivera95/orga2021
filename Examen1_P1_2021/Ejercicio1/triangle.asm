.global draw_triangle
;get user input
li $v0,5
syscall

move $t0,$a0

;stars per iteration
li $t1,1

;outer spaces
move $t2,$v0
addi $t2,$t2,-1

;inner spaces
addi $t3,$t3, 0

;initialize level
addi $t7,$t7, 0


draw_triangle:

    li $t4,0
    li $t5,0
    li $t6,0


    printOuterSpace:


    beq $t4,$t2,printStar

    ;print space

    li $s0,32
    li $v0,11
    syscall

    
    addi $t4,$t4,1

    j printOuterSpace


    printStar:

    beq $t6,$t1,end

    ;print star

    li $s0,42
    li $v0,11
    syscall

    addi $t6,$t6,1


    print_inner_space:

    li $t9,0

    beq $t7,$t9,end


    beq $t5,$t3,print_inner_space_end


    ;else print space

    li $s0,32
    li $v0,11
    syscall

    
    addi $t5,$t5,1


    j print_inner_space

    print_inner_space_end:


    j printStar

end:


;const 1
li $t9,1


li $s0,10
li $v0,11
syscall



addi $t7,$t7,1

addi $t2,$t2,-1

beq $t7,$t9,addOne


addi $t3,$t3,2

bne $t7,$t9,ignore



addOne:
addi $t3,$t3,1


;skip addOne

ignore:

slt $t8,$t9,$t7


bne $t8,$zero,if_end

;add star

addi $t1,$t1,1

if_end:


bne $t0,$t7,draw_triangle

lastLine:

li $a0,42
li $v0,11
syscall

addi $t1, $t1, 1

bne $t1,$t0,lastLine

li $a0,10
li $v0,11
syscall
