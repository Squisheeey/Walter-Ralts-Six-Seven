--[[function events.chat_send_message(msg)
      host:setActionbar(msg)
      local a, b = string.find(msg, "imagination")
      if string.find(string.lower(msg), "imagination") ~= {nil, nil} then
            log(a, b, msg)
            local c = "§a"
            local d = "§f"
            if a ~= nil and b ~= nil then
                  msg = string.sub(msg, 0, a - 1) .. c .. string.sub(msg, a - 1, b - a + 1) .. d .. string.sub(msg, b + 1, #msg)
                  log("It is now...", msg)
            end
            log("So return", msg)
            return msg
      else
            return nil
      end
end]]--