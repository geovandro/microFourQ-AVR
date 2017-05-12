//////////////////////////////////////////////////////////////////////////////
// Fast Reduction: r = c mod p; Incomplete arithmetic [0, 2^128-1]          //
//                                                                          //
// Authors: Zhe Liu, Geovandro Pereira, Hwajeong Seo                        //
//////////////////////////////////////////////////////////////////////////////

NAME mod128            ; module name
PUBLIC mod128          ; make the main label vissible outside this module
RSEG CODE              ; place program in 'CODE' segment

#define B0 R8
#define B1 R9
#define B2 R10
#define B3 R11
#define B4 R12
#define B5 R13
#define B6 R14
#define B7 R15
#define B8 R16
#define B9 R17
#define B10 R18
#define B11 R19
#define B12 R20
#define B13 R21
#define B14 R22
#define B15 R23
#define T0 R24
#define T1 R25
//#define T2 R26
#define ZERO R25

mod128:
;  R4–R15 and R24–R29
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
  //PUSH R26
  //PUSH R27
  PUSH R28
  PUSH R29

  MOVW R28, R16 // Product C
  MOVW R30, R18 // R
  
  //CLR ZERO


  LDD T0, Y+15
  
  LDD B0, Y+16
  LDD B1, Y+17
  LDD B2, Y+18
  LDD B3, Y+19
  
  LDD B4, Y+20
  LDD B5, Y+21
  LDD B6, Y+22
  LDD B7, Y+23
  
  LDD B8, Y+24
  LDD B9, Y+25
  LDD B10, Y+26
  LDD B11, Y+27
  
  LDD B12, Y+28
  LDD B13, Y+29
  LDD B14, Y+30
  LDD B15, Y+31
  
  MOV T1, T0
  ANDI T0, 0X7F
  
  ADD T1, T1
  ADC B0, B0
  ADC B1, B1
  ADC B2, B2
  ADC B3, B3
  
  ADC B4, B4
  ADC B5, B5
  ADC B6, B6
  ADC B7, B7
  
  ADC B8, B8
  ADC B9, B9
  ADC B10, B10
  ADC B11, B11
  
  ADC B12, B12
  ADC B13, B13
  ADC B14, B14
  ADC B15, B15
  
  
  
  LD T1, Y+
  ADD B0, T1
  LD T1, Y+
  ADC B1, T1
  LD T1, Y+
  ADC B2, T1
  LD T1, Y+
  ADC B3, T1
  
  LD T1, Y+
  ADC B4, T1
  LD T1, Y+
  ADC B5, T1
  LD T1, Y+
  ADC B6, T1
  LD T1, Y+
  ADC B7, T1
  
  LD T1, Y+
  ADC B8, T1
  LD T1, Y+
  ADC B9, T1
  LD T1, Y+
  ADC B10, T1
  LD T1, Y+
  ADC B11, T1
  
  LD T1, Y+
  ADC B12, T1
  LD T1, Y+
  ADC B13, T1
  LD T1, Y+
  ADC B14, T1
  ADC B15, T0
  
  CLR ZERO
  
  MOV T0, B15
  ANDI B15, 0X7F
  ADC T0, T0
  
  ADC B0, ZERO
  ADC B1, ZERO
  ADC B2, ZERO
  ADC B3, ZERO
  
  ADC B4, ZERO
  ADC B5, ZERO
  ADC B6, ZERO
  ADC B7, ZERO
  
  ADC B8, ZERO
  ADC B9, ZERO
  ADC B10, ZERO
  ADC B11, ZERO
  
  ADC B12, ZERO
  ADC B13, ZERO
  ADC B14, ZERO
  ADC B15, ZERO
  
  
  //LD T1, Y+
  //ADC B15, T1
  
  
  
  
  
  
  ST Z+, B0
  ST Z+, B1
  ST Z+, B2
  ST Z+, B3

  ST Z+, B4
  ST Z+, B5
  ST Z+, B6
  ST Z+, B7

  ST Z+, B8
  ST Z+, B9
  ST Z+, B10
  ST Z+, B11

  ST Z+, B12
  ST Z+, B13
  ST Z+, B14
  ST Z+, B15

  
  ;  R4–R15 and R24–R29
  POP R29
  POP R28
  //POP R27
  //POP R26
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

  
  RET
END
