local Player = {

    name = "Character Name",
    level = 0,
    exp = 0,
    nxtLvl = 20,
    hp = 20,
    stats = {
        str = 5,
        def = 5,
        dex = 4,
        lck = 3
    },

    printf = function (self)
        print("Name: "..self.name)
        print("Level: "..self.level)
        print("Exp:"..self.exp)
        print("NxtLvl:"..self.nxtLvl)
        print("Stats:")
        print(" str: "..self.stats.str)
        print(" def: "..self.stats.def)
        print(" dex: "..self.stats.dex)
        print(" lck: "..self.stats.lck)
    end,

    new = function (self, o)
        o = o or {} -- create objet if user does not provide one
        setmetatable(o, self)
        self.__index = self
        return o
    end,

    statUp = function (self, statName, up)
        self.stats[statName] = self.stats[statName] + up
    end,

    lvlUp = function (self)
        if self.exp >= self.nxtLvl then
            self.level = self.level + 1
            io.write(self.name .. " leveled up!\n")
            io.write(self.name .. " is now level: " .. self.level .. "\n")

            io.write("HP: " .. self.hp)
            self.hp = self.hp + 3 + math.random(0, 3)
            io.write(" -> " .. self.hp .. "\n")
            io.write("STR: " .. self.stats.str)
            self:statUp('str', math.random(2, 4) )
            io.write(" -> " .. self.stats.str .. "\n")
            io.write("DEF: " .. self.stats.def)
            self:statUp('def', math.random(2, 4) )
            io.write(" -> " .. self.stats.def .. "\n")
            io.write("DEX: " .. self.stats.dex)
            self:statUp('dex', math.random(2, 4) )
            io.write(" -> " .. self.stats.dex .. "\n")
            io.write("LCK: " .. self.stats.lck)
            self:statUp('lck', math.random(2, 4) )
            io.write(" -> " .. self.stats.lck .. "\n")

            self.exp = self.exp - self.nxtLvl
            self.nxtLvl = self.nxtLvl * self.level 
        end
    end

}

local a1 = {}
Player:new(a1)
a1.exp = 20
a1:printf()
print("TRYING TO DO AN UPDATE HERE!")
a1:lvlUp()
