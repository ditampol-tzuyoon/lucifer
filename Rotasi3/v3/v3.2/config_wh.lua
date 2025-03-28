Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"
LinkStore = "https://discord.gg/ohdear"
ExeTime = os.time()

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

addEvent(Event.variantlist, function(var, netid)
    if var:get(0):getString() == "OnConsoleMessage" then
        if var:get(1):getString():find("Failed to enter world for unknown reason.") then
            GotNuked = true
            unlistenEvents()
        elseif var:get(1):getString():find("That world is inaccessible") then
            GotNuked = true
            unlistenEvents()
        end
    elseif var:get(0):getString() == "OnStoreRequest" then
        if var:get(1):getString():find(namapack) then
            CashBack = true
        end
        unlistenEvents()
    elseif var:get(0):getString() == "OnWinterRallyRequest" then
        if var:get(1):getString():find("claim_button|Claim Rewards") then
            ClaimWinter = true
        end
        unlistenEvents()
    elseif var:get(0):getString() == "OnDialogRequest" then
        local variantText = var:get(1):getString()
        if variantText then
            if variantText:find("This Auto Surgeon Station can only cure") then
                TegOD("Malady berhasil disembuhkan!", "Cured!")
                Cured = true
                unlistenEvents()
            elseif variantText:find("end_dialog|autoSurgeonUi") then
                SurgContinuesOne = true
                unlistenEvents()
            elseif variantText:find("end_dialog|autoSurgeonCurePurchaseUi") then
                SurgContinuesTwo = true
                unlistenEvents()
            end
            unlistenEvents()
        end
    elseif var:get(0):getString() == "OnTalkBubble" then
        local variantText = var:get(2):getString()
        if variantText then
            Kocag = variantText:match("You need at least (%d) World Lock to purchase the cure!")
            if Kocag then
                TegOD("Harga Curednya "..Kocag.." WL Kocak!")
                unlistenEvents()
            end
        end
    end
end)

addEvent(Event.game_message, function(message)
    if message:find('available|1') then
        found = true
        Tegs("Found World [".. WorldPNB .."]")
        unlistenEvents()
    elseif message:find('available|0') then
        found = false
        Tegs("Not Found World [".. WorldPNB .."]")
        unlistenEvents()
    end
end)

function SendPlant(logger)
    wh = Webhook.new(WebhookPlant)
    wh.content = logger
    wh.username = bot.name
    wh:send()
end

function SendFossil(logger)
    wh = Webhook.new(WebhookFossil)
    wh.content = logger
    wh.username = bot.name
    wh:send()
end

function ohdsay(logger, TypeHook, Kirim, Pings)
    if Kirim then
        local Lopar = IconThumb[math.random(1, #IconThumb)]
        local Judulz = "Luci Rotation by Ohdear [" .. versi .. "] || "..getUsername()
        
        local Warna = (bot.status == 1) and 7405312 or 16711680
        local statzBot = (bot.status == 1) and "<a:Onlen:1206807819370758204>" or "<a:Oflen:1206807838996045844>"
        
        local Ment = Pings and (SimplePinghook and " | <@" .. DiscordID .. ">" or "<@" .. DiscordID .. ">") or ""

        local ThumbsUrl = {
            [4584] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/pepper.webp",
            [5666] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/LaserGrid.webp",
            [3004] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/ftank.webp",
            [340] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/chand.webp",
            [8640] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/sambalado.webp",
            [182] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/ItemSprites.png",
            [954] = "https://raw.githubusercontent.com/ditampol-tzuyoon/Growtopia/main/sugarcane.png"
        }
        
        Thumbs = ThumbsUrl[block] or ""

        local pibo = (findClothes(98) and ":green_circle: **WEAR** (x" .. findItem(98) .. ")") or ":red_circle: **NOT WEAR** (x" .. findItem(98) .. ")"

        local TotalAktif, TotalNonaktif = 0, 0
        for _, v in pairs(getBots()) do
            if v.status == 1 then TotalAktif = TotalAktif + 1 else TotalNonaktif = TotalNonaktif + 1 end
        end

        local function prepareWebhook(url)
            local wh = Webhook.new(url)
            wh.username = bot.name
            wh.embed1.use = true
            wh.embed1.color = Warna
            wh.embed1.footer.text = "Rotation Lucifer by Ohdear_\n"..IniWaktu()
            wh.embed1.image = Odirrrr
            wh.embed1.footer.icon_url = Thumbs
            wh.embed1.thumbnail = Lopar
            wh.embed1.author.name = Judulz
            wh.embed1.author.url = LinkStore
            wh.embed1.author.icon_url = Thumbs
            return wh
        end

        if TypeHook == "PingHook" then
            local wh = Webhook.new(PingHook)
            wh.username = bot.name
            if SimplePinghook then
                wh.content = statzBot .. " | " .. logger .. " | **Lv" .. bot.level .. "**" .. ((TargetGems and " | **" .. findItem(112) .. " Gems**") or "") .. Ment
            else
                wh.content = Ment
                wh.embed1.description = logger
                wh.embed1:addField(emot_bot .. " Bot Name", bot.name .. " | **Lv" .. bot.level .. "** | " .. getPing() .. "ms", false)
                wh.embed1:addField("<a:Onlen:1206807819370758204> ON | OFF <a:Oflen:1206807838996045844>", TotalAktif .. " | " .. TotalNonaktif, true)
            end
            wh:send()

        elseif TypeHook == "PlantHook" then
            local wh = Webhook.new(PlantHook)
            wh.content = logger
            wh.username = bot.name
            wh:send()

        elseif TypeHook == "SeedHook" then
            local wh = prepareWebhook(SeedHook)
            local Deskripsi = "<a:arrowlove:1270653616373628940> START [<t:" .. ExeTime .. ":R>]\n<a:arrowlove:1270653616373628940> UPDATED [<t:" .. os.time() .. ":R>]"
            wh.embed1.description = Deskripsi
            wh.embed1:addField(emot_bot .. " Bot Name", bot.name .. " | **Lv" .. bot.level .. "** | " .. getPing() .. "ms", false)
            wh.embed1:addField(emot_world .. " " .. GetNameID(seed), ShowSeed, true)
            wh.embed1:addField(emot_tas .. " Backpack (Sisa Seed)", findItem(seed) .. " " .. GetNameID(seed), true)
            wh.embed1:addField("<a:Onlen:1206807819370758204> ON | OFF <a:Oflen:1206807838996045844>", TotalAktif .. " | " .. TotalNonaktif, true)
            wh:edit(HookIDSeed)

        elseif TypeHook == "PackHook" then
            local wh = prepareWebhook(PackHook)
            local Deskripsi = "<a:arrowlove:1270653616373628940> START [<t:" .. ExeTime .. ":R>]\n<a:arrowlove:1270653616373628940> UPDATED [<t:" .. os.time() .. ":R>]"
            wh.embed1.description = Deskripsi
            wh.embed1:addField(emot_bot .. " Bot Name", bot.name .. " | **Lv" .. bot.level .. "** | " .. getPing() .. "ms", false)
            wh.embed1:addField(emot_pack .. " " .. namapack:upper(), ShowPack, false)
            wh.embed1:addField("<a:Onlen:1206807819370758204> ON | OFF <a:Oflen:1206807838996045844>", TotalAktif .. " | " .. TotalNonaktif, true)
            wh:edit(HookIDPack)

        elseif TypeHook == "SpecHook" then
            local wh = prepareWebhook(SpecHook)
            local Deskripsi = "<a:arrowlove:1270653616373628940> START [<t:" .. ExeTime .. ":R>]\n<a:arrowlove:1270653616373628940> UPDATED [<t:" .. os.time() .. ":R>]"
            wh.embed1.description = Deskripsi
            wh.embed1:addField(emot_bot .. " Bot Name", bot.name .. " | **Lv" .. bot.level .. "** | " .. getPing() .. "ms", false)
            wh.embed1:addField(emot_pack .. " SPECIAL ITEM", ShowSpec, false)
            wh.embed1:addField("<a:Onlen:1206807819370758204> ON | OFF <a:Oflen:1206807838996045844>", TotalAktif .. " | " .. TotalNonaktif, true)
            wh:edit(HookIDSpec)

        elseif TypeHook == "ToolsHook" then
            local wh = prepareWebhook(ToolsHook)
            local Deskripsi = "<a:arrowlove:1270653616373628940> START [<t:" .. ExeTime .. ":R>]\n<a:arrowlove:1270653616373628940> UPDATED [<t:" .. os.time() .. ":R>]"
            wh.embed1.description = Deskripsi
            wh.embed1:addField(emot_bot .. " Bot Name", bot.name .. " | **Lv" .. bot.level .. "** | " .. getPing() .. "ms", false)
            wh.embed1:addField(emot_pack .. " TOOLS ITEM", ShowTools, false)
            wh.embed1:addField("<a:Onlen:1206807819370758204> ON | OFF <a:Oflen:1206807838996045844>", TotalAktif .. " | " .. TotalNonaktif, true)
            wh:edit(HookIDTools)

        elseif TypeHook == "NukedHook" then
            local wh = Webhook.new(NukedHook)
            wh.content = logger .. Ment
            wh.username = bot.name
            wh:send()
        
        elseif TypeHook == "AllBotHook" then
            local wh = prepareWebhook(AllBotHook)
            local Deskripsi = "<a:arrowlove:1270653616373628940> START [<t:" .. ExeTime .. ":R>]\n<a:arrowlove:1270653616373628940> UPDATED [<t:" .. os.time() .. ":R>]"
            wh.embed1.description = Deskripsi

            Limit_BotInfo = Limit_BotInfo or 10
            for i, erBot in pairs(getBots()) do
                if erBot.index <= Limit_BotInfo then
                    if StatusBot(erBot):upper() == "ONLINE" then
                        EmojiStsBot = "<a:Onlen:1206807819370758204>"
                    else
                        EmojiStsBot = "<a:Oflen:1206807838996045844>"
                    end
                    if HideName then
                        Tuyul = "Bot Ke-"..i
                    else
                        Tuyul = erBot.name:upper()
                    end
                    wh.embed1:addField(emot_bot .. " " .. Tuyul .. " [" .. erBot:getInventory():findItem(242) .. " WL]", EmojiStsBot .. " | " .. StatusBot(erBot):upper() .. " [Lv" .. erBot.level .. "]\n<:bubble:1291603413410250835> | " .. erBot.custom_status .. "\n<a:world:1291603790226522143> | ||" .. erBot:getWorld().name:upper() .. "||\n<:gems:1291601156686090240> | " .. formatUang(erBot.gem_count) .. " / " .. formatUang(erBot.obtained_gem_count), true)
                    if (erBot.index % 2) == 0 then
                        wh.embed1:addField("\t", "\t", false)
                    end
                end
            end

            local activez, inactivez, bannedz, gemsz, obt_gemsz, chapcz, inerz = StatusAllBot()
            wh.embed1:addField(":video_game: Status " .. #getBots() .. " Bots", "<a:Onlen:1206807819370758204> | " .. activez .. "\n<a:Oflen:1206807838996045844> | " .. inactivez .. "\n<a:warning:1270653635641999443> | " .. bannedz .. "\n<a:done:1270654533911187517> | " .. chapcz .. "\n<a:loading:1270966313095008339> | " .. inerz .. "\n<:gems:1291601156686090240> | " .. formatUang(gemsz) .. " / " .. formatUang(obt_gemsz), false)
            wh:edit(HookIDBot)
        end
    end
end
