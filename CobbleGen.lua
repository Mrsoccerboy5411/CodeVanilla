local robot = require("robot")
local component = require("component")
local crafting = component.crafting

function craft()
    --clear inventory
    for i=1,16 do
        robot.select(i)
        robot.dropDown()
    end

    --pulls 3 cobblestone
    robot.select(1)
    robot.suckDown(3)
    robot.transferTo(2, 1)
    robot.transferTo(3, 1)

    --pulls 2 sticks
    robot.select(6)
    robot.suckUp(2)
    robot.transferTo(10, 1)

    --craft and equip the new pick
    robot.select(1)
    crafting.craft()
    robot.turnRight()  --places pick in hopper, due to equip requiring special components
    robot.drop()
    robot.turnLeft()
end

function mineCobble()
    robot.swing()
    os.sleep(3)
end


while true do
    if (robot.durability() == nil) 
    then
        craft()
    else
        mineCobble()
    end
end




