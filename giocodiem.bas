   1 REM Gioco.
   2 REM Di EMILIANO MATTIOLI
   3 REM ***********************
   4 CLS
  10 PRINT "Il gioco consiste nel prendere  i'*'.                           Te sei'\.'' e lasci una scia.     Se cozzi nella tua scia o tocchiun masso(\::) morirai.            Quando prendi un'*'la scia  cam=bia colore e non e'piu'pericolo=sa perche'puoi cozzare solo con=tro il tuo colore.              L'altro gioco invece consiste dievitare le stelle (+)."
  20 PRINT INK 2;"Adesso si incomincia!!!"
  21 PAUSE 0
  22 BORDER 7: PAPER 7: INK 0: CLS
  30 DIM b(22,31): LET color=1
  31 FOR i = 1 TO 22
  32 FOR j = 1 TO 31
  33 LET b(i,j) = 0
  34 NEXT j
  35 NEXT i
 100 RANDOMIZE
 140 FOR i=0 TO 21
 150 PRINT AT i,0; INK 2;"\::"; AT i,30;"\::"
 155 LET xbloc=RND*19+1: LET ybloc=RND*29+1: LET b(xbloc+1,ybloc+1)=10
 156 IF xbloc=10 AND ybloc=10 THEN GO TO 170
 160 PRINT AT xbloc,ybloc; INK 2;"\::"
 170 NEXT i
 210 FOR i=1 TO 30
 220 PRINT AT 0,i; INK 2;"\::";AT 21,i; INK 2;"\::"
 225 NEXT i
 226 LET psx=10: LET dir=5: LET score=0: LET psy=10
 227 GO SUB 9000
 235 PRINT AT psx,psy; INK color;"\'.": REM inizio ciclo gioco
 236 PAUSE 2
 240 IF b(psx+1,psy+1)=10 OR b(psx+1,psy+1)=color THEN GO TO 1060
 250 LET b(psx+1,psy+1)=color
 270 IF xo=psx AND yo=psy THEN GO SUB 9040
 275 IF psx=0 OR psx=21 OR psy=0 OR psy=30 THEN GO TO 1060
1000 LET a$=INKEY$
1010 IF a$="5" THEN LET dir=5
1020 IF a$="8" THEN LET dir=8
1030 IF a$="7" THEN LET dir=7
1040 IF a$="6" THEN LET dir=6
1045 PAUSE 3
1050 IF dir=5 THEN LET psy=psy-1
1051 IF dir=7 THEN LET psx=psx-1
1052 IF dir=6 THEN LET psx=psx+1
1053 IF dir=8 THEN LET psy=psy+1
1059 GO TO 235
1060 PRINT AT 0,0;"game over, punti "+STR$ (score): BEEP 0.1,-20
1070 PRINT "un'altra partita?(s/n)"
1080 PAUSE 0
1090 IF INKEY$="s" THEN GO TO 22
1100 IF INKEY$="n" THEN GO TO 2000
1110 GO TO 1080
2000 REM altro gioco
2010 INK 7: BORDER 0: PAPER 0: CLS : DIM c(23,31):LET score = 0
2012 FOR i = 1 TO 23
2013 FOR j = 1 TO 31
2014 LET c(i,j) = 0
2015 NEXT j
2016 NEXT i
2020 FOR n=1 TO 10
2030 LET xstella=INT (RND*22): LET ystella=INT (RND*30)
2035 IF xstella=10 AND ystella=10 THEN GO TO 2060
2040 PRINT AT xstella,ystella; INK INT (RND*7)+1;"+"
2050 LET c(xstella+1,ystella+1)=1
2060 NEXT n
2070 LET score=0: LET dir=5: LET psx=10: LET psy=10
2075 LET der=8: LET dir=7
2076 LET o$="\'."
2078 IF (der=5 AND dir=6) OR (der=8 AND dir=7) THEN LET o$="\.'"
2080 PRINT INK 2;AT psx,psy;o$
2090 IF c(psx+1,psy+1)=1 THEN GO TO 2250
2100 LET a$=INKEY$
2120 IF a$="6" AND psx < 20 THEN LET dir=6
2130 IF a$="7" AND psx > 1 THEN LET dir=7
2150 PAUSE 3
2155 PRINT AT psx,psy;" "
2160 IF der=5 THEN LET psy=psy-1
2170 IF dir=7 THEN LET psx=psx-1
2180 IF dir=6 THEN LET psx=psx+1
2190 IF der=8 THEN LET psy=psy+1
2191 IF psx=1 THEN LET dir=6
2192 IF psx=21 THEN LET dir=7
2193 IF psy=0 THEN LET der=8
2194 IF psy=30 THEN LET der=5
2195 IF psy=0 THEN BEEP 0.05,-10: LET score=score+1
2196 IF psy=0 THEN BORDER 6
2197 IF psy=30 THEN BEEP 0.05,0: LET score=score+1
2198 IF psy=30 THEN BORDER 1
2210 IF psy<>0 AND psy<>30 THEN GO TO 2076
2220 LET xstella=INT (RND*22): LET ystella=INT (RND*30)
2230 PRINT AT xstella,ystella; INK INT (RND*7)+1;"+": LET c(xstella+1,ystella+1)=1
2240 GO TO 2076
2250 PRINT AT 0,0;"game over, punti "+STR$ (score)
2255 PRINT "un'altra partita?(s/n)"
2260 BEEP 0.1,-20
2270 LET a$=INKEY$
2280 IF a$="s" THEN GO TO 2000
2290 IF a$="n" THEN GO TO 22
2300 PAUSE 0
2310 GO TO 2270
9000 LET xo=INT (RND*19+1): LET yo=INT (RND*29+1): REM subroutine crea asterischi
9010 IF b(xo+1,yo+1)=10 THEN GO TO 9000
9011 IF b(xo+1,yo+1)=color THEN GO TO 9000
9020 PRINT AT xo,yo;"*"
9030 RETURN
9040 LET score=score+1: REM subroutine punteggio
9050 BEEP 0.05,6
9060 LET color=color+1
9070 IF color=2 THEN LET color=3
9080 IF color=7 THEN LET color=1
9105 GO SUB 9000
9110 RETURN
