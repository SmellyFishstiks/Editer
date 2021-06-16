
spriteSheet=love.graphics.newImage("spritesheet.png")
function newSprite(x,y)
 local sw,sh=spriteSheet:getDimensions()
 local q=love.graphics.newQuad(x,y,8,8, sw,sh)
 return q
end

function sprite(i,x,y)
 love.graphics.draw(spriteSheet,spriteTable[i],floor(x+.5),floor(y+.5) )
end




spriteTable={}
for i=0,63 do
 spriteTable[i+1]= newSprite( (i%8)*8, floor(i/8)*8 )
end


