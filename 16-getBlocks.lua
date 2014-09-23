#!/usr/bin/env lua

-- We have to import the minecraft api module to do anything in the minecraft world
require 'mcpi/minecraft'
require 'mcpi/block'
require 'blockData'

--
--             NOTE THAT THE getBlocks() FUNCTION IS BUGGED IN THE API
--             THIS EXAMPLE WILL NOT WORK
--

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the current tile/block that the player is located at in the world
local playerPosition = mc.player:getTilePos()

local height = mc:getHeight(playerPosition.x, playerPosition.z)
-- create the output message as a string
local message = " height is "..height

-- Get the type of block for the highest point in world at horiz player posn
local blocksInCuboid = mc:getBlocks(playerPosition.x, height, playerPosition.z,
                              playerPosition.x + 10, height, playerPosition.z + 10)

print(blocksInCuboid)

-- print to the lua interpreter standard output (terminal probably)
print(message)

-- send message to the minecraft chat
mc:postToChat(message);
