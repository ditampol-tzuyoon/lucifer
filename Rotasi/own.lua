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

function ItemName(id)
    local IconItem = {
        [2382] = "<:2382:1296875147411591261>",
        [2292] = "<:2292:1296883683873001502>",
        [2294] = "<:2294:1296883814706184242>",
        [2296] = "<:2296:1296883678403756098>",
        [2298] = "<:2298:1296883676260597760>",
        [2300] = "<:2300:1296883674020581376>",
        [2308] = "<:2308:1296883671537815576>",
        [2310] = "<:2310:1296883668937216040>",
        [2312] = "<:2312:1296883666638868581>",
        [2314] = "<:2314:1296883664122155050>",
        [2316] = "<:2316:1296883657008480266>",
        [2320] = "<:2320:1296883654785634304>",
        [2322] = "<:2322:1296883652491214920>",
        [2324] = "<:2324:1296883650612170795>",
        [2326] = "<:2326:1296883648842301452>",
        [2328] = "<:2328:1296883646778576978>",
        [2332] = "<:2332:1296883644643807232>",
        [2334] = "<:2334:1296883642488066229>",
        [2336] = "<:2336:1296883640382263306>",
        [2338] = "<:2338:1296883638100557844>",
        [2340] = "<:2340:1296883636112592926>",
        [5706] = "<:5706:1296885688154984579>"
    }
    if IconItem[id] then
        return IconItem[id]
    end
    return "[" .. GetNameID(id) .. "]"
end

function GetListName(DetilList)
    nama1 = ""
    for i, v in ipairs(DetilList) do
        nama2 = "- "..ItemName(v).." (x"..scanFloat(v)..")\n"
        nama1 = nama1..nama2
    end
    return nama1
end
