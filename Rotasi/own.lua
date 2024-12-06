delaypnb = 175
delayworld = 5000
delayplant = 150
delayht = 150
TargetGems = 999999999
setoran = 75
JedaHW = 10
TilePNB = 5
idVial = 8542
nextrandom = false
delayrandomworld = 10000
nLettPNB = 6
Limit_BotInfo = 12
PNBinFarm = false
TargetLevel = 999
DelayRecon = 150000
DelayBadServer = 150000
KillGhost = true
BlackFriday = false

autobuypack = true
hargapack = 20000                -- Pack Price
namapack = "world_lock_10_pack"       -- Pack Name
MinItemPack = 10                 -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {242}
maxbuy = 15                       -- Bot will try to buying X times if have more gems
MinGems = 20000              -- Minimal Gems for Buying Pack

EventLabu = false
MinGOG = 30
DurasiWorldPNB = 120

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end

-- if bot.level < 50 then
--     JadwalOff = {
--         "14.15 - 16.00",
--         "17.30 - 19.30"
--     }
-- else
--     JadwalOff = {
--         "14.15 - 16.00"
--     }
-- end

JadwalOff = {
    "13.45 - 15.30"
}
