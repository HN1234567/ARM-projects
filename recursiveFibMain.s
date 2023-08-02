#
#  Fib(n) = if (n == 0 or n == 1) return 1
#    else return Fib(n-1) + Fib(n-2)


.text
.global main

main:

  # Save return to OS on stack.
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # Print prompt for number.
  LDR r0, =numPrompt
  BL printf

  # Scan for number
  LDR r0, =numInput
  LDR r1, =numSpace
  BL scanf

  # Save num in r6
  LDR r6, =numSpace
  LDR r6, [r6]

  # Calculate letter grade
  BL fibNum

  # Print grade result
  LDR r0, =resultString
  MOV r1, r6
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data
  # Number input prompt
  numPrompt: .asciz "Enter a number: \n"
  # Number input type
  numInput: .asciz "%d"
  # Assign space for number
  numSpace: .word 0
  # Output string format
  resultString: .asciz "The Fibonacci number is: %d\n\n"

# END main

.text
.global fibNum

fibNum:

  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  cmp r6, #0
  moveq r7, #0    @ F(0) = 0
  beq fibReturn

  cmp r6, #1
  moveq r7, #1    @ F(1) = 1
  beq fibReturn

  sub r6, r6, #1  @ Calculate F(n-1)
  bl fibNum

  mov r8, r7      @ Save F(n-1)

  sub r6, r6, #1  @ Calculate F(n-2)
  bl fibNum

  add r7, r7, r8  @ F(n) = F(n-1) + F(n-2)

  fibReturn:

  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data

#END gradeCalc

  
  
