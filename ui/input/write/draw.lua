function drawText()
 
 textCursor={0, bannerMargin+2, 2, 0}
 
 for i=0,#textTable do
  
  if i~=0 then
   text(textTable[i],nil,nil,"normal",doShowSpacing,nil,doWordWrap)
  end
  
  if i==writeCursor then drawTextCursor() end
  
 end
 
 textCursor[3]=0
end



typeT=0 
typeTLock=false
typeTCursor=1
typeAnimation={
 {[0]='\16','\18','\20','\18'},
 {[0]="-",'\\',"|","/"},
 {[0]="x","+"},
 {[0]='\23','\25','\24','\26'}
}
function drawTextCursor()

 typeT=typeT+1
 local a=floor(typeT/10)%(#typeAnimation[typeTCursor]+1)
 
 local focus= love.window.hasFocus()
 if not focus then if a==0 then typeTLock=true end else typeTLock=false end
 if typeTLock then typeT=typeT-1 end 
 
 if doWrite then
  text(typeAnimation[typeTCursor][a])
 end

end