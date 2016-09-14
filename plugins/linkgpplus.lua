
do function run(msg, matches)
if matches[1] == 'lin' then
local hash = 'link:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      return 'کاربر ('..msg.from.username..')شما درخواست دریافت لینک گروه را کرده اید \n اگر مایل هستید لینک گروه را در پیوی خو دریافت کنید کلمه pv را ارسال  ویا کلمه gp را ارسال کنید'
    end

    if msg.text then
  local hash = 'link:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^pv$") and redis:get(hash) == "waite" then
    redis:set(hash, "pv")
  elseif msg.text:match("^gp$") and redis:get(hash) == "waite" then
    redis:set(hash, "gp")

      end
    end
  local hash = 'link:'..msg.to.id..':'..msg.from.id
   if redis:get(hash) then
        if redis:get(hash) == "pv" then
        local data = load_data(_config.moderation.data)
        local settings = data[tostring(msg.to.id)]['settings'] 
        send_large_msg('user#id'..msg.from.id, "لینک ورود به گروه:\n______________________________\n"..settings.set_link)
         return 'لینک به پیوی شما ارسال شد'
        end
      end
    if redis:get(hash) then
        if redis:get(hash) == "gp" then
        local data = load_data(_config.moderation.data)
        local settings = data[tostring(msg.to.id)]['settings']
        return "لينک ورود به گروه:\n______________________________\n"..settings.set_link
      end
    end
end
return {
description = "show link",
usage = "link",
patterns = {
"^[!/#](lin)$",
"^pv$",
"^gp$"
},
run = run
} end