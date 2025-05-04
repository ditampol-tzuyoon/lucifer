ShowBotInfo = false
DurasiWorldPNB = 80
SetLevelWorld = 30
TimeRelogBotMatung = 15

setoran = 75
MinMaladyDuration = 600
JedaHW = 1
PrivatePNB = true

DelayRecon = 30000
DelayBadServer = 30000

if getBot().level >= 12 then
  TalkTooMuch = true
end

RestSchedule = false
JadwalOff = {
    "11.30 - 12.30",
    "15.00 - 15.45",
    "17.00 - 19.00",
    "20.15 - 21.00",
    "23.30 - 00.30"
}

hargapack = 2000
namapack = "world_lock"
MinItemPack = 5
iditempack = {242}
maxbuy = 10                      -- Bot will try to buying X times if have more gems
MinGems = 10000

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end

-- for _,pack in pairs(SpecialItem) do
--     if not pengecualian[pack] then
--         pengecualian[pack]=true
--     end
-- end
