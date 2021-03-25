
spriteSheet=love.graphics.newImage("spritesheet.png")
function newSprite(x,y)
 local sw,sh=spriteSheet:getDimensions()
 local q=love.graphics.newQuad(x,y,8,8, sw,sh)
 return q
end

function sprite(i,x,y)
 love.graphics.draw(spriteSheet,spriteTable[i],floor(x+.5),floor(y+.5) )
end




spriteTable={
 
 -- title
 newSprite(0,0),
 newSprite(8,0),
 newSprite(16,0),
 newSprite(24,0),
 newSprite(32,0),
 
 -- prompt
 newSprite(40,0),
 newSprite(48,0),
 
 -- empty
 newSprite(56,0),
 
 -- banner icons
 newSprite(0,8),
 newSprite(8,8),
 newSprite(16,8),
 newSprite(24,8),
 
 -- banner's menu icons
 newSprite(32,8),
 newSprite(40,8),
 newSprite(48,8),
 newSprite(56,8)
 
}