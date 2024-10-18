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
autobuypack = true

DelayRecon = 90000
DelayBadServer = 120000

ID_AcuanDrop_Pack = 13
hargapack = 5000
namapack = "crime_wave"
MinItemPack = 5
iditempack = {2382, 2292, 2294, 2296, 2298, 2300, 2308, 2310, 2312, 2314, 2316, 2320, 2322, 2324, 2326, 2328, 2332, 2334, 2336, 2338, 2340}
maxbuy = 6
MinGems = 25000

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end
