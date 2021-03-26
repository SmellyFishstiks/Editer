function UIBox_BannerFunc(box)
 
 local menus={
  (function()
  dropDownWindow(
   { {l.syntax,"",syntaxIcons[syntaxUsed],banner_Write_Syntax},
     {l.wordWrap,"",14,banner_Write_WordWrap},
     {l.showSpacing,"",14,banner_Write_ShowSpacing},
     {l.cursorAnimation,"",9,banner_CursorAnimation}
   },
   {UIBox_Banner_GetStretch,box,74})
  end),
  
  (function()
  dropDownWindow(
   { {l.runProject,"Cmd R",10},
     {l.toggleDebugger,"",15}
   },
   {UIBox_Banner_GetStretch,box,74})
  end),
  
  (function()
  dropDownWindow(
   { {l.openFolder,"",11},
     {l.save,"Cmd S",13},
     {l.newFile,"Cmd N",9}
   },
   {UIBox_Banner_GetStretch,box,74})
  end),
  
  (function()
  dropDownWindow(
   { {l.leave,"",12,banner_Quit} },
   {UIBox_Banner_GetStretch,box,74})
  end)
  
 }
 
 if doDropDown~=box.groupID then
  doDropDown=box.groupID
  dropDownPos=-8
  dropDownMenu=menus[doDropDown]
 end
 
end


function UIBox_Banner_GetStretch(box,i)
 local bx=bannerGetStretch()
 
 local r,b=16,20
 if bx<8 then r,b=10,0 end
 if bx<-12 then r,b=9,-8 end
 local i=false
 if not i then i=box.groupID end
 
 local x=i*r+bx*2-b
 local y=0
 
 return x,y
end


syntaxUsed=0
syntaxIcons={[0]=13,16}
function banner_Write_Syntax()
 
 syntaxUsed=(syntaxUsed+1)%(#syntaxIcons+1)
 mouse.click[1]=false
 
end

doWordWrap=false
function banner_Write_WordWrap()
 doWordWrap=not doWordWrap
 mouse.click[1]=false
end

doShowSpacing=false
function banner_Write_ShowSpacing()
 doShowSpacing=not doShowSpacing
 mouse.click[1]=false
end

function banner_CursorAnimation()
 typeTCursor=(typeTCursor%#typeAnimation)+1
 mouse.click[1]=false
end


doPrompt=false
function banner_Quit()
 state=1
 doPrompt=true
 doWrite=false
 PromptMenu=(function()
  dropDownWindow(
   { {l.quitProgram[1],"",nil,dummyPromptChoice,true},
     {l.quitProgram[2],"",nil,dummyPromptChoice,true},
     {l.quitProgram[3],"",nil,dummyPromptChoice,true},
     {l.promptYes,"",6,(function() doQuit=false love.event.quit() end)},
     {l.promptNo,"",7, (function() doPrompt=false state=0 end)}
   },
   {quitGetStretch,box,-61,bannerMargin+4})
  end)
end

function quitGetStretch()
 local wx=getWindowSize()
 
 return wx
end


