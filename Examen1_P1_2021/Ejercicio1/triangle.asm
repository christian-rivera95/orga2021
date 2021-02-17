;get user input
li $v0,5
syscall

move $t0,$v0

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


    print_outer_space:


    beq $t4,$t2,print_star

    ;print space

    li $a0,32
    li $v0,11
    syscall

    ;counter++
    addi $t4,$t4,1

    j print_outer_space


    print_star:

    beq $t6,$t1,end

    ;print star

    li $a0,42
    li $v0,11
    syscall

    addi $t6,$t6,1


    print_inner_space:

    li $t9,0

    beq $t7,$t9,end


    beq $t5,$t3,print_inner_space_end


    ;else print space

    li $a0,32
    li $v0,11
    syscall

    ;counter++
    addi $t5,$t5,1


    j print_inner_space

    print_inner_space_end:


    j print_star

end:


;const 1
li $t9,1


li $a0,10
li $v0,11
syscall

;counter++

addi $t7,$t7,1

addi $t2,$t2,-1

beq $t7,$t9,add_one


addi $t3,$t3,2

bne $t7,$t9,ignore



add_one:
addi $t3,$t3,1


;skip add_one

ignore:

slt $t8,$t9,$t7


bne $t8,$zero,if_end

;add star

addi $t1,$t1,1

if_end:


bne $t0,$t7,draw_triangle

last_line:

li $a0,42
li $v0,11
syscall

addi $t1, $t1, 1

bne $t1,$t0,last_line

li $a0,10
li $v0,11
syscall