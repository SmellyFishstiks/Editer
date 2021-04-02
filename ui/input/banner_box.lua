function UIBox_BannerFunc(box)
 
 local menus={
  (function()
  dropDownWindow(
   { {l.syntax,"",syntaxIcons[syntaxUsed],banner_Write_Syntax},
     {l.wordWrap,"",14,banner_Write_WordWrap},
     {l.showSpacing,"",14,banner_Write_ShowSpacing},
     {l.textLine,"",9,banner_TextLine},
     {l.cursorAnimation,tostring(typeTCursor),9,banner_CursorAnimation},
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
syntaxIcons={[0]=13,18,16}
function banner_Write_Syntax()
 
 syntaxUsed=(syntaxUsed+1)%(#syntaxIcons+1)
 mouse.click[1]=false
 writeUpdate=true
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
 
 -- add change to name here.
end

doLineBannerSlec=false
function banner_TextLine()
 doLineBannerSlec=not doLineBannerSlec
 
 if doLineBannerSlec then
  lineBannerMargin=6
 else
  lineBannerMargin=0
 end
 mouse.click[1]=false
end


doPrompt=false
function banner_Quit()
 state=1
 doPrompt=true
 doWrite=false
 
 local anwsers={l.promptYes,l.promptNo}
 math.randomseed(os.time())
 local rng=math.random(1,32)
 if rng==1 then
  anwsers[2]=l.promptNotSure
 end
 doDropDown=false
 
 PromptMenu=(function()
  dropDownWindow(
   { {l.quitProgram[1],"",nil,dummyPromptChoice,true},
     {l.quitProgram[2],"",nil,dummyPromptChoice,true},
     {l.quitProgram[3],"",nil,dummyPromptChoice,true},
     {anwsers[1],"",6,(function() doQuit=false love.event.quit() end)},
     {anwsers[2],"",7, (function() doPrompt=false state=0 end)}
   },
   {quitGetStretch,box,-61,bannerMargin+4})
  end)
end

function quitGetStretch()
 local wx=getWindowSize()
 
 return wx
end


