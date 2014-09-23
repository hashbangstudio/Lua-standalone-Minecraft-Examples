#!/usr/bin/env lua

require 'math'
require 'socket'
require 'mcpi/minecraft'
require 'mcpi/block'

-- create a function to create a random block of wool
function getWoolBlockWithRandomColour()
    --Generate a random number within the allowed range of colours 0-15
    -- Random num generator is automatically seeded with srand() by lua on first call
    local randomNumber = math.random(0,15)
    print("Random number to be used = "..randomNumber.."\n")
    local block = WOOL():withData(randomNumber)
    return block
end


-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

-- define the position of the bottom left block of the wall
local blockXposn = playerPosition.x + 6
local firstColumnX = blockXposn
local blockYposn = playerPosition.y + 1
local blockZposn = playerPosition.z + 6

-- Create a wall using nested for loops
for row = 1,6 do
    -- increase the height of the current row to be built
    blockYposn = blockYposn + 1
    blockXposn = firstColumnX
    for column = 1,10 do
        --increase the distance along the row that the block is placed at
        blockXposn = blockXposn + 1
        print("Creating block at ("..blockXposn..", "..blockYposn..", "..blockZposn..")\n" )
        -- Create a block
        mc:setBlock(blockXposn, blockYposn, blockZposn, getWoolBlockWithRandomColour())
        socket.sleep(0.5)
    end
end

