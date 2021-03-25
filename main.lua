

function love.load()
 require("require")
 
 initUIBoxes()
 
 screen=love.graphics.newCanvas(window.ogx, window.ogy)
end




t=0
state=0
function love.update()
 t=t+1
 
 inputMain()
 updateScreen()
end


function love.draw()
 
 love.graphics.push()
  love.graphics.scale(1/2)
   love.graphics.setCanvas(screen)
   
   pageBackground()
   --text("Apple 🍎",2,14,"italic")
   --text("\16\16\16\16\17\17\16\16\16\16\n\16\16\16\17\16\16\17\16\16\16\n\16\17\17\16\16\16\16\17\17\16\n\17\16\16\16\16\16\16\16\16\17\n\16\17\17\16\16\16\16\17\17\16\n\16\16\17\16\16\16\16\17\16\16\n\16\17\16\16\17\16\17\16\17\16\n\16\17\16\16\16\16\16\17\17\16\n\16\17\16\16\16\16\17\17\16\17\n\16\17\17\16\16\16\17\16\16\17\n\16\17\16\17\17\17\17\17\17\16\n\16\17\17\16\17\17\16\17\17\16\n",3,16)
   if doDropDown then DropDownFunc() end
   mainBanners()
   
   UIBoxMain()
   
   if doPrompt then promptScreen() end 
   
  love.graphics.setCanvas()
 love.graphics.pop()
 
 love.graphics.scale(window.ogp)
 love.graphics.draw(screen)
 
end


