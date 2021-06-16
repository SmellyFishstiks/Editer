
fontSheet=love.graphics.newImage("fontsheet.png")

font={}
fontDummyCanvas=love.graphics.newCanvas(12,12)
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
 local x,y=i%10,floor(i/10)
 
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

unicodeIDs={
 -- arrows
 8592,8593,8594,8595,
 -- omega
 9734,
 -- star
 937,
 -- apple
 127822,
 -- delta triangle
 8710,
 -- box
 9744,
 -- circle
 9711
}

for i=1, #unicodeIDs do
 font[ unicodeIDs[i] ]=newUnicode(i-1)
end




function textBubble(str,amount)
 
 local str=tostring(str)
 for i=1,amount-#str do
  str="0"..str
 end
 return str
 
end


function getChar(v,i)
 return utf8.dump(tostring(v))[i]
end

function getBoolChar(bool,i)
 
 local s=l.bool_False
 if bool then s=l.bool_True end
 return getChar(s,i)
end

function getBoolString(bool)
 
 local s=l.bool_False
 if bool then s=l.bool_True end
 return s
end



textCursor={0,0,0,0}
function text(str,x,y,mode,ifShow,ifShake,ifWrap)
 str=tostring(str)
 str=utf8.dump(str)
 
 
 
 mode=mode or "normal"
 
 textCursor[1]=x or textCursor[1]
 textCursor[2]=y or textCursor[2]
 
 for i=1,#str do
  
  local y=0
  if ifShake then
   if type(ifShake)=="number" then
    y=( sin( (ifShake%2+(t/10)) ))
   else
    y=abs( sin( (i%2+(t/10)) ))
   end
  end
  
  
  
  c=utf8.ord(str[i])--string.byte(str[i])
  if (c>127 or c<0) and not unicodeCheck(c) then c=63 end
  
  -- draw to canvas
  love.graphics.push()
   fontDummyCanvas:renderTo(function()
    love.graphics.clear()
    love.graphics.scale(2)
    local sheet,b=fontSheet,0
    if c>127 then sheet,b=unicodeSheet,4 end
    
    love.graphics.draw(sheet, font[c], 0,0)
   end)
  love.graphics.pop()
   
   love.graphics.push()
   fontCanvas:renderTo(function()
    love.graphics.clear()
    love.graphics.scale(2)
    local r=0
    if mode=="italic" then r=0.075 end
    
    local sheet,b=fontSheet,0
    if c>127 then sheet,b=unicodeSheet,4 end
    
    love.graphics.draw(fontDummyCanvas, 6-b,6,r)
    
    if c>127 then textCursor[1]=textCursor[1]+3 end
    
   end)
  love.graphics.pop()
  
  if not showCheck(c) or ifShow then
   love.graphics.draw(fontCanvas, textCursor[1]-6+textCursor[3], textCursor[2]-6+y+textCursor[4])
  end
  
  textCursor[1]=textCursor[1]+6
  
  
  local r=#tostring((#textLineMem))
  local xd=getWindowSize()*2-(lineBannerMargin*r+6)
  if c==10 or (ifWrap and textCursor[1]>xd) then
   textCursor[1]=x or 0
   textCursor[2]=textCursor[2]+8
  end
  
  
 end
 
end

hideChars={9,10,32}
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


function utf8.ord(c)
 local o=utf8.offset(c,1)
 local c=utf8.codepoint(c, o, o)
 return c
end

--[[
local test={"Ω","☆","🍎","∆","☐","◯"}
for k=1,#test do
 
 local t={}
 local str=test[k]
 for i=1,#str do
  local o=utf8.offset(str,i)-i
  if i+o>#str then break end
  
  local c=utf8.codepoint(str, i+o, i+o)
  t[#t+1]=c
  
 end
 
 for i=1,#t do
  print("value: "..t[i])
 end
end
-- ]]


--[[
 Ω ☆ 🍎
 ↑ ↓ → ←
 ∆ ☐ ◯
]]
