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
hargapack = 15000                -- Pack Price
namapack = "star_supplies"       -- Pack Name
MinItemPack = 10                 -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {6416, 6520, 6538, 6522, 6528, 6540, 6518, 6530, 6524, 6536, 6534, 6532, 6526, 5706, 14832}       -- Put all your id item pack in here
maxbuy = 5                       -- Bot will try to buying X times if have more gems
MinGems = 30000              -- Minimal Gems for Buying Pack

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end
