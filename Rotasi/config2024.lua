nLoop = 0
WorldPNB = "ABCHJADHJAD"

if not TargetLoop then
    TargetLoop = 77777
end

if not TryWarp then
    TryWarp = 25
end

function AmbilWaktu()
    -- Mengatur zona waktu menjadi UTC+7 (waktu Jakarta)
    local utcOffset = UTC_Time * 60 * 60  -- offset dalam detik
    
    -- Mendapatkan waktu saat ini dalam detik sejak epoch
    local currentTime = os.time()
    
    -- Menghitung waktu Jakarta dalam detik
    local jakartaTime = currentTime + utcOffset
    
    -- Mendapatkan informasi waktu dalam tabel
    local timeTable = os.date("*t", jakartaTime)
    
    -- Mengembalikan hari, jam, dan menit
    return timeTable.wday, timeTable.hour, timeTable.min
end

function Tegs(abc)
    Dayz, Hourz, Minutez = AmbilWaktu()
    DayNamez = getDayName(Dayz)
    print(DayNamez..", "..Hourz..":"..Minutez.." | "..OdBot().name.." | "..abc)
end


-- Fungsi untuk mendapatkan nama hari berdasarkan nilai wday
function getDayName(dayValue)
local days = {"Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"}
return days[dayValue]
end

function Randomz(length)
    AllRand = {}
    
    for i = 1, 26,1 do
        AllRand[i] = string.char(64+i)
    end

    Kapital = #AllRand

    for i = 1, 26,1 do
        AllRand[Kapital + i] = string.char(96+i)
    end

    Kecil = #AllRand + 1
    
    for i = 0, 9, 1 do
        AllRand[Kecil+i] = i
    end

	local result = {}
    local res = ""
	for i = 1, length do
        teks = (AllRand[math.random(1,#AllRand)])
        res = res .. teks
	end
	return res
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

    function ThatName(ods)
        return string.sub(RandomName, ods, ods)..RandomName:gsub(string.sub(RandomName, ods, ods), "")
    end

    MyName = {}
    for i = 1, #ListGuest do
        if i >= 1 and i <= 26 then
            table.insert(MyName, string.char(64+i)..ThatName(1))
        elseif i >= 27 and i <= 52 then
            table.insert(MyName, string.char((64-26)+i)..ThatName(2))
        elseif i >= 53 and i <= 78 then
            table.insert(MyName, string.char((64-52)+i)..ThatName(3))
        elseif i >= 79 and i <= 104 then
            table.insert(MyName, string.char((64-78)+i)..ThatName(4))
        elseif i >= 105 and i <= 130 then
            table.insert(MyName, string.char((64-104)+i)..ThatName(5))
        elseif i >= 131 and i <= 156 then
            table.insert(MyName, string.char((64-130)+i)..ThatName(6))
        elseif i >= 157 and i <= 182 then
            table.insert(MyName, string.char((64-156)+i)..ThatName(7))
        elseif i >= 183 and i <= 208 then
            table.insert(MyName, string.char((64-182)+i)..ThatName(8))
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

function Cadangan(id)
    if PerBotBackup == 0 then
        return {}
    else
        SplitCadangan = {}
        for i, v in pairs(BotBackup) do
            if i >= (((id - 1)*PerBotBackup) + 1) and i <= PerBotBackup*id then
                local SplitC = {}
                for w in v:gmatch("([^:]+)") do 
                    table.insert(SplitC, w) 
                end
                if #SplitC == 2 then
                    table.insert(SplitCadangan, { 
                        BotName = SplitC[1],
                        Password = SplitC[2]
                    })
                else
                    table.insert(SplitCadangan, { 
                        BotName = SplitC[1],
                        Password = SplitC[3]
                    })
                end
            end
        end
        return SplitCadangan
    end
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
	nBot = tonumber(SplitLogin[1]) - 1
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
        CadanganBot = Cadangan(i),
        World = MyWorld(i),
        idDoor = BotIDDoor,
        nWorld = BotStart[i],
        WebhookUrl = BotWebhook[i],
        idHook = BotIdWebhook[i]
    } )
end

if AutoLogin and #getBots() == 0 then
    if UseProxy then
        for i = 1, #ListProxy do
            getProxyManager():addProxy(ListProxy[i])
            getProxyManager():setLimit(BotPerProxy)
        end
    end
    yuna = 1
    for i,r in pairs(ListBot) do
        for _, v in pairs(SlotLogin) do
            if v == i then
                BotName = r.BotName
                Password = r.Password
                if GuestAkun then
                    local SplitGuest = {}
                    for w in ListGuest[i]:gmatch("([^|]+)") do 
                        table.insert(SplitGuest, w) 
                    end
                    addBot(BotName, SplitGuest[1], SplitGuest[2])
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
