#!/usr/bin/env lua


require 'mcpi/minecraft'
require 'mcpi/block'
require 'socket'

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

-- define the position of the bottom left block of the wall
local blockXposn   = playerPosition.x + 6
local firstColumnX = blockXposn
local blockYposn   = playerPosition.y + 1
local blockZposn   = playerPosition.z + 6

-- id of block to create
local id = 0

-- Create a wall using nested for loops
for row = 1,6 do
    -- increase the height of the current row to be built
    blockYposn = blockYposn + 1
    blockXposn = firstColumnX
    for column = 1,10 do
        --increase the distance along the row that the block is placed at
        blockXposn = blockXposn + 1
        print("Creating block with id = "..id.." at ("..blockXposn..", "..blockYposn..", "..blockZposn..")\n")
        -- Create a block
        -- If the id doesn't exist in the Minecraft world
        -- The message will still be sent but no block will be created
        --mc:setBlock(blockXposn, blockYposn, blockZposn, Block:new(id));--Alternative method
        mc:setBlock(blockXposn, blockYposn, blockZposn, id)
        -- Wait for 0.5 seconds
        socket.sleep(0.5)
        -- increment the id of the block to create
        id = id + 1
    end
end

