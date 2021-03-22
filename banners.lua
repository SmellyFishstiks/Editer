

 pageID=1
 pageIDTable={
  {"078aaa","078a5a","003140","1b1c3e"},
  {"078aaa","078a5a","001020","000b2e"},
  {"d93239","a21f3b","40000","400040"}
 } 
bannerIcons={
 {1},
 {2},
 {3},
 {4}
}


function pageBackground()
 
 local x,y=bannerGetStretch()
 setColor(pageIDTable[pageID][3])
 
 love.graphics.rectangle("fill",0,12,(window.ogx+x+1)*2,120+y*2)
 
 local r=1
 for i=1,121+y*2 do
  setColor(pageIDTable[pageID][4],floor(i/r)/((120+y*2)/r))
  love.graphics.line(0,11+i,(window.ogx+x+1)*2,11+i)
 end
 
 setColor("ffffff")
end

function mainBanners()
 
 local x,y=bannerGetStretch()
 setColor(pageIDTable[pageID][1])
 love.graphics.rectangle("fill",0,0,(window.ogx+x+1)*2,12)
 love.graphics.rectangle("fill",0,132+y*2,(window.ogx+x+1)*2,12)
 setColor("ffffff")
 local str="Editer"
 if x>-6 then str=str.." "..version end
 text(str,2,2)
 if x<8 and x>-2 then
  love.graphics.rectangle("fill",80,1,3,10)
 end
 
 local r,b=16,20
 if x<8 then r,b=10,0 end
 if x<-12 then r,b=9,-8 end
 for i=1,#bannerIcons do
  sprite(bannerIcons[i][1], 74+i*r+x*2-b, 2)
 end
 
end




function getwindowsize()
 local x,y = love.graphics.getDimensions()
 x=ceil(x/window.ogp)
 y=ceil(y/window.ogp)
 return x,y
end

function bannerGetStretch()
 local wx,wy=getwindowsize()
 
 local x=wx-window.ogx
 local y=wy-window.ogy
 return x,y
end