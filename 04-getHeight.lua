#!/usr/bin/env lua

require 'mcpi/minecraft'

--    First thing you do is create a connection to minecraft
--    This is like dialling a phone.
--    It sets up a communication line between your script and the minecraft world

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Set default values for horizontral coordinates
local xPos = 0
local zPos = 0

-- Check that have the appropriate number of command line arguments
--arg is a list of the command line arguments given
-- It is not zero indexed (the first element is at index 1)
local numOfArguments = #arg

if (numOfArguments == 2) then
   xPos = toInteger(arg[1])
   zPos = toInteger(arg[2])

elseif (numOfArguments == 0) then
   --just use the player position
   local playerPos = mc.player:getTilePos()
   xPos = toInteger(playerPos.x)
   zPos = toInteger(playerPos.z)

else
    print("Expected either none or two values as arguments for script, but received "..numOfArguments.."\n")
    os.exit()
end

print ("getting height at ("..xPos..", "..zPos..")")
local height = mc:getHeight(xPos, zPos)
local message = "Height of world is "..height.." at ("..xPos..", "..zPos..")"
print ("\n"..message.."\n")
-- send message to the minecraft chat
mc:postToChat(message)

