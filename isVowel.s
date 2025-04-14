B   test_isvowel

tsv_vowel   DEFB    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

        ALIGN

;; Do not modify this test code here, insert your code at strcpy below...
test_isvowel
        MOV     R13,#0x10000

        ADRL    R4,tsv_vowel
        MOV     R5,#26
tsv_loop
        LDRB    R6, [R4],#1
        MOV     R0, R6
        SWI     0

        MOV     R0,#32
        SWI     0
        
        MOV     R0,R6
        BL      isVowel
        SWI     4

        MOV     R0,#10
        SWI     0
        SUB     R5,R5,#1
        CMP     R5,#0
        BGT     tsv_loop

        SWI     2


;; isVowel -- test whether character in R0 is a vowel or not
;; R0 <--- character
;; Returns in  R0: 1 if R0 contained a vowel, 0 otherwise

isVowel
    CMP R0, #'A'
    BEQ isVowelTRUE
    CMP R0, #'E'
    BEQ isVowelTRUE
    CMP R0, #'I'
    BEQ isVowelTRUE
    CMP R0, #'O'
    BEQ isVowelTRUE
    CMP R0, #'U'
    BEQ isVowelTRUE
    CMP R0, #'a'
    BEQ isVowelTRUE
    CMP R0, #'e'
    BEQ isVowelTRUE
    CMP R0, #'i'
    BEQ isVowelTRUE
    CMP R0, #'o'
    BEQ isVowelTRUE
    CMP R0, #'u'
    BEQ isVowelTRUE

    MOV R0, #0
    BX LR        

isVowelTRUE
    MOV R0, #1
    BX LR       
