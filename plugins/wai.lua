
local function run(msg, matches)
reply = msg['id']
  if matches[1] == 'wai' then
    if tonumber == 228572542 then
      return "You are my Orginal Admin 😎 "
    elseif is_sudo(msg) then
send_document(get_receiver(msg), "/home/Seed/axs/sudo.webp", ok_cb, false)
      reply_msg(reply, "You are my admin 😎 ", ok_cb, false)
    elseif is_owner(msg) then
send_document(get_receiver(msg), "/home/Seed/axs/owner.webp", ok_cb, false)
      reply_msg(reply, "You are Group Owner 😊 ", ok_cb, false)
    elseif is_momod(msg) then
send_document(get_receiver(msg), "/home/Seed/axs/mod.webp", ok_cb, false)
      reply_msg(reply, "You are admin of Group 😃 ", ok_cb, false)
    else send_document(get_receiver(msg), "/root/Tele/axs/mmbr.webp", ok_cb, false)
      reply_msg(reply, "You are member 😐 ", ok_cb, false)
    end
  end
end

return {
  patterns = {
    "^[#!/]([Ww]ai)$",
     "^([Ww]ai)$"
    },
  run = run
}