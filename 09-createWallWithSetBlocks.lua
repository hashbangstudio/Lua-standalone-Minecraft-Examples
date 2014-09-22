#!/usr/bin/env lua

require 'mcpi/minecraft'
require 'mcpi/block'

--    First thing you do is create a connection to minecraft
--    This is like dialling a phone.
--    It sets up a communication line between your script and the minecraft world

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

-- Get the player position
local playerPosition = mc.player:getTilePos()

local wallStartXposn = playerPosition.x + 6
local wallStartYposn = playerPosition.y + 1
local wallZposn      = playerPosition.z + 6

local wallEndXposn = wallStartXposn + 10
local wallEndYposn = wallStartYposn + 6

-- Create a wall
mc:setBlocks(wallStartXposn , wallStartYposn, wallZposn,
               wallEndXposn,    wallEndYposn,   wallZposn,
               DIAMOND_BLOCK())
               
