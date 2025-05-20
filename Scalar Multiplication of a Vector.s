;------------------------------------------------------------
; Scalar Multiplication of a Vector (DLX Assembly)
; Performs scalar multiplication of a 5-element vector by 3
;------------------------------------------------------------

        .data
vector: .word 1, 2, 3, 4, 5      ; Input vector starting at 0x00000100
result: .word 0, 0, 0, 0, 0      ; Output vector starting at 0x00000124

        .text
        .global main
main:
    ;--------------------------------------
    ; Initialize constants and base addresses
    addi r1, r0, 3           ; r1 = scalar multiplier = 3
    addi r2, r0, 0x100       ; r2 = base address of input vector
    addi r3, r0, 0x124       ; r3 = base address of result vector

    ;--------------------------------------
    ; Load vector elements into registers
    lw r4, 0(r2)             ; r4 = vector[0]
    lw r5, 4(r2)             ; r5 = vector[1]
    lw r6, 8(r2)             ; r6 = vector[2]
    lw r7, 12(r2)            ; r7 = vector[3]
    lw r8, 16(r2)            ; r8 = vector[4]

    ;--------------------------------------
    ; Multiply each element by scalar
    mult r4, r4, r1          ; r4 = vector[0] * 3
    mult r5, r5, r1          ; r5 = vector[1] * 3
    mult r6, r6, r1          ; r6 = vector[2] * 3
    mult r7, r7, r1          ; r7 = vector[3] * 3
    mult r8, r8, r1          ; r8 = vector[4] * 3

    ;--------------------------------------
    ; Store results back to memory
    sw 0(r3), r4             ; result[0] = r4
    sw 4(r3), r5             ; result[1] = r5
    sw 8(r3), r6             ; result[2] = r6
    sw 12(r3), r7            ; result[3] = r7
    sw 16(r3), r8            ; result[4] = r8

    ;--------------------------------------
    ; Terminate program
    trap 0                   ; End execution
