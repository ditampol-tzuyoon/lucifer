IconThumb = {
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

function KirimWebhook(tipe, kirim, msg1, msg2, msg3)
    -- Fungsi untuk menyiapkan webhook yang umum
    if kirim then
        local function prepareWebhook(url)
            local wh = Webhook.new(url)
            wh.username = bot.name
            wh.embed1.use = true
            wh.embed1.color = 0x00FFFF
            return wh
        end

        if tipe == "FailedHook" then
            -- Pesan gagal
            local wh = Webhook.new(FailedHook)
            wh.username = bot.name
            wh.content = msg1 .. " | <@" .. DiscordID .. ">"
            wh:send()

        elseif tipe == "PingHook" then
            -- Pesan Ping
            local MentionOwn = (bot.status == 1) and "" or " <@" .. DiscordID .. ">"
            local statzBot = (bot.status == 1) and "<a:Onlen:1206807819370758204>" or "<a:Oflen:1206807838996045844>"
            
            local wh = Webhook.new(PingHook)
            wh.username = bot.name
            wh.content = statzBot .. " | " .. msg1 .. MentionOwn
            wh:send()

        elseif tipe == "BotHook" then
            -- Status update
            local thumbnail = IconThumb[math.random(1, #IconThumb)]
            local Deskripsi = "<a:arrowlove:1270653616373628940> START [<t:" .. ExeTime .. ":R>]\n<a:arrowlove:1270653616373628940> UPDATED [<t:" .. os.time() .. ":R>]"
            local wh = prepareWebhook(BotHook)  -- Diperbaiki: webhook untuk status
            wh.embed1.description = Deskripsi
            wh.embed1.title = Emoji_Title .. " STATUS DF [RDP-" .. NoRdp .. "] " .. Emoji_Title
            wh.embed1.author.name = "DF PREMIUM BY OHDEAR [".. versi .."]"
            wh.embed1.author.url = LinkStore
            wh.embed1.footer.icon_url = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/goldaxe.png"
            wh.embed1.thumbnail = thumbnail
            wh.embed1.footer.text = "Script DF Premium by Ohdear_"

            local botAktif = 0
            for _, erBot in pairs(getBots()) do
                if erBot.index >= StartIndex and erBot.index <= EndIndex then
                    botAktif = botAktif + 1
                end
            end

            if bot.index >= StartIndex and bot.index <= EndIndex then
                updateThread(MyThread(), botAktif, msg1, msg2, msg3)
            end

            embedData(wh)
            wh:edit(MsgidBot)

        elseif tipe == "RestockHook" then
            -- Restock log
            local wh = prepareWebhook(RestockHook)
            wh.embed1.title = Emoji_Title .. " AUTO RESTOCKED " .. msg2 .. " " .. Emoji_Title
            wh.embed1.description = msg1
            wh.embed1.footer.text = "RDP: " .. getUsername() .. " - Thread #" .. MyThread()
            wh:send()

        end
    end
end
