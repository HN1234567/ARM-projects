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
  # BL fibNum

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

gradeCalc:

  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0]



  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data
  tooLow: .asciz "too low\n"
  tooHigh: .asciz "too hi\n"
  printGrade: .asciz "Grade is: %s\n"
  gradeA: .asciz "A"
  gradeB: .asciz "B"
  gradeC: .asciz "C"
  gradeD: .asciz "D"
  gradeF: .asciz "F"

#END gradeCalc

  
  
