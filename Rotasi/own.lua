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
DelayRecon = 75000
DelayBadServer = 75000
KillGhost = false

autobuypack = true
hargapack = 45000                -- Pack Price
namapack = "surg_value_pack"     -- Pack Name
MinItemPack = 20                 -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {1270, 4316, 4310, 1258, 4312, 4318, 4308, 1260, 1268, 4314, 1264, 1266, 1262, 4296}              -- Put all your id item pack in here
maxbuy = 2                      -- Bot will try to buying X times if have more gems
MinGems = 45000              -- Minimal Gems for Buying Pack

EventLabu = false
MinGOG = 30

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
    "14.15 - 15.30"
}
