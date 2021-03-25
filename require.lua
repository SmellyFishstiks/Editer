local path=""


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
require(path.."dropdown")

path=path.."input/"
require(path.."base")

require(path.."box")
require(path.."banner_box")

require(path.."prompt")