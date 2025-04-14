B   test_insert

; You may want to try some of these different arrays to check your insertion sort really works
;tis_array  DEFW    2,6,4,6,2,1,1,3,2
;tis_array  DEFW    1,2,3,4,5,6,7,8,9
;tis_array  DEFW    9,8,7,6,5,4,3,2,1
tis_array   DEFW    9,2,1,4,3,6,5,8,7

        ALIGN

test_insert MOV             R13,#0x10000
        ADRL    R0,tis_array
        MOV     R1,#9
        BL      InsertionSort

        MOV     R2,#0
        MOV     R3,#9
        ADRL    R1,tis_array
        B       tis_cond
tis_loop
        LDR     R0, [R1, R2 LSL #2]
        SWI     4
        MOV     R0,#10
        SWI     0
        ADD     R2,R2,#1
tis_cond
        CMP     R2,R3
        BLT     tis_loop

        SWI     2


; InsertionSort -- should sort the array using the Insertion sort algorithm
; R0 -> array, R1 -> number of elems in array

; InsertionSort function to sort the array using the insertion sort algorithm
; R0 -> array address, R1 -> number of elements

InsertionSort
    MOV     r2, #1           

OuterLoop
    CMP     r2, r1                   
    BEQ     End                     

    MOV     r3, r2                    
    LDR     r4, [r0, r2, LSL #2]      

InnerLoop
    CMP     r3, #0                  
    BEQ     InsertElement              

    SUB     r5, r3, #1               
    LDR     r6, [r0, r5, LSL #2]     
    CMP     r6, r4                   
    BLE     InsertElement              

    STR     r6, [r0, r3, LSL #2]    
    SUB     r3, r3, #1               
    B       InnerLoop                 

InsertElement
    STR     r4, [r0, r3, LSL #2]      
    ADD     r2, r2, #1                
    B       OuterLoop                 

End
    BX      lr                        
