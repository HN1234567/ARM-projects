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
  MOV r1, r7
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data
  # Number input prompt
  numPrompt: .asciz "\nEnter a number: "
  # Number input type
  numInput: .asciz "%d"
  # Assign space for number
  numSpace: .word 0
  # Output string format
  resultString: .asciz "\n\nThe Fibonacci number is: %d\n\n"

# END main

.text
.global fibNum

fibNum:

  # Save return to OS on stack
  SUB sp, sp, #8
  STR lr, [sp, #0]
  STR r6, [sp, #4]
#  STR r7, [sp, #8]
#  STR r8, [sp, #12]

  # F(0) = 0
  CMP r6, #0
  MOVEQ r7, #0    
  BEQ fibReturn

  # F(1) = 1
  CMP r6, #1
  MOVEQ r7, #1    
  BEQ fibReturn

  # Calculate F(n-1)
  SUB r6, r6, #1
      LDR r0, =testOutput1
      MOV r1, r6
      MOV r2, r7
      MOV r3, r8
      BL printf  
  BL fibNum
      LDR r0, =testOutput2
      MOV r1, r6
      MOV r2, r7
      MOV r3, r8
  BL printf  
  # Save F(n-1)
  MOV r8, r7 

  # Calculate F(n-2)
  SUB r6, r6, #1
      LDR r0, =testOutput3
      MOV r1, r6
      MOV r2, r7
      MOV r3, r8
      BL printf    
  BL fibNum
      LDR r0, =testOutput4
      MOV r1, r6
      MOV r2, r7
      MOV r3, r8
      BL printf  

  # F(n) = F(n-1) + F(n-2)
  ADD r7, r7, r8  

  fibReturn:

  LDR lr, [sp, #0]
  LDR r6, [sp, #4]
#  LDR r7, [sp, #8]
#  LDR r8, [sp, #12]
  ADD sp, sp, #8
  MOV pc, lr

  
.data
  testOutput1: .asciz "\n(n-1) in:\nr6 is %d\nr7 is %d\nr8 is %d\n\n"
  testOutput2: .asciz "\n(n-1) out:\nr6 is %d\nr7 is %d\nr8 is %d\n\n"
  testOutput3: .asciz "\n(n-2) in:\nr6 is %d\nr7 is %d\nr8 is %d\n\n"
  testOutput4: .asciz "\n(n-2) out:\nr6 is %d\nr7 is %d\nr8 is %d\n\n"


#END fibNum

  
