#!/usr/bin/env lua


require 'mcpi/minecraft'

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

allIds = mc:getPlayerEntityIds()
local message = ""
-- create the output message as a string
for k, id in ipairs(allIds) do
    message = "id is "..id
    -- print to the lua interpreter standard output (terminal probably)
    print(message)
    -- send message to the minecraft chat
    mc:postToChat(message)
end
