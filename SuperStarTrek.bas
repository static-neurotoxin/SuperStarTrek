      INSTALL @lib$+"STRINGLIB"
   10 REM SUPER STARTREK - MAY 16,1978 - REQUIRES 24K MEMORY
   30 REM
   40 REM ****        **** STAR TREK ****        ****
   50 REM **** SIMULATION OF A MISSION OF THE STARSHIP ENTERPRISE,
   60 REM **** AS SEEN ON THE STAR TREK TV SHOW.
   70 REM **** ORIGIONAL PROGRAM BY MIKE MAYFIELD, MODIFIED VERSION
   80 REM **** PUBLISHED IN DEC'S "101 BASIC GAMES", BY DAVE AHL.
   90 REM **** MODIFICATIONS TO THE LATTER (PLUS DEBUGGING) BY BOB
  100 REM *** LEEDOM - APRIL & DECEMBER 1974,
  110 REM *** WITH A LITTLE HELP FROM HIS FRIENDS . . .
  120 REM *** COMMENTS, EPITHETS, AND SUGGESTIONS SOLICITED --
  130 REM *** SEND TO:  R. C. LEEDOM
  140 REM ***           WESTINGHOUSE DEFENSE & ELECTRONICS SYSTEMS CNTR.
  150 REM ***           BOX 746, M.S. 338
  160 REM ***           BALTIMORE, MD  21203
  170 REM ***
  180 REM *** CONVERTED TO MICROSOFT 8 K BASIC 3/16/78 BY JOHN GORDERS
  190 REM *** LINE NUMBERS FROM VERSION STREK7 OF 1/12/75 PRESERVED AS
  200 REM *** MUCH AS POSSIBLE WHILE USING MULTIPLE STATEMENTS PER LINE
  205 REM *** SOME LINES ARE LONGER THAN 72 CHARACTERS; THIS WAS DONE
  210 REM *** BY USING "?" INSTEAD OF "PRINT" WHEN ENTERING LINES
  215 REM ***
      REM *** November, 2023 ported to BBC Basic and enhanced in a number of ways
      REM ***
      REM *** CHANGELOG
      REM     * Added whitespace
      REM         BBC Basic is far more capable than 8K Microsoft Basic, so many of
      REM         the memory saving techniques make assumptions, like 2 character
      REM         variable names and all whitespace is optional that creates
      REM         ambiguity when these assumptions are no longer applicable.
      REM
      REM         Running on a memory limited basic is not a goal of this port
      REM
      REM     * Convert confusing flow control structures to more modern ones
      REM         The original code only uses IF/THEN, GOTO, GOSUB and ON n GO[TO/SUB]
      REM
      REM         I am converting code to use IF/THEN/ELSE, Mulitline IF, CASE and
      REM         WHILE/ENDWHILE

      REM      * Remove Altair Basic TTY dead code

      REM
      REM     TODO
      REM      * Convert all code to one statement per line
      REM      * Rename variables to descriptive names
      REM      * Convert unnamed procedures (GOSUB/RETURN) to named procedures
      REM      * Eliminate GOTO
      REM      * Eliminate remaining line numbers
      REM      * Convert all text to mixed text

      REM     Possible Enhancements
      REM      * Coordinates are y, x in game. Convert them to x, y
      REM      * Remove Paramount™ intellectual property
      REM      * Persistant sector maps
      REM      * Add color
      REM      * Convert to menuing system
      REM      * Add additional adversaries
      REM      * Add neutral ships
      REM
      REM     Lee Morgan 11/12/23
      REM ***

  220 PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT : PRINT
  221 PRINT "                                    ,------*------,"
  222 PRINT "                    ,-------------   '---  ------'"
  223 PRINT "                     '-------- --'      / /"
  224 PRINT "                         ,---' '-------/ /--,"
  225 PRINT "                          '----------------'": PRINT
  226 PRINT "                    THE USS ENTERPRISE --- NCC-1701"
  227 PRINT : PRINT : PRINT : PRINT : PRINT

  270 Z$ = "                         "
  330 DIM G(8,8), C(9,2), K(3,3), N(3), Z(8,8), D(8)
  370 T = INT( RND(1) * 20 + 20) * 100
      T0 = T
      T9 = 25 + INT( RND(1) * 10)
      D0 = 0
      E = 3000
      E0 = E
  440 P = 10
      P0 = P
      S9 = 200
      S = 0
      Bases = 2
      Klingons = 0
      X$ = ""
      X0$ = " IS "
  470 DEFFND(D) = SQR((K(I, 1) - S1) ^ 2 + (K(I, 2) - S2) ^ 2)
  475 DEFFNR(R) = INT(RND(R) * 7.98 + 1.01)
  480 REM INITIALIZE ENTERPRIZE'S POSITION
  490 Q1 = FNR(1)
      Q2 = FNR(1)
      S1 = FNR(1)
      S2 = FNR(1)
  530 FOR I=1 TO 9
        C(I, 1) = 0
        C(I, 2) = 0
      NEXT I
  540 C(3, 1) = -1
      C(2, 1) = -1
      C(4, 1) = -1
      C(4, 2) = -1
      C(5, 2) = -1
      C(6, 2) = -1
  600 C(1, 2) = 1
      C(2, 2) = 1
      C(6, 1) = 1
      C(7, 1) = 1
      C(8, 1) = 1
      C(8, 2) = 1
      C(9, 2) = 1
  670 FOR I = 1 TO 8
        D(I) = 0
      NEXT I

  710 A1$ = "NAVSRSLRSPHATORSHEDAMCOMXXX"
  810 REM SETUP WHAT EXISTS IN GALAXY…
  815 REM LocalKlingons= # KLINGONS LocalBases= # STARBASES LocalStars = # STARS
  820 FOR I = 1 TO 8
        FOR J = 1 TO 8
          LocalKlingons = 0
          Z(I, J) = 0
          R1 = RND(1)
  850     IF R1 > .98 THEN LocalKlingons = 3 : Klingons = Klingons + 3 : GOTO 980
  860     IF R1 > .95 THEN LocalKlingons = 2 : Klingons = Klingons + 2 : GOTO 980
  870     IF R1 > .80 THEN LocalKlingons = 1 : Klingons = Klingons + 1
  980     LocalBases = 0
          IF RND(1) > .96 THEN LocalBases = 1 : Bases = Bases + 1
 1040     G(I, J) = LocalKlingons * 100 + LocalBases * 10 + FNR(1)
        NEXT J
      NEXT I
      IF Klingons > T9 THEN T9 = Klingons + 1
 1100 IF Bases <> 0 THEN 1200
 1150 IF G(Q1, Q2) < 200 THEN G(Q1, Q2) = G(Q1, Q2) + 120 : Klingons = Klingons + 1
 1160 Bases = 1
      G(Q1, Q2) = G(Q1, Q2) + 10
      Q1 = FNR(1)
      Q2 = FNR(1)
 1200 K7 = Klingons
      IF Bases <> 1 THEN X$ = "S" : X0$ = " ARE "
 1230 PRINT "YOUR ORDERS ARE AS FOLLOWS:"
 1240 PRINT "     DESTROY THE "; Klingons; " KLINGON WARSHIPS WHICH HAVE INVADED"
 1252 PRINT "  THE GALAXY BEFORE THEY CAN ATTACK FEDERATION HEADQUARTERS"
 1260 PRINT "  ON STARDATE "; T0+T9;" THIS GIVES YOU "; T9; " DAYS. THERE"; X0$
 1272 PRINT "  "; Bases; " STARBASE";X$;" IN THE GALAXY FOR RESUPPLYING YOUR SHIP"
 1280 PRINT
 1300 I = RND(1)
 1310 REM HERE ANY TIME NEW QUADRANT ENTERED
 1320 Z4 = Q1
      Z5 = Q2
      LocalKlingons = 0
      LocalBases = 0
      LocalStars = 0
      G5 = 0
      D4 = .5 * RND(1)
      Z(Q1, Q2) = G(Q1, Q2)
 1390 IF Q1 < 1 OR Q1 > 8 OR Q2 < 1 OR Q2 > 8 THEN 1600
 1430 GOSUB 9030
      PRINT
      IF T0 <> T THEN 1490
 1460 PRINT "YOUR MISSION BEGINS WITH YOUR STARSHIP LOCATED"
 1470 PRINT "IN THE GALACTIC QUADRANT, '";G2$;"'."
      GOTO 1500
 1490 PRINT "NOW ENTERING ";G2$;" QUADRANT . . ."
 1500 PRINT
      LocalKlingons = INT(G(Q1, Q2) * .01)
      LocalBases = INT(G(Q1, Q2) *.1) - 10 * LocalKlingons
 1540 LocalStars = G(Q1, Q2) - 100 * LocalKlingons - 10 * LocalBases
      IF LocalKlingons = 0 THEN 1590
 1560 PRINT "COMBAT AREA      CONDITION RED"
      IF S > 200 THEN 1590
 1580 PRINT "   SHIELDS DANGEROUSLY LOW"
 1590 FOR I = 1 TO 3
        K(I, 1) = 0
        K(I, 2) = 0
      NEXT I
 1600 FOR I = 1 TO 3
        K(I, 3) = 0
      NEXT I
      Q$ = Z$+Z$+Z$+Z$+Z$+Z$+Z$+LEFT$(Z$,17)
 1660 REM POSITION ENTERPRISE IN QUADRANT, THEN PLACE "LocalKlingons" KLINGONS, &
 1670 REM "LocalBases" STARBASES, & "LocalStars" STARS ELSEWHERE.
 1680 A$= "<*>"
      Z1 = S1
      Z2 = S2
      GOSUB 8670
      IF LocalKlingons < 1 THEN 1820
 1720 FOR I = 1 TO LocalKlingons
        GOSUB 8590
        A$="+K+"
        Z1 = R1
        Z2 = R2
 1780   GOSUB 8670
        K(I, 1) = R1
        K(I, 2) = R2
        K(I, 3) = S9 * (0.5 + RND(1))
      NEXT I
 1820 IF LocalBases < 1 THEN 1910
 1880 GOSUB 8590
      A$=">!<"
      Z1 = R1
      B4 = R1
      Z2 = R2
      B5 = R2
      GOSUB 8670
 1910 FOR I = 1 TO LocalStars
        GOSUB 8590
        A$=" * "
        Z1 = R1
        Z2 = R2
        GOSUB 8670
      NEXT I
 1980 GOSUB 6430
 1990 IF S + E > 10 THEN IF E > 10 OR D(7)=0 THEN 2060
 1999 REM BUGBUG: Don't die if you are out of energy, but docked.
 2020 PRINT
      PRINT "** FATAL ERROR **   YOU'VE JUST STRANDED YOUR SHIP IN "
 2030 PRINT "SPACE" : PRINT "YOU HAVE INSUFFICIENT MANEUVERING ENERGY,";
 2040 PRINT " AND SHIELD CONTROL" : PRINT "IS PRESENTLY INCAPABLE OF CROSS";
 2050 PRINT "-CIRCUITING TO ENGINE ROOM!!" : GOTO 6220
 2060 INPUT "COMMAND ";A$
      CASE FN_upper(LEFT$(A$, 3)) OF
        WHEN "NAV" : GOTO 2300
        WHEN "SRS" : GOTO 1980
        WHEN "LRS" : GOTO 4000
        WHEN "PHA" : GOTO 4260
        WHEN "TOR" : GOTO 4700
        WHEN "SHE" : GOTO 5530
        WHEN "DAM" : GOTO 5690
        WHEN "COM" : GOTO 7290
        WHEN "XXX" : GOTO 6270
        OTHERWISE
          PRINT "ENTER ONE OF THE FOLLOWING:"
          PRINT "  NAV  (TO SET COURSE)"
          PRINT "  SRS  (FOR SHORT RANGE SENSOR SCAN)"
          PRINT "  LRS  (FOR LONG RANGE SENSOR SCAN)"
          PRINT "  PHA  (TO FIRE PHASERS)"
          PRINT "  TOR  (TO FIRE PHOTON TORPEDOES)"
          PRINT "  SHE  (TO RAISE OR LOWER SHIELDS)"
          PRINT "  DAM  (FOR DAMAGE CONTROL REPORTS)"
          PRINT "  COM  (TO CALL ON LIBRARY-COMPUTER)"
          PRINT "  XXX  (TO RESIGN YOUR COMMAND)"
          PRINT
      ENDCASE
      GOTO 1990

 2290 REM COURSE CONTROL BEGINS HERE
 2300 INPUT "COURSE (0-9)"; C1
      IF C1 = 9 THEN C1 = 1
 2310 IF C1 >= 1 AND C1 < 9 THEN 2350
 2330 PRINT "   LT. SULU REPORTS, 'INCORRECT COURSE DATA, SIR!'"
      GOTO 1990
 2350 X$="8"
      IF D(1) < 0 THEN X$="0.2"
 2360 PRINT "WARP FACTOR (0-"; X$; ")";
      INPUT W1
      IF D(1) < 0 AND W1 > .2 THEN 2470
 2380 IF W1 > 0 AND W1 <= 8 THEN 2490
 2390 IF W1=0 THEN 1990
 2420 PRINT "   CHIEF ENGINEER SCOTT REPORTS 'THE ENGINES WON'T TAKE";
 2430 PRINT " WARP "; W1; "!'"
      GOTO 1990
 2470 PRINT "WARP ENGINES ARE DAMAGED. MAXIUM SPEED = WARP 0.2"
      GOTO 1990
 2490 N = INT(W1 * 8 + .5)
      IF E - N >= 0 THEN 2590
 2500 PRINT "ENGINEERING REPORTS: 'INSUFFICIENT ENERGY' AVAILABLE"
 2510 PRINT "                      FOR MANEUVERING AT WARP "; W1; "!'"
 2530 IF S < N - E OR D(7) < 0 THEN 1990
 2550 PRINT "DEFLECTOR CONTROL ROOM ACKNOWLEDGES "; S; " UNITS OF ENERGY"
 2560 PRINT "                      PRESENTLY DEPLOYED TO SHIELDS."
 2570 GOTO 1990
 2580 REM KLINGONS MOVE/FIRE ON MOVING STARSHIP…
 2590 FOR I = 1 TO LocalKlingons
        IF K(I, 3) = 0 THEN 2700
 2610   A$ = "   "
        Z1 = K(I, 1)
        Z2 = K(I, 2)
        GOSUB 8670
        GOSUB 8590
 2660   K(I, 1) = Z1
        K(I, 2) = Z2
        A$ = "+K+"
        GOSUB 8670
 2700 NEXT I
      GOSUB 6000
      D1 = 0
      D6 = W1
      IF W1 >= 1 THEN D6 = 1
 2770 FOR I = 1 TO 8
        IF D(I) >= 0 THEN 2880
 2790   D(I) = D(I) + D6
        IF D(I) > -.1 AND D(I) < 0 THEN D(I)=-.1: GOTO 2880
 2800   IF D(I) < 0 THEN 2880
 2810   IF D1 <> 1 THEN D1 = 1 : PRINT "DAMAGE CONTROL REPORT: ";
 2840   PRINT TAB(8);
        R1 = I
        GOSUB 8790
        PRINT G2$; " REPAIR COMPLETED."
 2880 NEXT I
      IF RND(1) > .2 THEN 3070
 2910 R1 = FNR(1)
      IF RND(1) >= .6 THEN 3000
 2930 D(R1) = D(R1) - (RND(1) * 5 + 1)
      PRINT "DAMAGE CONTROL REPORT: ";
 2960 GOSUB 8790
      PRINT G2$; " DAMAGED"
      PRINT
      GOTO 3070
 3000 D(R1) = D(R1) + RND(1) * 3 + 1
      PRINT "DAMAGE CONTROL REPORT: ";
 3030 GOSUB 8790
      PRINT G2$; " STATE OF REPAIR IMPROVED"
      PRINT

 3060 REM BEGIN MOVING STARSHIP
 3070 A$="   "
      Z1 = INT(S1)
      Z2 = INT(S2)
      GOSUB 8670
 3110 X1 = C(C1, 1) + (C(C1 + 1, 1) - C(C1, 1)) * (C1 - INT(C1))
      X = S1
      Y = S2
 3140 X2 = C(C1, 2) + (C(C1 + 1, 2) - C(C1, 2)) * (C1 - INT(C1))
      Q4 = Q1
      Q5 = Q2
 3170 FOR I=1 TO N
        S1 = S1 + X1
        S2 = S2 + X2
        IF S1 < 1 OR S1 >= 9 OR S2 < 1 OR S2 >= 9 THEN 3500
 3240   S8 = INT(S1) * 24 + INT(S2) * 3 - 26
        IF MID$(Q$, S8, 2) = "  " THEN 3360
 3320   S1 = INT(S1 - X1)
        S2 = INT(S2 - X2)
        PRINT "WARP ENGINES SHUT DOWN AT ";
 3350   PRINT "SECTOR "; S1; ", "; S2; " DUE TO BAD NAVAGATION"
        GOTO 3370
 3360 NEXT I
      S1 = INT(S1)
      S2 = INT(S2)
 3370 A$="<*>"
      Z1 = INT(S1)
      Z2 = INT(S2)
      GOSUB 8670
      GOSUB 3910
      T8 = 1
 3430 IF W1 < 1 THEN T8 = .1 * INT(10 * W1)
 3450 T = T + T8
      IF T > T0 + T9 THEN 6220
 3470 REM SEE IF DOCKED, THEN GET COMMAND
 3480 GOTO 1980
 3490 REM EXCEEDED QUADRANT LIMITS
 3500 X = 8 * Q1 + X + N * X1
      Y = 8 * Q2 + Y + N * X2
      Q1 = INT(X / 8)
      Q2 = INT(Y / 8)
      S1 = INT(X - Q1 * 8)
 3550 S2 = INT(Y - Q2 * 8)
      IF S1 = 0 THEN Q1 = Q1 - 1 : S1 = 8
 3590 IF S2 = 0 THEN Q2 = Q2 - 1 : S2 = 8
 3620 X5 = 0
      IF Q1 < 1 THEN X5 = 1 : Q1 = 1 : S1 = 1
 3670 IF Q1 > 8 THEN X5 = 1 : Q1 = 8 : S1 = 8
 3710 IF Q2 < 1 THEN X5 = 1 : Q2 = 1 : S2 = 1
 3750 IF Q2 > 8 THEN X5 = 1 : Q2 = 8 : S2 = 8
 3790 IF X5 = 0 THEN 3860
 3800 PRINT "LT. UHURA REPORTS MESSAGE FROM STARFLEET COMMAND:"
 3810 PRINT " 'PERMISSION TO ATTEMPT CROSSING OF GALACTIC PERIMETER"
 3820 PRINT "IS HEREBY *DENIED*. SHUT DOWN YOUR ENGINES.'"
 3830 PRINT "CHIEF ENGINEER SCOTT REPORTS 'WARP ENGINES SHUT DOWN"
 3840 PRINT "AT SECTOR ";S1;", ";S2;" OF QUADRANT ";Q1;", ";Q2;".'"
 3850 IF T > T0 + T9 THEN 6220
 3860 IF 8 * Q1 + Q2 = 8 * Q4 + Q5 THEN 3370
 3870 T = T + 1
      GOSUB 3910
      GOTO 1320

 3900 REM MANEUVER ENERGY S/R **
 3910 E = E - N - 10
      IF E >= 0 THEN RETURN
 3930 PRINT "SHIELD CONTROL SUPPLIES ENERGY TO COMPLETE THE MANEUVER."
 3940 S = S + E
      E = 0
      IF S <= 0 THEN S = 0
 3980 RETURN
 3990 REM LONG RANGE SENSOR SCAN CODE
 4000 IF D(3) < 0 THEN PRINT "LONG RANGE SENSORS ARE INOPERABLE": GOTO 1990
 4030 PRINT "LONG RANGE SCAN FOR QUADRANT "; Q1; ", "; Q2
 4040 O1$="-------------------"
      PRINT O1$
 4060 FOR I = Q1 - 1 TO Q1 + 1
        N(1) = -1
        N(2) = -2
        N(3) = -3
        FOR J = Q2 - 1 TO Q2 + 1
 4120     IF I > 0 AND I < 9 AND J > 0 AND J < 9 THEN N(J - Q2 + 2) = G(I, J) : Z(I, J) = G(I, J)
 4180   NEXT J
        FOR L = 1 TO 3
          PRINT ": ";
          IF N(L) < 0 THEN PRINT "*** "; : GOTO 4230
 4210     PRINT RIGHT$( STR$(N(L) + 1000), 3); " ";
 4230   NEXT L
        PRINT ":"
        PRINT O1$
      NEXT I
      GOTO 1990

 4250 REM PHASER CONTROL CODE BEGINS HERE
 4260 IF D(4) < 0 THEN PRINT "PHASERS INOPERATIVE": GOTO 1990
 4265 IF LocalKlingons > 0 THEN 4330
 4270 PRINT "SCIENCE OFFICER SPOCK REPORTS 'SENSORS SHOW NO ENEMY SHIPS"
 4280 PRINT "                               IN THIS QUADRANT'"
      GOTO 1990
 4330 IF D(8) < 0 THEN PRINT "COMPUTER FAILURE HAMPERS ACCURACY"
 4350 PRINT "PHASERS LOCKED ON TARGET; ";
 4360 PRINT "ENERGY AVAILABLE = "; E; " UNITS"
 4370 INPUT "NUMBER OF UNITS TO FIRE ";X
      IF X <= 0 THEN 1990
 4400 IF E - X < 0 THEN 4360
 4410 E = E - X
      IF D(7) < 0 THEN X = X * RND(1)
 4450 H1 = INT(X / LocalKlingons)
      FOR I = 1 TO 3
        IF K(I, 3) <= 0 THEN 4670
 4480   H = INT((H1 / FND(0)) * (RND(1) + 2))
        IF H > .15 * K(I, 3) THEN 4530
 4500   PRINT "SENSORS SHOW NO DAMAGE TO ENEMY AT "; K(I, 1); ", "; K(I, 2)
        GOTO 4670
 4530   K(I, 3) = K(I, 3) - H
        PRINT H; " UNIT HIT ON KLINGON AT SECTOR "; K(I, 1); ", ";
 4550   PRINT K(I, 2)
        IF K(I, 3) <= 0 THEN PRINT "*** KLINGON DESTROYED ***" : GOTO 4580
 4560   PRINT "(SENSORS SHOW "; K(I, 3); " UNITS REMAINING)"
        GOTO 4670
 4580   LocalKlingons = LocalKlingons - 1
        Klingons = Klingons - 1
        Z1 = K(I, 1)
        Z2 = K(I, 2)
        A$="   "
        GOSUB 8670
 4650   K(I, 3) = 0
        G(Q1, Q2) = G(Q1, Q2) - 100
        Z(Q1, Q2) = G(Q1, Q2)
        IF Klingons <= 0 THEN 6370
 4670 NEXT I
      GOSUB 6000
      GOTO 1990

 4690 REM PHOTON TORPEDO CODE BEGINS HERE
 4700 IF P <= 0 THEN PRINT "ALL PHOTON TORPEDOES EXPENDED" : GOTO 1990
 4730 IF D(5) < 0 THEN PRINT "PHOTON TUBES ARE NOT OPERATIONAL" : GOTO 1990
 4760 INPUT "PHOTON TORPEDO COURSE (1-9) ";C1
      IF C1 = 9 THEN C1 = 1
 4780 IF C1 >= 1 AND C1 < 9 THEN 4850
 4790 PRINT "ENSIGN CHEKOV REPORTS, 'INCORRECT COURSE DATA, SIR!'"
 4800 GOTO 1990
 4850 X1 = C(C1, 1) + (C(C1 + 1, 1) - C(C1, 1)) * (C1 - INT(C1))
      E = E - 2
      P = P - 1
 4860 X2 = C(C1, 2) + (C(C1 + 1, 2) - C(C1, 2)) * (C1 - INT(C1))
      X = S1
      Y = S2
 4910 PRINT "TORPEDO TRACK:"
 4920 X = X + X1
      Y = Y + X2
      X3 = INT(X + .5)
      Y3 = INT(Y + .5)
 4960 IF X3 < 1 OR X3 > 8 OR Y3 < 1 OR Y3 > 8 THEN 5490
 5000 PRINT "               "; X3; ", "; Y3
      A$="   "
      Z1 = X
      Z2 = Y
      GOSUB 8830
 5050 IF Z3 <> 0 THEN 4920
 5060 A$ = "+K+"
      Z1 = X
      Z2 = Y
      GOSUB 8830
      IF Z3 = 0 THEN 5210
 5110 PRINT "*** KLINGON DESTROYED ***"
      LocalKlingons = LocalKlingons - 1
      Klingons = Klingons - 1
      IF Klingons <= 0 THEN 6370
 5150 FOR I = 1 TO 3
        IF X3 = K(I, 1) AND Y3 = K(I, 2) THEN 5190
 5180 NEXT I
      I = 3
 5190 K(I, 3) = 0
      GOTO 5430
 5210 A$ = " * "
      Z1 = X
      Z2 = Y
      GOSUB 8830
      IF Z3 = 0 THEN 5280
 5260 PRINT "STAR AT"; X3; ", "; Y3; " ABSORBED TORPEDO ENERGY."
      GOSUB 6000
      GOTO 1990
 5280 A$ = ">!<"
      Z1 = X
      Z2 = Y
      GOSUB 8830
      IF Z3 = 0 THEN 4760
 5330 PRINT "*** STARBASE DESTROYED ***"
      LocalBases = LocalBases - 1
      Bases = Bases - 1
 5360 IF Bases > 0 OR Klingons > T - T0 - T9 THEN 5400
 5370 PRINT "THAT DOES IT, CAPTAIN!! YOU ARE HEREBY RELIEVED OF COMMAND"
 5380 PRINT "AND SENTENCED TO 99 STARDATES AT HARD LABOR ON CYGNUS 12!!"
 5390 GOTO 6270
 5400 PRINT "STARFLEET COMMAND REVIEWING YOUR RECORD TO CONSIDER"
 5410 PRINT "COURT MARTIAL!"
      D0 = 0
 5430 Z1 = X
      Z2 = Y
      A$="   "
      GOSUB 8670
 5470 G(Q1, Q2) = LocalKlingons * 100 + LocalBases * 10 + LocalStars
      Z(Q1, Q2) = G(Q1, Q2)
      GOSUB 6000
      GOTO 1990
 5490 PRINT "TORPEDO MISSED"
      GOSUB 6000
      GOTO 1990

 5520 REM SHIELD CONTROL
 5530 IF D(7) < 0 THEN PRINT "SHIELD CONTROL INOPERABLE" : GOTO 1990
 5560 PRINT "ENERGY AVAILABLE = "; E + S;
      INPUT " NUMBER OF UNITS TO SHIELDS"; X
 5580 IF X < 0 OR S=X THEN PRINT "<SHIELDS UNCHANGED>" : GOTO 1990
 5590 IF X <= E + S THEN 5630
 5600 PRINT "SHIELD CONTROL REPORTS 'THIS IS NOT THE FEDERATION TREASURY.'"
 5610 PRINT "<SHIELDS UNCHANGED>"
      GOTO 1990
 5630 E = E + S - X
      S = X
      PRINT "DEFLECTOR CONTROL ROOM REPORT:"
 5660 PRINT " 'SHIELDS NOW AT "; INT(S); " UNITS PER YOUR COMMAND.'"
      GOTO 1990

 5680 REM DAMAGE CONTROL
 5690 IF D(6) >= 0 THEN 5910
 5700 PRINT "DAMAGE CONTROL REPORT NOT AVAILABLE"
      IF D0 = 0 THEN 1990
 5720 D3 = 0
      FOR I = 1 TO 8
        IF D(I) < 0 THEN D3 = D3 + .1
 5760 NEXT I
      IF D3 = 0 THEN 1990
 5780 PRINT
      D3 = D3 + D4
      IF D3 >= 1 THEN D3 = .9
 5810 PRINT "TECHNICIANS STANDING BY TO EFFECT REPAIRS TO YOUR SHIP;"
 5820 PRINT "ESTIMATED TIME TO REPAIR: "; .01 * INT(100 * D3); " STARDATES"
 5840 INPUT "WILL YOU AUTHORIZE THE REPAIR ORDER (Y/N) ";A$
 5860 IF A$ <> "Y" THEN 1990
 5870 FOR I = 1 TO 8
        IF D(I) < 0 THEN D(I) = 0
 5890 NEXT I
      T = T + D3 + .1
 5910 PRINT
      PRINT "DEVICE             STATE OF REPAIR"
      FOR R1 = 1 TO 8
 5920   GOSUB 8790
        PRINT G2$; LEFT$(Z$, 25 - LEN(G2$)); INT(D(R1) * 100) * .01
 5950 NEXT R1
      PRINT
      IF D0 <> 0 THEN 5720
 5980 GOTO 1990

 5990 REM KLINGONS SHOOTING
 6000 IF LocalKlingons <= 0 THEN RETURN
 6010 IF D0 <> 0 THEN PRINT "STARBASE SHIELDS PROTECT THE ENTERPRISE" : RETURN
 6040 FOR I = 1 TO 3
        IF K(I, 3) <= 0 THEN 6200
 6060   H = INT((K(I, 3) / FND(1)) * (2 + RND(1)))
        S = S - H
        K(I, 3) = K(I, 3) / (3 + RND(0))
 6080   PRINT H; " UNIT HIT ON ENTERPRISE FROM SECTOR "; K(I, 1); ", "; K(I, 2)
 6090   IF S <= 0 THEN 6240
 6100   PRINT "      <SHIELDS DOWN TO "; S; " UNITS>"
        IF H < 20 THEN 6200
 6120   IF RND(1) > .6 OR H / S <= .02 THEN 6200
 6140   R1 = FNR(1)
        D(R1) = D(R1) - H / S - .5 * RND(1)
        GOSUB 8790
 6170   PRINT "DAMAGE CONTROL REPORTS "; G2$; " DAMAGED BY THE HIT'"
 6200 NEXT I
      RETURN
 6210 REM END OF GAME
 6220 PRINT "IT IS STARDATE "; T
      GOTO 6270
 6240 PRINT
      PRINT "THE ENTERPRISE HAS BEEN DESTROYED. THEN FEDERATION ";
 6250 PRINT "WILL BE CONQUERED"
      GOTO 6220
 6270 PRINT "THERE WERE "; Klingons; " KLINGON BATTLE CRUISERS LEFT AT"
 6280 PRINT "THE END OF YOUR MISSION."
 6290 PRINT
      PRINT
      IF Bases = 0 THEN 6360
 6310 PRINT "THE FEDERATION IS IN NEED OF A NEW STARSHIP COMMANDER"
 6320 PRINT "FOR A SIMILAR MISSION -- IF THERE IS A VOLUNTEER,"
 6330 INPUT "LET HIM STEP FORWARD AND ENTER 'AYE' "; A$
      IF A$ = "AYE" THEN 10
 6360 END

 6370 PRINT "CONGRULATION, CAPTAIN! THEN LAST KLINGON BATTLE CRUISER"
 6380 PRINT "MENACING THE FDERATION HAS BEEN DESTROYED."
      PRINT
 6400 PRINT "YOUR EFFICIENCY RATING IS "; 1000 * (K7 / (T - T0)) ^ 2
      GOTO 6290

 6420 REM SHORT RANGE SENSOR SCAN & STARTUP SUBROUTINE
 6430 FOR I = S1 - 1 TO S1 + 1
        FOR J = S2 - 1 TO S2 + 1
 6450     IF INT(I + .5) < 1 OR INT(I + .5) > 8 OR INT(J + .5) < 1 OR INT(J + .5) > 8 THEN 6540
 6490     A$=">!<"
          Z1 = I
          Z2 = J
          GOSUB 8830
          IF Z3 = 1 THEN 6580
 6540   NEXT J
      NEXT I
      D0 = 0
      GOTO 6650
 6580 D0 = 1
      C$ = "DOCKED"
      E = E0
      P = P0
 6620 PRINT "SHIELDS DROPPED FOR DOCKING PURPOSES"
      S = 0
      GOTO 6720
 6650 IF LocalKlingons > 0 THEN C$="*RED*" : GOTO 6720
 6660 C$ = "GREEN"
      IF E < E0 * .1 THEN C$ = "YELLOW"
 6720 IF D(2) >= 0 THEN 6770
 6730 PRINT
      PRINT "*** SHORT RANGE SENSORS ARE OUT ***"
      PRINT
      RETURN
 6770 O1$ = "---------------------------------"
      PRINT O1$
      FOR I = 1 TO 8
 6820   FOR J = (I - 1) * 24 + 1 TO (I - 1) * 24 + 22 STEP 3
          PRINT " "; MID$(Q$, J, 3);
        NEXT J
        CASE I OF
          WHEN 1: PRINT "        STARDATE           "; INT(T * 10) * .1
          WHEN 2: PRINT "        CONDITION          "; C$
          WHEN 3: PRINT "        QUADRANT           "; Q1; ", "; Q2
          WHEN 4: PRINT "        SECTOR             "; S1; ", "; S2
          WHEN 5: PRINT "        PHOTON TORPEDOES   "; INT(P)
          WHEN 6: PRINT "        TOTAL ENERGY       "; INT(E+S)
          WHEN 7: PRINT "        SHIELDS            "; INT(S)
          WHEN 8: PRINT "        KLINGONS REMAINING "; INT(Klingons)
        ENDCASE
 7260 NEXT I
      PRINT O1$
      RETURN

 7280 REM LIBRARY COMPUTER CODE
 7290 IF D(8) < 0 THEN PRINT "COMPUTER DISABLED" : GOTO 1990
 7320 INPUT "COMPUTER ACTIVE AND AWAITING COMMAND: "; A
      IF A < 0 THEN 1990
 7350 PRINT
      H8 = 1
      CASE A OF
        WHEN 0: GOTO 7530
        WHEN 1: GOTO 7900
        WHEN 2: GOTO 8070
        WHEN 3: GOTO 8500
        WHEN 4: GOTO 8150
        WHEN 5: GOTO 7400
        OTHERWISE
          PRINT "FUNCTIONS AVAILABLE FROM LIBRARY-COMPUTER:"
          PRINT "   0 = CUMULATIVE GALACTIC RECORD"
          PRINT "   1 = STATUS REPORT"
          PRINT "   2 = PHOTON TORPEDO DATA"
          PRINT "   3 = STARBASE NAV DATA"
          PRINT "   4 = DIRECTION/DISTANCE CALCULATOR"
          PRINT "   5 = GALAXY 'REGION NAME' MAP"
          PRINT
      ENDCASE
      GOTO 7320

 7390 REM SETUP TO CHANGE CUMULATIVE GALACTIC RECORD TO GALAXY MAP
 7400 H8 = 0
      G5 = 1
      PRINT "                        THE GALAXY"
      GOTO 7550

 7530 REM CUMULATIVE GALACTIC RECORD
 7543 PRINT
      PRINT "        ";
 7544 PRINT "COMPUTER RECORD OF GALAXY FOR QUADRANT "; Q1; ", "; Q2
 7546 PRINT
 7550 PRINT "       1     2     3     4     5     6     7     8"
 7560 O1$ = "     ----- ----- ----- ----- ----- ----- ----- -----"
 7570 PRINT O1$
      FOR I = 1 TO 8
        PRINT STR$(I); "  ";
        IF H8 = 0 THEN 7740
 7630   FOR J = 1 TO 8
          PRINT "   ";
          IF Z(I, J) = 0 THEN PRINT "***"; : GOTO 7720
 7700     PRINT RIGHT$( STR$(Z(I, J) + 1000), 3);
 7720   NEXT J
        GOTO 7850
 7740   Z4 = I
        Z5 = 1
        GOSUB 9030
        J0 = INT(15 - .5 * LEN(G2$))
        PRINT TAB(J0); G2$;

 7800   Z5 = 5
        GOSUB 9030
        J0 = INT(39 - .5 * LEN(G2$))
        PRINT TAB(J0); G2$;
 7850   PRINT
        PRINT O1$
      NEXT I
      PRINT
      GOTO 1990

 7890 REM STATUS REPORT
 7900 PRINT "   STATUS REPORT:"
      X$=""
      IF Klingons > 1 THEN X$="S"
 7940 PRINT "KLINGON"; X$; " LEFT: "; Klingons
 7960 PRINT "MISSION MUST BE COMPLETED IN "; .1 * INT((T0 + T9 - T) * 10); " STARDATES"
 7970 X$ = "S"
      IF Bases < 2 THEN X$=""
      IF Bases < 1 THEN 8010
 7980 PRINT "THE FEDERATION IS MAINTAINING "; Bases; " STARBASE"; X$; " IN THE GALAXY"
 7990 GOTO 5690
 8010 PRINT "YOUR STUPIDITY HAS LEFT YOU ON YOUR ON IN"
 8020 PRINT " THE GALAXY -- YOU HAVE NO STARBASES LEFT!"
      GOTO 5690

 8060 REM TORPEDO, BASE NAV, D/D CALCULATOR
 8070 IF LocalKlingons <= 0 THEN 4270
 8080 X$ = ""
      IF LocalKlingons > 1 THEN X$ = "S"
 8090 PRINT "FROM ENTERPRISE TO KLINGON BATTLE CRUSER"; X$
 8100 H8 = 0
      FOR I = 1 TO 3
        IF K(I, 3) <= 0 THEN 8480
 8110   W1 = K(I, 1)
        X = K(I, 2)
 8120   C1 = S1
        A = S2
        GOTO 8220
 8150   PRINT "DIRECTION/DISTANCE CALCULATOR:"
 8160   PRINT "YOU ARE AT QUADRANT "; Q1; ", "; Q2; " SECTOR "; S1; ", "; S2
 8170   PRINT "PLEASE ENTER"
        INPUT "  INITIAL COORDINATES (X,Y)"; C1, A
 8200   INPUT "  FINAL COORDINATES (X,Y)"; W1, X
 8220   X = X - A
        A = C1 - W1
        IF X < 0 THEN 8350
 8250   IF A < 0 THEN 8410
 8260   IF X > 0 THEN 8280
 8270   IF A = 0 THEN C1 = 5 : GOTO 8290
 8280   C1 = 1
 8290   IF ABS(A) <= ABS(X) THEN 8330
 8310   PRINT "DIRECTION = "; C1 + (((ABS(A) - ABS(X)) + ABS(A)) / ABS(A))
        GOTO 8460
 8330   PRINT "DIRECTION = "; C1 + (ABS(A) / ABS(X)) : GOTO 8460
 8350   IF A > 0 THEN C1 = 3 : GOTO 8420
 8360   IF X <> 0 THEN C1 = 5 : GOTO 8290
 8410   C1 = 7
 8420   IF ABS(A) >= ABS(X) THEN 8450
 8430   PRINT "DIRECTION = "; C1 + (((ABS(X) - ABS(A)) + ABS(X)) / ABS(X))
        GOTO 8460
 8450   PRINT "DIRECTION = "; C1 + (ABS(X) / ABS(A))
 8460   PRINT "DISTANCE = "; SQR(X ^ 2 + A ^ 2)
        IF H8 = 1 THEN 1990
 8480 NEXT I
      GOTO 1990

 8500 IF LocalBases <> 0 THEN PRINT "FROM ENTERPRISE TO STARBASE:" : W1 = B4 : X = B5 : GOTO 8120
 8510 PRINT "MR. SPOCK REPORTS, 'SENSORS SHOW NO STARBASES IN THIS";
 8520 PRINT " QUADRANT.'"
      GOTO 1990
 8580 REM FIND EMPTY PLACE IN QUADRANT (FOR THINGS)
 8590 R1 = FNR(1)
      R2 = FNR(1)
      A$="   "
      Z1 = R1
      Z2 = R2
      GOSUB 8830
      IF Z3 = 0 THEN 8590
 8600 RETURN

 8660 REM INSERT IN STRING ARRAY FOR QUADRANT
 8670 S8 = INT(Z2 - .5) * 3 + INT(Z1 - .5) * 24 + 1
 8675 IF LEN(A$) <> 3 THEN PRINT "ERROR" : STOP
 8680 IF S8 = 1 THEN Q$ = A$ + RIGHT$(Q$, 189) : RETURN
 8690 IF S8 = 190 THEN Q$ = LEFT$(Q$, 189) + A$ : RETURN
 8700 Q$ = LEFT$(Q$, S8 - 1) + A$ + RIGHT$(Q$, 190 - S8)
      RETURN

 8780 REM PRINT S DEVICE NAME
      REM BUGBUG Convert this to an array
 8790 CASE R1 OF
        WHEN 1: G2$ = "WARP ENGINES"
        WHEN 2: G2$ = "SHORT RANGE SENSORS"
        WHEN 3: G2$ = "LONG RANGE SENSORS"
        WHEN 4: G2$ = "PHASER CONTROL"
        WHEN 5: G2$ = "PHOTON TUBES"
        WHEN 6: G2$ = "DAMAGE CONTROL"
        WHEN 7: G2$ = "SHIELD CONTROL"
        WHEN 8: G2$ = "LIBRARY-COMPUTER"
      ENDCASE
      RETURN
 8820 REM STRING COMPARISON IN QUADRANT ARRAY
 8830 Z1 = INT(Z1 + .5)
      Z2 = INT(Z2 + .5)
      S8 = (Z2 - 1) * 3 + (Z1 - 1) * 24 + 1
      Z3 = 0
 8890 IF MID$(Q$, S8, 3) <> A$ THEN RETURN
 8900 Z3 = 1
      RETURN

 9010 REM QUADRANT NAME IN G2$ FROM Z4,Z5 (=Q1,Q2)
 9020 REM CALL WITH G5=1 TO GET REGION NAME ONLY
 9030 IF Z5 <= 4 THEN
        CASE Z4 OF
          WHEN 1: G2$ = "ANTARES"
          WHEN 2: G2$ = "RIGEL"
          WHEN 3: G2$ = "PROCYON"
          WHEN 4: G2$ = "VEGA"
          WHEN 5: G2$ = "CANOPUS"
          WHEN 6: G2$ = "ALTAIR"
          WHEN 7: G2$ = "SAGITTARIUS"
          WHEN 8: G2$ = "POLLUX"
        ENDCASE
      ELSE
        CASE Z4 OF
          WHEN 1: G2$ = "SIRIUS"
          WHEN 2: G2$ = "DENEB"
          WHEN 3: G2$ = "CAPELLA"
          WHEN 4: G2$ = "BETELGEUSE"
          WHEN 5: G2$ = "ALDEBARAN"
          WHEN 6: G2$ = "REGULUS"
          WHEN 7: G2$ = "ARCTURUS"
          WHEN 8: G2$ = "SPICA"
        ENDCASE
      ENDIF
      IF G5 <> 1 THEN
        CASE Z5 OF
          WHEN 1,5: G2$ = G2$ + " I"
          WHEN 2,6: G2$ = G2$ + " II"
          WHEN 3,7: G2$ = G2$ + " III"
          WHEN 4,8: G2$ = G2$ + " IV"
        ENDCASE
      ENDIF
      RETURN
