

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
 
 local l=1
 for i=1,writeCursor do
  if textTable[i]=="\10" then
   l=l+1
  end
 end
 
 return "pos "..textBubble(writeCursor,n).."/"..textBubble(#textTable,n).." lin "..l
end


function bannerDescript_DropDown1()
 local names={"txt ","md  ","lua "}
 local b1,b2,b3=getChar(doWordWrap,1),getChar(doShowSpacing,1),getChar(doLineBannerSlec,1)
 return names[syntaxUsed+1].."wrp_"..b1.." shw_"..b2.." lin_"..b3--" csr"..typeTCursor
end