#!/usr/bin/env lua

require "mcpi/minecraft"

--    First thing you do is create a connection to minecraft
--    This is like dialling a phone.
--    It sets up a communication line between your script and the minecraft world

-- Create a connection to Minecraft
-- Any communication with the world must use this object
mc = Minecraft:create()

-- create the output message as a string from interactive prompt (read a single line)
io.stdout:write("Please enter text to send to the chat :")
message = io.stdin:read("*l")
-- print to the lua interpreter standard output (terminal probably)
print(message.."\n")
-- send message to the minecraft chat
mc:postToChat(message)

