# 1. Write a program to find prime numbers from 3 to n in a loop by dividing the number n by all numbers from 2..n/2 in an inner loop. 
# Using the remainder (rem) operation, determine if n is divisible by any number.
# If n is divisible, leave the inner loop. If the limit of n/2 is reached and the inner loop has not been exited, the number 
# is prime and you should output the number. So if the user were to enter 25, your 
# program would print out "2, 3, 5, 7, 11, 13, 17, 19, 23".
# 
# 2. Write a program to prompt the user for a number, and determine if that number is prime. 
# Your program should print out "Number n is prime" if the number is prime, and "Number n is not prime if the number is not prime. 
# The user should be able to enter a "-1" to end the problem. It should print an error if 0, 1, 2 or any negative number other than -1 are entered.

# r4: number entered      r5: -1
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

  # Initialize conditions
  MOV r5, #-1
  MOV r9, #0
  # Divide n by 2 to find number of elements to check

  # Start loop
  startSentinelLoop:

  # Check if end loop condition entered, -1.
  CMP r4, r5
  BNE endSentinelLoop
    
    # Loop block
    # Find remainder of number and divisor, place in r8
    startForLoop:
    MOV r8, r4 MOD r7
    CMP r8, r9
    
    #Branch if composite
    BNE endForLoop
      LDR r0, =compositeResult
      BL printf
      B endSentinelLoop
      
    endForLoop:
    ADD r7, r7, #1
    B startForLoop
    
  endSentinelLoop:

  #Return to OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
  
.data

  compositeResult: .asciz "\nThe number is composite.\n
  numPrompt: .asciz "\nEnter a number to check primality: \n"
  numInput: .asciz "%d
  numSpace: .word 0
  resultString: .asciz "%s received an %s.\n"
  

#END main
