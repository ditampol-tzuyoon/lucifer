Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"
LinkStore = "https://discord.gg/UG6MNdqtTa"
IP_Server_OD = "172.104.46.13"

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

LogoPartai = {
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/demokrat.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/gerindra.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/golkar.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/nasdem.png",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/pdip.jpeg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/jnck/main/partai/perindo.png"
}

function ohdsay(logger, hookURL, ping)

    Lopar = LogoPartai[math.random(1, #LogoPartai)]
    Judulz = "Rotasi Farm Lucifer ("..versi..") || "..#ListPembeli.." Users. || Author Ohdear_"

    if bot.status == 1 then
        Warna = 7405312
        statzBot = ":green_circle:"
    else
        Warna = 16711680
        statzBot = ":red_circle:"
    end

    if block == 4584 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/pepper.webp"
    elseif block == 5666 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/LaserGrid.webp"
    elseif block == 3004 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/ftank.webp"
    elseif block == 340 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/chand.webp"
    elseif block == 8640 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/sambalado.webp"
    else
        Thumbs = ""
    end

    if findClothes(98) then
        pibo = ":green_circle: **WEAR** (x"..findItem(98)..")"
    else
        pibo = ":red_circle: **NOT WEAR** (x"..findItem(98)..")"
    end

    wh = Webhook.new(hookURL)

    if ping then
        wh.content = "<@"..DiscordID..">"
    end

    wh.username = bot.name
    wh.embed1.use = true
    wh.embed1.description = logger
    wh.embed1.color = Warna
    wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()
    wh.embed1.image = Odirrrr
    
    if hookURL == PingHook then
        wh:send()

    elseif hookURL == MainHook and (not HideWebhook or ShowMainInfo) then
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Thumbs
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Lopar

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."**", false)
        wh.embed1:addField(emot_world.." Current World", bot:getWorld().name, true)
        wh.embed1:addField(emot_pickaxe.." Pickaxe", pibo, true)
        wh.embed1:addField(statzBot.." Bot Status", (OdBot().status):upper().. " | "..getPing().."ms", true)
        wh.embed1:addField(emot_tas.." Backpack", OdBot().items.." / "..OdBot().slots.." Slots.", true)
        wh.embed1:addField(emot_gems.." My Gems", OdBot().gems.." Gems", true)
        wh.embed1:addField(emot_world.." List World", ShowWorld, true)
        wh:edit(HookID)

    elseif hookURL == WebhookSeed and (not HideWebhook or ShowSeedInfo) then
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Thumbs
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Lopar

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
        wh.embed1:addField(emot_world.." "..GetNameID(seed), ShowSeed, true)
        -- wh.embed1:addField(emot_tas.." Backpack (Sisa Seed)", findItem(seed).." "..GetNameID(seed), true)
        wh.embed1:addField(":timer: Bot Active", BotRun, false)
        wh:edit(HookIDSeed)

    elseif hookURL == WebhookPack and (not HideWebhook or ShowPackInfo) then
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Thumbs
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Lopar

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
        wh.embed1:addField(emot_pack.." "..namapack:upper(), ShowPack, true)
        wh.embed1:addField(":timer: Bot Active", BotRun, false)
        wh:edit(HookIDPack)

    end
end
