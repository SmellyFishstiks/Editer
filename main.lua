

function love.load()
 require("require")
 
 initUIBoxes()
 
 screen=love.graphics.newCanvas(window.ogx, window.ogy)
end




t=0
state=0
function love.update()
 t=t+1
 
 if doWrite and state==0 then
  write_Cmds()
  write()
 end
 inputMain()
 updateScreen()
end


function love.draw()
 
 love.graphics.push()
  love.graphics.scale(1/2)
   love.graphics.setCanvas(screen)
   
   pageBackground()
   
   drawText()
   
   if doDropDown then DropDownFunc() end
   mainBanners()
   bannerDescript()
   
   mouseAnimation()
   
   UIBoxMain()
   
   if doPrompt then promptScreen() end 
   
  love.graphics.setCanvas()
 love.graphics.pop()
 
 love.graphics.scale(window.ogp)
 love.graphics.draw(screen)
 
end



doQuit=true
function love.quit()
  banner_Quit()
  return doQuit
end
