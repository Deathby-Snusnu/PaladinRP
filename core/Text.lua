local _, addon = ...
local GREATER_PREFIX = "GREATER_"

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then
        return nil
    end
    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= ""
            and (targetName or not text:find("%s", 1, true)) then
            usable[#usable + 1] = text
        end
    end
    if #usable == 0 then
        return nil
    end
    local text = usable[math.random(#usable)]
    return (text:gsub("%%s", function() return targetName end))
end

local function GetTargetName()
    if not UnitExists("target") then
        return nil
    end
    return UnitName("target")
end

function addon.GetTextPool(emote)
    local personalTexts = addon.db.personalTexts
    if personalTexts and personalTexts[emote] then
        return personalTexts[emote]
    end

    -- Präfixauflösung steht bewusst vor den rassenspezifischen Pools.
    if string.sub(emote, 1, #GREATER_PREFIX) == GREATER_PREFIX then
        local greaterEmote = string.sub(emote, #GREATER_PREFIX + 1)
        if addon.GreaterBlessings[greaterEmote] then
            return addon.GreaterBlessings[greaterEmote]
        end
    end

    local _, race = UnitRace("player")
    if race == "Scourge" then
        race = "Undead"
    end
    if addon.Racial[race] and addon.Racial[race][emote] then
        return addon.Racial[race][emote]
    end

    -- Reihenfolge erhält auch die vorhandenen Namenskollisionen.
    for _, pools in ipairs({
        addon.Blessings, addon.GreaterBlessings, addon.Auras,
        addon.Seals, addon.Abilities,
    }) do
        if pools[emote] then
            return pools[emote]
        end
    end
    return nil
end

function addon.BuildRPText(emote)
    local pool = addon.GetTextPool(emote)
    if type(pool) ~= "table" then
        return nil
    end

    local targetName = GetTargetName()
    if #pool > 0 then
        return ChooseText(pool, targetName)
    end

    if targetName and type(pool.ziel) == "table" and #pool.ziel > 0 then
        return ChooseText(pool.ziel, targetName)
    end
    return ChooseText(pool.gruppe, targetName)
end
