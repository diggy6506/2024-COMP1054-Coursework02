B   test_strcpy

tsc_string  DEFB    "Hello World",0
tsc_dest    DEFB    "###########################",0
tsc_copied  DEFB    "Copied '",0
tsc_to      DEFB    "' to '",0
tsc_eol     DEFB    "'\n",0
        ALIGN

;; Do not modify this test code here, insert your code at strcpy below...
test_strcpy
        MOV     R13,#0x10000

        ADRL    R0,tsc_dest
        ADRL    R1,tsc_string
        BL      strcpy

        ADRL    R0,tsc_copied
        SWI     3

        ADRL    R0,tsc_string
        SWI     3

        ADRL    R0,tsc_to
        SWI     3

        ADRL    R0,tsc_dest
        SWI     3

        ADRL    R0,tsc_eol
        SWI     3

        SWI     2


;; strcpy -- copy the string at R1 to the address at R0
;; R0 <--- destination
;; R1 <--- source

strcpy
    PUSH    {R4, LR}

strcpy_loop
    LDRB    R2, [R1], #1
    STRB    R2, [R0], #1    
    CMP     R2, #0          
    BNE     strcpy_loop     

    POP     {R4, LR}       
    BX      LR
