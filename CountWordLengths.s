B   test_cwrdl

tcwrdl_string   DEFB    "THE CAT SAT ON THE MAT",0

        ALIGN

;; Do not modify this test code here, insert your code at strcpy below...
test_cwrdl
        MOV     R13,#0x10000

        ADRL    R0,tcwrdl_string
        SWI     3

        ADRL    R0,tcwrdl_string
        ADRL    R1,tcwrdl_array
        BL      CountWordLengths
        MOV     R3,R0
        MOV     R0,#10
        SWI     0

        MOV     R2,#0
        ADRL    R1,tcwrdl_array
        B       tcwrdl_cond
tcwrdl_loop
        LDR     R0, [R1, R2 LSL #2]
        SWI     4
        MOV     R0,#10
        SWI     0
        ADD     R2,R2,#1
tcwrdl_cond
        CMP     R2,R3
        BLT     tcwrdl_loop

        SWI     2


;; CountWordLengths -- fill in an array with the length of each word in the string
;; R0 <-- string
;; R1 <-- array to file
;; Returns: The number of words found in R0.

CountWordLengths
    MOV     R2, #0
    MOV     R3, #0
    MOV     R4, R0

loop_start
    LDRB    R5, [R4], #1
    CMP     R5, #0
    BEQ     loop_end

    CMP     R5, #32
    BEQ     space_found

    ADD     R2, R2, #1
    B       loop_start

space_found
    CMP     R2, #0
    BEQ     loop_start

    STR     R2, [R1, R3, LSL #2]
    ADD     R3, R3, #1
    MOV     R2, #0
    B       loop_start

loop_end
    CMP     R2, #0
    BEQ     return_word_count

    STR     R2, [R1, R3, LSL #2]
    ADD     R3, R3, #1

return_word_count
    MOV     R0, R3
    BX      LR

;; DO NOT REMOVE THIS LABEL
tcwrdl_array    DEFW    0
