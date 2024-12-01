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
KillGhost = false

autobuypack = false
hargapack = 8000                -- Pack Price
namapack = "vending_machine"       -- Pack Name
MinItemPack = 1                 -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {10394, 6416, 6520, 6538, 6522, 6528, 6540, 6518, 6530, 6524, 6536, 6534, 6532, 6526, 2978}
maxbuy = 75                       -- Bot will try to buying X times if have more gems
MinGems = 8000              -- Minimal Gems for Buying Pack


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
    "13.45 - 15.30"
}
