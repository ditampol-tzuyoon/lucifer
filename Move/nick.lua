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
    "589805935938240522",
    "451780901664194578",
    "756066459465285654",
    "380311374468743179",
    "914736413633814568",
    "1193760521023918142",
    "414725665561247744",
    "853675179187109888",
    "343754497002045441",
    "1086256940629372938",
    "403496083080085506",
    "486856794174652426",
    "424893793637236736",
    "1030765931112181841",
    "1257282336844943382",
    "911935788336418866",
    "862706780068905010",
    "964403939753746502",
    "680741926194249730",
    "555670234632290305",
    "880065141390073876",
    "1290506567296483348",
    "1280499611827703850",
    "521002987540316184",
    "627098360704270347",
    "467344531898105868",
    "551284764330688512",
    "711067144477081671",
    "379566146732687364",
    "395090236654354440"
}

function ohdsay(logger, TypeHook, Pings)
    if not HideWebhook then
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
end
