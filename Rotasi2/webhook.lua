Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"
LinkStore = "https://discord.gg/UG6MNdqtTa"
IP_Server_OD = "47.90.162.79"

LogoPartai = {
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/1.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/2.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/3.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/4.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/5.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/6.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/7.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/8.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/9.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/10.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/11.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/12.jpg",
    "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/Erine/13.jpg"
}

function TahanGems(logger)
    wh = Webhook.new(WebhookCID)
    wh.content = logger
    wh.username = "Keep Gems Account"
    wh:send()
end

function ohdsay(logger, TypeHook, Pings)

    Lopar = LogoPartai[math.random(1, #LogoPartai)]
    Judulz = "Rotasi Farm Lucifer ("..versi..") || "..#ListPembeli.." Users. || Author Ohdear_"

    if bot.status == 1 then
        Warna = 7405312
        statzBot = ":green_circle:"
    else
        Warna = 16711680
        statzBot = ":red_circle:"
    end

    if Pings then
        if SimplePinghook then
            Ment = "<@"..userdc.."> | "
        else
            Ment = "<@"..userdc..">"
        end
    else
        Ment = ""
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
    elseif block == 182 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/ItemSprites.png"
    elseif block == 954 then
        Thumbs = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/sugarcane.png"
    else
        Thumbs = ""
    end

    if findClothes(98) then
        pibo = ":green_circle: **WEAR** (x"..findItem(98)..")"
    else
        pibo = ":red_circle: **NOT WEAR** (x"..findItem(98)..")"
    end
    
    if TypeHook == "PingHook" then
        wh = Webhook.new(PingHook)

        if SimplePinghook then
            wh.content = Ment..logger.." | **Lv"..bot.level.."**"
            wh.username = bot.name
        else
            wh.content = Ment
            wh.username = bot.name
            wh.embed1.use = true
            wh.embed1.description = logger
            wh.embed1.color = Warna
            wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()

            wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
            wh.embed1:addField(":timer: Bot Active", BotRun, false)
        end
        wh:send()

    elseif TypeHook == "MainHook" and (not HideWebhook or ShowMainInfo) then
        wh = Webhook.new(MainHook)
        wh.content = Ment
        wh.username = bot.name
        wh.embed1.use = true
        wh.embed1.description = logger
        wh.embed1.color = Warna
        wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()
        wh.embed1.image = Odirrrr
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Lopar
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Thumbs

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."**", false)
        wh.embed1:addField(emot_world.." Current World", bot:getWorld().name, true)
        wh.embed1:addField(emot_pickaxe.." Pickaxe", pibo, true)
        wh.embed1:addField(statzBot.." Bot Status", (OdBot().status):upper().. " | "..getPing().."ms", true)
        wh.embed1:addField(emot_tas.." Backpack", OdBot().items.." / "..OdBot().slots.." Slots.", true)
        wh.embed1:addField(emot_gems.." My Gems", OdBot().gems.." Gems", true)
        wh.embed1:addField(emot_world.." List World", ShowWorld, false)
        wh:edit(HookID)

    elseif TypeHook == "WebhookSeed" and (not HideWebhook or ShowSeedInfo) then
        wh = Webhook.new(WebhookSeed)
        wh.content = Ment
        wh.username = bot.name
        wh.embed1.use = true
        wh.embed1.description = logger
        wh.embed1.color = Warna
        wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()
        wh.embed1.image = Odirrrr
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Lopar
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Thumbs

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
        wh.embed1:addField(emot_world.." "..GetNameID(seed), ShowSeed, true)
        wh.embed1:addField(emot_tas.." Backpack (Sisa Seed)", findItem(seed).." "..GetNameID(seed), true)
        wh.embed1:addField(":timer: Bot Active", BotRun, false)
        wh:edit(HookIDSeed)

    elseif TypeHook == "WebhookPack" and (not HideWebhook or ShowPackInfo) then
        wh = Webhook.new(WebhookPack)
        wh.content = Ment
        wh.username = bot.name
        wh.embed1.use = true
        wh.embed1.description = logger
        wh.embed1.color = Warna
        wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()
        wh.embed1.image = Odirrrr
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Lopar
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Thumbs

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
        wh.embed1:addField(emot_pack.." "..namapack:upper(), ShowPack, true)
        wh.embed1:addField(":timer: Bot Active", BotRun, false)
        wh:edit(HookIDPack)

    elseif TypeHook == "WebhookSpec" and (not HideWebhook or ShowSpecInfo) then
        wh = Webhook.new(WebhookSpec)
        wh.content = Ment
        wh.username = bot.name
        wh.embed1.use = true
        wh.embed1.description = logger
        wh.embed1.color = Warna
        wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()
        wh.embed1.image = Odirrrr
        wh.embed1.footer.icon_url = Thumbs
        wh.embed1.thumbnail = Lopar
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1.author.icon_url = Thumbs

        wh.embed1:addField(emot_bot.." Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
        wh.embed1:addField(emot_pack.." SPECIAL ITEM", ShowSpec, true)
        wh.embed1:addField(":timer: Bot Active", BotRun, false)
        wh:edit(HookIDSpec)

    end
end
