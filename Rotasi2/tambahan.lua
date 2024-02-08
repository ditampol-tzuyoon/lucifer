nLoop = 0
WorldPNB = "WORLDPNBSAYAAPA"
ModUrl = "https://discord.com/api/webhooks/1203676541264072776/UlY0RhSidiRAIgLI0o7uU4gkDXoPkVtURTyxv2pZXX-1G2w4pWKsIY__UPA1FiUZlm4c"

if not DurasiWorldPNB then
    DurasiWorldPNB = 75
end

if not WorldGrinding then
    WorldGrinding = "ABCDEFOD"
end

if not DelayReplace then
    DelayReplace = 10000
end

if not TargetLoop then
    TargetLoop = 77777
end

if not TryWarp then
    TryWarp = 25
end

function AmbilWaktu()
    -- Mengatur zona waktu menjadi UTC+7 (waktu Jakarta)
    local currentTimeUTC = os.time(os.date("!*t"))
    local FormatUTC = currentTimeUTC + (UTC_Time * 60 * 60)

    -- Mendapatkan informasi waktu dalam tabel
    local timeTable = os.date("*t", FormatUTC)

    local formattedTime = string.format("%02d:%02d:%02d (UTC+"..UTC_Time..")", 
        timeTable.hour, 
        timeTable.min, 
        timeTable.sec
    )
    
    return formattedTime
end

function IniWaktu()
    -- Mendapatkan waktu saat ini dalam detik sejak epoch dalam UTC
    local currentTimeUTC = os.time(os.date("!*t"))
    local FormatUTC = currentTimeUTC + (UTC_Time * 60 * 60)

    -- Mendapatkan informasi waktu dalam tabel
    local timeTable = os.date("*t", FormatUTC)
    
    -- Daftar singkatan hari dan bulan
    local dayAbbrev = {"Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"}
    local monthAbbrev = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
    
    -- Membuat format waktu yang diinginkan
    local formattedTime = string.format("%s, %02d %s %d | %02d:%02d:%02d | UTC+"..UTC_Time, 
        dayAbbrev[timeTable.wday], 
        timeTable.day,
        monthAbbrev[timeTable.month],  -- Menggunakan monthAbbrev untuk mendapatkan singkatan bulan
        timeTable.year,
        timeTable.hour, 
        timeTable.min, 
        timeTable.sec
    )
    
    return formattedTime
end

function Tegs(abc)
    log(AmbilWaktu().." | "..OdBot().name.." | "..abc)
end

function SplitAkun(divira)
    local SplitA = {}
    for w in divira:gmatch("([^:]+)") do 
        table.insert(SplitA, w) 
    end

    table.insert(BotUser, SplitA[1])
    table.insert(BotPass, SplitA[2])
end

if GuestAkun then

    function randomLetter(ods)
        if ods == 0 then
            return ""
        else
            return string.sub("ABCDEFGHIJKLMNOPQRSTUVWXYZ", ods, ods)
        end
    end

    MyName = {}
    for i = 1, #ListGuest do
        if i >= 1 and i <= 26 then
            table.insert(MyName, (string.char(64+i)..randomLetter(0)..RandomName):lower())
        elseif i >= 27 and i <= 52 then
            table.insert(MyName, (string.char((64-26)+i)..randomLetter(1)..RandomName):lower())
        elseif i >= 53 and i <= 78 then
            table.insert(MyName, (string.char((64-52)+i)..randomLetter(2)..RandomName):lower())
        elseif i >= 79 and i <= 104 then
            table.insert(MyName, (string.char((64-78)+i)..randomLetter(3)..RandomName):lower())
        elseif i >= 105 and i <= 130 then
            table.insert(MyName, (string.char((64-104)+i)..randomLetter(4)..RandomName):lower())
        elseif i >= 131 and i <= 156 then
            table.insert(MyName, (string.char((64-130)+i)..randomLetter(5)..RandomName):lower())
        elseif i >= 157 and i <= 182 then
            table.insert(MyName, (string.char((64-156)+i)..randomLetter(6)..RandomName):lower())
        elseif i >= 183 and i <= 208 then
            table.insert(MyName, (string.char((64-182)+i)..randomLetter(7)..RandomName):lower())
        end
    end

    BotList = {}
    for q = 1, #ListGuest do
        table.insert(BotList, MyName[q]..":AWIKWOK")
    end
end

function AbaikanGems()
    if not CheckSoil(block) then
        if IgnoreGems_PTHT then
            bot.ignore_gems = true
        else
            bot.ignore_gems = false
        end
    end
end

function MyWorld(id)
    SplitWorld = {}
    for i, v in pairs(BotFarmList) do
        if i >= (((id - 1)*PerBotWorldCount) + 1) and i <= PerBotWorldCount*id then
            table.insert(SplitWorld, v)
        end
    end
    return SplitWorld
end

if LoginWithRange then
    SplitLogin = {}
    for c in LoginWithRange:gmatch("([^-]+)") do 
        table.insert(SplitLogin, c) 
    end

    SlotLogin = {}
    for i = SplitLogin[1], SplitLogin[2] do
        table.insert(SlotLogin, i)
    end
end

BotUser = {}
BotPass = {}
for i = 1, #BotList do
    SplitAkun(BotList[i])
end

if ResetnWorld then
    BotStart = {}
    for i = 1, #BotList do
        table.insert(BotStart, 1)
    end
end

if (not ShowMainInfo) and (HideWebhook) then
    BotWebhook = {}
    BotIdWebhook = {}
    for i = 1, #BotList do
        table.insert(BotWebhook, "")
        table.insert(BotIdWebhook, "")
    end
end

ListBot = {} --DONT TOUCH ME BITCH
for i, v in pairs(BotList) do
    table.insert(ListBot, {
        BotName = BotUser[i],
        Password = BotPass[i],
        World = MyWorld(i),
        idDoor = BotIDDoor,
        nWorld = BotStart[i],
        WebhookUrl = BotWebhook[i],
        idHook = BotIdWebhook[i]
    } )
end

function SplitGuest(macz, dataz)
    local SplitIt = {}
    for w in dataz:gmatch("([^|]+)") do 
        table.insert(SplitIt, w) 
    end

    if macz then
        return SplitIt[1]
    else
        return SplitIt[2]
    end
end

---============ ALTERNATIF ===========---

function BuatFolder()
    -- Cek apakah direktori sudah ada
    local isDirectoryExist = io.open("Ohdear", "r")
    if not isDirectoryExist then
        os.execute("mkdir Ohdear")
    else
        io.close(isDirectoryExist)
    end
end

function hapusFile(namaFile)
    local pathFile = "Ohdear/" .. namaFile .. ".txt"
    os.remove(pathFile)
end

function InsertBotName(ErineBot)

    -- Buka file dalam mode append
    local file = io.open("Ohdear/MyBot.txt", "a")
  
    -- Periksa apakah file berhasil dibuka
    if file then
        file:write(ErineBot, "\n")
        file:close()
    end
end

function NewOdBots()
    
    -- Buka file dalam mode read
    local file = io.open("Ohdear/MyBot.txt", "r")

    -- Inisialisasi array untuk menyimpan isi file
    local BotSaya = {}

    -- Periksa apakah file berhasil dibuka
    if file then
        -- Baca setiap baris dari file dan simpan dalam array 'BotSaya'
        for line in file:lines() do
            table.insert(BotSaya, line)
        end

        -- Tutup file setelah selesai membaca
        file:close()
    end

    return BotSaya
end

function SimpanPlant(tabel)
  
    -- Buka file untuk penulisan
    local file = io.open("Ohdear/Plant.txt", "w")
  
    -- Periksa apakah file berhasil dibuka
    if file then
        -- Iterasi melalui setiap elemen tabel dan tulis ke file
        for _, nilai in ipairs(tabel) do
            file:write(nilai, "\n")  -- Pisahkan dengan baris baru
        end

        -- Tutup file setelah selesai
        file:close()
    end
end

---============ ALTERNATIF ===========---

function PakaiProxy(socks)
    manager = getProxyManager()
    manager:setLimit(LimitProxy)
    for _, v in pairs(ListProxy) do
        manager:addProxy(v)
    end
end

if AutoLogin and #getBots() == 0 then
    if UseProxy then
        PakaiProxy()
    end
        
    if LanjutPlant then
        SimpanPlant(ListPlant)
    end
    BuatFolder()
    yuna = 1
    for i,r in pairs(ListBot) do
        for _, v in pairs(SlotLogin) do
            if v == i then
                BotName = r.BotName
                Password = r.Password
                if GuestAkun then
                    addBot(BotName, SplitGuest(true, ListGuest[i]), SplitGuest(false, ListGuest[i]))
                else
                    addBot(BotName, Password)
                end
                sleep(DelayLogin)
                yuna = yuna + 1
            end
        end
    end
    return
end

function GetMaWorld()
    addEvent(Event.variantlist, mawor)
            
    runThread(function()
        getBot():sendPacket(2, "action|wrench\n|netid|"..getLocal().netid)
        sleep(1000)
        getBot():sendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..getLocal().netid.."|\nbuttonClicked|my_worlds")
        sleep(1000)
    end) 
    
    listenEvents(6)
    removeEvent(Event.variantlist)
end
