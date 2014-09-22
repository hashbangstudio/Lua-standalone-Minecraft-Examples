#!/usr/bin/env lua

require 'math'
require 'mcpi/minecraft'

--    First thing you do is create a connection to minecraft
--    This is like dialling a phone.
--    It sets up a communication line between your script and the minecraft world

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

local playerPos = mc.player:getTilePos()


local message = "You are at ("..playerPos.x..", "..playerPos.y..", "..playerPos.z..")"
print (message.."\n")
-- send message to the minecraft chat
mc:postToChat(message)

-- Set initial values for amount to shift horizontral coordinates by
-- rand() creates a number between 0 and 1 less than number given (defaults to 1 if none given) 
local xShift = math.random(-10, 10)
local zShift = math.random(-10, 10)

-- Set variables for the new position
local newXpos = playerPos.x + xShift
local newZpos = playerPos.z + zShift

-- Set y position to be the height of the world so not in middle of a block
local newYpos =  mc:getHeight(newXpos, newZpos)

-- Set the position of the player
mc.player:setTilePos(newXpos, newYpos, newZpos)

playerPos = mc.player:getTilePos()

message = "You have been moved to ("..playerPos.x..", "..playerPos.y..", "..playerPos.z..")"

print (message.."\n")
-- send message to the minecraft chat
mc:postToChat(message)

