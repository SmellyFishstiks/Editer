

function inputMain()
 trackBoard()
 trackMouse()
 
end




keys={}
keyPresses={}
function trackBoard()
 for j,i in pairs(keys) do
  
  if keyPresses[j] then
   --print(j.." was pressed.")
   keyPresses[j]=nil
  end
  
  --print(j.. " is being held")
  
 end
 
end

function love.keypressed(key)
 keys[key]=true
 keyPresses[key]=true
 
 if key=="escape" and not doQuitPrompt then banner_Quit() end
end
function love.keyreleased(key)
 keys[key]=nil
end


function shiftCheck()
 if keys["capslock"] or keys["lshift"] or keys["rshift"] then
  return true
 end
 return false
end

function altCheck()
 if keys["lalt"] or keys["ralt"] then
  return true
 end
 return false
end

function cmdCheck()
 if keys["lgui"] or keys["rgui"] then
  return true
 end
 return false
end




mouse={
 pos={},
 coolDown=0,
 wheel=0,
 wheelCoolDown=0,
 click={},
 
 
 hover=false,
 action=false
}

function trackMouse()
 
 mouse.pos[1], mouse.pos[2]=getMousePos()
 
 mouse.action=false
 
 if mouse.coolDown~=0 then
  mouse.coolDown=mouse.coolDown-1
 end

 if mouse.wheelCoolDown~=0 then
  mouse.wheelCoolDown=mouse.wheelCoolDown-1
 end
 if floor(mouse.wheel+.5)~=0 then
  mouse.wheel=mouse.wheel/1.2
 else
  mouse.wheel=0
 end
 
 mouse.click={}
 if love.mouse.isDown(1) and mouse.coolDown==0 then
  mouse.click[1]=true mouse.coolDown=15
 end
 if love.mouse.isDown(2) and mouse.coolDown==0 then
  mouse.click[2]=true mouse.coolDown=15
 end
 
end

function getMousePos()
 local mx,my = love.mouse.getPosition()
 return floor((mx/10)*8)/4,floor((my/10)*8)/4
end

function love.wheelmoved(x,y)
 if y>1 then y=1 elseif y<-1 then y=-1 end
 mouse.wheel = y
 
 if mouse.wheel~=0 and mouse.wheelCoolDown==0 then
  mouse.wheelCoolDown=2
 end
end




function mouseAnimation()
 local ani="arrow"
 
 local x,y=bannerGetStretch()
 y=144+y*2-bannerMargin
 if mouse.pos[2]>bannerMargin and mouse.pos[2]<y and 
    state==0 and not mouse.hover and not mouse.action then
  ani="ibeam"
  if mouse.click[1] then doWrite=true end
 else
  if mouse.click[1] then doWrite=false end
 end
 
 if mouse.hover then ani="hand" end
 
 local cursor = love.mouse.getSystemCursor(ani)
 love.mouse.setCursor(cursor)
end




