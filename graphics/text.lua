
fontSheet=love.graphics.newImage("fontsheet.png")

font={}
fontCanvas=love.graphics.newCanvas(12,12)

function newChar(i)
 local sw,sh=fontSheet:getDimensions()
 local x,y=i%16,floor(i/16)
 
 local q=love.graphics.newQuad(x*6,y*6,6,6, sw,sh)
 return q
end

unicodeSheet=love.graphics.newImage("unicodesheet.png")
function newUnicode(i)
 local sw,sh=unicodeSheet:getDimensions()
 local x,y=i%8,floor(i/8)
 
 local q=love.graphics.newQuad(x*8,y*6,8,6, sw,sh)
 return q
end


function unicodeCheck(i)
 
 for j=1,#unicodeIDs do
  if unicodeIDs[j]==i then return true end
 end
 return false
end



for i=0,127 do
 font[i]=newChar(i)
end

unicodeIDs={226,206,240 }
for i=1, #unicodeIDs do
 font[ unicodeIDs[i] ]=newUnicode(i-1)
end







textCursor={0,0}
function text(str,x,y,mode,ifShow,ifShake)
 str=tostring(str)
 str=utf8.dump(str)
 
 
 
 mode=mode or "normal"
 if ifShow==nil then
  ifShow=true
 end
 
 textCursor[1]=x or textCursor[1]
 textCursor[2]=y or textCursor[2]
 
 for i=1,#str do
  
  local y=0
  if ifShake then
   y=abs( sin( (i%2+(t/10)) ))
  end
  
  c=string.byte(str[i])
  if (c>127 or c<0) and not unicodeCheck(c) then c=63 end
  
  love.graphics.push()
   fontCanvas:renderTo(function()
    love.graphics.clear()
    love.graphics.scale(2)
    local r=0
    if mode=="italic" then r=0.075 end
    
    local sheet,b=fontSheet,0
    if c>127 then sheet,b=unicodeSheet,4 end
    
    love.graphics.draw(sheet, font[c], 6-b,6,r)
    
    if c>127 then textCursor[1]=textCursor[1]+3 end
    
   end)
  love.graphics.pop()
  
  if (ifShow and not showCheck(c) ) or not ifShow then
   love.graphics.draw(fontCanvas, textCursor[1]-6, textCursor[2]-6+y)
  end
  
  textCursor[1]=textCursor[1]+6
  if c==10 then
   textCursor[1]=x or 0
   textCursor[2]=textCursor[2]+8
  end
  
  
 end
 
end


hideChars={10,32}
function showCheck(c)
 for i=1,#hideChars do
  if hideChars[i]==c then return true end
 end
 
 return false
end


function getSize(str,bonus)
 local n,t=0,utf8.dump(str)
 bonus = bonus or 0
 for i=1,#t do
  n=n+6
  if string.byte(t[i])>127 then
   n=n+2+bonus
  end
 end
 
 return n
end




function utf8.dump(str)
 local t={}
 for i=1,#str do
  
  local o=utf8.offset(str,i)-i
  
  if i+o>#str then return t end
 
  local c=utf8.char( utf8.codepoint(str, i+o, i+o) )
  t[#t+1]=c
  
 end
 
 return t
end


--[[
 Ω ☆ 🍎
]]
