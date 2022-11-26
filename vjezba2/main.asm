/*1.zadatak
.DEF cValue= R16
.DEF cResult = R17

ldi cValue , 12
cpi cValue , 10
brlt smaller //branch if less then

ldi cResult , 1
rjmp end

smaller : 
	ldi cResult , -1
end:
	nop

//2.zadatak
.DEF cLoBound = R16
.DEF cUpBound = R17
.DEF cResult = R18

  ldi cLoBound, 1
  ldi cUpBound, 11

  mov cResult, cLoBound

sumarize:
  add cResult, cLoBound
  inc cLoBound
  cp cLoBound, cUpBound
  breq end
  rjmp sumarize
end:
  nop
  

//3.zadatak
.include "m8def.inc"
.DEF global = R16
.DEF temp = R17
rjmp main

globalincrement: 
  inc global
ret

//globalincrement funkcija uvecava globalnu varijablu temp za 1

 

main:
  ldi temp, low(RAMEND) 
  out SPL, temp
  ldi temp, high(RAMEND)
  out SPH, temp
  ldi global, 29

//inicijalizacija stoga na kraj memorije

  rcall globalincrement
end:
  nop*/

//4.zadatak

.include "m8def.inc"

.DEF temp = R17
  rjmp main

globalincrement:
  pop R18
  pop R19

  pop temp
  inc temp
  push temp

  push R19
  push R18
ret

//spremanje adrese povratka
//dohvat argumenta
//inkrement
//stavljanje rezultata
//postavljanje rezultata
main:

  ldi temp, low(RAMEND) 
  out SPL, temp
  ldi temp, high(RAMEND)
  out SPH, temp

  ldi temp, 29

  push temp

 

//inicijalizacija stoga na kraj memorije

  rcall globalincrement
  pop temp

end:

  nop