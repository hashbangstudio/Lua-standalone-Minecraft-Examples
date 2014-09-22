#!/usr/bin/env lua

require "mcpi/minecraft"

mc = Minecraft:create()
exactPos = mc.player:getPos()
mc:postToChat(string.format("You are at ( %.2f, %.2f, %.2f)", exactPos.x, exactPos.y, exactPos.z))

