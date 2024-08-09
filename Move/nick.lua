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

Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"
LinkStore = "https://discord.gg/UG6MNdqtTa"
IP_Server_OD = "47.253.194.85"
ListPembeli = {
    "422670528483033088",
    "614877382352044073",
    "646934704582426625",
    "576434185405726780",
    "743046174751064076",
    "1017522284874969088",
    "409626157022052352",
    "454443422061821952",
    "898017809781653585",
    "542300187922661376",
    "960106527962841108",
    "1185961836588310568",
    "1203176906971942934",
    "854766876349300736",
    "1000093777576349836",
    "912222625604976660",
    "1019129204060717129",
    "589805935938240522"
}

function ohdsay(logger, TypeHook, Pings)

    Lopar = LogoPartai[math.random(1, #LogoPartai)]
    Judulz = "Dropped Multi Item Lucifer || "..#ListPembeli.." Users. || Author Ohdear_"

    if bot.status == 1 then
        Warna = 7405312
        statzBot = "<a:Onlen:1206807819370758204>"
    else
        Warna = 16711680
        statzBot = "<a:Oflen:1206807838996045844>"
    end

    if Pings then
        Ment = " | <@"..userdc..">"
    else
        Ment = ""
    end
    
    if TypeHook == "PingHook" then
        wh = Webhook.new(PingHook)
        wh.content = statzBot.." | "..logger..Ment
        wh.username = bot.name
        wh:send()
    elseif TypeHook == "MainHook" then
        wh = Webhook.new(MainWebhook)
        wh.content = Ment
        wh.username = bot.name
        wh.embed1.use = true
        wh.embed1.description = logger
        wh.embed1.color = Warna
        wh.embed1.footer.text = "Dropped Items by Ohdear_\n"..IniWaktu()
        wh.embed1.image = Odirrrr
        wh.embed1.thumbnail = Lopar
        wh.embed1.author.name = Judulz
        wh.embed1.author.url = LinkStore
        wh.embed1:addField(":crown: Bot Name", bot.name.." | **Lv"..bot.level.."** | "..getPing().."ms", false)
        wh.embed1:addField(":package: List Dropped", ShowItem, false)
        wh:edit(MainIDMessage)
    end
end
