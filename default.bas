 rem Generated 2021-07-21 3:11:28 PM by Visual bB Version 1.0.0.568
 rem **********************************
 rem *<filename>                      *
 rem *<description>                   *
 rem *<author>                        *
 rem *<contact info>                  *
 rem *<license>                       *
 rem **********************************
 playfield:
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 COLUBK = $0C
 COLUPF = $42

 player0x=50:player0y=50
 player1x=20:player1y=20
 missile0height=4:missile0y=255
 NUSIZ0 = 16 


sprites

 player0:
 %01111110
 %10000001
 %10011001
 %10100101
 %10000001
 %10100101
 %10000001
 %01111110
end


 player1:
 %00011000
 %00100100
 %01011010
 %10111101
 %10011001
 %10000001
 %01100110
 %00011000
end

 if missile0y>240 then goto skip
 missile0y = missile0y-2:goto draw_loop
skip
 if joy0fire then missile0y = player0y-2:missile0x=player0x+4



draw_loop
 drawscreen

 if player1y < player0y then player1y = player1y+1
 if player1y > player0y then player1y = player1y-1
 if player1x < player0x then player1x = player1x+1
 if player1x > player0x then player1x = player1x-1
 player1x = player1x:player1y = player1y
 
 if joy0up then player0y = player0y-1:goto jump
 if joy0down then player0y = player0y+1:goto jump
 if joy0left then player0x = player0x-1:goto jump
 if joy0right then player0x = player0x+1:goto jump



 if collision(missile0, player1) then score=score+1:player1x = rand/2:player1y=0:missile0y=255
 if collision(player0, player1) then score=score-1:player1x = rand/2:player1y=0:missile0y=255


jump
 goto sprites


