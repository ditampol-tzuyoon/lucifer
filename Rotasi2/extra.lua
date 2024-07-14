nLoop = 0
WorldPNB = "WORLDPNBSAYAAPA"

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
    print(AmbilWaktu().." | "..OdBot().name.." | "..abc)
end

ListSoil = {8622, 8628, 8634, 8640, 8646, 8652, 8658, 8664, 8670, 8676, 8682, 8688, 8694, 8700, 8706, 8712}
block = 0

function CheckSoil(id)
    for _, v in pairs(ListSoil) do
        if v == id then
            return true
        end
    end
    return false
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

function hapusFile(namaFile)
    local pathFile = "Ohdear/" .. namaFile .. ".txt"
    os.remove(pathFile)
end
