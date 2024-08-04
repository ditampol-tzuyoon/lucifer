bot = getBot()

function say(od)
    bot:say(od)
end

function Kegiatan(od)
    bot.custom_status = od
end

function StatusBot(detail)
    local OdStatus = {
        [BotStatus.online] = "online",
        [BotStatus.wrong_password] = "wrong",
        [BotStatus.account_banned] = "acc banned",
        [BotStatus.location_banned] = "ip banned",
        [BotStatus.too_many_login] = "too many",
        [BotStatus.version_update] = "update version",
        [BotStatus.maintenance] = "maintenance",
        [BotStatus.advanced_account_protection] = "AAP",
        [BotStatus.http_block] = "HTTP Block",
        [BotStatus.mod_entered ] = "Mod Entered",
        [BotStatus.changing_subserver ] = "Subserver",
        [BotStatus.bad_gateway] = "Bad Gateway",
        [BotStatus.server_issue] = "Server Issue",
        [BotStatus.retrieving_token] = "Retrieving Token",
    }

    if detail then
        local erS = OdStatus[detail.status]
    else
        local erS = OdStatus[bot.status]
    end
    
    if not erS then
        erS = "offline"
    end

    return erS
end

function StatusAllBot()
    local act = 0
    local nonact = 0
    local ban = 0

    for _, erBot in pairs(getBots()) do
        local status = StatusBot(erBot)

        if status == "online" then
            act = act + 1
        elseif status == "offline" then
            nonact = nonact + 1
        elseif status == "acc banned" or status == "ip banned" then
            ban = ban + 1
        end
    end

    return act, nonact, ban
end

function StatusGoogle()
    local OdGoogle = {
        [GoogleStatus.idle] = "Idle",
        [GoogleStatus.processing] = "Processing",
        [GoogleStatus.init_error] = "Init Error",
        [GoogleStatus.invalid_credentials] = "Inv Credentials",
        [GoogleStatus.account_disabled] = "Acc Disabled",
        [GoogleStatus.captcha_required] = "Captcha Required",
        [GoogleStatus.phone_required] = "Phone Required",
        [GoogleStatus.recovery_required] = "Recovery Required",
        [GoogleStatus.no_recovery_challenge] = "No Recovery Challenge",
        [GoogleStatus.couldnt_verify] = "Couldnt Verify",
        [GoogleStatus.unknown_url] = "Unknown URL"
    }

    local erG = OdGoogle[bot.google_status]

    if not erG then
        erG = "Entah"
    end

    return erG
end

function OdBot()
    if not GuestAkun then
        erine = bot.name
    else
        if not erine then
            if bot:isInWorld() then
                erine = getLocal().name
            else
                erine = bot.name
            end
        else
            if not string.match(erine, "_%d+") then
                if bot:isInWorld() then
                    erine = getLocal().name
                else
                    erine = bot.name
                end
            end
        end
    end

    return {
        world = bot:getWorld().name,
        name = erine,
        x = bot.x,
        y = bot.y,
        level = bot.level,
        status = StatusBot(),
        gems = bot.gem_count,
        items = bot:getInventory().itemcount,
        slots = bot:getInventory().slotcount,
    }
end

function getPlayers()
    world = bot:getWorld()
    local orang = {}
    for _,ppl in pairs(world:getPlayers()) do
        table.insert(orang, { name = ppl.name, userid = ppl.userid, netid = ppl.netid, country = ppl.country, x = math.floor(ppl.posx / 32), y = math.floor(ppl.posy / 32)})
    end
    return orang
end

function wear(id)
    bot:wear(id)
end

function unwear(id)
    bot:unwear(id)
end

function getPing()
    return bot:getPing()
end

function findItem(id)
    if id == 112 then
        return OdBot().gems
    end
    item = bot:getInventory():findItem(id)
    if item == nil then
        return 0
    else
        return item
    end
end

function findClothes(id)
    return bot:getInventory():getItem(id).isActive
end

function collect(erin)
    bot:collect(erin, 100)
end


function findPath(x,y)
    bot:findPath(x,y)
end

function wrench(x, y)
    bot:wrench(bot.x + x, bot.y + y)
end

function punch(x, y)
    bot:hit(bot.x + x, bot.y + y)
end

function place(id, x, y)
    bot:place(bot.x + x, bot.y + y, id)
end

function sendPacket(typ, pkt)
    bot:sendPacket(typ, pkt)
end


function drop(id, count)
    if count then
        bot:drop(id, count)
    else
        bot:drop(id, findItem(id))
    end
end

function trash(id, count)
    if count then
        bot:trash(id, count)
    else
        bot:trash(id, findItem(id))
    end
end

if not CollectInterval then
    CollectInterval = 200
end
if not ObjectCollectDelay then
    ObjectCollectDelay = 100
end

function collectSet(erin, jarak)
    bot.collect_interval = CollectInterval
    bot.object_collect_delay = ObjectCollectDelay
    bot.collect_range = jarak
    bot.auto_collect = erin
end

function disconnect()
    bot:disconnect()
end

function connect()
    bot:connect()
end

function getTile(x, y)
    world = bot:getWorld()
    tilefg = 9999
    tilebg = 9999
    tileflags = 0
    tileacc = 0
    tileready = false
    tilefg = world:getTile(x, y).fg
    tilebg = world:getTile(x, y).bg
    tileflags = world:getTile(x, y).flags
    if bot:isInWorld() and y >= 0 and y <= 53 then
        tileready = world:getTile(x, y):canHarvest()
        tileacc = world:hasAccess(x, y)
    end
    return {
        fg = tilefg,
        bg = tilebg,
        flags = tileflags,
        ready = tileready,
        access = tileacc,
    }
end

function getInventory()
    local tas = {}
    for _,bag in pairs(bot:getInventory():getItems()) do
        table.insert(tas, { id = bag.id, count = bag.count})
    end
    return tas
end

function getTiles()
    world = bot:getWorld()
    local tiles = {}
    for _,tile in pairs(world:getTiles()) do
        if bot:isInWorld() then
            table.insert(tiles, { x = tile.x, y = tile.y, fg = tile.fg, bg = tile.bg, ready = tile:canHarvest(), flags = tile.flags})
        end
    end
    return tiles
end

function getObjects()
    world = bot:getWorld()
    local object = {}
    for _,obj in pairs(world:getObjects()) do
        table.insert(object, { x = obj.x, y = obj.y, id = obj.id, uid = obj.oid, count = obj.count, flags = obj.flags})
    end
    return object
end

function GetNameID(id)
    return getInfo(id).name
end

function warp(Dunia, Kunci)
    if Kunci then
        bot:warp(Dunia.."|"..Kunci)
    else
        bot:warp(Dunia)
    end
end

function buy(pek)
    sendPacket(2, "action|buy\nitem|"..pek)
end

function Upgrades()
    sendPacket(2, "action|buy\nitem|upgrade_backpack")
end
