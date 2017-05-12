//////////////////////////////////////////////////////////////////////////////
// 128-bit multiprecision squaring                                          //
//                                                                          //
// Authors: Zhe Liu, Geovandro Pereira, Hwajeong Seo                        //
//////////////////////////////////////////////////////////////////////////////

NAME sqr128            ; module name
PUBLIC sqr128          ; make the main label vissible outside this module
RSEG CODE              ; place program in 'CODE' segment

; operand b: r21:r20
; operand a: r23:r22
; operand r: r25:r24  
  
  #define A0 R2
  #define A1 R3
  #define A2 R4
  #define A3 R5
  #define A4 R6
  #define A5 R7
  #define A6 R8
  #define A7 R9
  #define A8 R10
  #define A9 R11
  #define A10 R12
  #define A11 R13
  #define A12 R14
  #define A13 R15
  #define A14 R16
  #define A15 R17

  #define T0 R18
  #define T1 R19
  #define T2 R20
  #define T3 R21
  #define T4 R22
  #define T5 R23
  #define T6 R24   
  #define T7 R25   
  #define T8 R26
  #define T9 R27
  #define T10 R28
  #define ZERO R29

sqr128:
;  R4?R15 and R24?R29
	
  PUSH R4
  PUSH R5
  PUSH R6
  PUSH R7
  PUSH R8
  PUSH R9
  PUSH R10
  PUSH R11
  PUSH R12
  PUSH R13
  PUSH R14
  PUSH R15
  
  PUSH R24
  PUSH R25
  PUSH R26
  PUSH R27
  PUSH R28
  PUSH R29
	
  ;Y<-a
  MOVW R28, R16
  ;Z<-c
  MOVW R30, R18  

  LD A0, Y+
  LD A1, Y+
  LD A2, Y+
  LD A3, Y+

  LD A4, Y+
  LD A5, Y+
  LD A6, Y+
  LD A7, Y+

  LD A8, Y+
  LD A9, Y+
  LD A10, Y+
  LD A11, Y+

  LD A12, Y+
  LD A13, Y+
  LD A14, Y+
  LD A15, Y+
  

  CLR ZERO
  CLR T10
  MOVW T4, T10
  MOVW T6, T10
  MOVW T8, T10
  
  MUL A0, A1
  MOVW T0, R0

  MUL A0, A3
  MOVW T2, R0

  MUL A0, A2
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A1, A2
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  //
  MUL A0, A4
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A1, A3
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  //
  MUL A0, A5
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A1, A4
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A2, A3
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO
  
  //
  MUL A0, A6
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A1, A5
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A2, A4
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  //
  MUL A0, A7
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A1, A6
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A2, A5
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A3, A4
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO
  
  //
  MUL A0, A8
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A1, A7
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A2, A6
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A3, A5
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  //
  MUL A0, A9
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A1, A8
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A2, A7
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A3, A6
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A4, A5
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO
  
  //SHIFT
  LSL T0
  ROL T1
  ROL T2
  ROL T3

  ROL T4
  ROL T5
  ROL T6
  ROL T7

  ROL T8
  ROL T9
  ROL T10

  //
  MUL A0, A0  
  ST Z+, R0
  ADD T0, R1
  ADC T1, ZERO
  ADC T2, ZERO
  ADC T3, ZERO
  ADC T4, ZERO
  ADC T5, ZERO
  ADC T6, ZERO
  ADC T7, ZERO
  ADC T8, ZERO
  ADC T9, ZERO
  ADC T10, ZERO

  ST Z+, T0

  //
  MUL A1, A1
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO
  ADC T4, ZERO
  ADC T5, ZERO
  ADC T6, ZERO
  ADC T7, ZERO
  ADC T8, ZERO
  ADC T9, ZERO
  ADC T10, ZERO

  ST Z+, T1
  ST Z+, T2

  //
  MUL A2, A2  
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO
  ADC T6, ZERO
  ADC T7, ZERO
  ADC T8, ZERO
  ADC T9, ZERO
  ADC T10, ZERO

  ST Z+, T3
  ST Z+, T4

  //
  MUL A3, A3  
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO
  ADC T8, ZERO
  ADC T9, ZERO
  ADC T10, ZERO

  ST Z+, T5
  ST Z+, T6

  //
  MUL A4, A4    
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO
  ADC T10, ZERO

  ST Z+, T7
  ST Z+, T8

  PUSH T9
  PUSH T10

  //SECOND
  CLR T10
  MOVW T2, T10
  MOVW T4, T10
  MOVW T6, T10
  MOVW T8, T10


  //
  MUL A0, A10
  MOVW T0, R0

  MUL A1, A9
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A2, A8
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A3, A7
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A4, A6
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  //
  MUL A0, A11
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A1, A10
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A2, A9
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A3, A8
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A4, A7
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A5, A6
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  //
  MUL A0, A12
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A1, A11
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A2, A10
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A3, A9
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A4, A8
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A5, A7
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO
  
  //
  MUL A0, A13
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A1, A12
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A2, A11
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A3, A10
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A4, A9
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A5, A8
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A6, A7
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  //
  MUL A0, A14
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A1, A13
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A2, A12
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A3, A11
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A4, A10
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A5, A9
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A6, A8
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  //
  MUL A0, A15
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A1, A14
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A2, A13
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A3, A12
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A4, A11
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO
  
  MUL A5, A10
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO
  
  MUL A6, A9
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A7, A8
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

    //
  MUL A1, A15
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A2, A14
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A3, A13
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A4, A12
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO


  MUL A5, A11
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A6, A10
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A7, A9
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

    //
  MUL A2, A15
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A3, A14
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A4, A13
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A5, A12
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A6, A11
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A7, A10
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO
  
  MUL A8, A9
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

    //
  MUL A3, A15
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A4, A14
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A5, A13
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A6, A12
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A7, A11
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A8, A10
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  LSL T0
  ROL T1
  ROL T2
  ROL T3

  ROL T4
  ROL T5
  ROL T6
  ROL T7

  ROL T8
  ROL T9
  ROL T10


  POP A1
  POP A0

  ADD T0, A0
  ADC T1, A1
  ADC T2, ZERO
  ADC T3, ZERO
  ADC T4, ZERO
  ADC T5, ZERO
  ADC T6, ZERO
  ADC T7, ZERO
  ADC T8, ZERO
  ADC T9, ZERO
  ADC T10, ZERO


  CLR A0
  CLR A1
  MOVW A2, A0
  
  MUL A5, A5
  ADD T0, R0
  ADC T1, R1
  ADC A0, ZERO

  MUL A6, A6
  ADD T2, R0
  ADC T3, R1
  ADC A1, ZERO

  MUL A7, A7
  ADD T4, R0
  ADC T5, R1
  ADC A2, ZERO

  MUL A8, A8
  ADD T6, R0
  ADC T7, R1
  ADC A3, ZERO

  MUL A9, A9
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  ADD T2, A0
  ADC T3, ZERO
  ADC T4, A1
  ADC T5, ZERO
  ADC T6, A2
  ADC T7, ZERO  
  ADC T8, A3
  ADC T9, ZERO  
  ADC T10, ZERO  

  ST Z+, T0
  ST Z+, T1
  ST Z+, T2
  ST Z+, T3
  ST Z+, T4
  ST Z+, T5
  ST Z+, T6
  ST Z+, T7
  ST Z+, T8

  PUSH T9
  PUSH T10

  CLR T10
  MOVW T2, T10
  MOVW T4, T10
  MOVW T6, T10
  MOVW T8, T10
  MOVW A0, T10

  //
  MUL A4, A15
  MOVW T0, R0

  MUL A5, A14
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A6, A13
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A7, A12
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A8, A11
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  MUL A9, A10
  ADD T0, R0
  ADC T1, R1
  ADC T2, ZERO

  //
  MUL A5, A15
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A6, A14
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A7, A13
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A8, A12
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  MUL A9, A11
  ADD T1, R0
  ADC T2, R1
  ADC T3, ZERO

  //
  MUL A6, A15
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A7, A14
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A8, A13
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A9, A12
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO

  MUL A10, A11
  ADD T2, R0
  ADC T3, R1
  ADC T4, ZERO
  
  //
  MUL A7, A15
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A8, A14
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A9, A13
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  MUL A10, A12
  ADD T3, R0
  ADC T4, R1
  ADC T5, ZERO

  //
  MUL A8, A15
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A9, A14
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A10, A13
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  MUL A11, A12
  ADD T4, R0
  ADC T5, R1
  ADC T6, ZERO

  //
  MUL A9, A15
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A10, A14
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  MUL A11, A13
  ADD T5, R0
  ADC T6, R1
  ADC T7, ZERO

  //
  MUL A10, A15
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A11, A14
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO

  MUL A12, A13
  ADD T6, R0
  ADC T7, R1
  ADC T8, ZERO
  
  //
  MUL A11, A15
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  MUL A12, A14
  ADD T7, R0
  ADC T8, R1
  ADC T9, ZERO

  //
  MUL A12, A15
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  MUL A13, A14
  ADD T8, R0
  ADC T9, R1
  ADC T10, ZERO

  
  //
  MUL A13, A15
  ADD T9, R0
  ADC T10, R1
  ADC A0, ZERO

  //
  MUL A14, A15
  ADD T10, R0
  ADC A0, R1
  ADC A1, ZERO

  LSL T0
  ROL T1
  ROL T2
  ROL T3
  ROL T4
  ROL T5
  ROL T6
  ROL T7
  ROL T8
  ROL T9
  ROL T10
  ROL A0
  ROL A1


  POP A3
  POP A2

  ADD T0, A2
  ADC T1, A3
  ADC T2, ZERO
  ADC T3, ZERO
  ADC T4, ZERO
  ADC T5, ZERO
  ADC T6, ZERO
  ADC T7, ZERO
  ADC T8, ZERO
  ADC T9, ZERO
  ADC T10, ZERO
  ADC A0, ZERO
  ADC A1, ZERO  


  CLR A2
  CLR A3
  CLR A4
  CLR A5
  CLR A6


  ST Z+, T0


  MUL A10, A10
  ADD T1, R0
  ADC T2, R1
  ADC A2, ZERO

  MUL A11, A11
  ADD T3, R0
  ADC T4, R1
  ADC A3, ZERO

  MUL A12, A12
  ADD T5, R0
  ADC T6, R1
  ADC A4, ZERO

  MUL A13, A13
  ADD T7, R0
  ADC T8, R1
  ADC A5, ZERO

  MUL A14, A14
  ADD T9, R0
  ADC T10, R1
  ADC A6, ZERO

  MUL A15, A15
  ADD A0, R0
  ADC A1, R1

  
  ADD T3, A2
  ADC T4, ZERO
  ADC T5, A3
  ADC T6, ZERO
  ADC T7, A4
  ADC T8, ZERO
  ADC T9, A5
  ADC T10, ZERO
  ADC A0, A6
  ADC A1, ZERO

  ST Z+, T1
  ST Z+, T2
  ST Z+, T3
  ST Z+, T4
  ST Z+, T5
  ST Z+, T6
  ST Z+, T7
  ST Z+, T8
  ST Z+, T9
  ST Z+, T10
  ST Z+, A0
  ST Z+, A1

	POP R29
  POP R28
  POP R27
  POP R26
  POP R25
  POP R24  
  
  POP R15
  POP R14
  POP R13
  POP R12
  POP R11
  POP R10
  POP R9
  POP R8
  POP R7
  POP R6
  POP R5
  POP R4
  RET
  
END
