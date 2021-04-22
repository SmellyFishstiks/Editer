function syntax_Lua()
 
 colors={"ffffff","c8e0d0","c8e0d0"}
 modes={"normal","shake"}
 c,m=1,1
 
 
 
 for i=1,#textTable do
  
  
  -- comments
  syntax_comment(i)
  
  -- comments check for end
  syntax_commentEnd(i)
  
  -- comment blocks
  syntax_commentBlock(i)
  
  
  -- comment block check for end
  syntax_commentBlockEnd(i)
  
  
  
  
  syntaxTable[i]={modes[m],colors[c]}
 end
 
 
 
 colors,modes,c,m = nil,nil,nil,nil
end




function syntax_comment(i)
 
 if textTable[i]=="-" and textTable[i-1]=="-" and not (textTable[i+1]=="[" and textTable[i+2]=="[") and c~=3 then
  c=2
  --m=2
  syntaxTable[i-1]={modes[m],colors[c]}
 end
 
end

function syntax_commentEnd(i)
 
 if c==2 and textTable[i]=="\10" then
  c=1
  --m=1
 end
 
end


function syntax_commentBlock(i)
 
 if textTable[i]=="-" and textTable[i-1]=="-" and textTable[i+1]=="[" and textTable[i+2]=="[" then
  c=3
  --m=2
  syntaxTable[i-1]={modes[m],colors[c]}
 end
 
end

function syntax_commentBlockEnd(i)
 
 if textTable[i-1]=="]" and textTable[i-2]=="]" and c==3 then
  c=1
  --m=1
  --syntaxTable[i-1]={"normal",colors[c]}
 end
 
end
