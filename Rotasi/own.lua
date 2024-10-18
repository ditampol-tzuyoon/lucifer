delaypnb = 175
delayworld = 5000
delayplant = 150
delayht = 150
TargetGems = 999999999
setoran = 75
JedaHW = 10
TilePNB = 5                 -- (1 - 5)
idVial = 8542
nextrandom = false
delayrandomworld = 10000
nLettPNB = 6
Limit_BotInfo = 12
PNBinFarm = false
autobuypack = true

DelayRecon = 90000              -- Interval Reconnecting
DelayBadServer = 120000

ID_AcuanDrop_Pack = 13           -- ID Foreground or Background for Drop Pack
hargapack = 5000                -- Pack Price
namapack = "crime_wave"       -- Pack Name
MinItemPack = 5                 -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {2382, 2292, 2294, 2296, 2298, 2300, 2308, 2310, 2312, 2314, 2316, 2320, 2322, 2324, 2326, 2328, 2332, 2334, 2336, 2338, 2340}       -- Put all your id item pack in here
maxbuy = 6                       -- Bot will try to buying X times if have more gems
MinGems = 25000              -- Minimal Gems for Buying Pack

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end
