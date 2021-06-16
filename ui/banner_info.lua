function bannerDescript()
 
 local str=""
 
 if state==0 then
  
  if doWrite then
   str=bannerDescript_Write()
  end
  
  if doDropDown==1 then
   str=bannerDescript_DropDown1()
  end
  
  if doDropDown==3 then
   str=bannerDescript_DropDown3()
  end
  
 end
 
 
 local _,y=getWindowSize()
 text(str,3,y*2-9)
end



function bannerDescript_Write()
 local n=#tostring(#textTable)
 
 local li=1
 for i=1,writeCursor do
  if textTable[i]=="\10" then
   li=li+1
  end
 end
 
 return l.cursorPos..textBubble(writeCursor,n).."/"..textBubble(#textTable,n).." "..l.cursorLine..li
end


function bannerDescript_DropDown1()
 local names={"txt ","md  ","lua "}
 
 if mouse.hover=="syntax" then
  return l.syntax..names[syntaxUsed+1]
 end
 
 if tostring(mouse.hover)=="true" then
  mouse.hover=""
 end
 
 return mouse.hover or ""
end


function bannerDescript_DropDown3()
 
 if tostring(mouse.hover)=="true" then
  mouse.hover=""
 end
 
 return mouse.hover or ""
end

