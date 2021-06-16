

function getFileType(str)
 
 -- read file
 io.input(str)
 local data = io.read(2^4 )
 if data then
  
  --[[
  for i=1,#data do
   print(string.byte(string.sub(data,i,i)))
  end
  ]]
  
  -- check for aliases
  if string.sub(data,0,16)=="book\0\0\0\0mark\0\0\0\0" then
   return "alias"
  end
 end
 
 
 
 -- file extensions
 local i,c=-1,"?"
 while c~="." do
  i=i+1
  c=string.sub(str,#str-i,#str-i)
  
  if i>2^8 then
   
   -- if not file extension and not data
   if not data then
    return "directory"
   end
   
   -- if it can't find extension
   error("Editer: bad file type read.")
  end
 end
 
 -- return file extension
 local output=string.sub(str,#str-i,#str)
 --print(output)
 
 return output
 
end



function getFileSprite(extension)
 
 if extension=="directory" then return 11 end
 if extension=="alias" then return 12 end
 
 
 local files={
  {"txt",13},
  {"md",18},
  {"md",15},
  {"sndr",19},
  {"wav",20}
  
 }
 
 for i=1,#files do
  if extension=="."..files[i][1] then
   return files[i][2]
  end
 end
 
 return 13
end