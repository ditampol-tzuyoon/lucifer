ShowBotInfo = false
DurasiWorldPNB = 80
SetLevelWorld = 30
TalkTooMuch = true

-- hargapack = 20000                -- Pack Price
-- namapack = "world_lock_10_pack"         -- Pack Name
-- MinItemPack = 10                 -- Bot will dropping the pack when he have X MinItemPack or more
-- iditempack = {5402, 10538, 10536, 242}              -- Put all your id item pack in here
-- maxbuy = 5                      -- Bot will try to buying X times if have more gems
-- MinGems = 20000

hargapack = 10000                   -- Pack Price
namapack = "cny_spray"               -- Pack Name
MinItemPack = 2                    -- Bot will dropping the pack when he have X MinItemPack or more
iditempack = {5402, 10538, 10536, 242, 5764}   -- Put all your id item pack in here
maxbuy = 5                      -- Bot will try to buying X times if have more gems
MinGems = 20000

SpecialItem = {5742, 5746, 5748}                -- Put all your id item special in here
minSpec = 50
ID_AcuanDrop_Spec = 13

-- if getUsername() == "oline5" then
--     RestSchedule = false
--     JadwalOff = {
--         "13.45 - 15.30"
--     }
-- end

IgnorePack = {}
for _,pack in pairs(iditempack) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
    if not IgnorePack[pack] then
        IgnorePack[pack] = true
    end
end

for _,pack in pairs(SpecialItem) do
    if not pengecualian[pack] then
        pengecualian[pack]=true
    end
end
