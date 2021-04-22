local path=""

require("tablehelp")
require("shortcuts")

utf8 = require("utf8")


path="lang/"
l=require(path.."english")


path="graphics/"
require(path.."text")
require(path.."sprite")
require(path.."color")


path="ui/"
require(path.."window")
require(path.."banners")
require(path.."banner_info")
require(path.."banner_file")

require(path.."dropdown")

path=path.."input/"
require(path.."base")

require(path.."box")
require(path.."banner_box")

require(path.."prompt")


path=path.."write/"
require(path.."type")
require(path.."comand")
require(path.."arrow")
require(path.."draw")
require(path.."clipboard")

path=path.."syntax/"
require(path.."main")


path="ui/filenav/"
require(path.."iohelp")
