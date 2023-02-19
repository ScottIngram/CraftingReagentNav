local MY_NAME, MY_GLOBALS = ...

-- /dump C_TradeSkillUI.OpenRecipe(310526)
-- DevTools_Dump({"fun","yay"})
-- Blizzard_ProfessionsRecipeList -> OnSelectionChanged(o, elementData, selected)

MY_GLOBALS.DEBUG = {}
local DEBUG = MY_GLOBALS.DEBUG
DEBUG.OFF = true

function DEBUG.dump(...)
    if (DEBUG.OFF) then return end
    DevTools_Dump(...)
end

function DEBUG.print(...)
    if (DEBUG.OFF) then return end
    print(...)
end

function DEBUG.getName(self,default)
    if(self and self.GetName) then
        return self:GetName() or default or "UNKNOWN"
    end
    return default or "UNNAMED"
end

function DEBUG.messengerForEvent(eventName,action)
    return function(self)
        if (DEBUG.OFF) then return end
        print(DEBUG.getName(self,eventName).." was "..action.."! ")
    end
end

function DEBUG.run(callback)
    if (DEBUG.OFF) then return end
    callback()
end

function DEBUG.dumpKeys(obj)
    if (DEBUG.OFF) then return end
    pcall(function(object)
        for k, v in pairs(object or {}) do
            DEBUG.print((k or "nil").." <-> "..(v or "nil"))
        end
    end, obj)
end
