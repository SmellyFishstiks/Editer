

 pageID=1
 pageIDTable={
  {"078aaa","105666","003140","1b1c3e"},
  
  {"d93239","a21f3b","40000","400040"}
 } 
bannerIcons={
 {1},
 {2},
 {3},
 {4}
}

bannerMargin=12


function pageBackground()
 
 --love.graphics.clear()
 
 local b=bannerMargin
 
 local x,y=bannerGetStretch()
 setColor(pageIDTable[pageID][3])
 
 love.graphics.rectangle("fill",0,b,(window.ogx+x+1)*2,144+y*2-b*2)
 
 local r=16
 for i=0,144+y*2-b do
  setColor(pageIDTable[pageID][4],floor(i/r)/((144-b+y*2)/r))
  love.graphics.line(0, b+i-1, (window.ogx+x+1)*2, b+i-1)
 end
 
 setColor("ffffff")
end

function mainBanners()
 
 local x,y=bannerGetStretch()
 setColor(pageIDTable[pageID][1])
 love.graphics.rectangle("fill",0,0,(window.ogx+x+1)*2,bannerMargin)
 love.graphics.rectangle("fill",0,144+y*2-bannerMargin,(window.ogx+x+1)*2,bannerMargin)
 
 local r=#tostring((#textLineMem-1))
 for i=1,2 do
  setColor("000005",1/(i*8+15))
  love.graphics.line(lineBannerMargin*r, bannerMargin+i, (window.ogx+x+1)*2, bannerMargin+i)
 end
 
 setColor("ffffff")
 
 for i=0,4 do
  sprite(i+1,i*8+2,2)
 end
 
 local r,b=16,20
 if x<8 then r,b=10,0 end
 if x<-12 then r,b=9,-8 end
 for i=1,#bannerIcons do
  local y=0
  if doDropDown==i then y=1 end
  sprite(bannerIcons[i][1]+8, 74+i*r+x*2-b, 2+y)
 end
 
end




function bannerGetStretch()
 local wx,wy=getWindowSize()
 
 local x=wx-window.ogx
 local y=wy-window.ogy
 return x,y
end

