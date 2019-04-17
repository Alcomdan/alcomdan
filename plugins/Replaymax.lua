--[[
#      ▇▇▇                              ▇▇▇            ▄▇▇▇▇▇▄              ▇▇                                    ▇▇                
#      ▇▇   ▇                        ▇   ▇▇          ▄▇                ▇▄                     ▇▇                  ▇▇
#      ▇▇     ▇ @hlh313   ▇     ▇▇         ▄▇    ▄▄▄    ▇▄                             ▇▇ ▇▇
#      ▇▇        ▇             ▇         ▇▇     ▄▇                            ▇▄                       ▇▇ ▇▇ ¦ Dev : @hlh313
#      ▇▇           ▇       ▇            ▇▇   ▄▇ ¦ Dev : @hlh_313  ▇▄              ▇▇                 ▇▇
#      ▇▇              ▇▇                ▇▇  ▄▇                                    ▇▄   ▇▇                                  ▇▇¦ Source TH3BOSS BY @hlh_313
#---------------------------------------------------------------------
]] 

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
"ايامي وياها👫اتمنا انساها😔متندم اني حيل😞يم غيري هيه💃تضحك😂عليه??مقهور انام الليل😢كاعد امسح بل رسائل✉️وجان اشوف كل رسايلها📩وبجيت هوايه😭شفت احبك😍واني من دونك اموت😱وشفت واحد 🚶صار هسه وياية👬اني رايدها عمر عمر تعرفني كل زين🙈 وماردت لا مصلحة ولاغايه😕والله مافد يوم بايسها💋خاف تطلع🗣البوسه💋وتجيها حجايه😔️",
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
elseif Text== "اوامر التحشيش"  then return sendMsg(msg.chat_id_,msg.id_,"🙋🏽‍♂¦ مرحبآ عزيزي ،\n💯¦ إليـك اوامر التحشيش كـ التالي\n﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎\n\n👁‍🗨¦ رفع اثول «» تنزيل اثول ≈ 🤪\n\n✴️¦ رفع جلب «» تنزيل جلب ≈ 🐕\n\n🎫¦ رفع مطي «» تنزيل مطي ≈ 🐴\n\n??¦ رفع صخل «» تنزيل صخل ≈ 🐐\n\n🐊¦ رفع زاحف «» تتزيل زاحف ≈ 🐍\n\n🕊¦ رفع بكلبي«»تنزيل من كلبي ≈❤️\n\n⚜¦ رفع تاج «» تنزيل تاج ≈ 👑\n\n🎟¦ رفع نبي «» تنزيل نبي ≈ 👳🏻‍♂️\n\n🎶¦ رفع مرتي «» تنزيل مرتي ≈ 💃\n\n🎈¦ طلاك «» زواج ≈ 🤱🏻\n↗️\n﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎³¹³")

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
 },
 iBoss = iBoss,
 dBoss = dBoss,
 }
