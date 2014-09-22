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

local row = 0
local column = 0

-- Create a wall using nested for loops
for row = 1,6 do
    -- increase the height of the current row to be built
    blockYposn = blockYposn + 1
    blockXposn = firstColumnX
    
    for column = 1,10 do
        --increase the distance along the row that the block is placed at
        blockXposn = blockXposn + 1
        print("Creating block at ("..blockXposn..", "..blockYposn..", "..blockZposn..") \n")
        -- Create the block
        if ((row == 3) and (column == 3))then
            -- create the Glowing obsisian block only on 3rd row in 3rd column
            mc:setBlock(blockXposn, blockYposn, blockZposn, GLOWING_OBSIDIAN())
        else
            mc:setBlock(blockXposn, blockYposn, blockZposn, DIAMOND_BLOCK())
        end
        --wait for 0.5 seconds
        socket.sleep(0.5)
    end
end

