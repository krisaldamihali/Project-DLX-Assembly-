;------------------------------------------------------
; Caesar Cipher Implementation in DLX Assembly
; Encrypts characters 'K' and 'M' using a Caesar shift of +3
;------------------------------------------------------

;------ Data Segment ------
        .data
; Store original characters in memory (ASCII codes)
char_K:     .byte 75          ; ASCII code for 'K'
            .align 4          ; Align to next word boundary for consistency
char_M:     .byte 77          ; ASCII code for 'M'
            .align 4          ; Align to next word boundary

; Reserve memory space for encrypted results
encrypted_K: .byte 0          ; Placeholder for encrypted 'K' (should be 'N' -> 78)
             .align 4         ; Align for word alignment
encrypted_M: .byte 0          ; Placeholder for encrypted 'M' (should be 'P' -> 80)
             .align 4         ; Align for word alignment

;------ Text Segment ------
        .text
        .global main
main:
        ; Load original character values into registers
        lb      r1, char_K        ; Load 'K' (ASCII 75) into register r1
        lb      r2, char_M        ; Load 'M' (ASCII 77) into register r2

        ; Apply Caesar shift (+3 positions forward in alphabet)
        addi    r3, r1, 3         ; r3 = 'K' + 3 => 'N' (ASCII 78)
        addi    r4, r2, 3         ; r4 = 'M' + 3 => 'P' (ASCII 80)

        ; Store the encrypted results in memory
        sb      encrypted_K, r3   ; Store 'N' into encrypted_K location
        sb      encrypted_M, r4   ; Store 'P' into encrypted_M location

        ; Terminate program
        trap    0                 ; Stop execution
