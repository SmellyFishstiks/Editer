
function banner_Open_Folder(arg)
 state=1
 doPrompt=true
 doDropDown=false
 mouse.click[1]=false
 
 -- directory stuff
 local directory=io.home().."/directoryTest"
 local items=io.list(directory)
 local ignore={
  ".",
  "..",
  ".DS_Store",
  ".localized"
 }
 
 -- get items for dropdownWindow
 local t={}
 for i=1,#items do
  
  local f=true
  for j=1,#ignore do
   if items[i]==ignore[j] then
    f=false
   end
  end
  
  if f or showHiddenFiles then
   local fileType=getFileType(directory.."/"..items[i])
   t[#t+1]={
    items[i],"",
    getFileSprite(fileType),{banner_OpenFile,items[i]}
   }
  end
  
 end
 
 
 -- failsafe if empty directory
 if #t==0 then
  t={ {"Empty directory!","",8,dummyPromptChoice,0,true} }
 end
 
 
 PromptMenu=(function()
  dropDownWindow(
  t,
  {UIBox_Banner_GetStretch,arg[1],74})
 end)
 
end



function banner_OpenFile(file)
 
 local directory=io.home().."/directoryTest"
 
 io.input(directory.."/"..file)
 local data = io.read("*all")
 
 fileReadContents(data)
 
 state=0
 doPrompt=false
 doDropDown=false
end



showHiddenFiles=false
function banner_ShowFolderItems()
 showHiddenFiles=not showHiddenFiles
 mouse.click[1]=false

end

