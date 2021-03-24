-- conf file!

version="v2"

window={
 ogx=64,
 ogy=72,
 ogp=10,
}

function love.conf(t)
 t.version = "11.3"
 t.window.title = "Editer Test "..version
 t.window.width =  window.ogx*window.ogp
 t.window.height = window.ogy*window.ogp
 t.window.x=400
 t.window.y=50
 t.window.highdpi = true
 
 t.window.resizable=true
 
 t.window.minwidth=window.ogx*6.5-7
 t.window.minheight=window.ogy*4
 
end