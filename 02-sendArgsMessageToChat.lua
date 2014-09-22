#!/usr/bin/env lua

require "mcpi/minecraft"

--    First thing you do is create a connection to minecraft
--    This is like dialling a phone.
--    It sets up a communication line between your script and the minecraft world

-- Create a connection to Minecraft
-- Any communication with the world must use this object
mc = Minecraft:create()

-- Check that have the appropriate number of command line arguments (one in this case)
-- arg is a list of the command line arguments given
numOfArguments = #arg

if (numOfArguments == 1)then
    -- create the output message as a string
    message = arg[1]
    -- print to the lua interpreter standard output (terminal probably)
    print(message.."\n")
    -- send message to the minecraft chat
    mc:postToChat(message)
else
        print("Expected only one string as argument for script, but received "..numOfArguments.."\n")
end

