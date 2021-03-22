local f = love.graphics.newImageFont("font.png",[[aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ .,:;()[]{}=~><+-*/|\^%#!?_`'"0123456789]])
love.graphics.setFont(f)


function text(str,x,y)
 love.graphics.print(str,x,y)
end




function setColor(hex,aplha)
 
 local c={}
 for i=0,2 do
  c[i]=string.sub(hex,i*2+1,i*2+2)
  c[i]=tonumber("0x"..c[i])/255
 end
 
 local r,g,b=c[0],c[1],c[2]
 love.graphics.setColor(r,g,b,aplha or 1)
end