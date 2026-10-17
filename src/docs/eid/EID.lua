---@class EID
_G.EID = {}

--#region Luadoc type definitions (from EID source)
---@class EID_GoldenTrinketData
---@field t number[]? @The numbers inside the text that should be multiplied
---@field mult number? @Max multiplier applied. assumed to be 3.
---@field mults number[]? @Custom multipliers. A Missing Page's damage goes from 80 to 120 to 160; so its multipliers are 1.5 and 2, instead of 2 and 3
---@field append boolean? @If true, text is added to the description
---@field findReplace boolean? @If true, the text is replaced
---@field fullReplace boolean? @If true, description is fully replaced
---@field goldenOnly boolean? @If true, the description is modified only when the trinket is golden
---@field additions number? @Add a value to the number in the text, similar to multiplier. Expects a table of 3 values, 1: double, 2: triple, 3: quadruple effect

---@class EID_Icon
---@field [1] string @Animation name
---@field [2] integer @Animation frame
---@field [3] integer @Width
---@field [4] integer @Height
---@field [5] integer? @Left offset
---@field [6] integer? @Top offset
---@field [7] Sprite @Sprite object

---@class EID_DescObj
---@field ObjType integer
---@field ObjVariant integer
---@field ObjSubType integer
---@field fullItemString string @String in `Type.Variant.SubType` format
---@field Name string
---@field Description string
---@field Transformation string
---@field ModName string
---@field Quality integer
---@field Icon EID_Icon
---@field Entity Entity?
---@field ShowWhenUnidentified boolean?
---@field IgnoreBulletPointIconConfig boolean?
---@field ItemType integer?
---@field ChargeType integer?
---@field Charges integer? @Max charges

---@class EID_HudElement
---@field x number
---@field y number
---@field width number
---@field height number
---@field anchors EID_Anchor[]
---@field descriptionObj fun(): EID_DescObj

--#endregion

---Initializes handling of alternative language codes for a specific language using meta-table that redirect table accesses to the original table
function EID:AddAlternativeLanguageCode(originalLanguageCode, newLanguageCode)
end

---For adding a conditional that only displays when the closest player to the pedestal is the right character
function EID:AddClosestPlayerConditional(IDs, charIDs, modText, extraTable, includeTainted)
end

---Every single add conditional function ends up calling this function eventually. This is THE place to define variables every condition MUST have.
function EID:AddConditional(IDs, funcText, modText, extraTable)
end

---Adds an EID Icon to an Object
---@param eType EntityType
---@param eVariant integer
---@param eSubType integer
---@param iconName string
function EID:AddIconToObject(eType, eVariant, eSubType, iconName)
end

---Easy to use functions for conditionals that rely on having a specific item/character
---By default, they'll have a bulletpoint for the item/char, and {1} becomes the item/char's name
---checkInReminder is for if a synergy is no longer relevant once the item isn't obtainable (e.g. Abyss locusts) (true by default)
function EID:AddItemConditional(IDs, ownedIDs, modText, extraTable, checkInReminder)
end

---For adding a synergy pair where the same item name should be used for the descriptions of both sides of it
---e.g. Sacrificial Altar synergies are displayed on both the Altar and the familiar, but only the familiar's name matters
function EID:AddOneSidedSynergyConditional(IDs, ownedIDs, modText, extraTable, checkInReminder)
end

---Add pickup usage to history of pickups used by the player
---@param pickupType "pill" | "card"
---@param effectID PillEffect | Card
---@param player EntityPlayer
---@param useFlags UseFlag
---@param pillColorID? PillColor @Only used for pills
function EID:AddPickupToHistory(pickupType, effectID, player, useFlags, pillColorID)
end

---For adding a conditional based on if a specific character is present
---includeTainted is for if you want to check the normal and tainted version of a character (true by default)
function EID:AddPlayerConditional(IDs, charIDs, modText, extraTable, includeTainted)
end

---For adding a conditional that looks at owning itself; item reminder is of course disabled
---Holding Diplopia or Crooked Penny should probably also trigger this type of conditional, so it's included by default
function EID:AddSelfConditional(ownedIDs, modText, extraTable, includeDiplopia)
end

---For adding pairs of abilities to collectibles; you can define a different modifier text for each of them
---example: EID:AddSynergyConditional({list of IDs overridden by Brimstone}, Brimstone, "Overridden", "Overrides")
function EID:AddSynergyConditional(IDs, ownedIDs, modText1, modText2, extraTable1, extraTable2, checkInReminder)
end

---@param itemID CollectibleType
function EID:AddToCollectiblesToCheckList(itemID)
end

---Initializes handling of alternative language codes for all languages
function EID:AdjustLanguageConfigSetting()
end

---REPENTOGON: Function is no longer used since repentogon always has progress enabled.
function EID:AreAchievementsAllowed()
end

---@param t any[]
---@param value any
---@return boolean
function EID:ArrayContains(t, value)
end

---Handle Flip Item in New Room. Repentance only function!
function EID:AssignFlipItems()
end

---BAG OF CRAFTING
---Directly read bag of crafting content
function EID:BoCCheckForPickups()
end

---Check what pickups are available in this room
function EID:BoCGetRoomPickupList()
end

---read room items directly from room data when changing rooms, to ensure floor item counter doesnt desync
function EID:BoCOnNewRoom_Repentogon(_)
end

---Blocks all input actions triggered by the games bindings itself
function EID:BoCSBlockInputAction(_, inputHook, _)
end

---Returns true if the item name is matched
---@returns boolean
function EID:BoCSCheckItemName(itemName)
end

---Gets if the filtering is currently enabled
function EID:BoCSGetSearchEnabled()
end

---Returns if the search input is enabled
---@returns boolean
function EID:BoCSGetSearchInputEnabled()
end

---Returns the line that should be displayed inside of the menu
function EID:BoCSGetSearchLine()
end

---Returns the current search query
---@return string
function EID:BoCSGetSearchValue()
end

---Handles any input done related to Bag of Crafting search
function EID:BoCSHandleInput()
end

---This is a workaround to block every single Input call that could potentially be
---used from another mod.
---We override the Input functions with our own stubs to prevent other mods from
---doing actions while the user is performing a search.
---This does NOT block the main game from performing actions like toggling fullscreen
---or toggling the pause!
---Since this could be useful for multiple reasons, this should probably be put
---inside the main.lua instead of leaving this here
---Hooking multiple times WILL impact the performance!
---I've also added a third parameter called "force"
---This way, we are still able to force the real function to be called instead
---of our modified code
---This code should not impact the performance in a huge way
---since the first thing we do is check if the searchInput is enabled anyway
---We can allow losing a bit of performance when searching
function EID:BoCSHookInput()
end

---Resets the search query when entering a new level
function EID:BoCSOnNewLevel()
end

---Resets the search query when starting and continuing a game
function EID:BoCSPostGameStarted()
end

---Locks or unlocks the search query
---@param newState boolean
function EID:BoCSSetLocked(newState, force)
end

---Enables or disables the search input respectively
---@param newState boolean
function EID:BoCSSetSearchInputEnabled(newState, force)
end

---Returns the current search query
---@param newValue string @The new search query
function EID:BoCSSetSearchValue(newValue)
end

---Deactivate manual tracking code
function EID:BoCTrackBagHolding()
end

---Check the given item ID for the given max charge and/or charge type (as well as check if the players have the additional collectible ID provided)
function EID:CheckActiveChargeType(itemID, maxCharge, chargeType, requiredCollectible)
end

---When we're looking at a Car Battery pedestal, check our actives for having an effect or no effect
function EID:CheckActivesForCarBattery(_)
end

---Create a list of all grid entities in the room that have an EID description
function EID:CheckCurrentRoomGridEntities()
end

---When we're looking at a BFFS pedestal, check our familiars for having an effect (only finds the earliest one)
function EID:CheckFamiliarsForBFFS(_)
end

---Before using Flip, swap all flippable pedestal's current item with the flip one (also, fix grid index if needed)
---Repentance only function!
function EID:CheckFlipGridIndexes(collectibleType)
end

---When we have BFFS/Hive Mind, change familiar pedestal descriptions
function EID:CheckForBFFS(descObj, hiveMind)
end

---When we have Car Battery, change active pedestal descriptions
function EID:CheckForCarBattery(descObj)
end

---Check if we have characters with Schoolbag or a pocket active item
function EID:CheckForMultipleActives(_, onlyChargeablePockets)
end

---Check if we have characters with Schoolbag or a chargeable pocket active item (for 4.5 Volt)
function EID:CheckForMultipleChargeableActives(descObj)
end

---Check if we have any characters that can't have Red Health, to print additions to descs like Dead Cat
function EID:CheckForNoRedHealthPlayer()
end

---Check if we have a character with a pocket active
function EID:CheckForPocketActives()
end

---Obtains information about glitched items from the ItemConfig (hearts added on pickup, cacheflags affected), returns string of info
function EID:CheckGlitchedItemConfig(id)
end

---Checks if the given grid entity has a description available
---@param entity GridEntity @The grid entity to check for a description.
---@return boolean @Returns true if a description exists for the entity, false otherwise.
function EID:CheckGridEntityHasDescription(entity)
end

---Check if a pedestal's index is valid for Flip items. Repentance Only function!
---@param entity any
function EID:CheckPedestalIndex(entity)
end

---Check if any players own a collectible, returns true if at least one player has it
function EID:CheckPlayersCollectibles()
end

---Check for a player having an active item with a specific quantity of charges, or charge type
---0 = normal, 1 = timed, 2 = special
function EID:CheckPlayersForActiveChargeType(maxCharge, chargeType, checkPockets)
end

---Check our position modifiers based on HUD offset and character choice
function EID:CheckPosModifiers()
end

---Check for start of run warnings, such as old game version or modded items
function EID:CheckStartOfRunWarnings()
end

---MC_PRE_USE_ITEM callback to watch for Void absorbing active items
function EID:CheckVoidAbsorbs(_, _, player)
end

---Function to check if we are the closest player and should actually apply the conditional, or just append "Different effect for {1}"
function EID:ClosestCharCheck(modifierText, playerTypes, includeTainted)
end

---Find the closest player to the given entity
---@param entity Entity
---@return EntityPlayer
function EID:ClosestPlayerTo(entity)
end

---Collects items that the player got after using D4 item
---@param player EntityPlayer
function EID:CollectRerolledItemsOfPlayer(player)
end

---Wait until all collectibles spawning this frame have spawned before checking what we need to check about them
function EID:CollectibleSpawnedThisFrame(_)
end

---Super simple table concatenation: https://www.tutorialspoint.com/concatenation-of-tables-in-lua-programming
---@generic T
---@param table1 T[]
---@param table2 T[]
---@return T[]
function EID:ConcatTables(table1, table2)
end

---deep table copy, copied from http://lua-users.org/wiki/CopyTable
---@generic T
---@param orig T
---@return T
function EID:CopyTable(orig)
end

---Creates a description table for a given language to prevent outdated languages from breaking EID API functions for mods
---@param tableName string
---@param language EID_LanguageCode
function EID:CreateDescriptionTableIfMissing(tableName, language)
end

---Crooked Penny ---
function EID:CrookedPennyPrediction(seed, carBattery)
end

---Returns the item ID of D Infinity's current die
---For Repentance, the Drop button is tracked, which is probably not 100% successful, and handled elsewhere
function EID:CurrentDInfinity(rng, player)
end

---@return boolean
function EID:DetectModdedItems()
end

---Returns true, if the given entity is a valid game object and actually is something useful to process.
---Sometimes the game sends weird shit so this function is needed to catch bullshit
---@return boolean
function EID:EntitySanityCheck(entity)
end

---Returns true if the position at the given grid location is valid for pathfinding.
---gridPosition is a table with an x and y entry. Its derived from the FindVector class of "LuaFindings" module (pathfinder)
---@param gridPosition table
---@return boolean
function EID:EvaluateLocation(gridPosition)
end

---Returns a list of all active item ids
---@return integer[]
function EID:GetAllActiveItems()
end

---Returns a list of all passive item ids
---@return integer[]
function EID:GetAllPassiveItems()
end

---Function to get the current mod path
---@return string The absolute path to the current mod
function EID:GetCurrentModPath()
end

---Returns the dimension ID the player is currently in.
---@param level Level
---@return EID_Dimension?
function EID:GetDimension(level)
end

---REPENTOGON: Entity names can now be directly read from XML
---returns the name of the given entity
function EID:GetEntityXMLName(Type, Variant, SubType)
end

---takes a string like "5.100.69"
function EID:GetEntityXMLNameByString(str)
end

---@param variant integer @70: Pill | 100: Collectible | 300: Card | 350: Trinket
function EID:GetIconNameByVariant(variant)
end

---@param descObj EID_DescObj
---@return string
function EID:GetIconStringByDescriptionObject(descObj)
end

---Get an item's RNG seed.
---We have no use for the RNG object itself because every other function it can do will advance the item's RNG, altering the game state
---@param player EntityPlayer
---@param id CollectibleType | TrinketType | Card | PillEffect
---@param variant? integer @Default: 100 (Collectible)
---@return integer?
function EID:GetItemSeed(player, id, variant)
end

---Returns the maximum collectible id, including modded items
---@return CollectibleType
function EID:GetMaxCollectibleID()
end

---Returns the maximum trinket id, including modded trinkets
---@return TrinketType
function EID:GetMaxTrinketID()
end

---Returns the markup for a given player ID or type.
---If no icon was found, returns the customTransformation icon markup
---@param playerID integer
---@param altFallback? string
function EID:GetPlayerIcon(playerID, altFallback)
end

---Tries to get the Vanilla transformations of modded items based on Tags
function EID:GetTransformationsOfModdedItems()
end

---Glyph of Balance --
function EID:GlyphOfBalancePrediction(player)
end

---Returns true if an unobstructed path between the start and end position exists.
---Obstructions can be something like Rocks, Pits, Walls, etc.
---@param startPos Vector
---@param endPos Vector
---@return boolean
function EID:HasPathToPosition(startPos, endPos)
end

---Check the bestiary/character list if we have REPENTOGON, to help avoid spoilers. Otherwise just return true
function EID:HaveEncountered(monsterType, monsterVariant)
end

---Initialize a touched active item to 0 count for all players
---(Fixes co-op bugs, compared to only initiating it for the toucher)
---@param itemIDStr string
function EID:InitActiveItemInteraction(itemIDStr)
end

---Initializes handling of alternative language codes for all languages
function EID:InitAltLanguageCodes()
end

---If the player ItemInteraction table doesnt exist, create it with its init values
---@param playerID integer
function EID:InitItemInteractionIfAbsent(playerID)
end

---Initializes and loads all language packs for the current game version,
---including handling for Repentance and Repentance+ expansions,
---and sorts the language list after loading.
function EID:InitializeLanguagePacks()
end

---Function to check if a collectible pedestal is an alt path choice
function EID:IsAltChoice(pickup)
end

---Item Reminder function: check if the given category is currently selected
---@param categoryID integer
---@return boolean
function EID:IsCategorySelected(categoryID)
end

---Returns true if a given entity is a grid entity
---@param entity Entity | GridEntity
function EID:IsGridEntity(entity)
end

---Returns true if the given pedestal-entity is hidden (questionmark sprite)
---@param entity Entity
---@return boolean
function EID:IsItemHidden(entity)
end

---Item Reminder function: check if the currently selected category is scrollable
---@return boolean
function EID:IsScrollableCategorySelected()
end

---Add item description for a given entity to the reminder. Also tries to apply special modifiers if present
function EID:ItemReminderAddDescription(player, entityType, variant, subType, extraIcon)
end

---Helper function for modifiers that want to replace the description in the overview, but append to the description otherwise
function EID:ItemReminderAddResult(descObj, newText, inOverview)
end

---Adds a formatted "Result" text appended to the item description
function EID:ItemReminderAddResultAppend(descObj, newText)
end

---Adds a formatted "Result" text to the item name
function EID:ItemReminderAddResultHeaderSuffix(descObj, newName)
end

---In the overview category, check for special descriptions
function EID:ItemReminderAddSpecialDescriptions(player)
end

---Simple function to help with adding properly formatted sections to the reminder description
---returns false, when no further descriptions should be added
function EID:ItemReminderAddTempDescriptionEntry(icon, title, newDesc, objectID)
end

---returns true, if its possible for the currently evaluated view to have more descriptions added to it
function EID:ItemReminderCanAddMoreToView()
end

---Item Reminder function: special list of all players, ignoring tainted forgotten ghost and coop babies
function EID:ItemReminderGetAllPlayers()
end

---Generates the description for the Item Reminder, based on the currently selected category and player.
---@return string
function EID:ItemReminderGetDescription()
end

---Returns the title of the currently selected Item Reminder category.
---@return string
function EID:ItemReminderGetTitle()
end

---Item Reminder function: Active Item Descriptions
---@param player EntityPlayer
function EID:ItemReminderHandleActiveItems(player)
end

---Item Reminder function: Information about the player character's traits
---@param player EntityPlayer
function EID:ItemReminderHandleCharacterInfo(player)
end

---Item Reminder function: dice bag
---@param player EntityPlayer
function EID:ItemReminderHandleDiceBag(player)
end

---Item Reminder function: Resets data when initializing holding TAB
function EID:ItemReminderHandleInitHoldTab()
end

---Item Reminder function: Handle scroll inputs
function EID:ItemReminderHandleInputs()
end

---takes a list of item ids and an item variant to automatically print the correct amount of descriptions
function EID:ItemReminderHandleItemPrinting(player, entryTable, itemVariant, descending)
end

---takes a list of item ids and an item variant to automatically generate a scrollable list of item icons.
function EID:ItemReminderHandleItemScrollbarFeature(entryTable, itemVariant, descending)
end

---Item Reminder function: Lemegeton wisp descriptions
---@param player EntityPlayer
function EID:ItemReminderHandleLemegetonWisps(player)
end

---Item Reminder function: pocket actives
---@param player EntityPlayer
function EID:ItemReminderHandlePocketActive(player)
end

---Item Reminder function: Pocket Item Descriptions
---@param player EntityPlayer
function EID:ItemReminderHandlePocketItems(player)
end

---Item Reminder function: Tainted ??? Poop Descriptions
---@param player EntityPlayer
function EID:ItemReminderHandlePoopSpells(player)
end

---Item Reminder function: Passive Item Descriptions
---@param player EntityPlayer
function EID:ItemReminderHandleSelectedPassiveItem(player)
end

---Item Reminder function: Trinket Descriptions
---@param player EntityPlayer
function EID:ItemReminderHandleTrinkets(player)
end

---Item Reminder function: Held trinkets are added at the end of the table; use this table in descending order
---@param player EntityPlayer
function EID:ItemReminderHeldPlusGulped(player)
end

---Helper function for modifiers like Modeling Clay / Liberty Cap that replace their description with the temporary item's description
function EID:ItemReminderReplaceWithResult(descObj, result, resultVariant)
end

---trim all entries to make them shorter, by removing bullet points
function EID:ItemReminderTrimBulletPoints(description)
end

---Attempts to load all language packs from a given game version
function EID:LoadLanguagePacks(gameVersion)
end

---TODO: Account for Car Battery
---(If we have it, display multiple results? Also, if the result is Car Battery, it's immediately triggered again)
function EID:MetronomePrediction(rng)
end

---Check for multiple players existing for items like Yum Heart and Extension Cord, includes J&E and Strawmen
function EID:MultiplePlayerCharacters()
end

---OnGameExit saves the current EID configuration.
function EID:OnGameExit()
end

---OnGameStart is called when the game starts, either from a save or a new run.
---It initializes the config data if available.
---@param isSave boolean Indicates whether the game is starting from a save or a new run.
function EID:OnGameStart(isSave)
end

---Render function that runs every frame and handles the main EID rendering logic.
function EID:OnRender()
end

---OnUseCard is called when a card is used, and handles card history tracking and Wild Card effects.
---@param cardID number The ID of the card being used.
---@param player EntityPlayer The player using the card.
---@param useFlags number Flags indicating how the card was used (e.g., whether it was used with no animation).
function EID:OnUseCard(cardID, player, useFlags)
end

---OnUsePill is called when a pill is used, and handles pill history tracking and Wild Card effects.
---@param pillEffectID number The ID of the pill effect being used.
---@param player EntityPlayer The player using the pill.
---@param useFlags number Flags indicating how the pill was used (e.g., whether it was used with no animation).
function EID:OnUsePill(pillEffectID, player, useFlags)
end

---MC_PRE_USE_ITEM callback to watch for smelting trinkets; includes Gulp and Marbles
function EID:OnUseSmelter(_, _, player)
end

---Returns true, if the player has a given card
---@param player EntityPlayer
---@param cardID Card
---@return boolean, EntityPlayer?, integer?
function EID:PlayerHasCard(player, cardID)
end

---Checks if the given player has the given item ID (or is the given player ID)
---@param player EntityPlayer
---@param Type EntityType | string
---@param Var integer?
---@param Sub integer?
---@return boolean
function EID:PlayerHasItem(player, Type, Var, Sub)
end

---Returns true, if the player has a given pill color
---@param player EntityPlayer
---@param pillID PillColor
---@return boolean, EntityPlayer?, integer?
function EID:PlayerHasPill(player, pillID)
end

---Returns true, if the player has a given voided collectible
---@param player EntityPlayer
---@param collectibleID CollectibleType
---@return boolean, EntityPlayer?
function EID:PlayerVoidedCollectible(player, collectibleID)
end

---Returns true if any player is pressing the given button (you can also specify any of the input functions)
---@generic BTN
---@param button BTN
---@param inputFunc nil | fun(button: BTN, playerIndex: integer): boolean
---@return boolean, integer?
function EID:PlayersActionPressed(button, inputFunc)
end

---Returns true, if any player has a given card
---@param cardID Card
---@return boolean, EntityPlayer?
function EID:PlayersHaveCard(cardID)
end

---Checks if someone is playing as a certain character, for modifiers
---@param playerType PlayerType
---@param includeTainted? boolean @If true, doesn't care if the player is tainted or not
---@return boolean, EntityPlayer?, integer?
function EID:PlayersHaveCharacter(playerType, includeTainted)
end

---Checks if any player has a given collectible ID, for modifiers
---@param collectibleID CollectibleType
---@return boolean, EntityPlayer?, integer?
function EID:PlayersHaveCollectible(collectibleID)
end

---Checks if any player has a given item ID (or anyone is a given player ID)
---@param Type string | integer | EntityType
---@param Var integer | nil
---@param Sub integer | nil
---@return boolean, EntityPlayer?, integer?
function EID:PlayersHaveItem(Type, Var, Sub)
end

---Returns true, if any player has a given pill color
---@param pillID PillColor
---@return boolean, EntityPlayer?
function EID:PlayersHavePill(pillID)
end

---Checks if any player has a given trinket ID, for modifiers
---@param trinketID TrinketType
---@return boolean, EntityPlayer?, integer?
function EID:PlayersHaveTrinket(trinketID)
end

---Returns true, if any player has a given voided collectible
---@param collectibleID CollectibleType
---@return boolean, EntityPlayer?
function EID:PlayersVoidedCollectible(collectibleID)
end

---reimplementation of RNG:Next()
---Default RNG shift values for many things are 5, 9, 7 (xor table #35)
function EID:RNGNext(rngNum, shift1, shift2, shift3)
end

---Returns if this is a frame we should refresh our descriptions
---@return boolean
function EID:RefreshThisFrame()
end

---Render a sprite of an entity
---@param entity Entity
---@param sprite Sprite
---@param position Vector
function EID:RenderEntity(entity, sprite, position)
end

---Replaces Variable placeholders in string with a given value
---Example: "My {1} message" --> "My test message"
---varID can be omitted to replace {1} (or pass in a string table, to replace {1}, {2}, etc.)
---@param str string
---@param varID integer | integer[] | string | string[]
---@param newString? string | string[] | integer
function EID:ReplaceVariableStr(str, varID, newString)
end

---Reset the description cache, used when options change or when printing descriptions
function EID:ResetDescCache()
end

---simple function to reset the selected items in the scrollbars. can specify a category name like "Passives"
function EID:ResetItemReminderSelectedItems(categoryName)
end

---Convert a seed int into a float between 0 and 1
function EID:SeedToFloat(seed)
end

---Set a pilleffect to be permanently unidentifyable by EID
---@param pillEffectID PillEffect
---@param isUnidentifyable boolean
function EID:SetPillEffectUnidentifyable(pillEffectID, isUnidentifyable)
end

---Thing to fix find/replace pairs with hyphens (like "1-2") or pluses (like +1 Health) breaking because of special characters
---https://stackoverflow.com/questions/29072601/lua-string-gsub-with-a-hyphen
---@param str string
---@param what string
---@param with string
---@param count integer
---@return string, integer
function EID:SimpleReplace(str, what, with, count)
end

---Simple decimal rounding, instead of just floor or ceil
---@param num number
---@param dp integer?
---@return number
function EID:SimpleRound(num, dp)
end

---Converts e.g. "5.100.69" format strings into `5, 100, 69`. Returns 0 for any not included
---@param tvsString string
---@return integer, integer, integer
function EID:SplitTVS(tvsString)
end

---Returns true if Tab was pressed this frame, false otherwise
function EID:TabPressed()
end

---Returns true if Tab was released this frame, false otherwise
function EID:TabReleased()
end

---Teleport! Destination Prediction --
---Returns text like "{{RoomIcon}} Room Type Name#Up 3, Left 2"
function EID:Teleport1Prediction(rng)
end

---@param effectID string @Identifier in `Type.Variant.SubType` format
---@param player EntityPlayer
---@param pillColor? PillColor
function EID:TrackWildCardEffects(effectID, player, pillColor)
end

---Applies language specific modifiers that aim to pluralize a text
---@param text string
---@param amount integer
function EID:TryPluralizeString(text, amount)
end

---This is automatically called shortly after main.lua sees a Lemegeton get used, and when the Item Reminder is opened
function EID:UpdateAllPlayerLemegetonWisps()
end

---Updates the EID.RecentlyTouchedItems table to include the players currently held passive items
---@return table
function EID:UpdateAllPlayerPassiveItems()
end

---Check for gulped trinkets that have been removed (e.g. perfection, walnut)
function EID:UpdateAllPlayerTrinkets()
end

---Determine what stats will be increased after 1 absorption, the whole room's absorption, and whole room + a purchased item above your head
function EID:VoidRNGCheck(player, isRune)
end

---Count the number of absorbable pedestals in the room
---Returns a table of active items that will be absorbed
function EID:VoidRoomCheck()
end

---Returns true if the given pill color was used at least once in this game
---@param pillColor PillColor
---@return boolean
function EID:WasPillUsed(pillColor)
end

---To help with Rep tracking, watch for D Infinity to get used and resync its current dice
function EID:WatchForDInfinity()
end

---Watch pedestals for being a Glitched Crown style pedestal that flips between items too quickly to display descriptions for
function EID:WatchForGlitchedCrown()
end

---Prints a message in both the console and the Log file, to make important messages from EID stand out everywhere
---@param str string
function EID:WriteDebugMsg(str)
end

---Prints an error message in both the console and the Log file, to make important messages from EID stand out everywhere
---@param str string
function EID:WriteErrorMsg(str)
end

---Shortcut function for adding abyss synergies conditions
function EID:addAbyssSynergiesCondition(ID, text, numberToDouble, newNumber, language)
end

---Shortcut function for adding BFFS conditions; this is slightly more complex since it supports trinkets
---Example usage: EID:addBFFSCondition(myBasicFamiliarID, nil, 3.5)
function EID:addBFFSCondition(ID, text, numberToDouble, newNumber, language)
end

---Shortcut function for adding binge eater conditions
function EID:addBingeEaterBuffsCondition(ID, text, numberToDouble, newNumber, language)
end

---Adds a character specific description for the item "Birthright"
---@param characterId PlayerType
---@param description string
---@param playerName? string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addBirthright(characterId, description, playerName, language)
end

---Shortcut function for adding book of belial conditions
function EID:addBookOfBelialBuffsCondition(ID, text, numberToDouble, newNumber, language)
end

---Shortcut function for adding car battery conditions
function EID:addCarBatteryCondition(ID, text, numberToDouble, newNumber, language)
end

---Adds a description for a card/rune
---@param id Card
---@param description string
---@param itemName? string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addCard(id, description, itemName, language)
end

---DEPRECATED! Does nothing! Don't use!
---@deprecated
function EID:addCardMetadata(id, mimicCharge, isRune)
end

---Adds character specific information, which can be viewed in the Item Reminder
---@param characterId PlayerType
---@param description string
---@param playerName? string @Default: "Modded Character"
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addCharacterInfo(characterId, description, playerName, language)
end

---Adds a description for a collectible.
---@param id CollectibleType
---@param description string
---@param itemName string?
---@param language EID_LanguageCode? @Default: "en_us"
function EID:addCollectible(id, description, itemName, language)
end

---Adds a new color object with the shortcut defined in the "shortcut" variable (e.g. "{{shortcut}}" = your color)
---Shortcuts are case sensitive! Shortcuts can be overriden with this function to allow for full control over everything
---Either `kColor` or `callback` must be provided
---@param shortcut string
---@param kColor? KColor @Constant color
---@param callback? fun(color:KColor):KColor @Called whenever the color markup is interpreted
function EID:addColor(shortcut, kColor, callback)
end

---Add text to a pedestal's description when you own a different item
---ID and ownedID can be a collectible ID or a full item string (like "5.350.54")
---ownedID can also be a function rather than just an ID; if it returns true, the text will be displayed
---The text will be added as a new line, with the owned item's icon at the start
---If you pass in replaceText, instead the text is found in the description and replaced with replaceText
---For convenience, ID can be a table of IDs that will all get the condition applied
---Optional parameters: replaceText, language, extraTable
---Example usage: EID:addCondition(myDevilishItemID, EID.IsGreedMode, "{{GreedMode}} Reduces shop prices by 1 for each optional Nightmare wave completed")
function EID:addCondition(ID, ownedID, text, replaceText, language, extraTable)
end

---Add a coroutine to be ran 60 times a second
---@param name string
---@param func fun()
---@param overwrite? boolean @Default: false
function EID:addCoroutine(name, func, overwrite)
end

---Adds a custom poop spell to T???'s poop descriptions.
---This spell should be added with the "Custom Poop API" library to actually appear in-game.
---Example:
---```lua
---EID:addCustomPoopSpell("MYPOOP", "I Made This Poop", "{{PoopSpell1}}", "Can be throwed to deal damage", "en_us")
---```
---@param token string @The name of the spell in the Custom Poop API code
---@param name string @The name of the spell as it should appear in the description
---@param icon string @Markup icon of the poop
---@param description string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addCustomPoopSpell(token, name, icon, description, language)
end

---Adds Description object modifiers such as Spindown dice or Tarot Cloth
---@param modifierName string
---@param condition fun(descObj: EID_DescObj): boolean
---@param callback fun(descObj: EID_DescObj): EID_DescObj
---@param position? integer
function EID:addDescriptionModifier(modifierName, condition, callback, position)
end

---Add a description to the print queue
---@param desc EID_DescObj | table -- The description object to add
---@param insertLoc integer | nil
function EID:addDescriptionToPrint(desc, insertLoc)
end

---Adds a description for a an arbitrary Entity
---@param id EntityType
---@param variant integer
---@param subtype? integer @If `nil` or `-1`, it will affect all subtypes of that entity
---@param entityName string
---@param description string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addEntity(id, variant, subtype, entityName, description, language)
end

---Adds information about appending text and multiplying numbers in a modded trinket's Golden/Mom's Box description. All three variables are optional, set to ""/0 or nil to not include them
---@param appendText? string | string[] @Text to be appended onto the description. Can be one string, or a table of two strings; one for doubling and one for tripling
---@param numbersToMultiply? number | number[] @The number inside the text that should be multiplied. can be one number, or a table of numbers
---@param maxMultiplier? number @Is what tripling (Golden+Mom's Box) should multiply the numbers by, normally 3. If it's less than 2, it also applies to doubling
---@param language? EID_LanguageCode @Default: "en_us"
---Example: My modded trinket gives +0.5 range and when tripled, adds homing instead of tripling the range boost:
---```lua
---EID:addGoldenTrinketMetadata(Isaac.GetTrinketIdByName("Cool Trinket"), {"", "Homing tears"}, 0.5, 2)
---```
function EID:addGoldenTrinketMetadata(id, appendText, numbersToMultiply, maxMultiplier, language)
end

---@see EID_GoldenTrinketData
---Add a fully custom data table to the table of Golden Trinket effects.
---Check GoldenTrinketCallback in [eid_modifiers.lua](eid_modifiers.lua) to see the specifics of how it works.
---You may also want to add text entries into `EID.descriptions[languageCode].goldenTrinketEffects`
---@param id TrinketType
---@param dataTable EID_GoldenTrinketData
function EID:addGoldenTrinketTable(id, dataTable)
end

---Adds a new grid entity description entry.
---@param type GridEntityType
---@param variant integer
---@param name string
---@param description string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addGridEntity(type, variant, name, description, language)
end

---Adds a conditional description handler for a specific grid entity type.
---This function allows you to specify a grid entity type, a condition function to determine
---when the description should be shown, and a callback function to modify the description further.
---@param type GridEntityType
---@param conditionalFunction function
---@param callbackFunction function
function EID:addGridEntityConditional(type, conditionalFunction, callbackFunction)
end

---Shortcut function for adding Hive Mind conditions; by default, it will show with BFFS too, unless you pass in allowBFFS as false
function EID:addHiveMindCondition(ID, text, numberToDouble, newNumber, language, allowBFFS)
end

---Adds a horsepill-specific description for a PillEffect
---@param id PillEffect
---@param description string
---@param itemName? string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addHorsePill(id, description, itemName, language)
end

---Adds a new icon object with the shortcut defined in the "shortcut" variable (e.g. "{{shortcut}}" = your icon).
---Shortcuts are case sensitive! Shortcuts can be overriden with this function to allow for full control over everything
---@param shortcut string
---@param animationName string
---@param animationFrame integer @-1 to play the animation
---@param width integer
---@param height integer
---@param leftOffset? integer @Default: -1
---@param topOffset? integer @Default: 0
function EID:addIcon(shortcut, animationName, animationFrame, width, height, leftOffset, topOffset, spriteObject)
end

---Add a specific entity to be ignored by EID.
---Set entitySubType to -1 in order to ignore all entities with this type+variant combination.
---@param entityType EntityType
---@param entityVariant integer
---@param entitySubType integer
function EID:addIgnoredEntity(entityType, entityVariant, entitySubType)
end

---Adds a description for a PillEffect id
---@param id PillEffect
---@param description string
---@param itemName? string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addPill(id, description, itemName, language)
end

---Adds a metadata for a pilleffect. Used for Placebo/False PHD
---@param id PillEffect
---@param mimicCharge integer @DEPRECATED, does nothing
---@param class? EID_PillClass @Default: "0". With False PHD, "3-" gives +0.6 Damage, "2-" and "1-" spawn a Black Heart
function EID:addPillMetadata(id, mimicCharge, class)
end

---Function for adding text to a pedestal's description when you're playing a specific character
---The character's head icon will be at the start of appended lines
---By default, adding a conditional to a base character will also add it to the Tainted version of the character
---Optional parameters: replaceText, language, extraTable, includeTainted
---Example usage: EID:addPlayerCondition(myAngstyItemID, PlayerType.PLAYER_EVE, "Gives Eve extra mascara (2x Damage multiplier)")
function EID:addPlayerCondition(ID, playerID, text, replaceText, language, extraTable, includeTainted)
end

---Add a question mark description to the print queue
---@param entity Entity
---@param description string | nil
function EID:addQuestionMarkDescription(entity, description)
end

---Shortcut function for when you have two items that have a synergy with each other
---ID1 will have text1 added to its description if you own ID2
---ID2 will have text2 (or text1, if text2 isn't given) added to its description if you own ID1
---ID1 and ID2 can both be tables of IDs that will get the condition applied to each other
---Optional parameters: text2, language, extraTable
---Example usage: EID:addSynergyCondition(myHappyLittleItemID, {CollectibleType.COLLECTIBLE_BRIMSTONE, CollectibleType.COLLECTIBLE_SULFUR}, "Turns your laser into a smiley face that charms enemies")
function EID:addSynergyCondition(ID1, ID2, text1, text2, language, extraTable)
end

---Shortcut function for adding Ab+ Tarot Cloth conditions
function EID:addTarotClothBuffsABCondition(ID, text, numberToDouble, newNumber, language)
end

---Shortcut function for adding Repentance Tarot Cloth conditions
function EID:addTarotClothBuffsCondition(ID, text, numberToDouble, newNumber, language)
end

---Adds a text position modifier Vector, which will be applied to the text position variable.
---Useful to add small offsets. For example: for schoolbag HUD
---@param identifier string
---@param modifierVector Vector
function EID:addTextPosModifier(identifier, modifierVector)
end

---Shortcut function for tarotClothBuffs, tarotClothBuffsAB, carBattery, abyssSynergies, bookOfBelialBuffs, bingeEaterBuffs
---Because these are general conditions that only match one item type, it's super easy to add to them
---The text will be appended; numberToDouble will be found in the description and doubled, as that's the most frequent use case
---or, if you provide newNumber, it changes numberToDouble to that (technically, it's just a find/replace pair, any strings work)
---Example usage: EID:addToGeneralCondition(myVeryHealthyItemID, "bingeEaterBuffs", "↑ {{Speed}} +0.15 Speed#↓ {{Tears}} -0.5 Tears#↓ {{Damage}} -0.5 Damage")
function EID:addToGeneralCondition(ID, locTable, text, numberToDouble, newNumber, language)
end

---Adds a description for a trinket.
---@param id TrinketType
---@param description string
---@param itemName? string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:addTrinket(id, description, itemName, language)
end

---Changes the initial position of all eid descriptions
---Useful to totally alter and override the current initial Overlay position
---@param newPosVector Vector
function EID:alterTextPos(newPosVector)
end

---@param entityString string
---@param transformString string
---@param addToList? boolean
function EID:alterTransformationLookup(entityString, transformString, addToList)
end

---Appends a given string to the description of a given Description object
---@param descObj EID_DescObj
---@param appendString string
function EID:appendToDescription(descObj, appendString)
end

---Apply Description Modifier to a given description object
---@param description EID_DescObj
---@param SubType integer
---@return EID_DescObj
function EID:applyDescriptionModifier(description, SubType)
end

---Compares two KColors. Returns true if they are equal
---@param c1 KColor
---@param c2 KColor
---@return boolean
function EID:areColorsEqual(c1, c2)
end

---Assigns transformations to an entity (Adds to existing transformations)
---Target entity identifier is in `Type.Variant.SubType` format and is formed based on `targetType` and `targetIdentifier`<br>
---Example: adding "My Transformation" to Sad Onion:
---```lua
---EID:assignTransformation("collectible", 1, "My Transformation")
---```
---@param targetType EID_TypeVariantAlias @Alias for a `Type.Variant` of entity
---@param targetIdentifier integer | string @If valid `targetType` is specified, `SubType` of the entity. Otherwise, the full entity identifier
---@param transformationString string @Transformation name
function EID:assignTransformation(targetType, targetIdentifier, transformationString)
end

---Get the number of pickups in the given recipe table that are inside our bag
---Is for checking if a recipe is possible to create if you need to use every item in your bag
---@param craftTable integer[]
---@return integer
function EID:bagContainsCount(craftTable)
end

---Checks how many of an item there are in the bag
---@param itemID integer
---@param itemCount integer
---@return integer|false @false: not in the bag | 0: fewer items than the target amount | 1: exactly the target amount | 2: more items than the target amount
function EID:bagContainsItem(itemID, itemCount)
end

---Creates a table that contains all objects a transformation is associated with.
function EID:buildTransformationTables()
end

---The main function that takes 8 ingredients and tells you what collectible you will get in return
---Only pass in a table with 8 valid ingredients!!!
function EID:calculateBagOfCrafting(componentsTable)
end

---Check if a given font name is valid for the currently selected language
---@param fontType string
---@return boolean
function EID:canUseFontType(fontType)
end

---REPENTOGON: Function is no longer used since we can directly read the collection state from the game
function EID:checkPlayersForMissingItems()
end

---Generic function to compare two tables
function EID:compareTables(table1, table2, prevKey, progress)
end

---Creates a copy of a KColor object. This prevents overwriting existing KColor objects
---@param colorObj KColor
---@return KColor
function EID:copyKColor(colorObj)
end

---Tries to read special markup used to generate icons for all Collectibles/Trinkets and the default Cards/Pills
---Returns an inlineIcon Object or nil if no parsing was possible
---@param str string
---@return EID_Icon?
function EID:createItemIconObject(str)
end

---Creates a new transformation with a given unique name and a display name
---@param uniqueName string
---@param displayName string
---@param language? EID_LanguageCode @Default: "en_us"
function EID:createTransformation(uniqueName, displayName, language)
end

---Overrides all potentially displayed texts and permanently displays the given texts
---@see EID.hidePermanentText @Hides permanently displayed text object.
---@param descriptionObject EID_DescObj @Description object to display
---@param permName1 string? @Can be nil outside of EID
---@param permName2 string?
function EID:displayPermanentText(descriptionObject, permName1, permName2)
end

---Workaround function to get the currently held pill of the players. Used to map Pill ID to pill color and vise versa
function EID:evaluateHeldPill()
end

---Watch for a player's queued item (holding an item over their head) to track active item touches
---Used for Transformation Progress and for tracking Recently Touched Items
function EID:evaluateQueuedItems()
end

---Given a transformation identifier, iterates over every player and count the number of items they have which count towards that transformation
---@param transformation string
function EID:evaluateTransformationProgress(transformation)
end

---Filters a given string and looks for Colormarkup. Splits the text into subsections limited by them.
---Returns: Table of subsections of the text, their respective KColor, and the width of the subsection
---@param text string
---@param baseKColor KColor
---@return [string, KColor, integer][]
function EID:filterColorMarkup(text, baseKColor)
end

---Searches through the given string and replaces Icon placeholders with icons.
---Returns 2 values. the string without the placeholders but with an accurate space between lines. And a table of all Inline Sprites
---@param text string
---@param renderBulletPointIcon boolean?
---@return string, [EID_Icon, integer, function?][]
function EID:filterIconMarkup(text, renderBulletPointIcon)
end

---Get the name of a given player ID by checking for a matching EntityPlayer.
---This is for modded characters, whose name is best found by doing EntityPlayer:GetName()
---@param id PlayerType
---@return string?
function EID:findPlayerName(id)
end

---Fits a given string to a specific width
---@param str string
---@param textboxWidth integer
---@param breakUtf8Chars boolean
---@return string[] @Input string split into lines
function EID:fitTextToWidth(str, textboxWidth, breakUtf8Chars)
end

---Function to fix font compatibility. Resets config font to a value compatible with your current language
---@param forceRefresh boolean | nil
---@return boolean @True if the font was changed
function EID:fixDefinedFont(forceRefresh)
end

---Generates a string with the defined pixel-length using a custom 1px wide character.
---This will only work for this specific custom font.
---@param length integer
---@return string
function EID:generatePlaceholderString(length)
end

---Returns an adjusted SubType for special cases like Horse Pills and Golden Trinkets
---@param Type EntityType
---@param Variant integer
---@param SubType integer
---@return integer
function EID:getAdjustedSubtype(Type, Variant, SubType)
end

---Convert a pickup's ID into what ingredient it counts as
function EID:getBagOfCraftingID(Variant, SubType)
end

---Gets a KColor from a Markup-string (example Input: "{{ColorText}}").
---Returns the KColor object and a boolean value indicating if the given string was a color markup or not
---@param str string
---@param baseKColor KColor
---@return KColor, boolean
function EID:getColor(str, baseKColor)
end

---Returns the description data table related to a given id, variant and subtype.
---Falls back to english if it doesnt exist
---@param Type EntityType
---@param Variant integer
---@param SubType integer
---@return string
function EID:getDescriptionData(Type, Variant, SubType)
end

---Returns the specified object string in the current language.
---Falls back to english if it doesnt exist, unless `noFallback` is true
---@param objTable string
---@param objIdentifier? integer | string
---@param noFallback? boolean
---@return string
function EID:getDescriptionEntry(objTable, objIdentifier, noFallback)
end

---Returns the specified object string in english.
---@param objTable string
---@param objID? any
---@return string
function EID:getDescriptionEntryEnglish(objTable, objID)
end

---Returns the description object of the specified entity.
---Falls back to english if the objID isnt available
---@param Type EntityType | integer
---@param Variant integer
---@param SubType integer
---@param entity? Entity
---@param checkModifiers? boolean @Default: true
---@return EID_DescObj
function EID:getDescriptionObj(Type, Variant, SubType, entity, checkModifiers)
end

---Returns the description object of a specific entity.
---Falls back to english if the objID isnt available
---@param entity Entity
function EID:getDescriptionObjByEntity(entity)
end

---@param entity Entity
---@return any?
function EID:getEntityData(entity, str)
end

---Get KColor object of "Error" texts
---@return KColor, boolean
function EID:getErrorColor()
end

---Turns entity type names into actual ingame ID.Variant pairs
---@param typeName EID_TypeVariantAlias
function EID:getIDVariantString(typeName)
end

---Returns the inlineIcon object of a given Iconstring.
---Can be used to validate an iconstring
---@param str string
---@return EID_Icon
function EID:getIcon(str)
end

---Get the current Language. Defaults to english if none is set.
---@return EID_LanguageCode
function EID:getLanguage()
end

---Returns the entity that is currently described. Returns last described entity if currently not displaying text
---@return Entity?
function EID:getLastDescribedEntity()
end

---Returns description Object from the legacy mod descriptions if they exist
---@param Type EntityType
---@param Variant integer
---@param SubType integer
---@return [string, string, string]?
function EID:getLegacyModDescription(Type, Variant, SubType)
end

---Returns the icon and mod name of a given EID description object as a preformatted description string
---@param descObj EID_DescObj
---@return string
function EID:getModNameString(descObj)
end

---Get KColor object of "Entity Name" texts
---@return KColor, boolean
function EID:getNameColor()
end

---Returns the Inline Icon definition object for a given object.
---@param descObj EID_DescObj
---@return EID_Icon?
function EID:getObjectIcon(descObj)
end

---Returns the item pool of the described entity
---@param descObj EID_DescObj
---@return integer?
function EID:getObjectItemPool(descObj)
end

---Writes charge-related information to a given description object
---@param descObj EID_DescObj
function EID:getObjectItemTypeAndCharge(descObj)
end

---Tries to get the ingame name of an item based on its ID
---@param Type EntityType
---@param Variant integer
---@param SubType integer
---@return string
function EID:getObjectName(Type, Variant, SubType)
end

---Returns the quality of the described entity
---@param descObj EID_DescObj
---@return integer?
function EID:getObjectQuality(descObj)
end

---Returns the name of a pill based on the pilleffect id
---@param pillID PillEffect | integer
---@param isHorsepill boolean
---@return string
function EID:getPillName(pillID, isHorsepill)
end

---@param entityPlayer EntityPlayer
---@param lazarusAdjust? boolean
---@return integer
function EID:getPlayerID(entityPlayer, lazarusAdjust)
end

---Returns the name of a player based on their ID
---@param id PlayerType
---@param altFallback? string
---@return string
function EID:getPlayerName(id, altFallback)
end

---@return Vector
function EID:getScreenSize()
end

---Converts a given CollectibleID into the respective Spindown dice result
---@param collectibleID CollectibleType
---@return CollectibleType
function EID:getSpindownResult(collectibleID)
end

---Returns the width of a given string in Pixels
---@param str string
---@return integer
function EID:getStrWidth(str)
end

---Turns entity type and variant into their EID table-name
---@param Type EntityType
---@param Variant integer
---@param SubType integer
---@return string
function EID:getTableName(Type, Variant, SubType)
end

---Get KColor object of "Description" texts
---@return KColor, boolean
function EID:getTextColor()
end

---Returns the current text position
---@return Vector
function EID:getTextPosition()
end

---Get the transformation uniqueName / ID of a given entity
---Example:
---```lua
---EID:getTransformation(5,100,34) --Returns "12" which is the id for Bookworm
---```
---@param id EntityType
---@param variant integer
---@param subType integer
---@return string
function EID:getTransformation(id, variant, subType)
end

---Get KColor object of "Transformation" texts
---@return KColor, boolean
function EID:getTransformationColor()
end

---Returns the icon for a given transformation name or ID
---@param str string
---@return EID_Icon
function EID:getTransformationIcon(str)
end

---Get the name of the given transformation by its uniqueName / ID
---@param id string
---@return string
function EID:getTransformationName(id)
end

---Tries to get the ingame description of an object, based on their description in the XML files
---@param Type EntityType
---@param Variant integer
---@param SubType integer
---@return string
function EID:getXMLDescription(Type, Variant, SubType)
end

---Called when needed based on EID.Config["RefreshRate"]
function EID:handleBagOfCraftingRendering(ignoreRefreshRate)
end

---Called 60 times a second so we can read input properly
function EID:handleBagOfCraftingUpdating()
end

---Returns the icon used for the bulletpoint. It will look at the first word in the given string.
---Also returns the first word if it was rejected (so it can be removed from the line)
---@param text string
---@return string, string?
function EID:handleBulletpointIcon(text, ignoreBPConfig)
end

---@param hudElement EID_HudElement
---@return EID_HudElement
function EID:handleHUDElement(hudElement)
end

---Handle the HUD hover functionality, checking if the mouse is over any HUD elements
---@return EID_DescObj | nil - Returns the description object if the mouse is over a HUD element, otherwise nil
function EID:handleHoverHUD()
end

---Returns true, if curse of blind is active
---@return boolean
function EID:hasCurseBlind()
end

---Hides permanently displayed text objects if they exist.
function EID:hidePermanentText()
end

---Interpolates between 2 KColors with a given fraction.
---@param kColor1 KColor
---@param kColor2 KColor
---@param fraction number @Range: [0,1]
---@return KColor
function EID:interpolateColors(kColor1, kColor2, fraction)
end

---REPENTANCE ONLY! Return whether the collectible is completely disallowed by the current game mode.
---Bag of Crafting and Spindown Dice skip over disallowed items entirely
---@param collectibleID CollectibleType
---@return boolean
function EID:isCollectibleAllowed(collectibleID)
end

---REPENTANCE ONLY! Return whether the collectible is considered available.
---Bag of Crafting rerolls unavailable items; this function is kept brief to help BoC speed
---@param collectibleID CollectibleType
---@return boolean
function EID:isCollectibleAvailable(collectibleID)
end

---REPENTANCE ONLY! Return our best guess on whether an achievement-locked collectible is unlocked
---(Things like Tainted Lost and Sacred Orb give false negatives)
---Spindown Dice skips over locked items, but not unavailable items
---@param collectibleID CollectibleType
---@return boolean
function EID:isCollectibleUnlocked(collectibleID)
end

---Returns if EID is displaying text right now
---@return boolean
function EID:isDisplayingText()
end

---"Learned Recipes" MODE: Save the result of the 8 items inside our bag
function EID:learnBagOfCrafting(componentsTable)
end

---Loads a given font from a given file path and use it to render text
---@param fontFileName string
---@return boolean @True if the font was loaded successfully
function EID:loadFont(fontFileName)
end

---Attempts to merge two given Description objects into one
---@param oldDescObj EID_DescObj
---@param newDescObj EID_DescObj
---@return EID_DescObj
function EID:mergeDescriptionObjects(oldDescObj, newDescObj)
end

---MC_POST_UPDATE callback that runs 30 times a second; doesn't update while paused
---Handles updating the game state and checking for new items
function EID:onGameUpdate()
end

---Function to reset all floor trackers when a new floor is entered
function EID:onNewFloor()
end

---MC_POST_NEW_ROOM callback to handle new rooms, mostly Glowing Hour Glass rewinding and Grid Entities
function EID:onNewRoom()
end

---Handle MC_POST_NEW_ROOM for Repentance features
function EID:onNewRoomRep()
end

---Handle Flip Item positions and Crane Game item positions. Repentance Only function!
---@param selectedCollectible number
---@param itemPoolType number
function EID:postGetCollectible(selectedCollectible, itemPoolType)
end

---Post Pickup Init callback to handle Flip item initialization. Repentance Only function!
---@param entity any
function EID:postPickupInitFlip(entity)
end

---Pre Room Entity Spawn callback to handle Flip item and pedestal spawning. Repentance Only function!
---@param entityType any
---@param variant any
---@param subtype any
---@param gridIndex any
function EID:preRoomEntitySpawn(entityType, variant, subtype, gridIndex)
end

---Prints bullet points from a description string
---@param description string - The description string to print
---@param renderPos Vector - The position to render the bullet points at
---@param ignoreBPConfig boolean - If true, will ignore the bullet point icon configuration
function EID:printBulletPoints(description, renderPos, ignoreBPConfig)
end

---Prints a description to the screen
---@param desc EID_DescObj
---@param cachedID integer | nil -- If this is a cached description, pass the index of the cached description
function EID:printDescription(desc, cachedID)
end

---Print all descriptions that are currently in the description table
---@param useCached boolean | nil - If true, will use the cached descriptions instead of printing new ones
function EID:printDescriptions(useCached)
end

---Print all descriptions that are currently in the description table
function EID:printNewDescriptions()
end

---Removes color markup, preserves bulletpoint icons after start-of-line color markup
---@param text string
---@return string
function EID:removeColorMarkup(text)
end

---Remove a coroutine from the coroutine list
---@param name string
function EID:removeCoroutine(name)
end

---Removes a Description object modifier
---@see EID.addDescriptionModifier
---@param modifierName string
function EID:removeDescriptionModifier(modifierName)
end

---Removes a given value from the string inside a table. Example: "1,2,3", removing 2 will return "1,3"
---@param sourceTable table<any, string>
---@param entryKey any
---@param entryValue string
function EID:removeEntryFromString(sourceTable, entryKey, entryValue)
end

---Remove a specific entity from the ignored List of EID.
---@param entityType EntityType
---@param entityVariant integer
---@param entitySubType integer
function EID:removeIgnoredEntity(entityType, entityVariant, entitySubType)
end

---Removes a text position modifier Vector
---@param identifier string
function EID:removeTextPosModifier(identifier)
end

---Removes a transformation of an entity
---Target entity identifier is in `Type.Variant.SubType` format and is formed based on `targetType` and `targetIdentifier`<br>
---Example: removing "My Transformation" from Sad Onion:
---```lua
---EID:removeTransformation("collectible", 1, "My Transformation")
---```
---@param targetType EID_TypeVariantAlias @Alias for a `Type.Variant` of entity
---@param targetIdentifier integer | string @If valid `targetType` is specified, `SubType` of the entity. Otherwise, the full entity identifier
---@param transformationString string @Transformation name
function EID:removeTransformation(targetType, targetIdentifier, transformationString)
end

---Render HUD location indicators for debugging purposes
function EID:renderHUDLocationIndicators()
end

---Helper function to render Icons in specific EID settings
---@param spriteObj Sprite
---@param posX integer
---@param posY integer
---@param callback fun(spriteObj: Sprite) | nil
---@param animName string | nil
---@param animFrame integer | nil
function EID:renderIcon(spriteObj, posX, posY, callback, animName, animFrame)
end

---Render an indicator for an entity, such as a highlight or arrow
---@param entity Entity
---@param playerNum integer - The player number to render the indicator for. Controls the arrow color
function EID:renderIndicator(entity, playerNum)
end

---Renders a list of given inline sprite objects returned by the "EID:filterIconMarkup()" function
---@param spriteTable [EID_Icon, integer?, fun(spriteObj:Sprite)?][]
---@param posX integer
---@param posY integer
function EID:renderInlineIcons(spriteTable, posX, posY)
end

---Renders a given string using the EID Custom font. This will also apply any markup and render icons
---Should be called in a render callback
---@param str string
---@param position Vector
---@param scale Vector
---@param kcolor KColor
---@param renderBulletPointIcon boolean?
---@return KColor
function EID:renderString(str, position, scale, kcolor, renderBulletPointIcon)
end

---Render an unidentified pill description
---@param entity Entity
function EID:renderUnidentifiedPill(entity)
end

---Replaces all markup {{ }} with placeholder strings, to use in fitTextToWidth
---@param text string
---@param checkBulletpoint? boolean
---@return string, integer?
function EID:replaceAllMarkupWithSpaces(text, checkBulletpoint)
end

---Replaces markup icons with ones of a different size based on the current config
---@param description string
---@return string
function EID:replaceMarkupSize(description)
end

---Replaces name markup objects with the actual name
---@param text string
---@return string
function EID:replaceNameMarkupStrings(text)
end

---Replaces shorthand-representations of a character with the internal reference
---@param text string
---@return string
function EID:replaceShortMarkupStrings(text)
end

---REPENTOGON: Use PersistentGameData to determine item collection status
---Returns true if an item needs to be collected for the collection page
function EID:requiredForCollectionPage(itemID)
end

---Resumes all coroutines.
---Ran 60 times a second in main game render
function EID:resumeCoroutines()
end

---@param entity Entity
---@param str string
---@param value any
function EID:setEntityData(entity, str, value)
end

---Set an icon for the mod which will be displayed next to the item name
---@param iconMarkup string
---@param override? boolean @Default: true
function EID:setModIndicatorIcon(iconMarkup, override)
end

---Specify the name of the mod which will be displayed next to the item name
---By default EID takes the mod name
---@param newName string
function EID:setModIndicatorName(newName)
end

---Set the player and coop player data for EID
function EID:setPlayer()
end

---"Item Probability" MODE: Get percentages of what quality / item pool a given set of 8 ingredients can yield
function EID:simulateBagOfCrafting(componentsTable)
end

---Converts a given table into a string containing the crafting icons of the table
---Example input: {1,2,3,4,5,6,7,8}
---Result: "{{Crafting1}}{{Crafting2}}{{Crafting3}}{{Crafting4}}{{Crafting5}}{{Crafting6}}{{Crafting7}}{{Crafting8}}"
---@param craftTable integer[]
---@param indicateCompleteContent boolean
---@return string
function EID:tableToCraftingIconsFull(craftTable, indicateCompleteContent)
end

---Converts a given table into a string containing the crafting icons of the table, which are also grouped to reduce render lag
---@param craftTable integer[] @Example: {1,1,1,2,2,3,3,3}
---@param indicateCompleteContent boolean?
---@return string @Example: "3{{Crafting1}}2{{Crafting2}}3{{Crafting3}}"
function EID:tableToCraftingIconsMerged(craftTable, indicateCompleteContent)
end

---This function both trims the desc to just a list of chances, and highlights the next result if allowed, since those two actions are very intertwined
function EID:trimSanguineDesc(spikes, descObj)
end

---Try to automatically assign vanilla transformations to the entity
---@param collectibleID CollectibleType
function EID:tryAutodetectTransformationsCollectible(collectibleID)
end

---Replaces all values in `changeTable` with the values in `tableToUpdate`.
---If a value is an empty string, it will be removed.
---@param changeTable table
---@param tableToUpdate table
function EID:updateDescriptionsViaTable(changeTable, tableToUpdate)
end
