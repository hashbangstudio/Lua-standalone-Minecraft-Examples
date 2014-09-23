#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'


-- Create a connection to the Minecraft game
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

-- Set coordinates (position) for the block that is slightly away from the player
-- Note y is the vertical coordinate, x and z the horizontal
local blockXposn = playerPosition.x + 1
local blockZposn = playerPosition.z + 1
-- set the y coordinate to be at the height of the world at the (x,z) horisontal coordinate
local blockYposn = mc:getHeight(blockXposn, blockZposn)
local blockToPlace = AIR()
local numOfArgs = #arg
if (numOfArgs == 1 or numOfArgs == 2) then
    --remove any trailing and starting brackets and split on commas
    local blockText = arg[1]
    blockArgs = split("," , blockText)

    local blockId = toInteger(blockArgs[1])
    local blockData = toInteger(blockArgs[2])

    blockToPlace = Block:new(blockId,blockData)
    if (numOfArgs == 2)then
        local coordText = arg[2]
        coords = split(',', coordText)
        --print ("using coords = coords\n")
        --Ensure use integers and not fractional/decimal numbers
        blockXposn = toInteger(coords[1])
        blockYposn = toInteger(coords[2])
        blockZposn = toInteger(coords[3])
    end
else
    print("To place block next to player:\n")
    print("Usage : lua script.pl blockId,blockData\n")
    print("To place block at a specific coordinate\n")
    print("Usage : lua script.pl blockId,blockData x,y,z\n")
    print("Expected 1 or 2 aguments but received "..numOfArgs.."\n")
    os.exit()
end

print ("Placing block at ("..blockXposn..", "..blockYposn..", "..blockZposn..")\n")

mc:setBlock(blockXposn, blockYposn, blockZposn, blockToPlace)

