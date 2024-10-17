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

-- if getUsername() == "oline5" then autobuypack = false end

hargapack = 150000                -- Pack Price
namapack = "incognito_hat"     -- Pack Name
MinItemPack = 1                 -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {5706, 14832}              -- Put all your id item pack in here
maxbuy = 2                      -- Bot will try to buying X times if have more gems
MinGems = hargapack                 -- Minimal Gems for Buying Pack

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end
