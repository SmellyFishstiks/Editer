

function love.load()
 
 floor=math.floor
 ceil=math.ceil
 sin=math.sin
 cos=math.cos
 abs=math.abs
 
 love.graphics.setDefaultFilter("nearest","nearest",1)
 love.graphics.setLineStyle("rough")
 
 require("text")
 require("banners")
 
 screen=love.graphics.newCanvas(window.ogx*window.ogp, window.ogy*window.ogp)

end


spriteSheet=love.graphics.newImage("spriteSheet.png")
function newSprite(x,y)
 local sw,sh=spriteSheet:getDimensions()
 local q=love.graphics.newQuad(x,y,8,8, sw,sh)
 return q
end

function sprite(i,x,y)
 love.graphics.draw(spriteSheet,spriteTable[i],floor(x+.5),floor(y+.5) )
end

spriteTable={
 newSprite(0,0),
 newSprite(8,0),
 newSprite(16,0),
 newSprite(24,0)
}


function love.update()
end


function love.draw()
 
 love.graphics.push()
 love.graphics.scale(1/2)
 love.graphics.setCanvas(screen)
 
 love.graphics.clear()
 
 pageBackground()
 
 local testSTR=[[Test version.
Need to Make new font,
and syntax highlighting is must have
You can stretch
the window which is nice.

Want to make this a full
IDE but thats for the future ;p

But ya thanks for checking this out!
Want to make a thing to run and
write l`o`ve projects
(maybe even sprite editing and
sounder?,lots of stuff to expand
apon! but for now just fun ideas.)

like the changable colors though,
you can change them in "pageIDTable"
under banners.lua]]
text(testSTR,1,12)
 
 mainBanners()
 
 
 
 love.graphics.setCanvas()
 love.graphics.pop()
 
 
 love.graphics.scale(window.ogp)
 love.graphics.draw(screen)
 
end



