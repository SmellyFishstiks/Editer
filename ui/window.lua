
function getWindowSize()
 local x,y = love.graphics.getDimensions()
 return ceil(x/window.ogp), ceil(y/window.ogp)
end

function checkForResize()
 if not windowmem then
  windowmem={}
  windowmem[1],windowmem[2]=getWindowSize()
 end
 
 local w,h=getWindowSize()
 if windowmem[1]~=w or windowmem[2]~=h then
  screen = love.graphics.newCanvas()
  windowmem=nil
  return true
 end
end


function updateScreen()
 
 
 local f=checkForResize()
 if f then
  local x,y=getWindowSize()
  screen=love.graphics.newCanvas(x, y)
 end
 
 
end


function resetWindow(width, height)
 width, height = width or window.ogx*window.ogp, height or window.ogy*window.ogp
 
 local _,_,f=love.window.getMode()
 local x,y=f.x,f.y
 love.window.setMode(width, height, {x=x,y=y} )

end