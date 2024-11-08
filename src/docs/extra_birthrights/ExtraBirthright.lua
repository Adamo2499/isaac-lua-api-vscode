---@class ExtraBirthright
_G.ExtraBirthright = {}

---@alias CallbackID ModCallbacks | string

---Return modded or vanilla birthright id (to track modded and combined modes).
---@param option number # Value between 1 and 3 (5 with "extra" set to true). Usually 1 is for vanilla, 2 is for modded effect only, 3 for combined.
---@param extra boolean # Makes that character has 2 modded effects (2 and 3) and 2 combined effects (4 and 5).
function ExtraBirthright.GetOptionsBirthright(option, extra)
end

---Add Mod Config Menu value for modded character (although you can do it in your mod if you want).
---@param PlayerType PlayerType # Modded charcter ID
---@param name string #Name of modded character. Add 'Tainted' at the beginning for tainted character.
---@param extra boolean # If set to true, character get extra modded effect
---@param label string # Explanation of what modded effects are doing in MCM.
---@param splash1 string # Splash text that appears when picking up birthright. (cuurently in English, Russian, Spanish)
---@param firstEID any # EID for modded effect (cuurently in English, Russian, Spanish)
---@param splash2 string # Splash text that appears when picking up birthright.if second modded effect is selected (cuurently in English, Russian, Spanish)
---@param secondEID any # EID for second modded effect (cuurently in English, Russian, Spanish)
function ExtraBirthright.AddCustomEffectsMCM(PlayerType, name, extra, label, splash1, firstEID, splash2, secondEID)
end

---Get current Mod Config Menu setting value of character.
---@param ptype PlayerType
---@return int
function ExtraBirthright.GetMCMValue(ptype)
end

--- Remove MCM settings, EID and splash text of character with that name
---@param name PlayerType
function ExtraBirthright.RemoveCustomEffectsOptions(name)
end

---Add custom effect of modded birthright effect on pickup to table
---@param func function #Function responsible for action where birthright is picked up
function ExtraBirthright.AddOnPickupFunction(func)
end

---Adds condition for changing to modded birthright. Define for which character inside function.
---@param func function #Function responsible for action where birthright is picked up
---@return boolean
function ExtraBirthright.AddBirthrightChangeCondition(func)
end

---Add custom birthright callback to Tainted Eden's Birthright
---@param modID string #mod name
---@param id CallbackID # Callback ID (ModCallbacks)
---@param priority number @default: '0' 
---@param character PlayerType # Character ID (for example 0 for Isaac)
---@param fn any
---@param ... table # Extra params
function ExtraBirthright.AddCustomCallback(modID, id, priority, character, fn, ...)
end

---Function to check if value exists and is string
---@param str any
---@return boolean
function ExtraBirthright.IsString(str)
end

---Function to check if value exists and is number
---@param num any
---@return boolean
function ExtraBirthright.IsNumber(num)
end

---Function to check if value exists and is table
---@param tab any
---@return boolean
function ExtraBirthright.IsTable(tab)
end