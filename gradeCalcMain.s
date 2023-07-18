#
# Implement a grading program as follows.  It should follow the proper style for assembly. 
# Prompt for a name and an average.
# If the average is <0 or >100,  print an error
# Else calculate a grade as 90-100 as A, 80-90 as B, 70-80 as C, else F.
# Print out the student's name and grade.
# r4:               r5: student name
# r6: grade         r7: >= 0 flag
# r8: <= 100 flag   r9:

.text
.global main

main:

  # Save return to OS on stack.
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # Print prompt for student name.
  LDR r0, =namePrompt
  BL printf

  # Scan for student name
  LDR r0, =nameInput
  LDR r1, =nameSpace
  BL scanf

  # Save name in r5
  LDR r5, =nameSpace
  LDR r5, [r5]

  # Print prompt for grade.
  LDR r0, =gradePrompt
  BL printf

  # Scan for grade in percent
  LDR r0, =gradeInput
  LDR r1, =gradeSpace
  BL scanf

  # Save grade in r6
  LDR r6, =gradeSpace
  LDR r6, [r6]

  # Calculate letter grade
  # BL gradeCalc

  # Print grade result
  LDR r0, =resultString
  MOV r1, r5
  MOV r2, r6
  BL printf

  # Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data
  # Name input prompt
  namePrompt: .asciz "Enter the student's name: \n"
  # Input type
  nameInput: .asciz "%s"
  # Assign space for name
  nameSpace: .space 40
  # Grade input prompt
  gradePrompt: .asciz "Enter grade received: \n"
  # Grade input type
  gradeInput: .asciz "%d"
  # Assign space for grade
  gradeSpace: .word 0
  # Output string format
  resultString: .asciz "%s received an %s.\n"

# END main

.text
.global gradeCalc

gradeCalc:

  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0]

  # Verify grade is greater than or equal to 0
  MOV r0, #0
  CMP r6, r0
  BLT else1
    LDR r0, =tooLow
    BL printf
    B endCheck
  else1:

  # Verify grade is less than or equal to 100
  MOV r0, #100
  CMP r6, r0
  BGT else2
    LDR r0, =tooHigh
    BL printf
    B endCheck
  else2:

  endCheck:

  # Check greater than 90
  MOV r0, #90
  CMP r6, r0
  BGE else3
    LDR r0, =printGrade
    LDR r1, =gradeA
    LDR r1, [r1, #0]
    BL printf
    B endGrade
  else3:

  # Check greater than 80
  MOV r0, #80
  CMP r6, r0
  BGE else4
    LDR r0, =printGrade
    LDR r1, =gradeB
    LDR r1, [r1, #0]
    BL printf
    B endGrade
  else4:

  # Check greater than 70
  MOV r0, #70
  CMP r6, r0
  BGE else5
    LDR r0, =printGrade
    LDR r1, =gradeC
    LDR r1, [r1, #0]
    BL printf
    B endGrade
  else5:
    
  # Check greater than 60
  MOV r0, #60
  CMP r6, r0
  BGE else6
    LDR r0, =printGrade
    LDR r1, =gradeD
    LDR r1, [r1, #0]
    BL printf
    B endGrade
  else6:
    
  endGrade:

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

  
  
