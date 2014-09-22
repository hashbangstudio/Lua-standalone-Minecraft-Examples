#!/usr/bin/env lua

require "mcpi/minecraft"

mc = Minecraft:create()
pos = mc.player:getTilePos()
mc:postToChat(string.format("You are at ( %d, %d, %d)", pos.x, pos.y, pos.z))

