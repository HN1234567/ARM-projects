#
# Implement a grading program as follows.  It should follow the proper style for assembly. 
# Prompt for a name and an average.
# If the average is <0 or >100,  print an error
# Else calculate a grade as 90-100 as A, 80-90 as B, 70-80 as C, else F.
# Print out the student's name and grade.

.text
.global main

main:

  #Save return to OS on stack.
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Print prompt for student name.
  MOV r0, =namePrompt
  BL printf

  #Scan for student name
  LDR r0, =nameInput
  LDR r1, =nameSpace
  BL scanf

  #Save name in r5
  LDR r1, [r1, #0]
  LDR r5, r1

  #Scan for grade name
  LDR r0, =gradeInput
  LDR r1, =gradeSpace
  scanf

  #Save grade in r6
  LDR r1, [r1, #0]
  LDR r6, r1

  #Calculate letter grade
  BL gradeCalc

  #Print grade result
  LDR r0, resultString
  LDR r1, r5
  LDR r2, r7
  BL printf

  #Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data

  namePrompt: .asciz "Enter the student's name: \n"
  nameInput: .asciz "%s"
  nameSpace: .space 40
  resultString: .asciz "%s received an %s.\n"

#END main

.text
.global gradeCalc

  

.data

#END gradeCalc

  
  
