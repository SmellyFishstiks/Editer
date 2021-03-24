


function dropDownWindow(items,x,y)
 items=items or {{"rror","nil",1}}
 x=x or 0
 y=y or bannerMargin
 
 local hr=10
 
 local height=#items*hr+4
 local width=0
 
 
 local a=0
 for i=1,#items do
  
  local str=items[i][1]
  if items[i][2]~="" then a=-1 str=str.." ("..items[i][2]..")" end
  
  local n=getSize(str,1)
  
  if n>width then
   width=n
  end
  
 end
 width=width+13+a
 
 
 
 -- make sure it's in bounds
 local wx=getWindowSize()
 wx=floor(wx)
 --local dx=-width*3--width*(r^2)-width*r
 if x+width>wx*2 then x=wx*2-width end
 if x<0 then x=0 end
 
 for i=1,4 do
  setColor("000005",1/(10+(i-1)*4))
  love.graphics.line(x, y+height+i-.5-2, x+width, y+height+i-.5-2)
 end
 love.graphics.line(x+1, y+height-.5+3, x+width-1, y+height-.5+3)
 
 setColor(pageIDTable[pageID][2])
 love.graphics.rectangle("fill",x,y,width,height,4)
 
 setColor("ffffff")
 
 for i=1,#items do
  sprite(items[i][3],x+2,y+i*hr-hr+3)
  local str=items[i][1]
  if items[i][2]~="" then str=str.." ("..items[i][2]..")" end
  text(str,x+12,y+i*hr-hr+5)
 end
 
 --love.graphics.rectangle("fill",x,y+height,width*r,1)
 
 --setColor("000005",.1)
 --love.graphics.rectangle("fill",x,y+height+1,width*r,2)
 
 setColor("ffffff")
end