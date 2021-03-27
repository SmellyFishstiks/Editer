


function writeArrowMovment()
 
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
  
  if f then
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
  local q=0
  while true do
   q=q+1
   if textTable[n-q]=="\10" or not textTable[n-q] then
    break
   end
  end
  if v<=q then
   q=abs(q-v)
  else
   local a=abs(n-writeCursor)+1
   if q<=a then
    q=a-1 v=1
   else
    q=q-v
   end
   
  end
  
  local enterF=false
  
   --print(n,v,q)
   --print(v+q)
   for i=1,v+q do
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
 
end