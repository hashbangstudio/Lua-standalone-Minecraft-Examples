#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'
require 'blockData'

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

local xPos = 0
local yPos = 0
local zPos = 0

local numOfArgs = #arg
if (numOfArgs == 3)then
        xPos = toInteger(arg[1])
        yPos = toInteger(arg[2])
        zPos = toInteger(arg[3])
elseif(numOfArgs == 2) then
     xPos = toInteger(arg[1])
     zPos = toInteger(arg[2])
     --Get the block that would be stood on at this Horiz posn
     yPos = mc:getHeight(xPos, zPos) - 1

else
    print("Number of arguments incorrect \n")
    print("Expected 2 or 3 arguments but got numOfArgs \n")
    print("Usage with 3 args: lua script.pl xcoord ycoord zcoord\n")
    print("Usage with 2 args: lua script.pl xcoord zcoord\n")
    os.exit()
end

-- Get the type of block for the highest point in world
-- This is done at the horizonal player posn
local blockAndData = mc:getBlockWithData(xPos, yPos , zPos)

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

