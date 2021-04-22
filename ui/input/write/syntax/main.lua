

syntaxTable={}
function getSyntax()
 syntaxTable={}
 syntaxes[syntaxUsed]()
 
end

local path=string.sub(...,1,#...-4)
require(path.."txt")
require(path.."md")
require(path.."lua")


syntaxes={
 [0]=
 syntax_Txt,
 syntax_Md,
 syntax_Lua
}
getSyntax()