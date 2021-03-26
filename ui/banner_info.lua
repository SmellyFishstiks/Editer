

function bannerDescript()
 
 local str=""
 
 if state==0 then
  
  if doWrite then
   str=bannerDescript_Write()
  end
  
  if doDropDown==1 then
   str=bannerDescript_DropDown1()
  end
  
 end
 
 
 local _,y=getWindowSize()
 text(str,3,y*2-9)
end



function bannerDescript_Write()
 local n=#tostring(#textTable)
 return "p"..textBubble(writeCursor,n).."l"..textBubble(#textTable,n)
end


function bannerDescript_DropDown1()
 local names={"txt ","lua "}
 local b1,b2=getChar(doWordWrap,1),getChar(doShowSpacing,1)
 return names[syntaxUsed+1].."wrp_"..b1.." shw_"..b2.." csr"..typeTCursor
end