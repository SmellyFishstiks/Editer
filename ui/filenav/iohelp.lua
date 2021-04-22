-- shitty tiny library for getting the home dirc of your OS and listing things out using your shell's list function!
assert(love.system,"Hey you need love.system for this!")

-- set method and home
local osinfo =love.system.getOS()

io.listMethod="?"
local listCommands={}
listCommands["OS X"]="ls -a -f"
listCommands["Windows"]="dir"
io.listMethod=listCommands[osinfo] or error("Unsupported OS (no method!) :0")

io.listHome="?"
local homes={}
homes["OS X"]="Desktop"
homes["Windows"]="?"
io.listHome = homes[osinfo] or error("Unsupported OS (no home!) :0")



-- io.list so I can list my stuffs out :1
function io.list(path)
 local t, items = {}, io.popen(io.listMethod..[[ "]]..path..[["]])
 for name in items:lines() do
  t[#t+1]=name
 end
 items:close()
 
 return t
end

-- get the home!
function io.home()
 return os.getenv("HOME").."/"..io.listHome
end