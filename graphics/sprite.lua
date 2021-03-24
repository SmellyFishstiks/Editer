
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
 
 -- icons
 newSprite(0,8),
 newSprite(8,8),
 newSprite(16,8),
 newSprite(24,8),
 
 -- menu icons
 newSprite(32,8),
 
 -- (syntax icons)
 newSprite(0,16),
 newSprite(8,16),
 newSprite(16,16)
}