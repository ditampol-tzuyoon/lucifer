TargetGems = 999999999
ShowBotInfo = false
DurasiWorldPNB = 80
SetLevelWorld = 30

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

function Menanam()
    WarpPlant()
    if KillGhost then
        JmlGhost = #bot:getWorld():getNPCs()
        if JmlGhost > 0 then 
            odnotice("Wait, Mau Ruqyah "..JmlGhost.." Mbak Kun!\n**World : "..OdBot().world:upper().."**")
            if findItem(6086) ~= 1 or not findClothes(6086) then
                if findItem(6086) == 1 and not findClothes(6086) then
                    wear(6086)
                    sleep(500)
                elseif findItem(6086) ~= 1 then
                    MasukTools()
                    GetTools(6086, "Tools", 1, true)
                    DropTools(6086, 8, 11, 1, "Tools")
                end
            end
            WarpPlant()
            clearHantu("Plant")
            MasukTools()
            DropTools(6086, 8, 11, 0, "Tools")
            WarpPlant()
            ohdtag("Selesai Ruqyah")
        end
    end
    if Lubang() <= 1 and WorldPlant:upper() == OdBot().world:upper() then
        DeleteWorld(WorldPlant)
    else
        if WorldPlant:upper() == OdBot().world:upper() then
            Plant(true)
            if Lubang() <= 1 and WorldPlant:upper() == OdBot().world:upper() then
                SendPlant("World **"..WorldPlant.."** Berhasil ditanam!")
                DeleteWorld(WorldPlant)
            end
        end
    end
end

function GoPNB()
    JoinPNB()
    if KillGhost then
        JmlGhost = #bot:getWorld():getNPCs()
        if JmlGhost > 0 then 
            odnotice("Wait, Mau Ruqyah "..JmlGhost.." Mbak Kun!\n**World : "..OdBot().world:upper().."**")
            if findItem(6086) ~= 1 or not findClothes(6086) then
                if findItem(6086) == 1 and not findClothes(6086) then
                    wear(6086)
                    sleep(500)
                elseif findItem(6086) ~= 1 then
                    MasukTools()
                    GetTools(6086, "Tools", 1, true)
                    DropTools(6086, 8, 11, 1, "Tools")
                end
            end
            JoinPNB()
            clearHantu("PNB")
            MasukTools()
            DropTools(6086, 8, 11, 0, "Tools")
            JoinPNB()
            ohdtag("Selesai Ruqyah")
        end
    end
    if scanToxic(false) > 0 then
        odnotice("Terdapat "..scanToxic(true).." Toxic pada **PNB**!\n**World : "..OdBot().world:upper().."**")
        ClearToxic("PNB")
    end

    if scanCamera() > 0 then
        odnotice("Terdapat CCTV pada World PNB **["..OdBot().world:upper().."]**")
    end
end

function JoinPNB()
    Kegiatan("Warp to PNB")
    GotNuked = false
    WorldPNB = GetPNB()
    while WorldPNB:upper() ~= OdBot().world:upper() and not GotNuked do
        for i = 1, 5 do
            if WorldPNB:upper() ~= OdBot().world:upper() and not GotNuked then
                warp(WorldPNB)
                listenEvents(bot:getInterval(Action.warp))
                sleep(1000)
            end
            Recontol()
        end
        Recontol()
        if WorldPNB:upper() ~= OdBot().world:upper() and not GotNuked and StatusBot() == "online" then
            PaksaStop("PNB", WorldPNB)
        end
        if GotNuked then
            ohdtag("World PNB **["..WorldPNB:upper().."]** Got Nuked!\nUmur World : "..LifePNBWorld())
            GotNuked = false
            ChangeWorldPNB()
        else
            if bot:getWorld():hasAccess(0,0) == 0 and WorldPNB:upper() == OdBot().world:upper() then
                ohdtag("World PNB **["..WorldPNB:upper().."]** Punya Orang Lain!\nAuto Change World...")
                ChangeWorldPNB()
            end
        end
        sleep(500)
    end
end

function clearHantu(Tipe)
    while true do
        if (findItem(6086) == 0 and StatusBot() == "online") or findClothes(6086) then
            break
        end
        wear(6086)
        sleep(1000)
        AutoRecon(Tipe)
    end
    Kegiatan("Ruqyah")
    world = bot:getWorld()
    for _, npc in pairs(world:getNPCs()) do
        local pkt = GameUpdatePacket.new()
        pkt.type = 34
        pkt.count1 = npc.id
        pkt.count2 = 8
        pkt.pos_x = npc.x
        pkt.pos_y = npc.y
        pkt.pos2_x = world:getLocal().posx
        pkt.pos2_y = world:getLocal().posy
        bot:sendRaw(pkt)
        sleep(500)
    end
end

function WorldFarm()
    JoinFarm()
    if KillGhost then
        JmlGhost = #bot:getWorld():getNPCs()
        if JmlGhost > 0 then 
            odnotice("Wait, Mau Ruqyah "..JmlGhost.." Mbak Kun!\n**World : "..OdBot().world:upper().."**")
            if findItem(6086) ~= 1 or not findClothes(6086) then
                if findItem(6086) == 1 and not findClothes(6086) then
                    wear(6086)
                    sleep(500)
                elseif findItem(6086) ~= 1 then
                    MasukTools()
                    GetTools(6086, "Tools", 1, true)
                    DropTools(6086, 8, 11, 1, "Tools")
                end
            end
            JoinFarm()
            clearHantu("Farm")
            MasukTools()
            DropTools(6086, 8, 11, 0, "Tools")
            JoinFarm()
            ohdtag("Selesai Ruqyah")
        end
    end
    if scanCamera() > 0 then
        odnotice("Terdapat CCTV pada World Farm **["..OdBot().world:upper().."]**")
    end
    if scanToxic(false) > 0 then
        odnotice("Terdapat "..scanToxic(true).." Toxic pada **Farm**!\n**World : "..OdBot().world:upper().."**")
        ClearToxic("Farm")
    end
    if ScanFire(false) > 0 then
        odnotice("Terdapat "..ScanFire(true).." Api pada **Farm**!\n**World : "..OdBot().world:upper().."**")
        if PadamkanApi then
            if findItem(3066) ~= 1 or not findClothes(3066) then
                if findItem(3066) == 1 and not findClothes(3066) then
                    wear(3066)
                    sleep(500)
                elseif findItem(3066) ~= 1 then
                    MasukTools()
                    GetTools(3066, "Tools", 1, true)
                    DropTools(3066, 3, 16, 1, "Tools")
                end
            end
            -- World, DoorFarm = MyWorld(bot.index)
            JoinFarm()
            ClearFire()
            MasukTools()
            DropTools(3066, 3, 16, 0, "Tools")
            -- World, DoorFarm = MyWorld(bot.index)
            JoinFarm()
        end
    end

    collectSet(true, 3)

    if CheckSoil(block) then
        if IgnoreGems then
            bot.ignore_gems = true
        else
            bot.ignore_gems = false
        end
    end
end
