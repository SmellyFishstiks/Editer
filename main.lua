

function love.load()
 require("require")
 
 screen=love.graphics.newCanvas(window.ogx, window.ogy)
end




t=0
function love.update()
 t=t+1
 
 
 updateScreen()
end


function love.draw()
 
 love.graphics.push()
  love.graphics.scale(1/2)
   love.graphics.setCanvas(screen)
   
   love.graphics.clear()
   
   pageBackground()
   
   dropDownWindow({ {"New file","Cmd N",6},{"Syntax","",11},{"Word Wrap","",10} },32,24)
   
   
   
   --text("\16\16\16\16\17\17\16\16\16\16\n\16\16\16\17\16\16\17\16\16\16\n\16\17\17\16\16\16\16\17\17\16\n\17\16\16\16\16\16\16\16\16\17\n\16\17\17\16\16\16\16\17\17\16\n\16\16\17\16\16\16\16\17\16\16\n\16\17\16\16\17\16\17\16\17\16\n\16\17\16\16\16\16\16\17\17\16\n\16\17\16\16\16\16\17\17\16\17\n\16\17\17\16\16\16\17\16\16\17\n\16\17\16\17\17\17\17\17\17\16\n\16\17\17\16\17\17\16\17\17\16\n",nil,16)
   
   mainBanners()
   
  love.graphics.setCanvas()
 love.graphics.pop()
 
 love.graphics.scale(window.ogp)
 love.graphics.draw(screen)
 
end


