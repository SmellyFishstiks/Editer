

textTable={}
writeCursor=0
typeDeleteTimer=0
typeMoveTimer={
 L=0,
 R=0,
 U=0,
 D=0
}
function write()
 local x, y=mouse.pos[1], mouse.pos[2]
 
 
 
 if cmdCheck() then return end
 
 
 -- delete
 if keys["backspace"] and not altCheck() then
  local f=false
  if typeDeleteTimer==0 then f=true end
  if typeDeleteTimer>15 and typeDeleteTimer%5==0 then f=true end
  
  if f and writeCursor~=0 then
   textTable=remove_Table(textTable,writeCursor)
   writeCursor=max(writeCursor-1,0)
  end
  
  typeDeleteTimer=typeDeleteTimer+1
  
  
  
 else
  typeDeleteTimer=0
 end
 
 
 -- movement
 -- l
 if keys["left"] and not altCheck() then
  local f=false
  if typeMoveTimer.L==0 then f=true end
  if typeMoveTimer.L>15 and typeMoveTimer.L%5==0 then f=true end
  
  if f then
   writeCursor=max(writeCursor-1,0)
  end
  typeMoveTimer.L=typeMoveTimer.L+1
 else
  typeMoveTimer.L=0
 end
 
 -- r
 if keys["right"] and not altCheck() then
  local f=false
  if typeMoveTimer.R==0 then f=true end
  if typeMoveTimer.R>15 and typeMoveTimer.R%5==0 then f=true end
  
  if f then
   writeCursor=min(writeCursor+1,#textTable)
  end
  typeMoveTimer.R=typeMoveTimer.R+1
 else
  typeMoveTimer.R=0
 end
 
 -- u
 if keys["up"] and not altCheck() then
  local f=false
  if typeMoveTimer.U==0 then f=true end
  if typeMoveTimer.U>15 and typeMoveTimer.U%5==0 then f=true end
  
  
  local n=writeCursor+1
  while true do
   n=n+1
   if textTable[n]=="\10" or not textTable[n] then
    break
   end
  end
  --[[
  local v=0
  while true do
   v=v+1
   if textTable[n-v]=="\10" or not textTable[n-v] then
    break
   end
  end
  ]]
  
  --[[
  local enterF=false
  if f then
   
   for i=1,v do
    if textTable[writeCursor-1]=="\10" then 
     if enterF then break end
     enterF=true
    end
    writeCursor=max(writeCursor-1,0)
   end
  end
  ]]
  
  local n=writeCursor
  while true do
   n=n-1
   if textTable[n]=="\10" or not textTable[n] then
    break
   end
  end
  
  local v=0
  while true do
   v=v+1
   if textTable[n+v]=="\10" or not textTable[n+v] then
    break
   end
  end
  
  
  local enterF=false
  if f then
   error("THIS UP MOVEMENT IS ALL FUCKED UP. FIX IT")
   print(v)
   for i=0,v do
    if textTable[writeCursor]=="\10" then 
     if enterF then break end
     enterF=true
    end
    writeCursor=max(writeCursor-1,0)
   end
  end
  
  typeMoveTimer.U=typeMoveTimer.U+1
 else
  
  typeMoveTimer.U=0
 end
 
 -- d
 if keys["down"] and not altCheck() then
  local f=false
  if typeMoveTimer.D==0 then f=true end
  if typeMoveTimer.D>15 and typeMoveTimer.D%5==0 then f=true end
  
  
  local n=writeCursor+1
  while true do
   n=n-1
   if textTable[n]=="\10" or not textTable[n] then
    break
   end
  end
  local v=0
  while true do
   v=v+1
   if textTable[n+v]=="\10" or not textTable[n+v] then
    break
   end
  end
  
  local enterF=false
  if f then
   for i=1,v do
    if textTable[writeCursor+1]=="\10" then 
     if enterF then break end
     enterF=true
    end
    writeCursor=min(writeCursor+1,#textTable)
   end
  end
  typeMoveTimer.D=typeMoveTimer.D+1
 else
  
  typeMoveTimer.D=0
 end
 
 
 
 
 
 local m=1
 if shiftCheck() then m=m+1 end
 if altCheck() then m=m+2 end
 
 -- chars
 for i,j in pairs(keyPresses) do
  
  local c=typeCharCheck(i,m)
  if c then i=c end
  if i and i~="" then
   if m==2 then
    i=capsCheck(i)
   end
   
   typeT=0
   writeCursor=writeCursor+1
   textTable=addTo_Table(textTable,writeCursor,i)
  end
 end
 
 
end


charCheckTable={
"backspace",{"","","\127",""},

"lshift",{"","","",""},
"rshift",{"","","",""},
"capslock",{"","","",""},

"lctrl",{"","","",""},
"rctrl",{"","","",""},
"lalt",{"","","",""},
"ralt",{"","","",""},
"lgui",{"","","",""},
"rgui",{"","","",""},

"up",{"","","↑",""},
"down",{"","","↓",""},
"right",{"","","→",""},
"left",{"","","←",""},

"tab",{"\9","\9","\9","\9"},
"return",{"\10","\10","\10","\10"},
"space",{" "," "," "," "},

"`",{"`","~","",""},
"1",{"1","!",'\1','\11'},
"2",{"2","@",'\2','\12'},
"3",{"3","#",'\3','\13'},
"4",{"4","$",'\4','\14'},
"5",{"5","%",'\5','\15'},
"6",{"6","^",'\6',''},
"7",{"7","&",'\7',''},
"8",{"8","*",'\8',''},
"9",{"9","(",'\9',''},
"0",{"0",")",'\0','\10'},
"-",{"-","_","",""},
"=",{"=","+","",""},

"[",{"[","{","",""},
"]",{"]","}","",""},
"\\",{"\\","|","",""},
";",{";",":","",""},
"'",{"'",'"',"",""},
",",{",","<","",""},
".",{".",">","",""},
"/",{"/","?","",""},

"f1",{"","",'\16','\28'},
"f2",{"","",'\17','\29'},
"f3",{"","",'\18','\30'},
"f4",{"","",'\19','\31'},
"f5",{"","",'\20',''},
"f6",{"","",'\21',''},
"f7",{"","",'\22',''},
"f8",{"","",'\23',''},
"f9",{"","",'\24',''},
"f10",{"","",'\25',''},
"f11",{"","",'\26',''},
"f12",{"","",'\27',''}

}
secondaryCharCheckTable={
"a",{"🍎",""},
"s",{"☆",""},
"z",{"Ω",""}

}

function typeCharCheck(char,mode)
 mode=mode or 1
 for i=1,#charCheckTable/2 do
  if char==charCheckTable[i*2-1] then return charCheckTable[i*2][mode] end
 end
 
 
 if mode>2 then
  for i=1,#secondaryCharCheckTable/2 do
   if char==secondaryCharCheckTable[i*2-1] then return secondaryCharCheckTable[i*2][mode-2] end
  end
 
 end
 
 return false
end



function capsCheck(c)
 local n=utf8.ord(c)
 if n>96 and n<123 then n=n-32 return string.char(n) end
 return c
end



