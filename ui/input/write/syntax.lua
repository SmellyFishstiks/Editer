

syntaxTable={}
function getSyntax()
 syntaxTable={}
 syntaxes[syntaxUsed]()
 
end



function syntax_Txt()
 for i=1,#textTable do
  syntaxTable[i]={"normal","ffffff"}
 end
 
end

function syntax_Md()
 
 local col={"ffffff", "eaeafa", "ffffe8"}
 
 local asteriskCount=0
 local asteriskDoneCheck=false
 
 for i=1,#textTable do
  
  local color,mode=1,"normal"
  local c=textTable[i]
  
  if c=="*" and not asteriskDoneCheck  then asteriskCount=asteriskCount+1 end
  if asteriskCount~=0 and c~="*" then asteriskDoneCheck=true print(asteriskCount) end
  
  if asteriskCount==1 then color=2 mode="italic" end
  if asteriskCount==2 then color=3 end
  if asteriskCount==3 then color=3 mode="italic" end
  if asteriskDoneCheck and c=="*" or c=="\10" then asteriskDoneCheck=false asteriskCount=0 end
  
  syntaxTable[i]={mode,col[color]}
 end
 
end

function syntax_Lua()
 
 for i=1,#textTable do
  syntaxTable[i]={"normal","ffffff"}
 end
 
end

syntaxes={
 [0]=
 syntax_Txt,
 syntax_Md,
 syntax_Lua
}
getSyntax()