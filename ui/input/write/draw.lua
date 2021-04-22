function drawText()
 
 if writeUpdate then
  getSyntax()
  writeUpdate=false
 end
 
 local r=#tostring((#textLineMem))
 textCursor={0, bannerMargin+2, lineBannerMargin*r+2, 0}
 
 for i=0,#textTable do
  
  if i~=0 then
   
   local mode,color,shake=syntaxTable[i][1],syntaxTable[i][2],nil
   
   if mode=="shake" then shake=i mode="normal" end
   setColor(color)
   text(textTable[i], nil, nil, mode, doShowSpacing, shake, doWordWrap)
  end
  
  setColor("ffffff")
  if i==writeCursor then drawTextCursor() end
  
 end
 
 textCursor[3]=0
 
 if lineBannerMargin~=0 then
  drawTextLines()
 end
end



typeT=0 
typeTLock=false
typeTCursor=1
typeAnimation={
 {[0]='\16','\18','\20','\18'},
 {[0]="-",'\\',"|","/"},
 {[0]="x","+"},
 {[0]='_','_','_',' '}
}
function drawTextCursor()
 typeT=typeT+1
 local a=floor(typeT/10)%(#typeAnimation[typeTCursor]+1)
 
 local focus= love.window.hasFocus()
 if not focus then if a==0 then typeTLock=true end else typeTLock=false end
 if typeTLock then typeT=typeT-1 end 
 
 if doWrite then
  
  if syntaxTable[writeCursor+1] then
   setColor(syntaxTable[writeCursor+1][2])
  else
   setColor("ffffff")
  end
  text(typeAnimation[typeTCursor][a])
 end

end





lineBannerMargin=0
textLineMem={}
function drawTextLines()
 
 local b=bannerMargin
 
 local d,dx,h,str = 0, 0, 8, ""
 textLineMem={ {"1",0,8} }
 
 for i=1,#textTable do
  local a,c=6,textTable[i]
  if unicodeCheck(c) then a=8 end
  dx=dx+a
  
  if c=='\10' then
   d,dx,str = d+8, 0, tostring(#textLineMem+1)
   
   textLineMem[#textLineMem+1]={str,d,h}
   textLineMem[#textLineMem][3]=8
   h=8
  end
  if doWordWrap and dx>getWindowSize()*2-(lineBannerMargin+6) then
   h,d,dx = h+8, d+8, 0
   
   textLineMem[#textLineMem][3]=h
  end
  
 end
 


 local l=1
 for i=1,writeCursor do
  if textTable[i]=="\10" then
   l=l+1
  end
 end
 
 local r=#tostring((#textLineMem))
 local p=0
 for i=1,#textLineMem do
  
  setColor(pageIDTable[pageID][2])
  
  if l==i and doWrite then setColor(pageIDTable[pageID][1]) end
  
  local y=textLineMem[i][2]
  local h=textLineMem[i][3]
  love.graphics.rectangle("fill", 0,b+y,lineBannerMargin*r,h)
 end
 
 setColor("ffffff")
 for i=1,#textLineMem do
  local a=1
  if l==i and doWrite then a=2 end
  text(textLineMem[i][1],0,textLineMem[i][2]+a+bannerMargin)
 end
end



