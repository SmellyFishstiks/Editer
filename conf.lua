-- conf file!

version="v1"

window={
 ogx=64,
 ogy=72,
 ogp=10,
}

OSinfo="macosx"

function love.conf(t)
 t.version = "11.3"
 t.window.title = "Editer Test "..version
 t.window.width =  window.ogx*window.ogp
 t.window.height = window.ogy*window.ogp
 t.window.x=400
 t.window.y=50
 t.window.highdpi = true
 
 t.window.resizable=true
 
 t.window.minwidth=window.ogx*7-7
 t.window.minheight=window.ogy*4
 
end

function resetWindow(width, height)
 
 width, height = width or window.ogx*window.ogp, height or window.ogy*window.ogp
 
 local _,_,f=love.window.getMode()
 local x,y=f.x,f.y
 love.window.setMode(width, height, {x=x,y=y} )

end