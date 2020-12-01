;	CENG 329 HOMEWORK
;   Nadir Suhan ILTER 201611029
;
;
;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
;
;
;	CENG 329 HOMEWORK
;   Nadir Suhan ILTER 201611029

main:
			bis.b #BIT3, &P2DIR	; makes bits 1 of p2.3 BLUE
			bis.b #BIT3, &P1DIR ; makes bits 1 of p1.3 RED
			bis.b #BIT0, &P2DIR	; makes bits 1 of p2.0 YELLOW

			bic.b #BIT3, &P2DIR ; makes bits 0 of p2.3 BLUE
           	bic.b #BIT3, &P1DIR ; makes bits 0 of p1.3 RED
           	bic.b #BIT0, &P2DIR	; makes bits 0 of p2.0 YELLOW



			mov #0, R5 ; hold counter value for leds

blue:
			bis.b #BIT3, &P2DIR ; open led
			bic.b #BIT3, &P2DIR ; close led
			add #1, R5 ; update counter value
			cmp #5, R5 ; compare counter value with 5 for loop
			jne blue

			mov #0, R5 ; hold counter value for leds

red:
			bis.b #BIT3, &P1DIR ; open led
			bic.b #BIT3, &P1DIR ; close led
			add #1, R5 ; update counter value
			cmp #5, R5 ; compare counter value with 5 for loop
			jne red

			mov #0, R5 ; hold counter value for leds

yellow:
			bis.b #BIT0, &P2DIR ; open led
			bic.b #BIT0, &P2DIR ; close led
			add #1, R5 ; update counter value
			cmp #5, R5 ; compare counter value with 5 for loop
			jne yellow

			jmp main



;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
