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
autobuypack = false
MinItemPack = 1
namapack = "growganoth"
MinGOG = 30
MinGems = 45000

DelayRecon = 75000
DelayBadServer = 75000
iditempack = {10322, 10324, 10326, 3102, 1238, 1220, 3116, 1988, 5256, 1198, 10328, 13996}

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end
