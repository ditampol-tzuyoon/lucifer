TargetGems = 999999999

--[[
IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end
]]--

function JoinFarm()
    AbaikanGems()
    GotNuked = false

    if AutoCure then
        if maladyTimeout then
            CheckExpiredMalady()
        end
        if OdBot().world:upper() == "EXIT" then
            if PNBinFarm then
                MasukTools()
            else
                WorldLeveling()
            end
        end
        if OdBot().world:upper() ~= "EXIT" then
            Kegiatan("I. ["..GetMaladyName().."]")
            say("/status")
            if bot:getMaladyDuration() <= 0 then
                for i = 1, 30 do
                    sleep(1000)
                    if GetMaladyName() == "Healthy" then
                        break
                    end
                end
            end
            sleep(1000)
        end
        if GetMaladyName() ~= "Healthy" then
            if GetMaladyName() == "Torn Punching Muscle" or GetMaladyName() == "Gem Cuts" then
                TegOD("I Have "..GetMaladyName(), GetMaladyName())
                while true do
                    if findItem(242) >= SurgPrice or findItem(112) < 2000 or OdBot().world:upper() == "EXIT" then
                        break
                    end
                    buy("world_lock")
                    sleep(1000)
                end
                if findItem(242) < SurgPrice then
                    AmbilWL(SurgPrice)
                end
                AutoSurg()
                if OdBot().world:upper() ~= "EXIT" then
                    Kegiatan("Update Malady...")
                    say("/status")
                    sleep(1000)
                end
            end
        end
        if not IgnoreMalady then
            if OdBot().world:upper() == "EXIT" then
                if PNBinFarm then
                    MasukTools()
                else
                    WorldLeveling()
                end
            end
            if OdBot().world:upper() ~= "EXIT" then
                Kegiatan("II. ["..GetMaladyName().."]")
                say("/status")
                if bot:getMaladyDuration() <= 0 then
                    for i = 1, 30 do
                        sleep(1000)
                        if GetMaladyName() == "Healthy" then
                            break
                        end
                    end
                end
                sleep(1000)
            end
            if GetMaladyName() == "Healthy" then
                if TalkTooMuch and not PNBinFarm then
                    FindMalady()
                else
                    if findItem(idVial) == 0 then
                        AmbilVial()
                    end
                    while true do
                        Recontol("Tools")
                        if (findItem(idVial) == 0 and StatusBot() == "online") or GetMaladyName() ~= "Healthy" then
                            Tegs("Vial Saya: "..findItem(idVial).." ["..GetMaladyName().."]")
                            break
                        end
                        if getTile(bot.x, bot.y).fg == 6 and StatusBot() == "online" then
                            MasukTools()
                        end
                        TegOD("Using ["..GetNameID(idVial).."]", "Using ["..GetNameID(idVial).."]")
                        bot:use(idVial)
                        sleep(500)
                        say("/status")
                        sleep(1000)
                    end
                end
            end
        end
    end

    if TakePickaxe and findItem(98) ~= 1 then
        collectSet(false, 3)
        MasukTools()
        if findItem(98) == 0 then
            GetTools(98, "Tools", 1, true)
        end
        DropTools(98, 3, 18, 1, "Tools")
    end

    if TakeBene and findItem(1474) ~= 1 and bot.level <= 8 then
        collectSet(false, 3)
        MasukTools()
        if findItem(1474) == 0 then
            GetTools(1474, "Tools", 1, false)
        end
        DropTools(1474, 6, 18, 1, "Tools")
        EatBene = true
        TakeBene = false
    end
    
    if NewUpdate and Leveling and bot.level < RarityLevel then
        AutoFilterFarm(true)
    else
        AutoFilterFarm(false)
    end

    if World[nWorld]:upper() ~= OdBot().world:upper() then
        while World[nWorld]:upper() ~= OdBot().world:upper() and not GotNuked do
            for i = 1, 5 do
                if World[nWorld]:upper() ~= OdBot().world:upper() and not GotNuked then
                    warp(World[nWorld], DoorFarm[nWorld])
                    listenEvents(bot:getInterval(Action.warp))
                    sleep(1000)
                end
                AutoRecon()
            end
            AutoRecon()
            if World[nWorld]:upper() ~= OdBot().world:upper() and not GotNuked and StatusBot() == "online" then
                PaksaStop("Farm", World[nWorld])
            end
            sleep(500)
        end
    end

    if GotNuked then
        if ShowNukedInfo then
            ohdsay("World Farm **["..World[nWorld].."]** GOT NUKED!", "NukedHook", true)
        else
            odnotice("World Farm **["..World[nWorld].."]** GOT NUKED!")
        end
        Tegs("World Farm ["..World[nWorld].."] GOT NUKED!")
        NextWorld(true)
    else
        while true do
            sleep(200)
            if getTile(bot.x, bot.y).fg ~= 6 and StatusBot() == "online" then
                break
            end
            Recontol()
            for i = 1, 10 do
                Recontol()
                warp(World[nWorld], DoorFarm[nWorld])
                sleep(5000)
                if getTile(bot.x, bot.y).fg ~= 6 and StatusBot() == "online" then
                    break
                end
            end
            if getTile(bot.x, bot.y).fg == 6 and StatusBot() == "online" then
                odnotice("ID Door Salah pada World **["..OdBot().world:upper().."]**")
                sleep(10000)
                NextWorld()
            end
        end
        
        DetectFarm()

        local function getSafeTileInfo(x, y)
            local tile = getTile(x, y)
            if tile then
                local info = getInfo(tile.fg)
                return info
            else
                return nil
            end
        end

        local infoBelow = getSafeTileInfo(bot.x, bot.y + 1)
        local infoAbove = getSafeTileInfo(bot.x, bot.y - 1)

        if infoBelow and infoBelow.collision_type == 0 and bot.y < 50 then
            findPath(bot.x, bot.y + 1)
            sleep(500)
        elseif infoAbove and infoAbove.collision_type == 0 and bot.y > 5 then
            findPath(bot.x, bot.y - 1)
            sleep(500)
        end

        if findItem(1474) == 1 then
            bot:use(1474)
            sleep(500)
        end

        if TakePickaxe then
            if findItem(98) >= 1 and not findClothes(98) then
                while true do
                    if (findItem(98) == 0 and StatusBot() == "online") or findClothes(98) then
                        break
                    end
                    wear(98)
                    sleep(500)
                    AutoRecon("Farm")
                end
            end
        end

        collectSet(true, 3)
    end
end
