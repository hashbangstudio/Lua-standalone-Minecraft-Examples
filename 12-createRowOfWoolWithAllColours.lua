#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

-- define the position of the bottom left block of the wool row
local blockXposn   = playerPosition.x + 6
local blockYposn   = playerPosition.y + 1
local blockZposn   = playerPosition.z + 6

-- for value in the range 0 to 15 inclusive do the enclosed code
for colour = 0,15 do
    --increase the distance along the row that the block is placed at
    blockXposn = blockXposn + 1
    -- _ is a special variable automatically set by perl
    -- it contains the value being used in  the current iteration of the loop
    -- in this case the colour of the wool
    print("Creating block with data "..colour.." at ("..blockXposn..", "..blockYposn..", "..blockZposn..")\n")
    -- Create a block
    mc:setBlock(blockXposn, blockYposn, blockZposn, WOOL():withData(colour))
end

