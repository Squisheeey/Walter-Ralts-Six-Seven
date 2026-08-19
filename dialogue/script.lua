

--hide vanilla model
--vanilla_model.ALL:setVisible(false)

-- replace Walterv5 with the name of your bbmodel
local rt = models.Walterv5.root
local txtbox = rt.textbox
local txt = rt.text


txtbox:setLight(15,15)

local hide_ticks = 0
local hiding = false
local chars_delay = 1
local chars_delay_countdown = 0
local current_msg_len = 0
local current_scan_msg_len = 0
local g_msg = ""
local scan_msg = ""
local scan_chat = false
local current_char = 0
local current_scan_char = 0
local color_words = { 
["Vilopede"] = "#A899FF",
["vilopede"] = "#A899FF",
["starwalker"] = "yellow",
["Starwalker"] = "yellow",
["key"] = "yellow",
["item"] = "yellow",
["pacifist"] = "#03d3fc",
["pacifists"] = "#03d3fc",
["genocide"] = "#fc0313",
["genocides"] = "#fc0313"
}

function utf8_len(str)
    local _, count = string.gsub(str, "[^\128-\191]", "")
    return count
end

function utf8_char_len(c)
    if c < 0x80 then return 1
    elseif c < 0xE0 then return 2
    elseif c < 0xF0 then return 3
    else return 4 end
end

function utf8_nth_from_end(str, n)
    local i = #str
    local count = 0

    while i > 0 do
        local c = str:byte(i)
        if c < 0x80 or c >= 0xC0 then
            count = count + 1
            if count == n then
                return str:sub(i, i + utf8_char_len(str:byte(i)) - 1)
            end
        end
        i = i - 1
    end

    return ""
end

function utf8_sub(str, n)
    local i = 1
    local len = 0
    while i <= #str do
        len = len + 1
        if len > n then
            return str:sub(1, i - 1)
        end

        local c = str:byte(i)
        if c < 0x80 then
            i = i + 1
        elseif c < 0xE0 then
            i = i + 2
        elseif c < 0xF0 then
            i = i + 3
        else
            i = i + 4
        end
    end
    return str
end


local function truncate_color_json(text, max_chars)
    local segments = {}
    local last_end = 1

    while true do
        local s, e = string.find(text, "%S+", last_end)
        if not s then break end

        local prefix = text:sub(last_end, s - 1)
        local word   = text:sub(s, e)

        if prefix ~= "" then
            table.insert(segments, { type = "text", text = prefix })
        elseif color_words[word] and #segments == 0 then
            -- гарантируем первый текстовый сегмент
            table.insert(segments, { type = "text", text = "" })
        end

        if color_words[word] then
            table.insert(segments, {
                type  = "color",
                text  = word,
                color = color_words[word]
            })
        else
            table.insert(segments, { type = "text", text = word })
        end

        last_end = e + 1
    end

    local suffix = text:sub(last_end)
    if suffix ~= "" then
        table.insert(segments, { type = "text", text = suffix })
    end

    local used = 0
    local out_segs = {}

    for _, seg in ipairs(segments) do
        local seg_len = utf8_len(seg.text) or 0

        if used + seg_len < max_chars then
            table.insert(out_segs, seg)
            used = used + seg_len
        else
            local remaining = max_chars - used
            if remaining > 0 then
                local part = utf8_sub(seg.text, remaining)
                if seg.type == "color" then
                    table.insert(out_segs, {
                        type  = "color",
                        text  = part,
                        color = seg.color
                    })
                else
                    table.insert(out_segs, { type = "text", text = part })
                end
                used = used + remaining
            end
            break
        end
    end

    local parts = {}
    for _, seg in ipairs(out_segs) do
        if seg.type == "text" then
            table.insert(parts, string.format("%q", seg.text))
        else
            table.insert(parts, string.format(
                "{\"text\":%q,\"color\":%q}",
                seg.text,
                seg.color
            ))
        end
    end

    return "[" .. table.concat(parts, ",") .. "]"
end


events.RENDER:register(function(d)
    local cameraRot = client:getCameraRot()

    if renderer:isFirstPerson() then
        cameraRot = vec(0, 0, 0)
    end
    
    local i = cameraRot.y - player:getBodyYaw(d)

    txt:setRot(0, 0, 0);
end)

function events.tick()
    if scanned == false and scan_chat == false then
        if current_char < current_msg_len then
            chars_delay_countdown = chars_delay_countdown+1
            if chars_delay_countdown == chars_delay then
                current_char = current_char+1
                local nameText = txt:newText("dynamic_text")
                local msg = truncate_color_json(g_msg, current_char)            
                nameText:setText(msg)
                        :setPos(0, 0, 0)
                        :setScale(0.35)
                        :setAlignment("LEFT")
                        :setWidth(150)
                        :setLight(15,15)
                chars_delay_countdown = 0
                local last_char = utf8_nth_from_end(msg, 3)
                if last_char ~= " " then
                    sounds:playSound("dialogue.voice", player:getPos(), 0.5)
                end
            end
        elseif txtbox:getVisible() and (not hiding) then
            hiding = true
            hide_ticks = 75
        end
        if hiding then
            --log(hiding, hide_ticks)
            hide_ticks = hide_ticks - 1
            if hide_ticks == 0 then
                txtbox:setVisible(false)
                txt:setVisible(false)
                hiding = false
            end
        end
    end

    if scanned == true then
        scan_chat = true
    end

    if scan_chat == true then
        if harping then 
            pings.scan_msg(SCAN_msg) 
            harping = false 
        end
        if current_scan_char < current_scan_msg_len then
            chars_delay_countdown = chars_delay_countdown + 1
            if chars_delay_countdown == chars_delay then
                current_scan_char = current_scan_char + 1
                local nameText = txt:newText("dynamic_text")
                local msg = truncate_color_json(scan_msg, current_scan_char)
                
                nameText:setText(SCAN_msg)
                        :setPos(0, 0, 0)
                        :setScale(0.35)
                        :setAlignment("LEFT")
                        :setWidth(150)
                        :setLight(15,15)
                chars_delay_countdown = 0
                local last_char = utf8_nth_from_end(scan_msg, 3)
                if last_char ~= " " then
                    sounds:playSound("dialogue.voice", player:getPos(), 0.2)
                end
            end
        elseif txtbox:getVisible() and (not hiding) then
            hiding = true
            hide_ticks = 75
        end
            
        if hiding then
            scan_chat = false
            hide_ticks = hide_ticks - 1
            if hide_ticks == 0 then
                txtbox:setVisible(false)
                txt:setVisible(false)
                hiding = false
            end
        end
    end
end

function pings.chat_msg(msg)
    g_msg = msg
    current_msg_len = utf8_len(msg)
    current_char = 0
    txtbox:setVisible(true)
    txt:setVisible(true)
end

function pings.scan_msg(scan)
    scan_msg = SCAN_msg
    log(scan_msg)
    current_scan_msg_len = utf8_len(SCAN_msg)
    current_scan_char = 0
    txtbox:setVisible(true)
    txt:setVisible(true)
end

function events.chat_send_message(msg)
    if msg:sub(1, 1) == "/" then
    	return msg
    else
        pings.chat_msg(msg)
        return msg
    end
end

