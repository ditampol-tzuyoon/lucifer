Odirrrr = "https://raw.githubusercontent.com/ditampol-tzuyoon/surfer/main/Image%20Animasi.gif"
LinkStore = "https://discord.gg/Dbv4TrERck"
ExeTime = os.time()

function IniWaktu()
    local currentTimeUTC = os.time(os.date("!*t"))
    local FormatUTC = currentTimeUTC + (UTC_Time * 60 * 60)

    local timeTable = os.date("*t", FormatUTC)
    
    local dayAbbrev = {"Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"}
    local monthAbbrev = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
    
    local formattedTime = string.format("[%02d:%02d:%02d]", 
        timeTable.hour, 
        timeTable.min, 
        timeTable.sec
    )
    
    return formattedTime
end

function MengirimConsole(abc)
    print("["..IniWaktu().."] "..bot.name.." | "..abc)
end

addEvent(Event.variantlist, function(var, netid)
    if var:get(0):getString() == "OnDialogRequest" then
        local message = var:get(1):getString()
        if message:find("end_dialog|door_edit") then
            if message:find("add_text_input|door_id|ID|"..DoorID.."|") then SuccessID = true else sendPacket(2, string.format("action|dialog_return\ndialog_name|door_edit\ntilex|%d|\ntiley|%d|\ndoor_name|Ohdear\ndoor_target|\ndoor_id|"..DoorID , message:match("tilex|(%d+)"), message:match("tiley|(%d+)"))) end
            unlistenEvents()
        elseif message:find("add_button|recalcLock") then
            if message:find("add_checkbox|checkbox_ignore|Ignore empty air|1") then SuccessLock = true else sendPacket(2, string.format("action|dialog_return\ndialog_name|lock_edit\ntilex|%d|\ntiley|%d|\nbuttonClicked|recalcLock\n\ncheckbox_public|0\ncheckbox_ignore|1", message:match("tilex|(%d+)"), message:match("tiley|(%d+)"))) end
            unlistenEvents()
        elseif message:find("end_dialog|boombox_edit") then
            if message:find("add_checkbox|checkbox_silence|Silenced|1") then SuccessJammed = true else sendPacket(2, string.format("action|dialog_return\ndialog_name|boombox_edit\ntilex|%d|\ntiley|%d|\ncheckbox_public|0\ncheckbox_silence|1", message:match("tilex|(%d+)"), message:match("tiley|(%d+)"))) end
            unlistenEvents()
        elseif message:find("This Auto Surgeon Station can only cure") then
            Cured = true
            unlistenEvents()
        elseif message:find("end_dialog|autoSurgeonUi") then
            SurgContinuesOne = true
            unlistenEvents()
        elseif message:find("end_dialog|autoSurgeonCurePurchaseUi") then
            SurgContinuesTwo = true
            unlistenEvents()
        end
    elseif var:get(0):getString() == "OnConsoleMessage" then
        local message = var:get(1):getString()
        if message:find("too many worlds today.") then
            MaxWorld = true
        end
    end
end)

addEvent(Event.game_message, function(message)
    if message:find('available|1') then
        found = true
        successWarp = true
        MengirimConsole("Finding World "..WorldDF.." ["..nWorld.."]")
        unlistenEvents()
    elseif message:find('available|0') then
        found = false
        successWarp = true
        MengirimConsole("World ["..WorldDF.."] not Available! ")
        unlistenEvents()
    end
end)
