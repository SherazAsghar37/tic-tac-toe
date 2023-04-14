;Variable Printing Macro
printVarSP macro arg
mov dl," "
mov ah,2
int 21h
mov dl,arg
; add dl,48
mov ah,2
int 21h
endm
;AfterPressing
UniCheck1 macro index,repeat,nextCheck
cmp index,'O'
JE nextCheck
jmp repeat
endm

WinCheckUser macro
cmp ind1,"O"
je Ucompare1
cmp ind2,"O"
je jumphelper2
cmp ind3,"O"
je jumphelper3
cmp ind7,'O'
je jumphelper4
cmp ind4,'O'
je jumphelper5
jmp CompWin
jumphelper2:
    jmp Ucompare2
jumphelper3:
    jmp Ucompare3
jumphelper4:
    jmp Ucompare4
jumphelper5:
    jmp Ucompare5
Ucompare1:
    ComparerUser ind2,ind3,jump1,End1,endzy1
    ComparerUser ind4,ind7,Jump2,End2,endzy2
    ComparerUser ind5,ind9,Jump3,End3,endzy3
    cmp ind2,"O"
    je jump1helper2
    cmp ind3,"O"
    je jump1helper3
    cmp ind7,'O'
    je jump1helper4
    cmp ind4,'O'
    je jump1helper5
    jmp CompWin
    jump1helper2:
        jmp Ucompare2
    jump1helper3:
        jmp Ucompare3
    jump1helper4:
        jmp Ucompare4
    jump1helper5:
        jmp Ucompare5
Ucompare2:
    ComparerUser ind5,ind8,Jump4,End4,endzy4
    cmp ind3,"O"
    je Ucompare3
    cmp ind7,'O'
    je jump1helper4
    cmp ind4,'O'
    je jump1helper5
    jmp CompWin
Ucompare3:
    ComparerUser ind6,ind9,Jump5,End5,endzy5
    ComparerUser ind5,ind7,Jump6,End6,endzy6
    cmp ind7,'O'
    je Ucompare4
    cmp ind4,'O'
    je Ucompare5
    jmp CompWin
Ucompare4:
    ComparerUser ind8,ind9,Jump7,End7,endzy7
    cmp ind4,'O'
    je Ucompare5
    jmp CompWin
Ucompare5:
    ComparerUser ind5,ind6,Jump8,End8,endzy8
    jmp CompWin
endm
ComparerUser macro second,third,jumpingCond,EndingCond,endzy
cmp second,'O'
je jumpingCond
jmp endzy
jumpingCond:
    cmp third,'O'
    je EndingCond
    jmp endzy
EndingCond:
    lea dx,youwon
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
endzy:
endm
WinCompCheck macro 
cmp ind1,"X"
je compare1
cmp ind2,"X"
je jumpinghelper2
cmp ind3,'X'
je jumpinghelper3
cmp ind7,'X'
je jumpinghelper4
cmp ind4,"X"
je jumpinghelper5
jmp endingStage
jumpinghelper2:
    jmp compare2
jumpinghelper3:
    jmp compare3
jumpinghelper4:
    jmp compare4
jumpinghelper5:
    jmp compare5
compare1:
    ComparerComp ind2,ind3,jumper1,ender1,endz1
    ComparerComp ind4,ind7,jumper2,ender2,endz2
    ComparerComp ind5,ind9,jumper3,ender3,endz3
    cmp ind2,"X"
    je jumping1helper2
    cmp ind3,"X"
    je jumping1helper3
    cmp ind7,'X'
    je jumping1helper4
    cmp ind4,'X'
    je jumping1helper5
    jmp endingStage
    jumping1helper2:
        jmp compare2
    jumping1helper3:
        jmp compare3
    jumping1helper4:
        jmp compare4
    jumping1helper5:
        jmp compare5
compare2:
    ComparerComp ind5,ind8,jumper4,ender4,endz4
    cmp ind3,"X"
    je jumping1helper3
    cmp ind7,'X'
    je jumping1helper4
    cmp ind4,'X'
    je jumping1helper5
    jmp endingStage
compare3:
    ComparerComp ind6,ind9,jumper5,ender5,endz5
    ComparerComp ind5,ind7,jumper6,ender6,endz6
    cmp ind7,'X'
    je compare4
    cmp ind4,'X'
    je compare5
    jmp endingStage
compare4:
    ComparerComp ind8,ind9,jumper7,ender7,endz7
    cmp ind4,'X'
    je compare5
    jmp endingStage
compare5:
    ComparerComp ind5,ind6,jumper8,ender8,endz8
    jmp endingStage
endm
ComparerComp macro second,third,jname,endname,endz
cmp second,'X'
je jname
jmp endz
jname:
    cmp third,'X'
    je endname
    jmp endz
endname:
    lea dx,compwon
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
endz:
endm

intelligence macro
cmp ind1,'_'
jne answerJumper
cmp ind2,'_'
jne answerJumper1
cmp ind3,'_'
jne answerJumper2
cmp ind4,'_'
jne answerJumper3
cmp ind6,'_'
jne answerJumper4
cmp ind7,'_'
jne answerJumper5
cmp ind8,'_'
jne answerJumper6
cmp ind9,"_"
jne answerJumper7
jmp RandComparison
answerJumper:
    jmp answer1
answerJumper1:
    jmp answer2
answerJumper2:
    jmp answer3
answerJumper3:
    jmp answer4
answerJumper4:
    jmp answer5
answerJumper5:
    jmp answer6
answerJumper6:
    jmp answer7
answerJumper7:
    jmp answer8
answer1:
    MoreComparison ind1,ind2,ind3,CheckForEmpty1,EndIt1,'3',setRand1
    MoreComparison ind1,ind4,ind7,CheckForEmpty2,EndIt2,'7',setRand2
    MoreComparison ind1,ind5,ind9,CheckForEmpty3,EndIt3,'9',setRand3
    MoreComparison ind1,ind7,ind4,CheckForEmpty4,EndIt4,'4',setRand4
    MoreComparison ind1,ind3,ind2,CheckForEmpty5,EndIt5,'2',setRand5
    MoreComparison ind1,ind9,ind5,CheckForEmpty6,EndIt6,'5',setRand6
answer2:
    MoreComparison ind2,ind5,ind8,CheckForEmpty7,EndIt7,'8',setRand7
    MoreComparison ind2,ind8,ind5,CheckForEmpty11,EndIt11,'5',setRand11
answer3:
    MoreComparison ind3,ind6,ind9,CheckForEmpty8,EndIt8,'9',setRand8
    MoreComparison ind3,ind5,ind7,CheckForEmpty9,EndIt9,'7',setRand9
    MoreComparison ind3,ind2,ind1,CheckForEmpty10,EndIt10,'1',setRand10
answer4:
    MoreComparison ind4,ind5,ind6,CheckForEmpty12,EndIt12,'6',setRand12
    MoreComparison ind4,ind6,ind5,CheckForEmpty13,EndIt13,'5',setRand13
answer5:
    MoreComparison ind6,ind5,ind4,CheckForEmpty14,EndIt14,'4',setRand14
answer6:
    MoreComparison ind7,ind4,ind1,CheckForEmpty15,EndIt15,'1',setRand15
    MoreComparison ind7,ind5,ind3,CheckForEmpty16,EndIt16,'3',setRand16
    MoreComparison ind7,ind8,ind9,CheckForEmpty17,EndIt17,'9',setRand17
answer7:
    MoreComparison ind8,ind5,ind2,CheckForEmpty18,EndIt18,'2',setRand18
answer8:
    MoreComparison ind9,ind8,ind7,CheckForEmpty19,EndIt19,'7',setRand19
    MoreComparison ind9,ind5,ind1,CheckForEmpty20,EndIt20,'1',setRand20
    MoreComparison ind9,ind1,ind5,CheckForEmpty21,EndIt21,'5',setRand21
    MoreComparison ind9,ind6,ind3,CheckForEmpty22,EndIt22,'3',setRand22
jmp RANDCOMPARISON
endm
MoreComparison macro pos1,pos2,pos3,CheckForEmpty,endIt,setWhat,setRand
cmp pos1,'_'
jne CheckForEmpty
jmp endIt
CheckForEmpty:
    mov cl,pos1
    cmp pos2,cl
    je setRand
    jmp endIt
    setRand:
        cmp pos3,'_'
        jne endIt
        mov RAND,setWhat
        jmp RANDComparison
endIt:
endm

;Firts main jump
firstJump macro
cmp playing,'1'
je turnNextUser
jmp computerTurner
turnNextUser:
    cmp turnState,'0'
    je UserTurn
    jmp OtherUser
computerTurner:
    cmp turnState,'0'
    je UserTurn
    jmp ComputerTurn
endm

;Chechking for second
UniCheck2 macro index,jumpto0,finaljumpp
cmp index,'X'
JNE jumpto0
jmp finaljumpp
endm

;Final user pass
finalUserPass macro what,TurnForOtherUser,TurnForComputer
setVar what,'O'
cmp playing,'1'
je TurnForOtherUser
jmp TurnForComputer
TurnForOtherUser:
    mov turnState,'2'
    jmp Start
TurnForComputer:
    mov turnState,"1"
    jmp Start
endm
finalUser1Pass macro what
setVar what,'X'
mov turnState,"0"
jmp Start
endm
;Final Computer Pass
finalCompPass macro index
setVar index,"X"
mov turnState ,"0"
jmp Start
endm
;Printing String
PrintStr macro arg
lea dx , arg
mov ah,09h
int 21h
endm

;Space + Charcter printing Macro
printCharSP macro argu
mov dl," "
mov ah,2
int 21h
mov dx,argu
mov ah,2
int 21h
endm

;Setting variable and its value
setVar macro arg,val
mov arg,val
endm

;Program Starting
Dosseg
.model small
.stack 100h
.data
;Messages
    player1 db " Choose these options to play:$ "
    occupiedMsg db " ----------This place is already occupied----------$"
    enterAgain db " ----------Please Input Again----------$"
    occupiedMsg1 db " xxxxxxxxxxxxxxxxxxxxx---Computer---xxxxxxxxxxxxxxxxxxxxxxxxx$"
    enterAgain1 db " xxxxxxxxxxxxxxxxxxxxxxxxx---input again---xxxxxxxxxxxxxxxxxxxx$"
    TestVar db " ---------------------Here--------------------$"
    drawn db "-------------------Match Got Drawn----------------"
    UserTest db " ---------------------User Test--------------------$"
    youwon db "-----------------Congrats! you won---------$"
    compwon db "-----------------You lose!---------------$"
    passNextC db "--------------------pass Computer---------"
    passNextU db "--------------------pass User---------"
    turnState db "0"
    testor db "-----------------------running--------------------$"
    userMsg db " -----------------Press 1 to play with Computer----------------$"
    userMsg1 db " ----------------Press 2 to play with friend--------------$"
    stopper db ?
    ;Main variables
    ind1 db ?
    ind2 db ?
    ind3 db ?
    ind4 db ?
    ind5 db ?
    ind6 db ?
    ind7 db ?
    ind8 db ?
    ind9 db ?
    RAND db ?
    UserRecentPos db ?
    CompRecentPos db ?
    playing db ?
.code
main proc
mov ax,@data
mov ds,ax
mov bl,47
mov stopper,47
lea dx,userMsg
mov ah,09h
int 21h
call shiftLine
lea dx,userMsg1
mov ah,09h
int 21h
call shiftLine
mov ah,8
int 21h
mov playing,al
mov ind1,"_"
mov ind2,"_"
mov ind3,"_"
mov ind4,"_"
mov ind5,"_"
mov ind6,"_"
mov ind7,"_"
mov ind8,"_"
mov ind9,"_"
cmp playing,'1'
je Start
call randomNum
cmp RAND,"4"
jle statechanger
jmp Start
stateChanger:
    mov turnState,'1'
Start:
    inc stopper
    call shiftLine
    call shiftLine
    printVarSP ind1
    printVarSP ind2
    printVarSP ind3
    call shiftLine
    printVarSP ind4
    printVarSP ind5
    printVarSP ind6
    call shiftLine
    printVarSP ind7
    printVarSP ind8
    printVarSP ind9
    call shiftLine
    
        
;----------------------------------------------------------------------------
;Static Bottom Instructions
;----------------------------------------------------------------------------
    
    startPrinting:
        PrintStr player1
        call shiftLine
        printCharSP "1" 
        printCharSP "2" 
        printCharSP "3" 
        call shiftLine
        printCharSP "4" 
        printCharSP "5" 
        printCharSP "6" 
        call shiftLine
        printCharSP "7" 
        printCharSP "8" 
        printCharSP "9" 
        call shiftLine
        WinCheckUser
        CompWin:
            WinCompCheck
        endproJumper:
            call endPro
        endingStage:
            cmp stopper,'9'
            call shiftLine
            je endproJumper
            jmp Decider
    Decider:
        firstJump
    UserTurn:
        mov ah,8
        int 21h
        cmp al,'1'
        JE pressed1
        cmp al,'3'
        JE pressed3
        cmp al,'2'
        je pressed2
        cmp al,'4'
        je pressed4
        cmp al,'5'
        je pressed5
        cmp al,'6'
        je pressed6
        cmp al,'7'
        je jumpto7
        cmp al,'8'
        je jumpto8
        jmp pressed9
        jumpto7:
         jmp pressed7
        jumpto8:
            jmp pressed8
        pressed1:
            UniCheck1 ind1,check1,StartJump
        pressed2:
            UniCheck1 ind2,check2,StartJump
        pressed3:
            UniCheck1 ind3,check3,StartJump
        pressed4:
            UniCheck1 ind4,check4,StartJump
        pressed5:
            UniCheck1 ind5,check5,StartJump
        pressed6:
            UniCheck1 ind6,check6,StartJump
        pressed7:
            UniCheck1 ind7,check7,StartJump
        StartJump:
            call occupied
            jmp startPrinting
        pressed8:
            UniCheck1 ind8,check8,StartJump
        pressed9:
            UniCheck1 ind9,check9,StartJump
        
        check1:
            UniCheck2 ind1,passto1Jump,startPrintingJump
        check2:
            UniCheck2 ind2,passto2Jump,startPrintingJump
        check3:
            UniCheck2 ind3,passto3Jump,startPrintingJump
        check4:
            UniCheck2 ind4,passto4Jump,startPrintingJump
        startPrintingJump:
            call occupied
            jmp UserTurn
        check5:
            UniCheck2 ind5,passto5Jump,startPrintingJump
        check6:
            UniCheck2 ind6,passto6Jump,startPrintingJump
        check7:
            UniCheck2 ind7,passto7Jump,startPrintingJump
        check8:
            UniCheck2 ind8,passto8Jump,startPrintingJump
        check9:
            UniCheck2 ind9,passto9Jump,startPrintingJump
        passto1Jump:
            jmp pass1
        passto2Jump:
            jmp pass2
        passto3Jump:
            jmp pass3
        passto4Jump:
            jmp pass4
        passto5Jump:
            jmp pass5
        passto6Jump:
            jmp pass6
        passto7Jump:
            jmp pass7
        passto8Jump:
            jmp pass8
        passto9Jump:
            jmp pass9
        ;passes
        pass1:
            finalUserPass ind1,TurnForOtherUser1,TurnForComputer1
        pass2:
            finalUserPass ind2,TurnForOtherUser2,TurnForComputer2
        pass3:
            finalUserPass ind3,TurnForOtherUser3,TurnForComputer3
         pass4:
            finalUserPass ind4,TurnForOtherUser4,TurnForComputer4
         pass5:
            finalUserPass ind5,TurnForOtherUser5,TurnForComputer5
         pass6:
            finalUserPass ind6,TurnForOtherUser6,TurnForComputer6
         pass7:
            finalUserPass ind7,TurnForOtherUser7,TurnForComputer7
         pass8:
            finalUserPass ind8,TurnForOtherUser8,TurnForComputer8
         pass9:
            finalUserPass ind9,TurnForOtherUser9,TurnForComputer9

    OtherUser:
        mov ah,8
        int 21h
        cmp al,'1'
        JE pressed01
        cmp al,'3'
        JE pressed03
        cmp al,'2'
        je pressed02
        cmp al,'4'
        je pressed04
        cmp al,'5'
        je pressed05
        cmp al,'6'
        je pressed06
        cmp al,'7'
        je jumpto07
        cmp al,'8'
        je jumpto08
        jmp pressed09
        jumpto07:
         jmp pressed07
        jumpto08:
            jmp pressed08
        pressed01:
            UniCheck1 ind1,check01,StartJump1
        pressed02:
            UniCheck1 ind2,check02,StartJump1
        pressed03:
            UniCheck1 ind3,check03,StartJump1
        pressed04:
            UniCheck1 ind4,check04,StartJump1
        pressed05:
            UniCheck1 ind5,check05,StartJump1
        pressed06:
            UniCheck1 ind6,check06,StartJump1
        pressed07:
            UniCheck1 ind7,check07,StartJump1
        StartJump1:
            call occupied
            jmp startPrinting
        pressed08:
            UniCheck1 ind8,check08,StartJump1
        pressed09:
            UniCheck1 ind9,check09,StartJump1
        
        check01:
            UniCheck2 ind1,pass01,startPrintingJump1
        check02:
            UniCheck2 ind2,pass02,startPrintingJump1
        check03:
            UniCheck2 ind3,pass03,startPrintingJump1
        startPrintingJump1:
            call occupied
            jmp UserTurn
        check04:
            UniCheck2 ind4,pass04,startPrintingJump1
        check05:
            UniCheck2 ind5,pass05,startPrintingJump1
        check06:
            UniCheck2 ind6,pass06,startPrintingJump1
        check07:
            UniCheck2 ind7,pass07,startPrintingJump1
        check08:
            UniCheck2 ind8,pass08,startPrintingJump1
        check09:
            UniCheck2 ind9,pass09,startPrintingJump1
        ;passes
        pass01:
            finalUser1Pass ind1
        pass02:
            finalUser1Pass ind2
        pass03:
            finalUser1Pass ind3
         pass04:
            finalUser1Pass ind4
         pass05:
            finalUser1Pass ind5
         pass06:
            finalUser1Pass ind6
         pass07:
            finalUser1Pass ind7
         pass08:
            finalUser1Pass ind8
         pass09:
            finalUser1Pass ind9

    ComputerTurn:
        randomAgain:
            call randomNum
            intelligence
            RandComparison:
                cmp RAND,"1"
                JE Got1
                cmp RAND,"2"
                JE Got2
                cmp RAND,"3"
                JE Got3
                cmp RAND,"4"
                JE Got4
                cmp RAND,"5"
                JE Got5
                cmp RAND,"6"
                JE Got6
                cmp RAND,"7"
                JE jumpcomp7
                cmp RAND,"8"
                JE jumpComp8
                jmp Got9
                jumpcomp7:
                    jmp Got7
                jumpComp8:
                    jmp Got8
        Got1:
            UniCheck1 ind1,cmpcheck1,compJump
        Got2:
            UniCheck1 ind2,cmpcheck2,compJump
        Got3:
            UniCheck1 ind3,cmpcheck3,compJump
        Got4:
            UniCheck1 ind4,cmpcheck4,compJump
        Got5:
            UniCheck1 ind5,cmpcheck5,compJump
        compJump:
            jmp ComputerTurn
        Got6:
            UniCheck1 ind6,cmpcheck6,compJump
        Got7:
            UniCheck1 ind7,cmpcheck7,compJump
        Got8:
            UniCheck1 ind8,cmpcheck8,compJump
        Got9:
            UniCheck1 ind9,cmpcheck9,compJump
        
        cmpcheck1:
            UniCheck2 ind1,compPass1,compJump
        cmpcheck2:
            UniCheck2 ind2,compPass2,compJump
        cmpcheck3:
            UniCheck2 ind3,compPass3,compJump
        cmpcheck4:
            UniCheck2 ind4,compPass4,compJump
        cmpcheck5:
            UniCheck2 ind5,compPass5,compJump
        cmpcheck6:
            UniCheck2 ind6,compPass6,compJump
        cmpcheck7:
            UniCheck2 ind7,compPass7,compJump
        cmpcheck8:
            UniCheck2 ind8,compPass8,compJump
        cmpcheck9:
            UniCheck2 ind9,compPass9,compJump
        
        compPass1:
            finalCompPass ind1
        compPass2:
            finalCompPass ind2
        compPass3:
            finalCompPass ind3
        compPass4:
            finalCompPass ind4
        compPass5:
            finalCompPass ind5
        compPass6:
            finalCompPass ind6
        compPass7:
            finalCompPass ind7
        compPass8:
            finalCompPass ind8
        compPass9:
            finalCompPass ind9


mov ah,4ch
int 21h
main endp

;Spacae printing procedure
printSpace proc 
mov dx," "
mov ah,2
int 21h
ret
printSpace endp

;Line shifting procedure
shiftLine proc
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
ret
shiftLine endp

;Occupied message procedure
occupied proc 
call shiftLine
lea dx,occupiedmsg
mov ah,09h
int 21h
call shiftLine
lea dx,enteragain
mov ah,09h
int 21h
ret
occupied endp
occupied1 proc
call shiftLine
lea dx,occupiedmsg1
mov ah,09h
int 21h
call shiftLine
lea dx,enteragain1
mov ah,09h
int 21h
ret
occupied1 endp
;Random number gamerator
randomNum proc
generator:
    mov ah,0h
    int 1ah
    mov ax,dx
    mov dx,0
    mov bx,10
    div bx
    add dl,48
    cmp dl,"0"
    je generator
    cmp dl,"9"
    jg generator
    mov RAND,dl
ret
randomNum endp
; endProcedure1 endp
endPro proc
call shiftLine
PrintStr drawn
mov ah,4ch
int 21h
endPro endp
end main