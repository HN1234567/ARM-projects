# 1. Write a program to find prime numbers from 3 to n in a loop by dividing the number n by all numbers from 2..n/2 in an inner loop. 
# Using the remainder (rem) operation, determine if n is divisible by any number.
# If n is divisible, leave the inner loop. If the limit of n/2 is reached and the inner loop has not been exited, the number 
# is prime and you should output the number. So if the user were to enter 25, your 
# program would print out "2, 3, 5, 7, 11, 13, 17, 19, 23".
# 
# 2. Write a program to prompt the user for a number, and determine if that number is prime. 
# Your program should print out "Number n is prime" if the number is prime, and "Number n is not prime if the number is not prime. 
# The user should be able to enter a "-1" to end the problem. It should print an error if 0, 1, 2 or any negative number other than -1 are entered.

# r4: number entered      r5: end condition
# r6: number of elements  r7: current divisor
# r8: modulo result

.text
.global main

main:

  #Save return to OS on stack.
  SUB sp, sp, #4
  STR lr, [sp, #0]

  #Print prompt for imput number to check prime
  MOV r0, =numPrompt
  BL printf

  #Scan for input number
  LDR r0, =numInput
  LDR r1, =numSpace
  BL scanf
  LDR r4, =numSpace
  LDR r4, [r4]

  # Initialize Loop
  MOV r5, #-1
  # Divide n by 2 to find number of elements to check

  # Start loop
  startLoop:
  CMP r4, r5
  BEQ endLoop
    
    # Loop block
    MOV r8, r4 MOD r7
    




  endLoop:

  #Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data

  numPrompt: .asciz "\nEnter a number to check primality: \n"
  numInput: .asciz "%d"
  numSpace: .word 0
  resultString: .asciz "%s received an %s.\n"

#END main
