#!/usr/bin/env lua

require 'mcpi/minecraft'

--arg is a list of the command line arguments given
local numOfArguments = #arg

if (numOfArguments == 2)then
    -- Create a connection to Minecraft
    -- Any communication with the world must use this object
    local mc = Minecraft:create()

    local playerPosition = mc.player:getPos()

    --create a message to send
    --format the output so that is one decimal place
    local message = string.format("You are at (%.1f, %.1f, %.1f)", playerPosition.x, playerPosition.y, playerPosition.z)
    print("message\n")
    -- send message to the minecraft chat
    mc:postToChat(message)

    -- Set variables for the new position
    local newXpos = arg[1]
    local newZpos = arg[2]

    -- Set y position to be the height of the world so not in middle of a block
    local newYpos =  mc:getHeight(newXpos, newZpos)

    -- Set the position of the player
    mc.player:setPos(newXpos, newYpos, newZpos)
    -- Get the current position that the player is located at in the world
    playerPosition = mc.player:getPos()
    --format the output so that is one decimal place
    message = string.format("You have been moved to (%.1f, %.1f, %.1f)", playerPosition.x, playerPosition.y, playerPosition.z)
    print (message.."\n")
    -- send message to the minecraft chat
    mc:postToChat(message)

else
    print("Expected two values arguments for script, but received "..numOfArguments.."\n")
    print("Usage: lua script.lua xCoord zCoord\n")
    print("Example usage: lua script.lua 9.2 8.5\n")
    os.exit()
end

