local BigGoblin = {}
BigGoblin.__index = BigGoblin

--This is where you set the parent class
setmetatable(BigGoblin,{__index = Goblin})


--This will be the constructor for the child class
function BigGoblin.new(x,y,damage,health)
    --This gets the parent class object
    --You pass through variables to the parent class
    --You can also use the 'or' in the constructor to add the default values
    local obj = Goblin.new(x,y,damage or 20,health or 30)

    --This is where you can change variables
    obj.width = 40
    obj.height = 40

    return setmetatable(obj,BigGoblin)
end

--If you want to write over the parents class method you can do so
function BigGoblin:takeDamage(damage)
    --Make sure damage in a positive number 
    if type(damage) == "number" or damage > 0 then
        --Using the self variable will only call the objects
        --method
        self:setHealth(self:getHealth() - damage)

        print("Big Goblin took damage")

        --Check to see if alive
        if self:getHealth() <= 0 then
            self:die()
        end
    end
end


return BigGoblin