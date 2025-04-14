    B test_rmvwls
        
	trv_string  DEFB    "HELLO WORLD",0
    trv_becomes DEFB    "' becomes '",0
    trv_eol     DEFB    "'\n",0
     
	 ALIGN

;; Do not modify this test code here, insert your code at strcpy below...
test_rmvwls
        MOV     R13,#0x10000

        MOV     R0,#39
        SWI     0
        ADRL    R0,trv_string
        SWI     3

        ADRL    R0,trv_becomes
        SWI     3

        ADRL    R0,trv_string
        BL      RemoveVowels   

        ADRL    R0,trv_string
        SWI     3

        ADRL    R0,trv_eol
        SWI     3

        SWI     2


;; The line below copies your isVowel subroutine into this file automatically
;; IT IS NOT NECESSARY TO COPY THE SUBROUTINE MANUALLY
        include isVowel.s


;; RemoveVowels -- remove any vowels in the string at R0 using the isVowel subroutine to identify vowels
;; R0 <-- string

RemoveVowels
    PUSH {LR}        
    MOV R1, R0       
    MOV R2, R0        

Loop
    LDRB R3, [R1]     
    CMP R3, #0         
    BEQ Done

    MOV R0, R3         
    BL isVowel         
    CMP R0, #1         
    BEQ NextChar       

    STRB R3, [R2]      
    ADD R2, R2, #1     

NextChar
    ADD R1, R1, #1      
    B Loop

Done
    MOV R0, #0         
    STRB R0, [R2]     
    POP {PC}             



        









	
