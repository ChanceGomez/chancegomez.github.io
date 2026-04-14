local Goblin = {}
Goblin.__index = Goblin


--This is the classes Constructor 
function Goblin.new(x,y,damage,health)
    --This creates an object (the class)
    local obj = setmetatable({},Goblin)
    
    --This is where you can set up the classes variables
    --adding the 'or 5' will create default values if the 
    --variable being passedthrough is nil.
    --Making them local will make these variables private 
    --to the rest of the system
    local damage = damage or 5 
    local health = health or 10

    --Variables declared straight to the object will be public
    obj.x = x or 0
    obj.y = y or 0
    obj.width = 20
    obj.height = 20

    --This is where you would define the getters/setters
    function obj:getDamage()
        return damage
    end

    function obj:setDamage(value)
        damage = value
    end

    function obj:getHealth()
        return health
    end
    
    function obj:setHealth(value)
        health = value
    end

    --This is where you return the obj 
    --It will retain everything that you did in this constructor
    --and will have all the functions associated with this class
    return obj
end

--Methods outside the constructor will be public variables


--This will be the deconstructor
function Goblin:die()
    print("Goblin Died")
    --You can tell the object is no longer alive to get rid of it
    --outside of the class
    self.isAlive = false
end

--This method will be on every instance of goblin
--Using the ':' semicolon will allow you to use the 
--keyword self as the objects variable
function Goblin:takeDamage(damage)
    --Make sure damage in a positive number 
    if type(damage) == "number" or damage > 0 then
        --Using the self variable will only call the objects
        --method
        self:setHealth(self:getHealth() - damage)

        print("Goblin took damage")

        --Check to see if alive
        if self:getHealth() <= 0 then
            self:die()
        end
    end
end

function Goblin:attack()
    print("Goblin Attacked")
    return self:getDamage()
end


return Goblin