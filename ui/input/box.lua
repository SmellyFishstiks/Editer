



function initUIBoxes()
 
 -- banner icons
 for i=1,4 do
  newUIBox(74,2,9,9, UIBox_BannerFunc, {nil, i, UIBox_Banner_GetStretch, nil} )
 end
 
end


UIBoxTable={}
function newUIBox(x,y,w,h,func,extra)
 
 local extra=extra or {}
 
 local b={
  
  x=x,y=y,
  w=w,h=h,
  func=func or UIBox_DummyFunc,
  
  ID=extra[1] or 0,
  groupID=extra[2] or 0,
  push=extra[3] or UIBox_DummyFunc,
  squash=extra[4] or UIBox_DummyFunc
  
 }
 
 UIBoxTable[#UIBoxTable+1]=b
 return b
end


function UIBox_DummyFunc()
 return 0,0
end





function UIBoxMain()
 
 
 
 local f=false
 
 for i=1,#UIBoxTable do
  local b=UIBoxTable[i]
  
  local dx,dy=0,0
  if b.push then dx,dy=b:push(b) end
  local x,y=b.x+dx, b.y+dy
  
  
  if mouse.pos[1]<x+b.w-1 and mouse.pos[1]>x-1 and
     mouse.pos[2]<y+b.h and mouse.pos[2]>y-1 then
   if b.ID~=state then goto _ end
   f=true
   
   if mouse.click[1] then b:func() end
   
  end
  ::_::
 end
 
 setColor("ffffff")
 
 if f then mouse.hover=true else
  
  if mouse.click[1] then doDropDown=nil end
  mouse.hover=false
 end
end
