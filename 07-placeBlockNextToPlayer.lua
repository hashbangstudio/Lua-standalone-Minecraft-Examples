#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'

--    First thing you do is create a connection to minecraft
--    This is like dialling a phone.
--    It sets up a communication line between your script and the minecraft world

-- Any communication with the world must use this object
-- Create a connection to the Minecraft game
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

-- define the position of the block
local blockXposn = playerPosition.x + 1
local blockYposn = playerPosition.y + 1
local blockZposn = playerPosition.z + 1


local message = "Creating block at ("..blockXposn..", "..blockYposn..", "..blockZposn..")\n"

print(message)
-- Create a block
mc:setBlock(blockXposn, blockYposn, blockZposn, DIAMOND_BLOCK())

