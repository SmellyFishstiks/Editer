






function fileReadContents(contents)
 
 contents = contents or "file empty?"
 print(contents)
 
 
 local str = utf8.dump( contents )
 
 local paste={}
 
 for i=1,#str do
  
  local flag=false
  local c=str[i]
  
  for j=1,#unicodeIDs do
   if utf8.ord(c)<128 or unicodeCheck( utf8.ord(c) ) then
    flag=true
   end
  end
  
  local r="\17"
  if flag then r=c end
  paste[#paste+1]=r
 end
 
 
 
 writeUpdate=true
 writeCursor=0
 textTable={}
 for i=1,#paste do
  --print(paste[i])
  writeCursor=writeCursor+1
  textTable=addTo_Table(textTable,writeCursor,paste[i])
 end
end