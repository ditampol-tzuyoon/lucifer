if not RarityLevel then
	RarityLevel = 1
end
nLoop = 0
WorldPNB = "ABCHJADHJAD"

if not TargetLoop then
    TargetLoop = 77777
end
if not nMyWorlds then
    nMyWorlds = 1
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
    yuna = 1
    for i,r in pairs(ListBot) do
        for _, v in pairs(SlotLogin) do
            if v == i then
                BotName = r.BotName
                Password = r.Password
                addBot(BotName, Password)
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
