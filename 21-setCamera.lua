#!/usr/bin/env lua


require 'mcpi/minecraft'

function printAvailableCameraModes()
    print("Available camera modes are:\n")
    print("normal, follow, fixed\n")
end

function printUsage()
    print("Usage : lua script.pl normal [entityId]\n")
    print("Usage : lua script.pl follow [entityId]\n")
    print("Usage : lua script.pl fixed Xcoord Ycoord Zcoord\n")
end

-- Create a connection to Minecraft
-- Any communication with the world must use this object
local mc = Minecraft:create()

local minNumOfParams = 1
local numOfParamsGiven = #arg

if (numOfParamsGiven >= minNumOfParams) then

    local cameraMode = arg[1]
    --print cameraMode."\n"
    if cameraMode ==  "follow" then
        if (numOfParamsGiven == 1) then
            mc.camera:setFollow()
        elseif (numOfParamsGiven == 2) then
            mc.camera:setFollow(arg[2])
        else
            print "Expected 1 or 2 parameters but got numOfParamsGiven"
            printUsage()
            os.exit()
        end
    elseif cameraMode ==  "normal" then
        if (numOfParamsGiven == 1) then
            mc.camera:setNormal()
        elseif (numOfParamsGiven == 2) then
            mc.camera:setNormal(arg[2])
        else
            print "Expected 1 or 2 parameters but got numOfParamsGiven"
            printUsage()
            os.exit()
        end
    elseif cameraMode ==  "fixed" then
        if (numOfParamsGiven == 4) then
            --should verify arguments are integer coordinates
            mc.camera:setFixed()
            mc.camera:setPos(arg[2],
                             arg[3],
                             arg[4])
        else
            print("insufficient parameters given. \n")
            print("Require 4 but got numOfParamsGiven\n")
            printUsage()
            os.exit()
        end
     else
            print("Unknown camera mode parameter given ", arg[1])
            printAvailableCameraModes()
            printUsage()
            os.exit()
    end
else
    print("insufficient parameters given\n")
    print("Require minimum of minNumOfParams, got "..numOfParamsGiven.."\n")
    printUsage()
    os.exit()
end
