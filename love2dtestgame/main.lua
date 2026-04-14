Goblin = require("Classes.Goblin")
BigGoblin = require("Classes.BigGoblin")

--This is where you would get an object
Bob = Goblin.new(100,100)
BigBob = BigGoblin.new(60,100)

--If we tell bob to attack BigBob we would do it like this
--it will get the damage from Bob and put it into big bobs take damage call
BigBob:takeDamage(Bob:getDamage())
print("BigBob's health",BigBob:getHealth()) 

--Now if bigbob attacks bob we would do it vise versa
Bob:takeDamage(BigBob:getDamage())    

--Now check if Bob is still alive
if Bob.isAlive == false then
    Bob = nil
end
