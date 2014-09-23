#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'
require 'blockData'

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the current tile/block that the player is located at in the world
local playerPosition = mc.player:getTilePos()

local height = mc:getHeight(playerPosition.x, playerPosition.z)
-- create the output message as a string
local message = "Height is "..height

-- print to the lua interpreter standard output (terminal probably)
print(message.."\n")

-- send message to the minecraft chat
mc:postToChat(message)

-- Get the type of block for the highest point in world
-- This is done at the horizonal player posn
local blockAndData = mc:getBlockWithData(playerPosition.x, height , playerPosition.z)

if (blockAndData.id == AIR().id) then
     -- Need to do height minus one for this as not flower etc
     blockAndData = mc:getBlockWithData(playerPosition.x, height -1 , playerPosition.z)
end

local blockName = getBlockNameFromId(blockAndData.id)
-- Add to message, the type of block stood on
message = "Block is of type "..blockAndData.id.." which is "..blockName

-- print to the lua interpreter standard output (terminal probably)
print(message.."\n")

-- send message to the minecraft chat
mc:postToChat(message)

local dataMessage = "Block data is "..blockAndData.data
print(dataMessage.."\n")
mc:postToChat(dataMessage)


if (blockAndData.id == WOOL().id) then
    print("Is Wool Block - ")
    for colour, dataNum in pairs(colourNameToId) do
        if (dataNum == blockAndData.data) then
            local colMsg = "Colour is "..colour
            print(colMsg.."\n")
            mc:postToChat(colMsg)
        end
    end
end
