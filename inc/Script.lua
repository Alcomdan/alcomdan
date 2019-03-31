--[[
#    ▀█████████▄   ▄██████▄     ▄████████    ▄████████
#      ███    ███ ███    ███   ███    ███   ███    ███
#      ███    ███ ███    ███   ███    █▀    ███    █▀
#     ▄███▄▄▄██▀  ███    ███   ███          ███
#    ▀▀███▀▀▀██▄  ███    ███ ▀███████████ ▀███████████ ¦ Dev : @hlh313
#      ███    ██▄ ███    ███          ███          ███ ¦ Dev : [@hlh_313]
#      ███    ███ ███    ███    ▄█    ███    ▄█    ███
#    ▄█████████▀   ▀██████▀   ▄████████▀   ▄████████▀  ¦ Source TH3BOSS BY [@hlh_313]
#---------------------------------------------------------------------
]]
local function iBoss(msg,MsgText)

if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
return modadd(msg)  
end
 
if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end
end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then

if not MsgText[2] and not msg.reply_id then
if redis:get(boss..'lock_id'..msg.chat_id_) then
local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "🎫┇معرفـك ❪ @"..data.username_.." ❫\n" else UserNameID = "" end
local zz = (redis:get(boss..':User_Points:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local rfih = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if data.photos_[0] then 
ali = {
'بمكن ازحف😹😌',
'بشر زربه💩',
'لاقيمه للقمر امام وجهك🌚🥀',
'خليني احبك🙈❤️',
'ببكن خاص 🌚😹',
'ببكن حلق🙊💋',
'لاخلقه ولا اخلاق☹️😹',
'امشي ورا السده🌚😹',
'يحفظك ابو هاشم🌚😹',
'وجه زربه💩😹',
'ياحلو منين الله جابك🙈❤️',
'خلينه نكبل🙈❤️',
'طيح الله حظك وحظ ابوك😹',
'مارتاحلك😐',
'ااااخ كلبي طك من الحلوين',
'ادمن وكف الايدي فدوه',
'خلصن الحلوات اجو الحلوين',
'تحبني؟🙈',


}
ssssys = ali[math.random(#ali)]
sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,
'🎇┇'..ssssys..'\n'
..'🎟┇ايديـك ❪ '..msg.sender_user_id_..' ❫\n'
..UserNameID
..'👮‍♀️┇رتبتـك ❪ '..msg.TheRank..' ❫\n'
..'🎲┇تفاعلك ❪ '..Get_Ttl(msgs)..' ❫\n'
..'💬┇رسائلك ❪ '..msgs..' ❫\n'
..'🚸┇سحكاتـك ❪ '..rfih..' ❫\n'
..'💎┇مجوهراتك ❪ '..zz..' ❫\n'
,dl_cb,nil)
else
sendMsg(msg.chat_id_,msg.id_,
'📬┇لا يمكنني عرض صورتك لانك قمت بحظر البوت او ليس لديك صوره ...!\n'..'['..UserNameID..']'
..'🎟┇ايديـك ❪ '..msg.sender_user_id_..' ❫\n'
..'📡┇رتبتـك ❪ '..msg.TheRank..' ❫\n'
..'🎲┇تفاعلك ❪ '..Get_Ttl(msgs)..' ❫\n'
..'💬┇رسائلك ❪ '..msgs..' ❫\n'
..'🚸┇سحكاتـك ❪ '..rfih..' ❫\n'
..'📞┇الـجـهـات ❪ '..NumGha..' ❫\n'
..'💎┇مجوهراتك ❪ '..zz..' ❫\n')
end
end) 
end ,nil)
end
return false
end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "المجموعه" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(boss..'group:name'..msg.chat_id_) or '')
redis:set(boss..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"👨🏻‍💻¦  ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*👥¦* عدد الاعـضـاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*📛¦* عدد المحظـوريـن ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*👨🏻‍🔧¦* عدد الادمـنـيـه ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*⚜¦* ايدي المجموعه ⇜ ❪`"..msg.chat_id_.."`❫"
.."\n\n⚜¦ الاسم ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(boss..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.." \n📌*¦* تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا لا يمكنني التثبيت .\n🎟*¦* لست مشرف او لا املك صلاحيه التثبيت \n ❕')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n💬*¦* تم الغاء تثبيت الرساله \n✓")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا لا يمكنني الغاء التثبيت .\n🎟*¦* لست مشرف او لا املك صلاحيه التثبيت \n ❕')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا عزيزي '..msg.TheRankCmd..' .\n🎟*¦* لا توجد رساله مثبته لاقوم بازالتها \n ❕')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end 
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end 
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور,المطور الاساسي} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور,المطور الاساسي} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end

if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end 
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الالعاب" 		then return mute_game(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الالعاب" 		then return unmute_game(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(boss..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(boss..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"🙋🏼‍♂️*¦* تم انشاء رابط جديد \n🔖¦ ["..LinkGp.."]\n🔖¦ لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"📛¦ لا يمكنني انشاء رابط للمجموعه .\n🎟¦ لانني لست مشرف في المجموعه \n ❕")
end
else
return sendMsg(msg.chat_id_,msg.id_,"📛¦ لقد قمت بانشاء الرابط سابقا .\n🎟¦ ارسل { الرابط } لرؤيه الرابط  \n ❕")
end
return false
end 

if MsgText[1] == "الرابط" then
if not redis:get(boss..'linkGroup'..msg.chat_id_) then 
return "📡*¦* اوه 🙀 لا يوجد رابط ☹️\n🔖*¦*لانشاء رابط ارسل { انشاء رابط } \n📡" 
end
local GroupName = redis:get(boss..'group:name'..msg.chat_id_)
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
return "🔖¦رابـط الـمـجـمـوعه 💯\n🌿¦ "..Flter_Markdown(GroupName).." :\n\n["..GroupLink.."]\n"
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
if not GroupLink then return "📡*¦* اوه 🙀 لا يوجد هنا رابط\n🔖¦ *رجائا اكتب [ضع رابط]*🔃" end
local Text = "🔖¦رابـط الـمـجـمـوعه 💯\n🌿¦ "..Flter_Markdown(redis:get(boss..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "🙋🏼‍♂️*¦* عذرا عزيزي \n🌿¦ لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "🙋🏼‍♂️*¦* عذرا عزيزي \n🌿¦  لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n🌿¦ تم ارسال الرابط خاص لك 🔃"
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:setex(boss..'rulse:witting'..msg.sender_user_id_,300,true)
return '📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل القوانين  للمجموعه 🍃'
end

if MsgText[1] == "القوانين" then
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "🙋🏻‍♂*¦* مرحبأ عزيري القوانين كلاتي 👇🏻\n📛¦ ممنوع نشر الروابط \n⚠️¦ ممنوع التكلم او نشر صور اباحيه \n⚔¦ ممنوع  اعاده توجيه\n💭¦ ممنوع التكلم بلطائفه \n♥️¦ الرجاء احترام المدراء والادمنيه\n"
else 
return "*🔖¦القوانين :*\n"..redis:get(boss..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "📡*¦* حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(boss..'flood'..msg.chat_id_,MsgText[2]) 
return "📡*¦* تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if 500 < tonumber(MsgText[2]) then return "📛*¦* حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑¦* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*⛑¦* تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  \n✓")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end

local Admins = redis:scard(boss..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد ادمنيه ليتم مسحهم ✓" 
end
redis:del(boss..'admins:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح {"..Admins.."} من الادمنيه في البوت \n✓"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local Mn3Word = redis:scard(boss..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "📡*¦* عذرا لا توجد كلمات ممنوعه ليتم حذفها ✓" 
end
redis:del(boss..':Filter_Word:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n🔖¦ تم مسح {*"..Mn3Word.."*} كلمات من المنع ✓"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "📛¦ عذرا لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(boss..'rulse:msg'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم حذف القوانين بنجاح ✓"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'welcome:msg'..msg.chat_id_) then 
return "📡*¦* اوه ☢ هنالك خطأ 🚸\n📛¦ عذرا لا يوجد ترحيب ليتم مسحه ✓" 
end
redis:del(boss..'welcome:msg'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم حذف الترحيب بنجاح \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
local NumMnsha = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "📛¦ عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..NumMnsha.." *} من المنشئيين\n✓"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local NumMDER = redis:scard(boss..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "📛¦ عذرا لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(boss..'owners:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..NumMDER.." *} من المدراء  \n✓"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end

local list = redis:smembers(boss..'banned:'..msg.chat_id_)
if #list == 0 then return "*📌¦ لا يوجد مستخدمين محظورين  *" end
message = '📋*¦* قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(boss..'banned:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..#list.." *} من المحظورين  \n✓"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local MKTOMEN = redis:scard(boss..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "📡*¦* لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(boss..'is_silent_users:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..MKTOMEN.." *} من المكتومين  \n✓"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local MMEZEN = redis:scard(boss..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*⚙️*¦ لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(boss..'whitelist:'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦  تم مسح {* "..MMEZEN.." *} من المميزين  \n✓"
end

if MsgText[2] == 'الرابط' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then 
return "*⚙️*¦ لا يوجد رابط مضاف اصلا " 
end
redis:del(boss..'linkGroup'..msg.chat_id_)
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."   \n📛¦ تم مسح رابط المجموعه \n✓"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:setex(boss..'name:witting'..msg.sender_user_id_,300,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الاسم  للمجموعه \n🛠"
end


if MsgText[1] == "حذف صوره" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ تم حذف صوره آلمـجمـوعهہ 🌿\n✓')
end


if MsgText[1] == "ضع صوره" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ تم تغيير صوره آلمـجمـوعهہ ⠀\n✓')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ ليس لدي صلاحيه تغيير الصوره \n🤖 ¦ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '📭¦ حسننا عزيزي 🍁\n🌄 ¦ الان قم بارسال الصوره\n🛠' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:setex(boss..'about:witting'..msg.sender_user_id_,300,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الوصف  للمجموعه\n🛠" 
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return GetListAdmin(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return ownerlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return whitelist(msg) 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"🔖| لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "📌| عـدد الـبـوتات •⊱ {* "..(Total - 1).." *} ⊰•\n\n"
if NumBot == 0 then 
TextR = TextR.."📮| لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."🔖| لم يتم طـرد {* "..NumBotAdmin.." *} بوت لآنهہ‌‏م مـشـرفين."
else
TextR = TextR.."📮| تم طـرد كــل البوتآت بنجآح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '🤖| قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

📮| لـديـک {]]..total..[[} بـوتـآت
🔖| ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
sendMsg(msg.chat_id_,msg.id_,'🔛| جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(boss..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(boss..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(boss..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"🚸 ¦ تم طـرد {* "..NumMemDone.." *} من آلحسـآبآت آلمـحذوفهہ‏‏ 🌿")
else
sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ لا يوجد حسابات محذوفه في المجموعه 🌿')
end
end
end,nil)
end
end,nil)
return false
end  


if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(boss..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️¦ في مجموعه  » »  '..redis:get(boss..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ عزيزي المطور ✋🏿\n👨🏻‍🔧¦ شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if MsgText[2] == '1' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك  👍🏿\n📆¦  الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(boss..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️¦ تم تفعيل الاشتراك   👍🏿\n📆¦  الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local check_time = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳¦ `باقي من الاشتراك ` » » * \n 📆¦  '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1] == "كشف البوت" and not MsgText[2] then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
GetChatMember(msg.chat_id_,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusMember" then 
sendMsg(msg.chat_id_, msg.id_,'📡*¦* جيد , الـبــوت ادمــن الان \n')
else 
sendMsg(msg.chat_id_, msg.id_,'📡*¦* كلا البوت ليس ادمن في المجموعة 📛')
end
end)
return false
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \n✔️¦ ❪ الاحـصـائـيـات الـرسـائـلك ❫\n \n"
.."💬¦ الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."📞¦ الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."📸¦ الـصـور ❪ `"..photo.."` ❫\n"
.."📽¦ الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."🔖¦ الـمـلـصـقات ❪ `"..sticker.."` ❫\n"
.."🎙¦ الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🔊¦ الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞¦ الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬¦ الـتـعـديـل ❪ `"..edited.."` ❫\n\n"
.."📊¦ تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1]== 'جهاتي' then
return '🧟‍♂*¦*  عدد جهہآتگ آلمـضـآفهہ‏‏ » 【'..(redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..'】 . \n🐾'
end


if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="👨🏽‍🔧¦ اهـلا بـك عزيزي في معلوماتك 🥀 \n"
.."ـ.——————————\n"
.."🗯¦ الاســم ❪ "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." ❫\n"
.."💠¦ المعرف ❪ "..ResolveUser(data).." ❫\n"
.."⚜️¦ الايـدي ❪ `"..msg.sender_user_id_.."` ❫\n"
.."🚸¦ رتبتــك ❪ "..msg.TheRank.." ❫\n"
.."🔰¦ـ ❪ `"..msg.chat_id_.."` ❫\n"
.."ـ.——————————\n"
.." ❪ الاحـصـائـيـات الـرسـائـل ❫\n"
.."💬¦ الـرسـائـل ❪ `"..msgs.."` ❫\n"
.."📞¦ الـجـهـات ❪ `"..NumGha.."` ❫\n"
.."📸¦ الـصـور ❪ `"..photo.."` ❫\n"
.."📽¦ الـمـتـحـركـه ❪ `"..animation.."` ❫\n"
.."🔖¦ الـمـلـصـقات ❪ `"..sticker.."` ❪\n"
.."🎙¦ الـبـصـمـات ❪ `"..voice.."` ❫\n"
.."🔊¦ الـصـوت ❪ `"..audio.."` ❫\n"
.."🎞¦ الـفـيـديـو ❪ `"..video.."` ❫\n"
.."📬¦ الـتـعـديـل ❪`"..edited.."` ❫\n\n"
.."📊¦ تـفـاعـلـك ❪ "..Get_Ttl(msgs).." ❫\n"
.."ـ.——————————\n"
.."👨🏻‍💻¦ مـطـور البوت •⊱ "..SUDO_USER.." ⊰•\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "الترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:set(boss..'welcom:witting'..msg.sender_user_id_,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ ارسل كليشه الترحيب الان\n\n🔖¦ ملاحظه تستطيع اضافه دوال للترحيب مثلا :\n🗒¦ اضهار قوانين المجموعه  » *{القوانين}*  \n📰¦  اضهار الاسم العضو » *{الاسم}*\n🏷¦ اضهار المعرف العضو » *{المعرف}*\n🏷¦ اضهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(boss..'welcome:msg'..msg.chat_id_))
else 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."  \n🌿¦ نورت المجموعه \n💂🏼‍♀️" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end


if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local mtwren = redis:scard(boss..':SUDO_BOT:')
if mtwren == 0 then  return "⚙️*¦* عذرا لا يوجد مطورين في البوت  ✖️" end
redis:del(boss..':SUDO_BOT:') 
return "📛*¦* تم مسح {* "..mtwren.." *} من المطورين ☔️\n✓"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local addbannds = redis:scard(boss..'gban_users')
if addbannds ==0 then 
return "*⚙️¦ قائمة الحظر فارغه .*" 
end
redis:del(boss..'gban_users') 
return "⚙️*¦* تـم مـسـح { *"..addbannds.." *} من قائمه العام\n✓" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" then
local groups = redis:smembers(boss..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'💯*¦* جـيـد , لا توجد مجموعات وهميه \n✓')
else
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n🚸*¦* تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n📉*¦* اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" then
local pv = redis:smembers(boss..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(boss..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'👨🏼‍⚕️| جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n🚸*¦* تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n📉*¦* اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(boss..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'📭¦ حسننا عزيزي 🍁\n🌄 ¦ الان قم بارسال الصوره للترحيب \n🛠' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then 
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(boss..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(boss..':NameBot:')..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
⚖️¦ مـعرف آلمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
👨🏽‍🔧]]) 
return false
else
return "📛| لا توجد صوره مضافه للترحيب في البوت \n📌| لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(boss..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '📭¦ حسننا عزيزي 🍁\n💬¦ الان قم بارسال الكليشه \n🛠' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(boss..':addnumberusers',MsgText[2]) 
return '💱*¦* تم وضـع شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..MsgText[2]..'】* عضـو  🍁\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'🚸*¦* شـرط آلتفعيل آلبوت آذآ گآنت آلمـجمـوعهہ‏‏ آگثر مـن *【'..redis:get(boss..':addnumberusers')..'】* عضـو  🍁\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🔝" then 
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
return '📮*¦* عدد المجموعات المفعلة » `'..redis:scard(boss..'group:ids')..'`  ➼' 
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if redis:sismember(boss..'group:ids',MsgText[2]) then
local name_gp = redis:get(boss..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'📛*¦* تم تعطيل المجموعه بأمر من المطور  \n🚸*¦* سوف اغادر جاوو 🚶🏻🚶🏻 ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return '📛*¦* تم تعطيل المجموعه ومغادرتها \n🏷*¦* المجموعةة » ['..name_gp..']\n🎫*¦* الايدي » ( *'..MsgText[2]..'* )\n✓'
else 
return '📛*¦* لا توجد مجموعه مفعله بهذا الايدي !\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(boss..":TEXT_SUDO") or '🗃¦ لا توجد كليشه المطور .\n📰¦ يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n📡'
end

if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل التوجيه للاذاعه \n🔛" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:all'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل الكليشه للاذاعه عام \n🔛" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 👤" then		
if not msg.SudoUser then return "📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:pv'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل الكليشه للاذاعه خاص \n🔛"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then		
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "📡*¦* الاذاعه مقفوله من قبل المطور الاساسي  🚶" 
end
redis:setex(boss..'fwd:groups'..msg.sender_user_id_,300, true) 
return "📭¦ حسننا الان ارسل الكليشه للاذاعه للمجموعات \n🔛" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🕹" then
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 📜" then 
if not msg.SudoUser then return"📛*¦* هذا الامر يخص {المطور} فقط  \n🚶" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return '🎫*¦* رتبتك ⇜ ❪ '..msg.TheRank..' ❫\n➖' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
redis:del(boss..'welcom:witting'..msg.sender_user_id_,
boss..'rulse:witting'..msg.sender_user_id_,
boss..'rulse:witting'..msg.sender_user_id_,
boss..'name:witting'..msg.sender_user_id_,
boss..'about:witting'..msg.sender_user_id_,
boss..'fwd:all'..msg.sender_user_id_,
boss..'fwd:pv'..msg.sender_user_id_,
boss..'fwd:groups'..msg.sender_user_id_,
boss..'namebot:witting'..msg.sender_user_id_,
boss..'addrd_all:'..msg.sender_user_id_,
boss..'delrd:'..msg.sender_user_id_,
boss..'addrd:'..msg.sender_user_id_,
boss..'delrdall:'..msg.sender_user_id_,
boss..'text_sudo:witting'..msg.sender_user_id_,
boss..'addrd:'..msg.chat_id_..msg.sender_user_id_,
boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return '📬*¦* تم آلغآء آلآمـر بنجآح \n🌿'
end  

if (MsgText[1] == '/files' or MsgText[1]== "الملفات 🗂" or MsgText[1]== "الملفات" ) then
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
return All_File()
end   

if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '👨🏾‍🔧¦ اصدار سورس مـاكـس : احـدث اصـدار \n📡'
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس ™') then
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local GetVerison = https.request('https://github.com/MAXTELE/max.github.io/GetVersion.txt') or 0
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'🔛*¦* يوجد تحديث جديد الان \n📡*¦* جاري تنزيل وتثبيت التحديث  ...')
redis:set(boss..":VERSION",GetVerison)
return false
else
return "🔖|سـورس مـاكـس\n👨🏾‍🔧*¦* لديـك احدث اصدار \n📦"
end
return false
end

if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'⏳*┇* جاري رفع النسخه انتظر قليلا ... \n⌛️')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"📛*¦* عذرا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n❕")
end
else 
sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس الزعيم يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n❕')
end  
else
sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا الملف ليس بصيغه Json !?\n❕')
end 
else
sendMsg(msg.chat_id_,msg.id_,'📛*¦* عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات\n❕')
end 
end,nil)
else 
return "📦*¦* ارسل ملف النسخه الاحتياطيه اولا\n📑*¦* ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
return "💯 البوت شـغــال 🚀" 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايدي 🆔") and msg.type == "pv" then return  "\n"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس 📡" and msg.type == "pv" then
local inline = {{{text="قنآهہ‏‏ آلسـورس : مـاكـس 🍃",url="t.me/hlh_313"}}}
send_key(msg.sender_user_id_,'  [قناة السورس : مـاكـس](t.me/hlh_313)',nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 📈" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
return 'الاحصائيات : 📈 \n\n👥*¦* عدد المجموعات المفعله : '..redis:scard(boss..'group:ids')..'\n👤*¦* عدد المشتركين في البوت : '..redis:scard(boss..'users')..'\n📡'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
redis:setex(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "📭¦ حسننا الان ارسل كلمة الرد العام 🍃\n"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local names 	= redis:exists(boss..'replay:'..msg.chat_id_)
local photo 	= redis:exists(boss..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(boss..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(boss..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(boss..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(boss..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(boss..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(boss..'replay:'..msg.chat_id_,boss..'replay_photo:group:'..msg.chat_id_,boss..'replay_voice:group:'..msg.chat_id_,
boss..'replay_animation:group:'..msg.chat_id_,boss..'replay_audio:group:'..msg.chat_id_,boss..'replay_sticker:group:'..msg.chat_id_,boss..'replay_video:group:'..msg.chat_id_)
return "✓ تم مسح كل الردود 🚀"
else
return '🚸*¦* لا يوجد ردود ليتم مسحها \n❕'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"♨️ للمطورين فقط ! 💯" end
local names 	= redis:exists(boss..'replay:all')
local photo 	= redis:exists(boss..'replay_photo:group:')
local voice 	= redis:exists(boss..'replay_voice:group:')
local imation 	= redis:exists(boss..'replay_animation:group:')
local audio 	= redis:exists(boss..'replay_audio:group:')
local sticker 	= redis:exists(boss..'replay_sticker:group:')
local video 	= redis:exists(boss..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(boss..'replay:all',boss..'replay_photo:group:',boss..'replay_voice:group:',boss..'replay_animation:group:',boss..'replay_audio:group:',boss..'replay_sticker:group:',boss..'replay_video:group:')
return "✓ تم مسح كل الردود العامه🚀"
else
return "لا يوجد ردود عامه ليتم مسحها ! 🚀"
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
redis:set(boss..'delrdall:'..msg.sender_user_id_,true) 
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  المجموعات 🍃"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
redis:set(boss..'delrd:'..msg.sender_user_id_,true)
return "📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الرد لمسحها من  للمجموعه 🍃"
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local names  	= redis:hkeys(boss..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(boss..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(boss..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(boss..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(boss..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(boss..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(boss..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' 
end
local ii = 1
local message = '💬*¦* ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه 🎙 ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 🗨' then
if not msg.SudoBase then return "♨️ للمطور فقط ! 💯" end
local names 	= redis:hkeys(boss..'replay:all')
local photo 	= redis:hkeys(boss..'replay_photo:group:')
local voice 	= redis:hkeys(boss..'replay_voice:group:')
local imation 	= redis:hkeys(boss..'replay_animation:group:')
local audio 	= redis:hkeys(boss..'replay_audio:group:')
local sticker 	= redis:hkeys(boss..'replay_sticker:group:')
local video 	= redis:hkeys(boss..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return '🚸*¦* لا يوجد ردود مضافه حاليا \n❕' 
end
local ii = 1
local message = '💬*¦* الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره 🏞 ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص 🗯 ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه 🎙 ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه 🎭 ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه 🔊 ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق 🗺 ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو  🎞 ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
redis:setex(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(boss..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "📭¦ حسننا , الان ارسل كلمه الرد \n-"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
redis:setex(boss..'namebot:witting'..msg.sender_user_id_,300,true)
return"📭¦ حسننا عزيزي  ✋🏿\n🗯¦ الان ارسل الاسم  للبوت 🍃"
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 •⊱ { Seystem } ⊰•\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖 •⊱ { Memory } ⊰•\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾 •⊱ { HardDisk } ⊰•\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️ •⊱ { Processor } ⊰•\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*📡 •⊱ { Location } ⊰•\n*»» ]]..DataCenter..[[*'
echo '*------------------------------\n*👨🏾‍🔧 •⊱ { Server[_]Login } ⊰•\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌 •⊱ { Uptime } ⊰•  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟l •⊱ { نظام التشغيل } ⊰•\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*🔖l •⊱ { الذاكره العشوائيه } ⊰•\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*💾l •⊱ { وحـده الـتـخـزيـن } ⊰•\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⚙️l •⊱ { الـمــعــالــج } ⊰•\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*📡l •⊱ { موقـع الـسـيـرفـر } ⊰•\n*»» ]]..DataCenter..[[*'
echo '*------------------------------\n*👨🏾‍🔧l •⊱ { الــدخــول } ⊰•\n*»» '`whoami`'*'
echo '*------------------------------\n*🔌l •⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰•  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
return [[
      ❂

 ‏‎‏❋¦ مـسـآرت آلآوآمـر آلعآمـهہ‏‏ ⇊

👨‍⚖️¦ م1 » آوآمـر آلآدآرهہ‏‏
📟¦ م2 » آوآمـر آعدآدآت آلمـجمـوعهہ‏‏
🛡¦ م3 » آوآمـر آلحمـآيهہ‏‏
🕹¦ م المطور »  آوآمـر آلمـطـور
⚡️¦ اوامر الرد » لآضـآفهہ‏‏ رد مـعين
📁¦ اوامر الملفات » لآدآرهہ‏‏ مــلفآت آلبوت


 ‏‎‏❋¦ رآسـلني للآسـتفسـآر ☜ { ]]..SUDO_USER..[[ } ✓ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local text =[[
•⊱ {  آوآمر الرفع والتنزيل  } ⊰•


🔮¦ رفع منشى ‿ تنزيل منشى 
⚗¦ رفع المدير ‿ تنزيل المدير
📿¦ رفع ادمن ‿ تنزيل ادمن 
💈¦ رفع مميز ‿ تنزيل مميز 

⦅ ꯭آو꯭آم꯭ـر آ꯭لم꯭ـس꯭ـح꯭ للم꯭ـنش꯭ـى꯭ ⦆

🗑¦ مسح الادمنيه •⊱ لمسح الادمنيه 
🗑¦ مسح المميزين •⊱ لمسح الاعضاء المميزين 
🗑¦ مسح المدراء •⊱ لمسح المدراء 

⦅آوآمـر آلحظـر وآلطــرد وآلتقييـد  ⦆
      
🔱¦ حظر (بالرد/بالمعرف) •⊱ لحظر العضو
⚜¦ طرد ( بالرد/بالمعرف) •⊱ لطرد العضو 
🔅¦ كتم (بالرد/بالمعرف) •⊱ لكتم العضو 
🌀¦ تقييد (بالرد/بالمعرف) •⊱ لتقييد العضو
🚫¦ منع + الكلمه •⊱ لمنع كلمه داخل المجموعه
🚸¦ الغاء الحظر (بالرد/بالمعرف) •⊱ لالغاء الحظر 
🔆¦ الغاء الكتم (بالرد/بالمعرف) •⊱ لالغاء الكتم 
〰¦ فك التقييد (بالرد/بالمعرف) •⊱ لالغاء تقييد العضو 
⭕️¦ الغاء منع •⊱ لالغاء منع الكلمه بالمجموعه
📮¦ طرد البوتات : لطرد كل البوتات
📛¦ طرد المحذوفين : لطرد الحسابات المحذوفه
📟¦ كشف البوتات : لاضهار عدد البوتات الموجوده

🗯*┇* راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false

end
if MsgText[1]== 'م2' then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local text = [[
👨🏽‍✈️¦  اوامر الوضع للمجموعه ::

📮¦ـ➖➖➖➖➖
💭¦ ضع الترحيب  ↜ لوضع ترحيب  
💭¦ ضع القوانين :↜ لوضع القوانين 
💭¦ ضع وصف :↜ لوضع وصف  
💭¦ ضـع رابط :↜ لوضع الرابط  
💭¦ الـرابـط :↜  لعرض الرابط  
📮¦ـ➖➖➖➖➖

👨🏽‍💻¦  اوامر رؤية الاعدادات ::

🗯¦ القوانين : لعرض  القوانين 
🗯¦ الادمنيه : لعرض  الادمنيه 
🗯¦ المدراء : لعرض  الاداريين 
🗯¦ المكتومين :↜لعرض  المكتومين 
🗯¦ المطور : لعرض معلومات المطور 
🗯¦ معلوماتي :↜لعرض معلوماتك  
🗯¦ الحمايه : لعرض كل الاعدادات  
🗯¦ الوسائط : لعرض اعدادات الميديا 
🗯¦ الاعدادات : لعرض اعدادات المجموعه 
🗯¦ المجموعه : لعرض معلومات المجموعه 

➖➖➖➖➖➖➖
🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
local text = [[

⚡️ اوامر حماية المجموعه ⚡️
🗯*¦*ـ➖➖➖➖
🗯*¦* قفل «» فتح •⊱ التعديل  ⊰•
🗯*¦*️ قفل «» فتح •⊱ البصمات ⊰•
🗯*¦* قفل «» فتح •⊱ الــفيديو ⊰•
🗯*¦* قفل «» فتح •⊱ الفيديو ⊰•
🗯*¦* قفل «» فتح •⊱ الـصــور ⊰•
🗯*¦* قفل «» فتح •⊱ الملصقات ⊰•

🗯*¦* قفل «» فتح •⊱ المتحركه ⊰•
🗯*¦* قفل «» فتح •⊱ الدردشه ⊰•

🗯*¦* قفل «» فتح •⊱ الروابط ⊰•
🗯*¦* قفل «» فتح •⊱ التاك ⊰•
🗯*¦* قفل «» فتح •⊱ البوتات ⊰•
🗯*¦* ️قفل «» فتح •⊱ المعرفات ⊰•
🗯*¦* قفل «» فتح •⊱ البوتات بالطرد ⊰•
🗯*¦* قفل «» فتح •⊱ الكلايش ⊰•
🗯*¦*️ قفل «» فتح •⊱ التكرار ⊰•
🗯*¦* قفل «» فتح •⊱ التوجيه ⊰•
🗯*¦* قفل «» فتح •⊱ الانلاين ⊰•

🗯*¦* قفل «» فتح •⊱ الجهات ⊰•
🗯*¦* قفل «» فتح •⊱ الــكـــل ⊰•
🔅*¦*ـ➖➖➖➖➖
📲*¦* قفل «» فتح •⊱ التوجيه بالتقييد ⊰•
🔗*¦* قفل «» فتح •⊱ الروابط بالتقييد ⊰•
📀*¦* قفل «» فتح •⊱ المتحركه بالتقييد ⊰•
📸*¦* قفل «» فتح •⊱ الصور بالتقييد ⊰•
📽*¦* قفل «» فتح •⊱ الفيديو بالتقييد ⊰•
🔅*¦*ـ➖➖➖➖➖
📌*¦* تفعيل «» تعطيل •⊱  الترحيب ⊰•

🗯*¦* تفعيل «» تعطيل •⊱  الردود ⊰•
📢*¦* تفعيل «» تعطيل •⊱  التحذير ⊰•
🗨*¦* تفعيل «» تعطيل •⊱  الايدي ⊰•
🔅*¦*ـ➖➖➖➖➖

👨🏻‍💻*¦* للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "🔅¦ للمطور الاساسي فقط  🎖" end
local text = [[
📌¦ اوامر المطور 🃏

🔅¦ تفعيل : لتفعيل البوت 
🔅¦ تعطيل : لتعطيل البوت 
🔅¦ اسم بوتك + غادر : لطرد البوت
🔅¦ مسح الادمنيه : لمسح الادمنيه 
🔅¦ مسح المميزين : لمسح الاعضاء المميزين 
🔅¦ مسح المدراء : لمسح المدراء 
🔅¦ مسح المطورين : لمسح كل المطورين
🔅¦ تحديث: لتحديث ملفات البوت

🔅¦ اذاعه : لنشر رساله لكل المجموعات
🔅¦ اذاعه خاص : لنشر رساله لكل المشتركين خاص
🔅¦ اذاعه عام : لنشر رساله لكل المجموعات والخاص
🔅¦ اذاعه عام بالتوجيه : لنشر منشور قناتك بابتوجيه للكل

🔅¦ تحديث السورس: لتحديث السورس الى اصدار احدث
🔅¦ـ➖➖➖➖➖

🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" end
local text = [[
🗯¦ جميع اوامر الردود 
🔅¦ـ➖➖➖➖➖
🔅¦ الردود : لعرض الردود المثبته
🔅¦ اضف رد : لأضافه رد جديد
🔅¦ مسح رد  الرد المراد مسحه
🔅¦ مسح الردود : لمسح كل الردود
🔅¦ اضف رد عام : لاضافه رد لكل المجموعات
🔅¦ مسح رد عام : لمسح الرد العام 
🔅¦ مسح الردود العامه : لمسح كل ردود العامه
🔅¦ـ➖➖➖➖➖
🗯¦ راسلني للاستفسار 💡↭ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
 if MsgText[1]== "اوامر الملفات" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local text = [[
🤖¦ •⊱ { آوآمر آلملفآت } ⊰•

🗓¦ `/files`  لعرض قائمه الملفات 
📑¦ ``  لعرض  
📨¦ sp + الاسم | لارسال الملف اليك 
📮¦ dp + اسم الملف المراد حذفه 
]]
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if not redis:get(boss..'lave_me'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* المغادره بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(boss..'lave_me'..msg.chat_id_) 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* تم تفعيل المغادره \n✓" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "📛*¦* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n🚶" end
if redis:get(boss..'lave_me'..msg.chat_id_) then 
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* المغادره من قبل البوت بالتأكيد معطله\n✓" 
else
redis:set(boss..'lave_me'..msg.chat_id_,true)  
return "🙋🏼‍♂️*¦* أهلا عزيزي "..msg.TheRankCmd.."\n📡*¦* تم تعطيل المغادره من قبل البوت\n✓" 
end   
end

if MsgText[1] == "مغادره" or MsgText[1] == "ادفرني" or MsgText[1] == "احظرني" or MsgText[1] == "اطردني" then
if not redis:get(boss..'lave_me'..msg.chat_id_) then
if msg.Admin then return "📛*¦* لا استطيع طرد المدراء والادمنيه والمنشئين  \n🚶" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"👨🏼‍⚕️| اهلا عزيزي , لقد تم طردك من المجموعه بامر منك \n🔖| اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\n🔖¦فهذا رابط المجموعه 💯\n🌿¦"..Flter_Markdown(redis:get(boss..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(boss..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"🚸| لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"🚸| لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 



if MsgText[1] == "سورس" or MsgText[1]=="السورس" then
return [[
    🛠 ┇ تنصـيب سـورس مـاكـس  🔎

 ⇓⇓⇓ 

`git clone https://github.com/MAXTELE/MAX.git ;cd MAX;chmod +x ins;./ins`

» فقط أضغط على الكود ☝️ ليتم النسخ 
» ثم الصقه بالترمنال وانتر تتنظر يتنصب 
» بعدهہ‏‏آ يطـلب مـعلومـآت بآلترمـنآل .
» تدخل مـعلومـآتگ مـن توگن ومـعرفگ 
» وسـوف يعمـل آلبوت بالسـگرين تلقآئيآ ...

💭┇ قناة السورس ☜ [@hlh_313]

]]
end

if MsgText[1] == "" or MsgText[1]:lower() == ""  then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local Get_Files, res = https.request("https://github.com/MAXTELE/max.github.io/GetFiles.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
if Get_info then
local TextS = res.IinFormation.Text_Msg
local TextE = res.IinFormation.BorderBy
local NumFile = 0
for name,Course in pairs(res.Plugins) do
local Check_File_is_Found = io.open("plugins/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "{✓}"
else
CeckFile = "{✖️}"
end
NumFile = NumFile + 1
TextS = TextS..NumFile.."- `"..name..'` » '..CeckFile..'\nl*»»* [{تفاصيل اكثر}]('..Course..")\n------------------------------------\n"
end
return TextS..TextE
else
return "📛| اوبس , هناك خطأ في مصفوفه الجيسون راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن.!"
end
else
return "📛| اوبس , لا يوجد اتصال في الـapi راسل المطور ليتم حل المشكله في اسرع وقت ممكن.!"
end
return false
end



if MsgText[1]:lower() == "sp" and MsgText[2] then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local FileName = MsgText[2]:lower()
local Check_File_is_Found = io.open("plugins/"..FileName,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
TText = "📑| الملف موجود بالفعل \n🔖| تم تحديث الملف  \n✓"
else
TText = "🔖| تم تثبيت وتفعيل الملف بنجاح \n✓"
end
local Get_Files, res = https.request("https://raw.githubusercontent.com/MAXTELE/max.github.io/master/plugins/"..FileName)
if res == 200 then
print("DONLOADING_FROM_URL: "..FileName)
local FileD = io.open("plugins/"..FileName,'w+')
FileD:write(Get_Files)
FileD:close()
Start_Bot()

return TText
else
return "📛| لا يوجد ملف بهذا الاسم في المتجر \n✖️"
end
end

if MsgText[1]:lower() == "dp" and MsgText[2] then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local FileName = MsgText[2]:lower()
local Check_File_is_Found = io.open("plugins/"..FileName,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
os.execute("rm -fr plugins/"..FileName)
TText = "📑| الملف ~⪼ ["..FileName.."] \n🔖| تم حذفه بنجاح  \n✓"
else
TText = "📑| الملف ~⪼ ["..FileName.."] \n🔖| بالفعل محذوف  \n✓"
end
Start_Bot()
return TText
end

if MsgText[1] == "الساعه" then
return "➖\n⏱| الـسـاعه الان : "..os.date("%I:%M%p").."\n"
.."📆| الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1] == "التاريخ" then
return "➖\n📆| الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
if redis:get(boss..":UserNameChaneel") then
return "📑| اهلا عزيزي المطور \n🔖| الاشتراك بالتأكيد مفعل"
else
redis:setex(boss..":ForceSub:"..msg.sender_user_id_,350,true)
return "📑| مرحبا بـك في نظام الاشتراك الاجباري\n🔖| الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local SubDel = redis:del(boss..":UserNameChaneel")
if SubDel == 1 then
return "🔖| تم تعطيل الاشتراك الاجباري . \n✓"
else
return "🔖| الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
local UserChaneel = redis:get(boss..":UserNameChaneel")
if UserChaneel then
return "🔖| اهلا عزيزي المطور \n🔖| الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n✓"
else
return "🔖| لا يوجد قناة مفعله ع الاشتراك الاجباري. \n✓"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" then
if not msg.SudoBase then return"📛*¦* هذا الامر يخص {المطور الاساسي} فقط  \n🚶" end
redis:setex(boss..":ForceSub:"..msg.sender_user_id_,350,true)
return "📑| مرحبا بـك في نظام الاشتراك الاجباري\n🔖| الان ارسل معرف قـنـاتـك"
end





end




local function dBoss(msg)

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(boss..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*📛¦* تم حظرك من البوت بسبب التكرار \n🛠') 
end
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then

if msg.SudoBase then
local text = '🎖¦ آهہ‏‏لآ عزيزي آلمـطـور 🍃\n💰¦ آنتهہ‏‏ آلمـطـور آلآسـآسـي هہ‏‏نآ 🛠\n...\n\n🚸¦ تسـتطـيع‏‏ آلتحگم بگل آلآوآمـر آلمـمـوجودهہ‏‏ بآلگيبورد\n⚖️¦ فقط آضـغط ع آلآمـر آلذي تريد تنفيذهہ‏‏'
local keyboard = {
 {"ضع اسم للبوت ©","ضع صوره للترحيب 🌄"},
 {"تعطيل التواصل ✖️","تفعيل التواصل 🔛"},
 {"المطورين 🕹","ايدي 🆔","الاحصائيات 📈"},
 {"اضف رد عام ➕","الردود العامه 🗨"},
 {"الملفات 🗂","اذاعه عام بالتوجيه 📣"},
 {"اذاعه 🗣","اذاعه عام 📢","اذاعه خاص 👤"},
 {"تحديث ♻️","قائمه العام 📜","قناة السورس 📡"},
 {"تحديث السورس ™"},
 {"الغاء الامر ✖️"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(boss..'users',msg.sender_user_id_)
if redis:get(boss..'lock_service') then 
text = [[💯¦ مـرحبآ آنآ بوت آسـمـي []]..redis:get(boss..':NameBot:')..[[] 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
🚸¦ البوت خدمي ومتاح للكل 
👷🏽¦ فقط اضف البوت لمجموعتك وارفعه مشرف  
  ثم ارسل ❪ تفعيل ❫ ♻️

⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER..[[

👨🏽‍🔧]]
else
text = [[💯¦ مـرحبآ آنآ بوت آسـمـي []]..redis:get(boss..':NameBot:')..[[] 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
🚸¦ فقط آلمـطـور يسـتطـيع تفعيل آلبوت
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER..[[

👨🏽‍🔧]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(boss.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"📬¦ تم آرسـآل آلرسـآل‏‏هہ 🌿\n🎟¦ آلى : "..USERNAME.." 🏌🏻",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(boss..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"📛¦ عذرآ لآ يمـگنگ آرسـآل { توجيهہ‌‏ , مـلصـق , فديو گآم} ❗️")
return false
end
redis:setex(boss.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"🗯¦ تم آرسـآل رسـآلتگ آلى آلمـطـور\n📬¦ سـآرد عليگ في آقرب وقت\n🏌 "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group =====================================
if redis:get(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(boss..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ✓ تم اضافت الرد 🚀 \n-')
elseif msg.photo then 
redis:hset(boss..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه صوره للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.voice then
redis:hset(boss..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه بصمه صوت للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لسماع البصمه الاتيه .')
elseif msg.animation then
redis:hset(boss..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه متحركه للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.video then
redis:hset(boss..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه فيديو للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الفيديو الاتي .')
elseif msg.audio then
redis:hset(boss..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه للصوت للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوت الاتي .')
elseif msg.sticker then
redis:hset(boss..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه ملصق للرد بنجاح ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الملصق الاتي .')
end  

end

--====================== Reply All Groups =====================================
if redis:get(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(boss..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ✓ تم اضافت الرد لكل المجموعات 🚀 ')
elseif msg.photo then 
redis:hset(boss..'replay_photo:group:',klma,photo_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه صوره للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.voice then
redis:hset(boss..'replay_voice:group:',klma,voice_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه بصمه صوت للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لسماع البصمه الاتيه .')
elseif msg.animation then
redis:hset(boss..'replay_animation:group:',klma,animation_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه متحركه للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.video then
redis:hset(boss..'replay_video:group:',klma,video_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه فيديو للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الفيديو الاتي .')
elseif msg.audio then
redis:hset(boss..'replay_audio:group:',klma,audio_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه للصوت للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الصوت الاتي .')
elseif msg.sticker then
redis:hset(boss..'replay_sticker:group:',klma,sticker_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'🗂¦ تم اضافه ملصق للرد العام ✓\n🗂¦ يمكنك ارسال (['..klma..']) لاضهار الملصق الاتي .')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============

if redis:get(boss..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(boss..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"📑| عذرا , هناك خطأ لديك \n🔖| المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"📑| عذرا , لقد نسيت شيئا \n🔖| يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(boss..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"🔖| جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n📮| على قناتك : ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"📑| عذرا , عزيزي المطور \n🔖| هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(boss..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(boss..'namebot:witting'..msg.sender_user_id_)
redis:set(boss..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"📭¦ تم تغير اسم البوت  ✋🏿\n🗯¦ الان اسمه "..Flter_Markdown(msg.text).." \n✓")
return false
end

if redis:get(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
redis:setex(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📜¦ جيد , يمكنك الان ارسال جوا ب الردالعام \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-")
end
end

if redis:get(boss..'delrdall:'..msg.sender_user_id_) then
redis:del(boss..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(boss..'replay:all',msg.text)
local photo =redis:hget(boss..'replay_photo:group:',msg.text)
local voice = redis:hget(boss..'replay_voice:group:',msg.text)
local animation = redis:hget(boss..'replay_animation:group:',msg.text)
local audio = redis:hget(boss..'replay_audio:group:',msg.text)
local sticker = redis:hget(boss..'replay_sticker:group:',msg.text)
local video = redis:hget(boss..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'💬*¦* هذا الرد ليس مضاف في قائمه الردود 📛')
else
redis:hdel(boss..'replay:all',msg.text)
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n  ✓ تم مسح الرد 🚀 ')
end 
end 


if redis:get(boss..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(boss..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(boss..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "📜*¦* تم وضع الكليشه بنجاح كلاتي 👋🏻\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n✓")
end
if redis:get(boss..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(boss..'welcom:witting'..msg.sender_user_id_) 
redis:set(boss..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📜*¦* تم وضع الترحيب بنجاح كلاتي 👋\n✓" )
end
if redis:get(boss..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(boss..'rulse:witting'..msg.sender_user_id_) 
redis:set(boss..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'📜*¦* مرحبآ عزيزي\n📦¦ تم حفظ القوانين بنجاح ✓\n🔖¦ ارسل [[ القوانين ]] لعرضها \n💬✓')
end
if redis:get(boss..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(boss..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(boss..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(boss..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"📜*¦* تم وضع الوصف بنجاح\n✓")
end 
end,nil)
end


if redis:get(boss..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(boss..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')  
local groups = redis:smembers(boss..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑| اهلا عزيزي المطور \n🔖| جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(boss..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'📜*¦* تم اذاعه الكليشه بنجاح 🏌🏻\n🗣*¦* للمـجمـوعآت » *'..#groups..'* گروب \n👥*¦* للمـشـترگين » '..#pv..' مـشـترگ \n✓')
end

if redis:get(boss..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(boss..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑| اهلا عزيزي المطور \n🔖| جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(boss..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'🙍🏼‍♂️*¦* عدد المشتركين : '..#pv..'\n🗣*¦* تم الاذاعه الى '..SenderOk..' مشترك \n ✓') 
end
end)
end
end

if redis:get(boss..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(boss..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(boss..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'📑| اهلا عزيزي المطور \n🔖| جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = '📛*¦* تم حذف •⊱ { *'..NumGroupsDel..'*  } ⊰• من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'📑*¦* عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n🗣*¦* تـم الاذاعه الى •⊱ { *'..AllGroupSend..'*  } ⊰•\n'..MsgTDel..'✓')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(boss..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(boss..':WELCOME_BOT'),[[💯¦ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(boss..':NameBot:')..[[ 🎖
💰¦ آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
📛¦ مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
⚖️¦ مـعرف آلمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 🌿
👨🏽‍🔧]])
return false
end 

if msg.forward_info and redis:get(boss..'fwd:'..msg.sender_user_id_) then
redis:del(boss..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')
local groups = redis:smembers(boss..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'📑| اهلا عزيزي المطور \n🔖| جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'📜*¦* تم اذاعه التوجيه بنجاح 🏌🏻\n🗣*¦* للمـجمـوعآت » *'..#groups..'* \n👥*¦* للخآص » '..#pv..'\n✓')			
end

 

if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoBase or msg.Director) then
sendMsg(msg.chat_id_,msg.id_,'🚦| طبكم مرض حغادر باي 💔🚶‍♂') 
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.photo and redis:get(boss..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(boss..'welcom_ph:witting'..msg.sender_user_id_)
redis:set(boss..':WELCOME_BOT',photo_id)
sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ تم تغيير صـورهہ‏‏ آلترحيب للبوت 🌿\n✓')
return false
end 

if msg.photo and msg.type == "channel" and msg.GroupActive then
if redis:get(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_)
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.ID == "Ok" then
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'🚸 ¦ ليس لدي صلاحيه تغيير الصوره \n🤖 ¦ يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n✓')
end
end,nil)
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(boss..'replay:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(boss..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"📜¦ جيد , يمكنك الان ارسال جواب الرد \n🔛¦ [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]] ✓\n-")
end
end

if redis:get(boss..'delrd:'..msg.sender_user_id_) then
redis:del(boss..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(boss..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(boss..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'💬*¦* هذا الرد ليس مضاف في قائمه الردود 📛')
else
redis:hdel(boss..'replay:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n  ✓ تم مسح الرد 🚀 ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(boss..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"📛‍♂️*¦* عذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"📛‍♂️*¦* عذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت\n✓")      
end
end,nil)
end
return false
end
redis:set(boss..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه ✓\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(boss..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"📡| قام  ["..UserName.."]\n📭¦ بتغير اسم المجموعه  ✋🏿\n🗯¦ الى "..Flter_Markdown(msg.content_.title_).." \n✓") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(boss..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(boss..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(boss..'welcome:msg'..msg.chat_id_) or "🔖¦ مرحباً عزيزي\n🔖¦ نورت المجموعة \n💂🏼‍♀️")
if welcome then
rules = (redis:get(boss..'rulse:msg'..msg.chat_id_) or "🔖¦ مرحبأ عزيري 👋🏻 القوانين كلاتي 👇🏻\n🔖¦ ممنوع نشر الروابط \n🔖¦ ممنوع التكلم او نشر صور اباحيه \n🔖¦ ممنوع  اعاده توجيه \n🔖¦ ممنوع التكلم بلطائفه \n🔖¦ الرجاء احترام المدراء والادمنيه 😅\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(boss..'welcome:msg'..msg.chat_id_) or "🔖¦ مرحباً عزيزي\n🔖¦ نورت المجموعة \n💂🏼‍♀️")
if welcome then
rules = (redis:get(boss..'rulse:msg'..msg.chat_id_) or "🔖¦ مرحبأ عزيري 👋🏻 القوانين كلاتي 👇🏻\n🔖¦ ممنوع نشر الروابط \n🔖¦ ممنوع التكلم او نشر صور اباحيه \n🔖¦ ممنوع  اعاده توجيه \n🔖¦ ممنوع التكلم بلطائفه \n🔖¦ الرجاء احترام المدراء والادمنيه 😅\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(boss..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(boss..'welcome:get'..msg.chat_id_)
end
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(boss..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(boss..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(boss..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"👤¦ العضو » "..USERNAME.."\n🚸¦ قمـت بتگرآر آگثر مـن "..NUM_MSG_MAX.." رسـآلهہ‌‏ , لذآ تم تقييدگ مـن آلمـجمـوعهہ‌‏ ✓\n",12,USERCAR) 
return false
end)
end 
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 
if msg.forward_info_ then
if redis:get(boss..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) and not redis:get(boss..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع اعادة التوجيه  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(boss..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(boss..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(boss..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا الانلاين مقفول  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(boss..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(boss..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(boss..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ ممنوع ارسال الروابط  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ ممنوع ارسال روابط الويب   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(boss..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ ممنوع ارسال التاك  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(boss..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ ممنوع ارسال المعرف   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(boss..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ ممنوع ارسال الماركدوان  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦  .ممنوع ارسال روابط الويب   \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(boss..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذراً ممنوع التعديل تم المسح \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(boss..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الفيديو كام \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(boss..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الصور  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(boss..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الفيديو  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(boss..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(boss..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
 if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الملفات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(boss..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الملصقات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(boss..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الصور المتحركه  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(boss..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(boss..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
 if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال جهات الاتصال  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(boss..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
 if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الموقع  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(boss..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
 if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال البصمات  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(boss..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع لعب الالعاب  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(boss..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الصوت  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(boss..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا الكيبورد مقفول  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(boss..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال الروابط  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "📛¦ عذرا ممنوع ارسال روابط الويب  \n📛"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(boss..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'📛*¦* لا يمكنني مسح الرساله المخالفه .\n🎟*¦* لست مشرف او ليس لدي صلاحيه  الحذف \n ❕')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
local msgx = "📛¦ عذرا ممنوع ارسال التاك او المعرف  \n📛"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"👤¦ العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(boss..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(boss..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(boss..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(boss..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(boss..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local su = {
"نعم حبيبي المطور 🌝❤",
"هايروحي كٌْـْـًْْـٍْ☝ــًْوًٌْل😻❤️",
"ها يابــعد دگــات كِـུ֘͢ـ᷀͛❤️ـۢۢۢ͜͢͡ـلُـུ֤͋꩸֤ـֿ֤ࣵـبّـيَ🤤❤️",
"يابعد روح ["..Bot_Name.."] 😘❤️",
"هلا بمطوري العشق أمرني"}
local ss97 = {
"ها حياتي😻","عيونه 👀 وخشمه 👃🏻واذانه👂🏻",
"باقي ويتمدد 😎","ها حبي 😍","ها عمري 🌹","اجيت اجيت كافي لتصيح 🌚👌",
"هياتني اجيت 🌚❤️","نعم حبي 😎","هوه غير يسكت عاد ها شتريد 😷",
"احجي بسرعه شتريد 😤","ها يا كلبي ❤️","هم صاحو عليه راح ابدل اسمي من وراكم 😡",
"لك فداك ["..Bot_Name.."] حبيبي انت اموووح 💋","دا اشرب جاي تعال غير وكت 😌","كول حبيبي أمرني 😍",
"احجي فضني شرايد ولا اصير ضريف ودكلي جرايد لو مجلات تره بايخه 😒😏",
"اشتعلو اهل ["..Bot_Name.."] شتريد 😠","بووووووووو 👻 ها ها فزيت شفتك شفتك لا تحلف 😂",
"طالع مموجود 😒","هااا شنوو اكو حاته بالكروب وصحت عليه  😍💕","انت مو قبل يومين غلطت عليه؟  😒",
"راجع المكتب حبيبي عبالك ["..Bot_Name.."] سهل تحجي ويا 😒","ياعيون ["..Bot_Name.."] أمرني 😍",
"لك دبدل ملابسي اطلع برااااا 😵😡 ناس متستحي","سويت هواي شغلات سخيفه بحياتي بس عمري مصحت على واحد وكلتله انجب 😑",
"مشغول ويا ضلعتي  ☺️","مازا تريد منه 😌🍃"
}
local bs = {
"مابوس 🌚💔",
"اآآآم͠ــ.❤️😍ــو͠و͠و͠آ͠آ͠ح͠❤️عسسـل❤️",
"الوجه ميساعد 😐✋",
"ممممح😘ححح😍😍💋",
}
local ns = {
"🌹 هــلــℌelℓoووات🌹عمـ°🌺°ــري🙊😋",
"هْـٌﮩٌﮧٌ﴿🙃﴾ﮩٌـ୭ٌ୭ـْلوُّات†😻☝️",
"هلاوو99وووات نورت/ي ❤️🙈",
"هلووات 😊🌹",
}
local sh = {
"اهلا عزيزي المطور 😽❤️",
"هلوات . نورت مطوري 😍",
}
local lovm = {
"اكرهك 😒👌🏿",
"منو لـ كلك احبك؟ 😒👌🏻",
"دي 😑👊🏾",
"اعشكك/ج مح 😍💋",
"اي احبك/ج 😍❤️",
"ماحبك/ج 😌🖖",
"امـــوت فيك ☹️",
"اذا كتلك/ج احبك/ج شراح تستفاد/ين 😕❤️",
"ولي ماحبك/ج 🙊💔",
}
local song = {
"عمي يبو البار 🤓☝🏿️ \nصبلي لبلبي ترى اني سكران 😌 \n وصاير عصبي 😠 \nانه وياج يم شامه 😉 \nوانه ويــــاج يم شامه  شد شد  👏🏿👏🏿 \nعدكم سطح وعدنه سطح 😁 \n نتغازل لحد الصبح 😉 \n انه وياج يم شامه 😍 \n وانه وياج فخريه وانه وياج حمديه 😂🖖🏿\n ",
"اي مو كدامك مغني قديم 😒🎋 هوه ﴿↜ انـِۨـۛـِۨـۛـِۨيـُِـٌِہۧۥۛ ֆᵛ͢ᵎᵖ ⌯﴾❥  ربي كامز و تكلي غنيلي 🙄😒🕷 آإرۈحُـ✯ـہ✟  😴أنــ💤ــااااام😴  اشرف تالي وكت يردوني اغني 😒☹️🚶","لا تظربني لا تظرب 💃💃 كسرت الخيزارانه💃🎋 صارلي سنه وست اشهر💃💃 من ظربتك وجعانه🤒😹",
"موجوع كلبي😔والتعب بية☹️من اباوع على روحي😢ينكسر كلبي عليه😭",
"ايامي وياها👫اتمنا انساها😔متندم اني حيل😞يم غيري هيه💃تضحك😂عليه😔مقهور انام الليل😢كاعد امسح بل رسائل✉️وجان اشوف كل رسايلها📩وبجيت هوايه😭شفت احبك😍واني من دونك اموت😱وشفت واحد 🚶صار هسه وياية👬اني رايدها عمر عمر تعرفني كل زين🙈 وماردت لا مصلحة ولاغايه😕والله مافد يوم بايسها💋خاف تطلع🗣البوسه💋وتجيها حجايه😔️",
"??صوتي بعد مت سمعه✋يال رايح بلا رجعة🚶بزودك نزلت الدمعة ذاك اليوم☝️يال حبيتلك ثاني✌روح وياه وضل عاني😞يوم اسود علية اني🌚 ذاك اليوم☝️تباها بروحك واضحك😂لان بجيتلي عيني???? وافراح يابعد روحي😌خل الحركة تجويني😔🔥صوتي بعد متسمعة🗣✋",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^كول (.*)$") then
if utf8.len(Text:match("^كول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"📛| ما اكدر اكول اكثر من 500 حرف 🙌🏾")
end
local callback_Text = FlterName(Text:match("^كول (.*)$"),50)
if callback_Text and callback_Text == 'الاسم سبام 📛' then
return sendMsg(msg.chat_id_,msg.id_,"📛| للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif Text:match("^"..Bot_Name.." اتفل (.*)$") then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'اوك سيدي 🌝🍃')
sendMsg(msg.chat_id_,msg.reply_id,'لك شنو هاذه ويهك ختفوووووووووو💦💦️️ بنص ويهك 😹')
else 
return sendMsg(msg.chat_id_,msg.id_,"  🕵🏻 وينه بله سويله رد 🙄")
end
elseif Text:match("^"..Bot_Name.." رزله(.*)$") and msg.SudoUser then
if msg.reply_id then
sendMsg(msg.chat_id_,msg.id_,'اوك سيدي 🌝🍃')
return sendMsg(msg.chat_id_,msg.reply_id,'تعال هيوو  😒 شو طالعه عينك ولسانك طويل سربوت  اشو تعال بله شنو هاذ ويهك هاذ 😳 كول بلعباس , 😅 لك #دي وتفو بعد لتندك بتاج راسك خوش حمبقلبي  👍🏿') 
end
elseif Text:match("^بوس (.*)$") then 
if msg.reply_id then 
return sendMsg(msg.chat_id_,msg.reply_id,bs[math.random(#bs)])
else
return sendMsg(msg.chat_id_,msg.id_,"📌 وينه بله سويله رد 🕵🏻")
end 
elseif msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,sh[math.random(#sh)])
elseif not msg.SudoUser and Text=="هلو" then 
return sendMsg(msg.chat_id_,msg.id_,ns[math.random(#ns)])
elseif msg.SudoUser and Text== "احبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اموت عليك حياتي  😍❤️")
elseif msg.SudoUser and Text== "تحبني" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,"اموت عليك حياتي  😍❤️")
elseif not msg.SudoUser and Text== "احبك" or Text=="حبك" then 
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif not msg.SudoUser and Text== "تحبني" then
return sendMsg(msg.chat_id_,msg.id_,lovm[math.random(#lovm)])
elseif Text== "غني" or Text=="غنيلي" then 
return sendMsg(msg.chat_id_,msg.id_,song[math.random(#song)])
elseif Text=="اتفل" or Text=="تفل" then
if msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,'ختفوووووووووو💦💦️️')
else 
return sendMsg(msg.chat_id_,msg.id_,"📌 انجب ما اتفل عيب 😼🙌🏿") 
end
elseif Text== "تف" then return sendMsg(msg.chat_id_,msg.id_,"عيب ابني/بتي اتفل/ي اكبر منها شوية 😌😹")
elseif Text== "شلونكم" or Text== "شلونك" or Text== "شونك" or Text== "شونكم" then 
return sendMsg(msg.chat_id_,msg.id_,"اني بالنسبة اليه دايح شوف بقيه الاعضااء 😂🖕")
elseif Text== "صاكه"  then return sendMsg(msg.chat_id_,msg.id_,"اووويلي يابه 😍❤️ دزلي صورتهه 🐸💔")
elseif Text== "وينك"  then return sendMsg(msg.chat_id_,msg.id_,"دور بكلبك وتلكاني 😍😍❤️")
elseif Text== "منورين"  then return sendMsg(msg.chat_id_,msg.id_,"من نورك عمري ❤️🌺")
elseif Text== "هاي"  then return sendMsg(msg.chat_id_,msg.id_,"هايات عمري 😍🍷")
elseif Text== "🙊"  then return sendMsg(msg.chat_id_,msg.id_,"فديت الخجول 🙊 😍")
elseif Text== "😢"  then return sendMsg(msg.chat_id_,msg.id_,"لتبجي حياتي 😢")
elseif Text== "😭"  then return sendMsg(msg.chat_id_,msg.id_,"لتبجي حياتي 😭😭")
elseif Text== "منور"  then return sendMsg(msg.chat_id_,msg.id_,"نِْـِْـــِْ([💡])ِْــــًِـًًْـــِْـِْـِْـورِْكِْ")
elseif Text== "😒" and not is_sudo then return sendMsg(msg.chat_id_,msg.id_,"شبيك-ج عمو 🤔")
elseif Text== "مح"  then return sendMsg(msg.chat_id_,msg.id_,"محات حياتي🙈❤")
elseif Text== "شكرا" or Text== "ثكرا" then return  sendMsg(msg.chat_id_,msg.id_,"{ •• الـّ~ـعـفو •• }")
elseif Text== "انته وين"  then return sendMsg(msg.chat_id_,msg.id_,"بالــبــ🏠ــيــت")
elseif Text== "😍"  then return sendMsg(msg.chat_id_,msg.id_," يَمـه̷̐ إآلُحــ❤ــب يَمـه̷̐ ❤️😍")
elseif Text== "اكرهك"  then return sendMsg(msg.chat_id_,msg.id_,"ديله شلون اطيق خلقتك اني😾🖖🏿🕷")
elseif Text== "اريد اكبل" then return sendMsg(msg.chat_id_,msg.id_,"خخ اني هم اريد اكبل قابل ربي وحد😹🙌️")
elseif Text== "ضوجه"  then return sendMsg(msg.chat_id_,msg.id_,"شي اكيد الكبل ماكو 😂 لو بعدك/ج مازاحف/ة 🙊😋")
elseif Text== "اروح اصلي" then return sendMsg(msg.chat_id_,msg.id_,"انته حافظ سوره الفاتحة😍❤️️")
elseif Text== "صاك"  then return sendMsg(msg.chat_id_,msg.id_,"زاحفه 😂 منو هذا دزيلي صورهه")
elseif Text== "اجيت" or Text=="اني اجيت" then return  sendMsg(msg.chat_id_,msg.id_,"كْـٌﮩٌﮧٌ﴿😍﴾ـﮩٌول الـ୭ـهـٌ୭ـْلا❤️")
elseif Text== "طفي السبلت" then return sendMsg(msg.chat_id_,msg.id_,"تم اطفاء السبلت بنجاح 🌚🍃")
elseif Text== "شغل السبلت" then return sendMsg(msg.chat_id_,msg.id_,"تم تشغيل السبلت بنجاح بردتو مبردتو معليه  🌚🍃")
elseif Text== "حفلش"  then return sendMsg(msg.chat_id_,msg.id_,"افلش راسك 🤓")
elseif Text== "نايمين" then return sendMsg(msg.chat_id_,msg.id_,"ني سهران احرسكـم😐🍃'")
elseif Text== "اكو احد" then return sendMsg(msg.chat_id_,msg.id_,"يي عيني انـي موجـود🌝🌿")
elseif Text== "شكو" then return sendMsg(msg.chat_id_,msg.id_,"كلشي وكلاشي🐸تگـول عبالك احنـة بالشورجـة🌝")
elseif Text== "انتة منو" then return sendMsg(msg.chat_id_,msg.id_,"آني كـامل مفيد اكبر زنگين أگعدة عالحديـد🙌")
elseif Text== "كلخرا" or Text== "اكل خره" then return sendMsg(msg.chat_id_,msg.id_,"خرا ليترس حلكك/ج ياخرا يابنلخرا خختفووو ابلع😸🙊💋")
elseif Text== "حبيبتي" then return sendMsg(msg.chat_id_,msg.id_,"منو هاي 😱 تخوني 😔☹")
elseif Text== "حروح اسبح" then return sendMsg(msg.chat_id_,msg.id_,"واخيراً 😂")
elseif Text== "😔"  then return sendMsg(msg.chat_id_,msg.id_,"ليش الحلو ضايج ❤️🍃")
elseif Text== "☹️"  then return sendMsg(msg.chat_id_,msg.id_,"لضوج حبيبي 😢❤️🍃")
elseif Text== "جوعان"  then return sendMsg(msg.chat_id_,msg.id_,"تعال اكلني 😐😂")
elseif Text== "تعال خاص" or Text== "خاصك" or Text=="شوف الخاص" or Text=="شوف خاص" then return "ها شسون 😉"
elseif Text== "لتحجي"  then return sendMsg(msg.chat_id_,msg.id_,"وانت شعليك حاجي من حلگگ😒")
elseif Text== "معليك" or Text== "شعليك" then return sendMsg(msg.chat_id_,msg.id_,"عليه ونص 😡")
elseif Text== "شدسون" or Text== "شداتسوون" or Text== "شدتسون" then return  sendMsg(msg.chat_id_,msg.id_,"نطبخ 😐")
elseif Text:match(Bot_Name.." شلونك$") then 
return sendMsg(msg.chat_id_,msg.id_,"احســن مــن انتهــــہ شــلونـــك شــخــبـارك يـــول مۂــــشتـــاقـــلك شــو ماكـــو 😹🌚")
elseif Text== "يومه فدوه"  then return sendMsg(msg.chat_id_,msg.id_,"فدؤه الج حياتي 😍😙")
elseif Text== "افلش"  then return sendMsg(msg.chat_id_,msg.id_,"باند عام من 30 بوت 😉")
elseif Text== "احبج"  then return sendMsg(msg.chat_id_,msg.id_,"يخي احترم شعوري 😢")
elseif Text== "شكو ماكو"  then return sendMsg(msg.chat_id_,msg.id_,"غيرك/ج بل كلب ماكو يبعد كلبي😍❤️️")
elseif Text== "اغير جو"  then return sendMsg(msg.chat_id_,msg.id_,"😂 تغير جو لو تسحف 🐍 عل بنات")
elseif Text== "😋"  then return sendMsg(msg.chat_id_,msg.id_,"طبب لسانك جوه عيب 😌")
elseif Text== "😡"  then  return sendMsg(msg.chat_id_,msg.id_,"ابرد  🚒"  )
elseif Text== "مرحبا"  then return sendMsg(msg.chat_id_,msg.id_,"مراحب 😍❤️ نورت-ي 🌹")
elseif Text== "سلام" or Text== "السلام عليكم" or Text== "سلام عليكم" or Text=="سلامن عليكم" or Text=="السلامن عليكم" then 
return sendMsg(msg.chat_id_,msg.id_,"وعليكم السلام اغاتي🌝👋" )
elseif Text== "واكف"  then return sendMsg(msg.chat_id_,msg.id_,"يخي مابيه شي ليش تتفاول😢" )
elseif Text== "🚶🏻‍♂"  then return sendMsg(msg.chat_id_,msg.id_,"لُـﮩـضڵ تتـمشـﮥ اڪعـد ﺳـﯠڵـف 🤖👋🏻")
elseif Text== "البوت واكف" then return sendMsg(msg.chat_id_,msg.id_,"هياتني 😐")
elseif Text== "ضايج"  then return sendMsg(msg.chat_id_,msg.id_,"ليش ضايج حياتي")
elseif Text== "ضايجه"  then return sendMsg(msg.chat_id_,msg.id_,"منو مضوجج كبدايتي")
elseif Text== "😳" or Text== "😳😳" or Text== "😳😳😳" then return sendMsg(msg.chat_id_,msg.id_,"ها بس لا شفت خالتك الشكره 😳😹🕷")
elseif Text== "صدك"  then return sendMsg(msg.chat_id_,msg.id_,"قابل اجذب عليك!؟ 🌚")
elseif Text== "شغال"  then return sendMsg(msg.chat_id_,msg.id_,"نعم عزيزي باقي واتمدد 😎🌿")
elseif Text== "تخليني"  then return sendMsg(msg.chat_id_,msg.id_,"اخليك بزاويه 380 درجه وانته تعرف الباقي 🐸")
elseif Text== "فديتك" or Text== "فديتنك"  then return  sendMsg(msg.chat_id_,msg.id_,"فداكـ/چ ثولان العالـم😍😂" )
elseif Text== "بوت"  then return sendMsg(msg.chat_id_,msg.id_,"أسمي ["..Bot_Name.."] 🌚🌸")
elseif Text== "مساعدة"  then return sendMsg(msg.chat_id_,msg.id_,"لعرض قائمة المساعدة اكتب الاوامر 🌚❤️")
elseif Text== "زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"زاحف عله خالتك الشكره 🌝")
elseif Text== "حلو"  then return sendMsg(msg.chat_id_,msg.id_,"انت الاحلى 🌚❤️")
elseif Text== "تبادل"  then return sendMsg(msg.chat_id_,msg.id_,"كافي ملينه تبادل 😕💔")
elseif Text== "عاش"  then return sendMsg(msg.chat_id_,msg.id_,"الحلو 🌝🌷")
elseif Text== "مات"  then return sendMsg(msg.chat_id_,msg.id_,"أبو الحمامات 🕊🕊")
elseif Text== "ورده" or Text== "وردة" then return sendMsg(msg.chat_id_,msg.id_,"أنت/ي  عطرها 🌹🌸")
elseif Text== "شسمك"  then return sendMsg(msg.chat_id_,msg.id_,"مكتوب فوك 🌚🌿")
elseif Text== "فديت" or Text=="فطيت" then return sendMsg(msg.chat_id_,msg.id_,"فداك/ج كلبي ودكاته 🙈💗")
elseif Text== "واو"  then return sendMsg(msg.chat_id_,msg.id_,"قميل 🌝🌿")
elseif Text== "زاحفه" or Text== "زاحفة" then return  sendMsg(msg.chat_id_,msg.id_,"لو زاحفتلك جان ماكلت زاحفه 🌝🌸")
elseif Text== "حبيبي" or Text=="حبي" then return  sendMsg(msg.chat_id_,msg.id_,"بعد روحي 😍❤️ تفضل")
elseif Text== "حبيبتي" then return sendMsg(msg.chat_id_,msg.id_,"تحبك وتحب عليك 🌝🌷")
elseif Text== "حياتي" then return sendMsg(msg.chat_id_,msg.id_,"ها حياتي 😍🌿")
elseif Text== "عمري" then return sendMsg(msg.chat_id_,msg.id_,"خلصته دياحه وزحف 🌝🌿 ")
elseif Text== "اسكت" then return sendMsg(msg.chat_id_,msg.id_,"وك معلم 🌚💞")
elseif Text== "بتحبني" then return sendMsg(msg.chat_id_,msg.id_,"بحبك اد الكون 😍🌷")
elseif Text== "المعزوفه" or Text=="المعزوفة" or Text=="معزوفه" then 
return sendMsg(msg.chat_id_,msg.id_,"طرطاا طرطاا طرطاا 😂👌")
elseif Text== "موجود" then return sendMsg(msg.chat_id_,msg.id_,"تفضل عزيزي 🌝🌸")
elseif Text== "اكلك" then return sendMsg(msg.chat_id_,msg.id_,".كول حياتي 😚🌿")
elseif Text== "فدوه" or Text=="فدوة" or Text=="فطوه" or Text=="فطوة" then  
return sendMsg(msg.chat_id_,msg.id_,"لكلبك/ج 😍❤️")
elseif Text== "دي"  or Text== "ديي" then return sendMsg(msg.chat_id_,msg.id_,"امشيك بيها 😉👋🏻")
elseif Text== "اشكرك" then return sendMsg(msg.chat_id_,msg.id_,"بخدمتك/ج حبي ❤")
elseif Text== "😉"  then return sendMsg(msg.chat_id_,msg.id_,"😻🙈")
elseif Text== "😑"  or Text==  "😑😑" or Text==  "😑😑😑" then return sendMsg(msg.chat_id_,msg.id_,"ديي وجهك معقد😑👊🏻")
elseif Text== "اطردني"  then return sendMsg(msg.chat_id_,msg.id_,"واني شعلي؟ 😂")
elseif Text== "احظرني"  then return sendMsg(msg.chat_id_,msg.id_,"انجب مالي دخل خلي واحد م̷ـــِْن  الادمنيه 😹☝️🏻")
elseif Text== "ادفرني"  then return sendMsg(msg.chat_id_,msg.id_,"ولله عدي بصطال يفيدك ؟ 😹😹👋🏻")
elseif Text== "🙄🙄"  then return sendMsg(msg.chat_id_,msg.id_,"كشششش عاع😃 طيورك فوك😂")
elseif Text== "شسمج"  then return sendMsg(msg.chat_id_,msg.id_,"عوف اسمي وانطيني رقمك بلخاص ههه🙊")
elseif Text== "خاصك"  then return sendMsg(msg.chat_id_,msg.id_,"سهلـة الـﻐـرك بالمٲي ﺑﯿـدك تطلعـة بس الـغـﺭك بالـخاﺹ ڪلي شـيطلعـة 😹😔💜")
elseif Text== "اني"  then return sendMsg(msg.chat_id_,msg.id_,"انت🌚 واحــد😒 ملطلـــط😡مــــا تكعـــد وتسكت😂😘")
elseif Text== "نورت"  then return sendMsg(msg.chat_id_,msg.id_,"نـ﴿💡﴾ـورك/ج ؏ـمـ😲ـآني وحہـ(🔥)ـہرگ بيـ🏡ـت جيہـْ✍ـہرآنيًٍِ")
elseif Text== "نورتي"  then return sendMsg(msg.chat_id_,msg.id_,"نـ﴿💡﴾ـورك/ج ؏ـمـ😲ـآني وحہـ(🔥)ـہرگ بيـ🏡ـت جيہـْ✍ـہرآنيًٍِ")
elseif Text== "الله"  then return sendMsg(msg.chat_id_,msg.id_,"راجع المكتب حبيبي عبالك سهل تحجي ويا الله 😒💔")
elseif Text== "😹😹😹"  then return sendMsg(msg.chat_id_,msg.id_,"شـهضحڪًــة  ๋͜͡اٰ͡لحلوة بربڪً  ͜اٰ͡مڪً على شـو متوحمة😉😉")
elseif Text== "حسوني"  then return sendMsg(msg.chat_id_,msg.id_,"على أشباهي أن يشعروا بالفخر ، لأني ضمن مجموعتهم🙂")
elseif Text== "رفع اثول"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع العضو اثول الگروب🤪بنجاح✔️\n🛠¦ تمت إضافته إلى قائمه الثولان😹\n✓️")
elseif Text== "تنزيل اثول"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم تنزيل العضو من ثولان الكروب✔️\n🛠¦ تمت الزاله من قامة الثولان😹\n✓️")
elseif Text== "رفع جلب"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع المتهم إلى جلب 🐶بنجاح✔️\n🛠¦ تمت إضافته إلى قائمه الجلاب😹\n✓️")
elseif Text== "تنزيل جلب"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي \n🎫¦ تم تنزيل المتهم جلب 🐶بنجاح✔️\n🛠¦ تمت إزالته من قائمه الجلاب😹\n✓️")
elseif Text== "رفع مطي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع المتهم مطي بنجاح✔️\n🛠¦ تمت ترقيته ليستلم عربانه 🐴\n✓️")
elseif Text== "تنزيل مطي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم تنزيل المتهم مطي بنجاح🐴\n🛠¦ تمت سحب منه العربانه😹✔️\n✓️")
elseif Text== "رفع صخل"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع المتهم صخل 😹بنجاح✔️\n🛠¦ الان اصبح صخل الكروب 🐐\n✓️")
elseif Text== "تنزيل صخل"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم تنزيل المتهم صخل😹بنجاح✔️\n🛠¦ تمت ٳزالته من قائمة الصخوله🐐\n✓️")
elseif Text== "رفع زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهلا عزيزي\n🎫¦ تم رفع المتهم زاحـ🐊ـف بنجاح ✔️\n🐊¦ اصبح زاحف الكروب ❕\n✓️")
elseif Text== "تنزيل زاحف"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهلا عزيزي\n🎫¦ تم تنزيل المتهم زاحـ🐊ـف بنجاح ✔️\n🐊¦ تمت ٳزالته من زواحف الكروب ❕\n✓️")
elseif Text== "رفع بكلبي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع العضو داخل كلبك✔️\n🛠¦ تمت ترقيته بنجاح 😻😹👋🏻\n✓️")
elseif Text== "تنزيل من كلبي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم تنزيل من داخل قلبك✔️\n🛠¦ تمت ازالته من قائمه القلوب 😹💔\n✓️")
elseif Text== "رفع تاج"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهـلا عزيزي\n🎫¦ تم رفع صديقك تـ👑ـاج بنجاح ✔️ \n🛠¦ اصبح خط احمر ❗️ \n✓️")
elseif Text== "تنزيل تاج"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهـلا عزيزي\n🎫¦ تم تنزيل العضو المهتلف\n🛠¦ من قائمة ألتـ👑ـاج بنجاح ✔️😹💔\n✓️")
elseif Text== "رفع نبي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع العضو نبي 👳🏻‍♂️🤓بنجاح✔️\n🛠¦ بعد شتريد مولاي الامير🌚😹\n✓️")
elseif Text== "تنزيل نبي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم تنزيل العضو نبي 👳🏻‍♂️من المجموعة بنجاح✔️\n🛠¦طاحت كرامتك مولاي🤧😂\n✓️")
elseif Text== "رفع مرتي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم رفع العضو مرتك بنجاح✔️\nالآن يمكنكم أخذ راحتكم🤤😉\n✓️")
elseif Text== "تنزيل مرتي"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم تنزيل الجكمه مرتك بنجاح✔️\nالآن انتم مفترقان☹️💔\n✓️")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم زواجكم الاثنين بنجاح✔️\n🛠¦ الآن يمكنكم أخذ راحتكم🤤😉\n✓️")
elseif Text== "طلاك"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏻‍♂¦ اهــلا عزيزي\n🎫¦ تم طلاك العضو بنجاح✔️\n🛠¦ الآن هو مطلك امشي طلعبرا 😹💔\n✓️")
elseif Text== "اوامر التحشيش"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏽‍♂¦ مرحبآ عزيزي ،\n💯¦ إليـك اوامر التحشيش كـ التالي\n﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎\n\n👁‍🗨¦ رفع اثول «» تنزيل اثول ≈ 🤪\n\n✴️¦ رفع جلب «» تنزيل جلب ≈ 🐕\n\n🎫¦ رفع مطي «» تنزيل مطي ≈ 🐴\n\n💥¦ رفع صخل «» تنزيل صخل ≈ 🐐\n\n🐊¦ رفع زاحف «» تتزيل زاحف ≈ 🐍\n\n🕊¦ رفع بكلبي«»تنزيل من كلبي ≈❤️\n\n⚜¦ رفع تاج «» تنزيل تاج ≈ 👑\n\n🎟¦ رفع نبي «» تنزيل نبي ≈ 👳🏻‍♂️\n\n🎶¦ رفع مرتي «» تنزيل مرتي ≈ 💃\n\n🎈¦ طلاك «» زواج ≈ 🤱🏻\n↗️\n﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎³¹³")

elseif Text== "اقرالي دعاء" then 
return sendMsg(msg.chat_id_,msg.id_,"اللهم عذب المدرسين 😢 منهم الاحياء والاموات 😭🔥 اللهم عذب ام الانكليزي 😭💔 وكهربها بلتيار الرئيسي 😇 اللهم عذب ام الرياضيات وحولها الى غساله بطانيات 🙊 اللهم عذب ام الاسلاميه واجعلها بائعة الشاميه 😭🍃 اللهم عذب ام العربي وحولها الى بائعه البلبي اللهم عذب ام الجغرافيه واجعلها كلدجاجه الحافية اللهم عذب ام التاريخ وزحلقها بقشره من البطيخ وارسلها الى المريخ اللهم عذب ام الاحياء واجعلها كل مومياء اللهم عذب المعاون اقتله بلمدرسه بهاون 😂😂😂")
elseif Text== "ايديي" or Text=="ايدي 🆔" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"🧟‍♂¦ آضـغط على آلآيدي ليتم آلنسـخ\n\n "..USERNAME.." ~⪼ ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="اريد رابط الحذف" or Text=="اريد رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
💭*¦* رابط حذف حـساب التيليگرام ↯
📛¦ لتتندم فڪر قبل ڪلشي  
👨🏽‍⚖️¦ بالتـوفيـق عزيزي ...
🚸¦ [اضغط هنا لـحـذف الـحـسـاب](https://telegram.org/deactivate)
🎁¦ [اضغط هنا لديك مفاجئه](https://t.me/hlh_313)
🎁¦ [اضغط هنا لديك مفاجئه اخرى](https://t.me/llh313)
]] )
--=====================================
elseif Text== "انجب" or Text== "نجب" or Text=="جب" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"حاضر مو تدلل حضره المطور  😇 ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"ع راسي تدلل انته المنشئ تاج راسي 😌")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"لخاطرك راح اسكت لان مدير وع راسي  😌")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"فوك مامصعدك ادمن ؟؟ انته انجب 😏")
else 
return sendMsg(msg.chat_id_,msg.id_,"انجب انته لاتندفر 😏")
end 
end 




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------

if redis:get(boss..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'🕵🏼️‍♀️¦ انتهى الاشتراك في احد المجموعات ✋🏿\n👨🏾‍🔧¦ المجموعه : '..FlterName(redis:get(boss..'group:name'..msg.chat_id_))..'🍃\n💂🏻‍♀️¦ ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'🕵🏼️‍♀️¦ انتهى الاشتراك البوت✋🏿\n💂🏻‍♀️¦ سوف اغادر المجموعه فرصه سعيده 👋🏿\n👨🏾‍🔧¦ او راسل المطور للتجديد '..SUDO_USER..' 🍃')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(boss..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'🕵🏼️‍♀️¦ باقي يوم واحد وينتهي الاشتراك ✋🏿\n👨🏾‍🔧¦ راسل المطور للتجديد '..SUDO_USER..'\n📛')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 


return {
Boss = {
"^(تقييد)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(فك التقييد)$",
"^(فك التقييد) (%d+)$",
"^(فك التقييد) (@[%a%d_]+)$",
"^(فك تقييد)$",
"^(فك تقييد) (%d+)$",
"^(فك تقييد) (@[%a%d_]+)$",
"^(ضع شرط التفعيل) (%d+)$",
"^(التفاعل)$",
"^(التفاعل) (@[%a%d_]+)$",
"^([iI][dD])$",
"^(ايدي)$",
"^(ايدي) (@[%a%d_]+)$",
"^(كشف)$",
"^(كشف) (%d+)$",
"^(كشف) (@[%a%d_]+)$",
'^(رفع مميز)$',
'^(رفع مميز) (@[%a%d_]+)$',
'^(رفع مميز) (%d+)$',
'^(تنزيل مميز)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(رفع ادمن)$',
'^(رفع ادمن) (@[%a%d_]+)$',
'^(رفع ادمن) (%d+)$',
'^(تنزيل ادمن)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(رفع المدير)$',
'^(رفع مدير)$', 
'^(رفع مدير) (@[%a%d_]+)$',
'^(رفع المدير) (@[%a%d_]+)$',
'^(رفع المدير) (%d+)$',
'^(رفع مدير) (%d+)$',
'^(رفع منشى)$',
'^(رفع منشئ)$',
'^(رفع منشئ) (@[%a%d_]+)$',
'^(رفع منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ)$',
'^(تنزيل منشى)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل منشى) (%d+)$',
'^(تنزيل منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
'^(قفل) (.+)$',
'^(فتح) (.+)$',
'^(تفعيل)$',
'^(تفعيل) (.+)$',
'^(تعطيل)$',
'^(تعطيل) (.+)$',
'^(ضع تكرار) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام)$",
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر)$", 
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر)$", 
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(رفع مطور)$",
"^(رفع مطور) (@[%a%d_]+)$",
"^(رفع مطور) (%d+)$",
"^(تنزيل مطور)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(تعطيل) (-%d+)$",
"^(الاشتراك) ([123])$",
"^(الاشتراك)$",
"^(شحن) (%d+)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(ضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(رابط)$",
"^(الرابط)$",
"^(رابط خاص)$",
"^(الرابط خاص)$",
"^(القوانين)$",
"^(ضع القوانين)$",
"^(ضع قوانين)$",
"^(ضع تكرار)$",
"^(ضع التكرار)$",
"^(الادمنيه)$",
"^(قائمه المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(المكتومين)$",
"^(ضع الترحيب)$",
"^(الترحيب)$",
"^(المحظورين)$",
"^(ضع اسم)$",
"^(ضع صوره)$",
"^(ضع وصف)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(صوره الترحيب)$",
"^(ضع كليشه المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(اذاعه)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$",
"^(اذاعه عام بالتوجيه 📣)$", 
"^(اذاعه خاص 👤)$", 
"^(اذاعه عام 📢)$", 
"^(اذاعه 🗣)$", 
"^(قائمه العام)$",
"^(قائمه العام 📜)$",
"^(المطورين)$",
"^(المطورين 🕹)$",
"^(تيست)$",
"^(test)$",
"^(ايدي 🆔)$",
"^(قناة السورس 📡)$",
"^(الاحصائيات)$",
"^(الاحصائيات 📈)$",
"^(اضف رد عام)$",
"^(اضف رد عام ➕)$",
"^(مسح الردود)$",
"^(مسح الردود العامه)$",
"^(ضع اسم للبوت)$",
"^(حذف صوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(الردود العامه)$",
"^(الردود العامه 🗨)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس ™)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(رتبتي)$",
"^(ضع اسم للبوت ©)$",
"^(ضع صوره للترحيب 🌄)$",
"^(ضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر ✖️)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(الساعه)$",
"^(التاريخ)$",
"^()$",
"^(الملفات 🗂)$",
"^(/files)$",
"^(/[Ss]tore)$",
"^(الملفات)$",
"^([Ss][pP]) ([%a%d_]+.lua)$", 
"^([dD][pP]) ([%a%d_]+.lua)$", 
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(السيرفر)$",
"^(نسخه احتياطيه للمجموعات)$",
"^(رفع نسخه الاحتياطيه)$", 
"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(ادفرني)$", 
"^(مغادره)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 


"^(السورس)$",
"^(سورس)$",
"^(م المطور)$", 
"^(اوامر الرد)$",
"^(اوامر الملفات)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$",


 
 
 },
 iBoss = iBoss,
 dBoss = dBoss,
 }
