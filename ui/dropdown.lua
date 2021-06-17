


function dropDownWindow(items,x,y)
 items=items or {{"rror","nil",1}}
 
 if type(x)=="table" then y=x[4] or dropDownPos x=x[1](x[2])+x[3] end
 
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
 local wx=getWindowSize()-.5
 
 --local dx=-width*3--width*(r^2)-width*r
 if x+width>wx*2 then x=wx*2-width end
 if x<0 then x=0 end
 
 
 
 -- input
 local n=0
 if mouse.pos[1]>x and mouse.pos[1]<x+width and
    mouse.pos[2]>y and mouse.pos[2]<y+height then
  
  if y<bannerMargin and state==0 then goto _ end
  
  
  
  n=floor( (mouse.pos[2]-y-2)/10 +1 )
  n=min(#items, max(1,n))
  
  mouse.hover=items[n][5] or "" mouseAnimation()
  
  if mouse.click[1] then
   
   mouse.action=true
   local a,func=nil,items[n][4]
   if type(func)=="table" then
    a=func[2]
    func=func[1]
   end
   func(a)
  end
  ::_::
 end
 
 
 
 for i=1,4 do
  setColor("000005",1/(10+(i-1)*4))
  love.graphics.line(x, y+height+i-.5-2, x+width, y+height+i-.5-2)
 end
 love.graphics.line(x+1, y+height-.5+3, x+width-1, y+height-.5+3)
 
 setColor(pageIDTable[pageID][2])
 love.graphics.rectangle("fill",x,y,width,height,4)
 
 setColor("ffffff")
 
 for i=1,#items do
  local g=0
  if n==i then g=1 end
  if items[i][3] then
   sprite(items[i][3], x+2+g, y+i*hr-hr+3)
  end
  
  local str=items[i][1]
  if items[i][2]~="" then str=str.." ("..items[i][2]..")" end
  
  text(str, x+12+g, y+i*hr-hr+5,"normal",false,items[i][6])
 end
 
end




function DropDownFunc()
 
 if dropDownPos~=bannerMargin then 
  dropDownPos=dropDownPos+2
 end
 dropDownMenu()
end









