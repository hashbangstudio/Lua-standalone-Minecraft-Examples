#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/event'
require 'socket'


-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

while(1) do
    hits = mc.events:pollBlockHits()
    local numOfHits = #hits
    --print("numOfHits\n")
    if (numOfHits > 0) then
        for k,v in ipairs(hits) do
            print (v:toString().."\n")
        end
    end
    socket.sleep(1)
end

