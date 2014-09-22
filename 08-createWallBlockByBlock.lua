#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'
require 'socket'


-- Create a connection to the Minecraft game
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

-- define the position of the first block
local blockXposn = playerPosition.x + 6
local firstColumnX = blockXposn
local blockYposn = playerPosition.y + 1
local blockZposn = playerPosition.z + 6

--For all the values (rows) 1,2,3,4,5,6 do the enclosed code block
for row = 1,6 do
    -- increase the height of the current row to be built
    blockYposn = blockYposn + 1; 
    blockXposn = firstColumnX
    --for all the values (columns) 1,2,3,4,5,6,7,8,9,10 do the enclosed code block
    for column = 1,10 do
        --increase the distance along the row that the block is placed at
        blockXposn = blockXposn + 1
        print("Creating block at ("..blockXposn..", "..blockYposn..", "..blockZposn..")\n")
        -- Create a block
        mc:setBlock(blockXposn, blockYposn, blockZposn, DIAMOND_BLOCK())
        -- NOTE this is a hack/bodge using the luasocket library as Lua does not have a sleep function
        -- alternatively could do a shell command or other libraries
        socket.sleep(0.5)
    end
end

