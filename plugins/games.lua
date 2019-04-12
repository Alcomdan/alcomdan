--[[
#      ▇▇▇                                       ▇▇▇                     ▄▄▄▄▄                     ▇▇                                                     ▇▇
#      ▇▇     ▇                             ▇     ▇▇                 ▄▇            ▇▄                          ▇▇                                   ▇▇                
#      ▇▇        ▇                        ▇       ▇▇               ▄▇                ▇▄                                 ▇▇                 ▇▇
#      ▇▇          ▇ @hlh313   ▇         ▇▇              ▄▇▄▄▄▄▄▇▄                                          ▇▇ ▇▇
#      ▇▇             ▇             ▇             ▇▇          ▄▇                            ▇▄                                     ▇▇ ▇▇ ¦ Dev : @hlh313
#      ▇▇                ▇       ▇                ▇▇        ▄▇ ¦ Dev : @hlh_313  ▇▄                           ▇▇                 ▇▇
#      ▇▇                   ▇▇                    ▇▇       ▄▇                                    ▇▄                 ▇▇                                  ▇▇
#      ▇▇                                               ▇▇    ▄▇                                           ▇▄   ▇▇                                                      ▇▇  ¦ Source TH3BOSS BY @hlh_313
#---------------------------------------------------------------------
]]
local function games(msg,MsgText)
if msg.type ~= "pv" and msg.GroupActive then

if MsgText[1] == "تفعيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "*️✔¦ ❪ اهلن عزيزي 🙋🏻‍♂ هذا الامر يخص المطور , المنشى , المدير , الادمن ❫\n*" end
if not redis:get(boss..'lock_geams'..msg.chat_id_) then 
return "*🙋🏻‍♂¦ مرحباً عزيزي "..msg.TheRankCmd.."\n✔¦ الالعاب بالتأكيد مفعله\n*" 
else 
redis:del(boss..'lock_geams'..msg.chat_id_) 
return "*🙋🏻‍♂¦ مرحباً عزيزي "..msg.TheRankCmd.."\n✔¦ تم تفعيل الالعاب\n*" 
end 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "*✔¦ ❪ اهلن عزيزي 🙋🏻‍♂ هذا الامر يخص المطور , المنشى , المدير , الادمن ❫\n*" end
if redis:get(boss..'lock_geams'..msg.chat_id_) then 
return "*🙋🏼‍♂️¦ مرحباً عزيزي "..msg.TheRankCmd.." \n📡¦ الالعاب بالتأكيد معطله \n*" 
else
redis:set(boss..'lock_geams'..msg.chat_id_,true)  
return "*🙋🏼‍♂️¦ مرحباً عزيزي "..msg.TheRankCmd.." \n📡¦ تم تعطيل الالعاب \n*" 
end   
end

if MsgText[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
local ID_USER = MsgText[2]
redis:set(boss..'SET:ID:USER'..msg.chat_id_,ID_USER)  
redis:setex(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*📊¦ ارسل لي عدد الرسائل الذي تريده*')
end
if MsgText[1] == "اضف مجوهرات" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "📛*¦* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
local ID_USER = MsgText[2]
redis:set(boss..'SET:ID:USER:NUM'..msg.chat_id_,ID_USER)  
redis:setex(boss.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*📊¦ ارسل لي عدد المجوهرات الذي تريده*')
end
if not redis:get(boss..'lock_geams'..msg.chat_id_) and msg.GroupActive then


if MsgText[1] == 'محيبس' or MsgText[1] == 'بات' then   
Num = math.random(1,6)
redis:set(boss.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*🙋🏻‍♂¦ اهلن عزيزي 
📮¦ اليك 6 ايدي اختر رقم لأستخراج البات م̷ـــِْن اليد التي تحمل المحيبس
🎁¦ الفائز يحصل على { 3 } من النقاط
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
➀    ➁    ➂    ➃   ➄    ➅ 
↓   ↓   ↓    ↓   ↓   ↓ 
👊‹›👊‹›👊‹›👊‹›👊‹›👊
*
]]
sendMsg(msg.chat_id_,msg.id_,TEST)   
redis:setex(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end




if MsgText[1] == 'حزوره' then
katu = {'امي','انا','المخده','الهواء','الهواء','القمر','الباب المفتوح','النهر','الكف','الغيم','اسمك','حرف الام','الابجديه','الدائره','الساعه','تموز','الصمت','السلحفات','كم الساعه','شجره العائله','ضفدع','خليه النحل','الصوت','الجوع','الكتاب','البيض','الاسفنجه','البرتقال','الكفن','الساعه','ارجل المنضده','البصل','الوقت','النار','الثلج','العمر','المسمار','الحفره','المشط','التلفون','الجرص','المراه','الغداء','الفيل','الصدئ','الهواء','عقرب الساعه'};
name = katu[math.random(#katu)]
redis:set(boss..':Set_Hzorh:'..msg.chat_id_,name)
name = string.gsub(name,'امي','اخت خالك ومو خالتك منو')
name = string.gsub(name,'انا','بنت امك وابنت ابوك ومش اختك ولاخوك منو')
name = string.gsub(name,'المخده','اني خفيفه واني لطيفه اكوم من حضن الوزير اكعد بحضن الخليفه أزيح الهموم  واخلي لحبيب نايم منو انني')
name = string.gsub(name,'الهواء','ماهو الشيء الذي يسير امامك ولا تراه')
name = string.gsub(name,'القمر','ماهو الشيء الذي يحيا اول الشهر ويموت في اخره')
name = string.gsub(name,'الباب المفتوح','ماهو الباب الذي لا يمكن فتحه')
name = string.gsub(name,'النهر','ماهو الشي الذي يجري ولا يمشي')
name = string.gsub(name,'الكف','ماهو الشي الذي لو خمس اصابع دون لحم او عضم')
name = string.gsub(name,'الغيم','ماهو الشي الذي يمشي بلا رجلين ويبكي بلا عينين')
name = string.gsub(name,'اسمك','ماهو الشيء الذي لك ويستخدمه الناس من دون اذنك')
name = string.gsub(name,'حرف الام','ماهو الشيء الذي تراه في الليل ثلاث مرات والنهار مره واحده')
name = string.gsub(name,'الابجديه','كلمه تتكون من 8 احرف لكنها تجمع كل الحروف')
name = string.gsub(name,'الدائره','ماهو الشيء الذي ليس له بدايه وليس له نهايه')
name = string.gsub(name,'الساعه','ماهو الشيء الذي لا يتكلم واذا اكل صدق واذا جاع كذب')
name = string.gsub(name,'تموز','ماهو اسم الشهر الميلادي الذي اذا حذفت اوله تحول الى فاكهه')
name = string.gsub(name,'الصمت','ماهي الكلمه الذي يبطل معناها اذا نطقت بها ')
name = string.gsub(name,'السلحفات','ماهو الذي لحمهه من الداخل وعضمهه من الخارج ')
name = string.gsub(name,'كم الساعه','ماهوه السوال الذي تختلف اجابته دائماً')
name = string.gsub(name,'شجره العائله','ما اسم الشجره التي ليس لها ضل ولا لها ثمار ')
name = string.gsub(name,'الضفدع','ماهو الحيوان الذي لسانه طويل وجسمه صغير')
name = string.gsub(name,'خليه النحل','ماهو الشيء الذي يتسع مئاات الالوف ولا يتسع طير منتوف')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا ب الاذنين؟؟')
name = string.gsub(name,'الجوع','ماهو الشيء الذي يقرصك ولا تراه')
name = string.gsub(name,'الكتاب','له اوراق وماهو بنبات . له جلد وماهو بحيوان . وعلم وماهو ب انسان من هو')
name = string.gsub(name,'البيض','ماهو الشي الذي اسمه علئ لونه')
name = string.gsub(name,'الاسفنجه','كلي ثقوب ومع ذالك احفظ الماء فمن انا ')
name = string.gsub(name,'البرتقال','ماهو الشيء نرميه بعد العصر')
name = string.gsub(name,'الكفن','ماهو الشيء لاتحب ان تلبسة وان لبستة لاترة')
name = string.gsub(name,'الساعه','ماهو الشيء الذي يمشي ويقف وليس له ارجل')
name = string.gsub(name,'ارجل المنضده','اننا اربعة اخوه ولنا راس واحد فمن نحن')
name = string.gsub(name,'البصل','شيء تذبحه وتبكي عليه؟')
name = string.gsub(name,'الوقت','يذهب ولا يرجع')
name = string.gsub(name,'النار','شيء ياكل ولايشبع وان شرب الماء مات')
name = string.gsub(name,'الثلج','شيء مصنوع من الماء. وان عاش في الماء يموت')
name = string.gsub(name,'العمر','ماهو الشيء الذي كلما زاد نقص')
name = string.gsub(name,'المسمار','ماهو الشيء الذي لا يمشي الا ب الضرب')
name = string.gsub(name,'الحفره','ماهو الشيء الذي كلما اخذنا منهه زاد وكبر')
name = string.gsub(name,'المشط','له اسنان ولا يعض ماهو ')
name = string.gsub(name,'التلفون','يسمع بلا اذن ويحكي بلا لسان فما هو')
name = string.gsub(name,'الجرص','ماهو الشيء الذي اذا لمستهه صاح')
name = string.gsub(name,'المراه','ارى كل شيء من دون عيون فمن اكون')
name = string.gsub(name,'الغداء','ماهو الشيء الذي لايؤكل في الليل ')
name = string.gsub(name,'الفيل','من هوه الحيوان الذي يحك اذنه في انفه')
name = string.gsub(name,'الصدئ','ماهو الشيء الذي يتكلم جميع اللغات ')
name = string.gsub(name,'الهواء','شيء بيني وبينك لا تراه عينك ولا عيني فما هوه')
name = string.gsub(name,'عقرب الساعه','هناك عقرب لا يلدغ ولا يخاف منه الاطفال فما هوه')
return '  اول واحد يحلها » {* '..name..' *} ' 
end


if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local NUM = math.random(10,1000)
redis:set(boss..':NUM_SET:'..msg.chat_id_,(NUM * 3))
local Smiles = {'🍏','🍎','🍐',NUM,NUM,NUM,NUM,NUM,'🍊','🍋','🍌','🍉',NUM,NUM,NUM,NUM,NUM,'🍇','🍓','🍈','🍒',NUM,NUM,NUM,NUM,NUM,'??','🍍','🥥','🥝','🍅',NUM,NUM,NUM,NUM,NUM,'🍆','🥑','🥦','🥒',NUM,NUM,NUM,NUM,NUM,'🌶','🌽','🥕','🥔','🍠','🥐','🍞',NUM,NUM,NUM,NUM,NUM,'🥖','🥨','🧀','🥚','🍳','🥞','🥓',NUM,NUM,NUM,NUM,NUM,'🥩','🍗','🍖','🌭','🍔','🍟',NUM,NUM,NUM,NUM,NUM,'🍕','🥪','🥙','🍼','☕️','🍵',NUM,NUM,NUM,NUM,NUM,'🥤','🍶','🍺','🍻',NUM,NUM,NUM,NUM,NUM,'🏀','⚽️','🏈','⚾️','🎾','🏐',NUM,NUM,NUM,NUM,NUM,'🏉','🎱','🏓','🏸','🥅','🎰','🎮',NUM,NUM,NUM,NUM,NUM,'🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹',NUM,NUM,NUM,NUM,NUM,'🎼','🎧','🎤','🎬','🎨','🎭',NUM,NUM,NUM,NUM,NUM,'🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌',NUM,NUM,NUM,NUM,NUM,'🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌',NUM,NUM,NUM,NUM,NUM,'📍','📓','📗','📂','📅','📪','📫','📬',NUM,NUM,NUM,NUM,NUM,'📭','⏰','📺','🎚','☎️',NUM,NUM,NUM,NUM,NUM,'📡'}
Emoji = Smiles[math.random(#Smiles)]
redis:set(boss..':Set_Smile:'..msg.chat_id_,Emoji)
if tonumber(redis:get(boss..':Set_Smile:'..msg.chat_id_)) == tonumber(redis:get(boss..':NUM_SET:'..msg.chat_id_)) then
return '👁‍🗨┇اول من يكتب هذه العدد يفوز ؛  ››`'..(redis:get(boss..':Set_Smile:'..msg.chat_id_))..'`'
else
return '️👁‍🗨┇اول من يكتب هذه السمايل يفوز ››    `'..(redis:get(boss..':Set_Smile:'..msg.chat_id_))..'`'
end
end
if MsgText[1] == 'ترتيب' then
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
redis:set(boss..':Set_Arg:'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ي ف ا')
name = string.gsub(name,'بزونه','ز و ب ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ث ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ا ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
return '  اسرع واحد يرتبها {* '..name..' *} ' 
end
if MsgText[1] == 'معاني' then
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديج','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set(boss..':Set_Name_Meant:'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
return '👁‍🗨¦ اول من يكتب معنى السمايل يفوز { '..name..' }'
end

if MsgText[1] == 'مجوهراتي' then 
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
return '*📮¦ عدد المجوهرات التي ربحتها هي » { '..points..' }\n📬¦ تسطيع بيع مجوهراتك ولحصول على (100) رساله مقابل كل مجوهرات من المجوهرات *\n'
else
return ' *💬¦ ليس لديك مجوهرات ،\n📬¦ للحصول ؏ مجوهرات ،\n📮¦ ارسل الالعاب وابدأ اللعب ! *'
end
end
if MsgText[1] == 'بيع مجوهراتي' then
if MsgText[2] == "0" then
return '📛¦ هناك خطأ عزيزي  \n🔖¦ يجب ان يكون البيع ع الاقل 1 من المجوهرات . 'end
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if tonumber(MsgText[2]) > tonumber(points) then
return '📛| عذرا ليس لديك مجوهرات بهذا العدد لبيعهن' 
end
if points == "0" then
return '📛 ¦ للاسف ليس لديك مجوهرات \n🔖 ¦ للحصول على مجوهرات العب احد الالعاب الموجوده في `قائمه الالعاب`'
else
local Total_Point = MsgText[2] * 100
redis:decrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,MsgText[2])  
redis:incrby(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_,Total_Point)  
return "💰¦ تم خصم {* "..MsgText[2].." *} من مجوهراتك\n📮| تم زياده {* "..Total_Point.."* } من الرسائل \n📑| اصبحت رسائلك { *"..redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_).."* } رساله\n🔖"
end
end
if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
return [[ 
🙋🏻‍♂¦ اهلا بك عزيزي 
🎮¦ اليك الالعاب ک تالي ...

🚸 ≈ الاسرع » تطابق السمايلات
📬 ≈ معاني » لعبه معاني السمايلات
🎭 ≈ ترتيب » لعبه ترتيب الكلمات
🎮 ≈ روليت » لعبه روليت الشهيره 
📛 ≈ حزوره » لعبه الحزوره 
💥 ≈ محيبس » لعبه المحيبس او بات 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
]]
end
if MsgText[1] == 'روليت' then
redis:del(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(boss..':List_Rolet:'..msg.chat_id_)  
redis:setex(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*🎪¦ حسننا لنلعب ,ارسل عدد الاعبين للروليت\n*'
end
if MsgText[1] == 'نعم' and redis:get(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "📛| لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "📛| عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(boss..':User_Points:'..msg.chat_id_..data.id_,2)
end,nil)
redis:del(boss..':List_Rolet:'..msg.chat_id_) 
redis:del(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '✔¦ تم اختيار الشخص الاتي \n🌟¦ صاحب الحظ ( ['..UserName..'] ) \n💰¦  ربحت معنا²مجوهرات \n' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return '*📮¦* لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."•  » [" ..v.."] »\n"  
end 
return Text
end
if MsgText[1] == 'قائمه الالعاب' then
sendMsg(msg.chat_id_,msg.id_,[[
🙋🏻‍♂¦ اهلا بك عزيزي 
🎮¦ اليك الالعاب ک تالي ...

🚸 ≈ الاسرع » تطابق السمايلات
📬 ≈ معاني » لعبه معاني السمايلات
🎭 ≈ ترتيب » لعبه ترتيب الكلمات
🎮 ≈ روليت » لعبه روليت الشهيره 
📛 ≈ حزوره » لعبه الحزوره 
💥 ≈ محيبس » لعبه المحيبس او بات 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
⚖¦ ݪݪـﻤزيد م̷ـــن آݪمعـݪومـآت ݛآسݪنآ
⚖¦ مطور آݪـبوت ↓
⚖¦ م •⊱ ]]..SUDO_USER..[[ ⊰• √]])
end
end
end
end
local function procces(msg)
if msg.text and not redis:get(boss..'lock_geams'..msg.chat_id_) then
if msg.text == redis:get(boss..':Set_Smile:'..msg.chat_id_) then --//  الاسرع
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*\n🎊¦ احسنت اجابتك صحيحه*')end

if msg.text == redis:get(boss..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*\n🎊¦ احسنت اجابتك صحيحه*')end

if msg.text == redis:get(boss..':Set_Arg:'..msg.chat_id_) then -- // الترتيب
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Arg:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*\n🎊¦ احسنت اجابتك صحيحه*')end
if msg.text == redis:get(boss..':Set_Name_Meant:'..msg.chat_id_) then --// المعاني
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Name_Meant:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*\n🎊¦ احسنت اجابتك صحيحه*')end
if redis:get(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999 then
sendMsg(msg.chat_id_,msg.id_,"*📬¦ لا تستطيع اضافة اكثر من 99999999 رساله\n*")   
redis:del(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(boss..'SET:ID:USER'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n📬*¦ روح خالي 😉 تم اضافة له { "..msg.text.." }* رساله")
redis:incrby(boss..'msgs:'..GET_IDUSER..':'..msg.chat_id_,msg.text)  
end
redis:del(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end

if redis:get(boss.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999 then
sendMsg(msg.chat_id_,msg.id_,"*📬¦ لا تستطيع اضافة اكثر من 99999999 نقطه\n*")   
redis:del(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(boss..'SET:ID:USER:NUM'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n📬*¦ طكو طكو عمي 😻 تم اضافة له { "..msg.text.." }* مجوهره")
redis:incrby(boss..':User_Points:'..msg.chat_id_..GET_IDUSER,msg.text)  
end
redis:del(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end


if msg.text:match("^(%d+)$") and redis:get(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*📮¦* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '\n💬¦ تم بدء تسجيل السته\n💱¦ يرجى ارسال المعرفات \n🎊¦ الفائز يحصل على 2 مجوهرات\n🎯¦ عدد الاعبين المطلوب ❪ *'..msg.text..'* ❫\n'
end
redis:del(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_)  
return sendMsg(msg.chat_id_,msg.id_,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and redis:get(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if redis:sismember(boss..':List_Rolet:'..msg.chat_id_,msg.text) then
return sendMsg(msg.chat_id_,msg.id_,'*📮¦* المعرف {['..msg.text..']} موجود اساسا' )
end
redis:sadd(boss..':List_Rolet:'..msg.chat_id_,msg.text)
local CountAdd = redis:get(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = redis:scard(boss..':List_Rolet:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:setex(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
return sendMsg(msg.chat_id_,msg.id_,"📮¦ تم ادخال المعرف  ❪ ["..msg.text.."] ❫\n🔖¦ تم اكمال العدد الكلي\n📛¦ هل انت مستعد  رسل (نعم) للبدء \n")
end 
return sendMsg(msg.chat_id_,msg.id_,"📮¦ تم ادخال المعرف ❪ ["..msg.text.."] ❫\n🔖¦ تبقى *{ "..CountUser.." }* لاعبين ليكتمل العدد\n📑¦ ارسل المعرف التالي\n")
end
end 


if redis:get(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 6 then
sendMsg(msg.chat_id_,msg.id_,"*📬¦ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*\n")   
return false  end 
local GETNUM = redis:get(boss.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*✔¦ العب وخوش تلعب \n✔¦ حصلت على 3 مجوهرات \n*')   
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*📮¦ للاسف لقد خسرت \n📬¦ المحبس بيد رقم ❪ '..GETNUM..' ❫\n💥¦ حاول مره اخرى للعثور على المحيبس\n*')   
end
end
end
if msg.text then  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_}, function(arg,data) 
if redis:get(boss.."chencher"..msg.sender_user_id_) then 
if redis:get(boss.."chencher"..msg.sender_user_id_) ~= data.first_name_ then 
tahan = '['..(redis:get(boss.."chencher"..msg.sender_user_id_) or '')..']'
taham = '['..data.first_name_..']'
local taha ={ 
'\n شكو غيرت اسمك  يا حلو 😹🌚',
'\n شهل اسم الفيطي  '..taham.. ' \n رجعه ؏ قديم \n '..tahan..'',
'\n  ها ها شو غيرت اسمك 🤔😹',
'\n شكو غيرت اسمك شنو قطيت وحده جديده 😹😹🌚',
'\n شو غيرت اسمك شنو تعاركت ويه الحب ؟😹🌞',
'\n ها ولك مو جان  اسمك   '..tahan..' شكو غيرته ',
'\n شكو غيرت اسمك شسالفه ؟؟ 🤔🌞'
}
sendMsg(msg.chat_id_,msg.id_,taha[math.random(#taha)])
end  
end
redis:set(boss.."chencher"..msg.sender_user_id_, data.first_name_) 
end,nil) 
end



end
return {
Boss = {
"^(نعم)$", 
"^(الاعبين)$",  
"^(الالعاب)$", 
"^(محيبس)$", 
"^(حزوره)$", 
"^(بات)$", 
'^(تعطيل) (.+)$',
'^(تفعيل) (.+)$',
"^(اسرع)$",
"^(الاسرع)$",
"^(مجوهراتي)$",
"^(ترتيب)$", 
"^(معاني)$", 
"^(اضف رسائل) (%d+)$",
"^(اضف مجوهرات) (%d+)$",
"^(بيع مجوهراتي) (%d+)$",
"^(روليت)$", 
"^(قائمه الالعاب)$", 
 },
 iBoss = games,
 dBoss = procces,
 }
