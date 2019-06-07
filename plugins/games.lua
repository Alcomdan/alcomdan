--[[
#      ▇▇▇                              ▇▇▇            ▄▇▇▇▇▇▄              ▇▇                                    ▇▇                
#      ▇▇   ▇                        ▇   ▇▇          ▄▇                ▇▄                     ▇▇                  ▇▇
#      ▇▇     ▇ @hlh313   ▇     ▇▇         ▄▇    ▄▄▄    ▇▄                             ▇▇ ▇▇
#      ▇▇        ▇             ▇         ▇▇     ▄▇                            ▇▄                       ▇▇ ▇▇ ┊Dev : @hlh313
#      ▇▇           ▇       ▇            ▇▇   ▄▇ ┊Dev : @hlh_313  ▇▄              ▇▇                 ▇▇
#      ▇▇              ▇▇                ▇▇  ▄▇                                    ▇▄   ▇▇                                  ▇▇┊Source TH3max BY @hlh_313
#---------------------------------------------------------------------
]]
local function games(msg,MsgText)
if msg.type ~= "pv" and msg.GroupActive then

if MsgText[1] == "تفعيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "*️✔┊❪ اهلن عزيزي 🙋🏻‍♂ هذا الامر يخص المطور , المنشى , المدير , الادمن ❫\n*" end
if not MAXBOT:get(max..'lock_geams'..msg.chat_id_) then 
return "*🙋🏻‍♂┊مرحباً عزيزي "..msg.TheRankCmd.."\n✔┊الالعاب بالتأكيد مفعله\n*" 
else 
MAXBOT:del(max..'lock_geams'..msg.chat_id_) 
return "*🙋🏻‍♂┊مرحباً عزيزي "..msg.TheRankCmd.."\n✔┊تم تفعيل الالعاب\n*" 
end 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "*✔┊❪ اهلن عزيزي 🙋🏻‍♂ هذا الامر يخص المطور , المنشى , المدير , الادمن ❫\n*" end
if MAXBOT:get(max..'lock_geams'..msg.chat_id_) then 
return "*🙋🏼‍♂️┊مرحباً عزيزي "..msg.TheRankCmd.." \n📡┊الالعاب بالتأكيد معطله \n*" 
else
MAXBOT:set(max..'lock_geams'..msg.chat_id_,true)  
return "*🙋🏼‍♂️┊مرحباً عزيزي "..msg.TheRankCmd.." \n📡┊تم تعطيل الالعاب \n*" 
end   
end

if MsgText[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "📛*┊* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
local ID_USER = MsgText[2]
MAXBOT:set(max..'SET:ID:USER'..msg.chat_id_,ID_USER)  
MAXBOT:setex(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*📊┊ارسل لي عدد الرسائل الذي تريده*')
end
if MsgText[1] == "اضف مجوهرات" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "📛*┊* هذا الامر يخص {المطور,المنشئ} فقط  \n🚶" end
local ID_USER = MsgText[2]
MAXBOT:set(max..'SET:ID:USER:NUM'..msg.chat_id_,ID_USER)  
MAXBOT:setex(max.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*📊┊ارسل لي عدد المجوهرات الذي تريده*')
end
if not MAXBOT:get(max..'lock_geams'..msg.chat_id_) and msg.GroupActive then


if MsgText[1] == 'محيبس' or MsgText[1] == 'بات' then   
Num = math.random(1,6)
MAXBOT:set(max.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*🙋🏻‍♂┊اهلن عزيزي 
📮┊اليك 6 ايدي اختر رقم لأستخراج البات م̷ـــِْن اليد التي تحمل المحيبس
🎁┊الفائز يحصل على { 3 } من النقاط
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
➀    ➁    ➂    ➃   ➄    ➅ 
↓   ↓   ↓    ↓   ↓   ↓ 
👊‹›👊‹›👊‹›👊‹›👊‹›👊
*
]]
sendMsg(msg.chat_id_,msg.id_,TEST)   
MAXBOT:setex(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end




if MsgText[1] == 'تخمين' then   
Num = math.random(1,10)
redis:set(boss.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*📮┊اهلا بك عزيزي في لعبة التخمين :
ٴ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎

🔖┊سيتم تخمين عدد ما بين الـ ❪1 و 10❫ اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ 
💥
*
]]
sendMsg(msg.chat_id_,msg.id_,TEST)   
redis:setex(boss.."SET:t" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end


if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local NUM = math.random(10,1000)
MAXBOT:set(max..':NUM_SET:'..msg.chat_id_,(NUM * 3))
local Smiles = {'🍏','🍎','🍐',NUM,NUM,NUM,NUM,NUM,'🍊','🍋','🍌','🍉',NUM,NUM,NUM,NUM,NUM,'🍇','🍓','🍈','🍒',NUM,NUM,NUM,NUM,NUM,'??','🍍','🥥','🥝','🍅',NUM,NUM,NUM,NUM,NUM,'🍆','🥑','🥦','🥒',NUM,NUM,NUM,NUM,NUM,'🌶','🌽','🥕','🥔','🍠','🥐','🍞',NUM,NUM,NUM,NUM,NUM,'🥖','🥨','🧀','🥚','🍳','🥞','🥓',NUM,NUM,NUM,NUM,NUM,'🥩','🍗','🍖','🌭','🍔','🍟',NUM,NUM,NUM,NUM,NUM,'🍕','🥪','🥙','🍼','☕️','🍵',NUM,NUM,NUM,NUM,NUM,'🥤','🍶','🍺','🍻',NUM,NUM,NUM,NUM,NUM,'🏀','⚽️','🏈','⚾️','🎾','🏐',NUM,NUM,NUM,NUM,NUM,'🏉','🎱','🏓','🏸','🥅','🎰','🎮',NUM,NUM,NUM,NUM,NUM,'🎳','🎯','🎲','🎻','🎸','🎺','🥁','??',NUM,NUM,NUM,NUM,NUM,'🎼','🎧','🎤','🎬','🎨','🎭',NUM,NUM,NUM,NUM,NUM,'🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌',NUM,NUM,NUM,NUM,NUM,'🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌',NUM,NUM,NUM,NUM,NUM,'📍','📓','📗','📂','📅','📪','📫','📬',NUM,NUM,NUM,NUM,NUM,'📭','⏰','📺','🎚','☎️',NUM,NUM,NUM,NUM,NUM,'📡'}
Emoji = Smiles[math.random(#Smiles)]
MAXBOT:set(max..':Set_Smile:'..msg.chat_id_,Emoji)
if tonumber(MAXBOT:get(max..':Set_Smile:'..msg.chat_id_)) == tonumber(MAXBOT:get(max..':NUM_SET:'..msg.chat_id_)) then
return '👁‍🗨┇اول من يكتب هذه العدد يفوز ؛  ››`'..(MAXBOT:get(max..':Set_Smile:'..msg.chat_id_))..'`'
else
return '️👁‍🗨┇اول من يكتب هذه السمايل يفوز ››    `'..(MAXBOT:get(max..':Set_Smile:'..msg.chat_id_))..'`'
end
end
if MsgText[1] == 'ترتيب' then
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
MAXBOT:set(max..':Set_Arg:'..msg.chat_id_,name)
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
MAXBOT:set(max..':Set_Name_Meant:'..msg.chat_id_,name)
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
return '👁‍🗨┊اول من يكتب معنى السمايل يفوز { '..name..' }'
end

if MsgText[1] == 'مجوهراتي' then 
local points = MAXBOT:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
return '*📮┊عدد المجوهرات التي ربحتها هي » { '..points..' }\n📬┊تسطيع بيع مجوهراتك ولحصول على (100) رساله مقابل كل مجوهرات من المجوهرات *\n'
else
return ' *💬┊ليس لديك مجوهرات ،\n📬┊للحصول ؏ مجوهرات ،\n📮┊ارسل الالعاب وابدأ اللعب ! *'
end
end
if MsgText[1] == 'بيع مجوهراتي' then
if MsgText[2] == "0" then
return '📛┊هناك خطأ عزيزي  \n🔖┊يجب ان يكون البيع ع الاقل 1 من المجوهرات . 'end
local points = MAXBOT:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if tonumber(MsgText[2]) > tonumber(points) then
return '📛| عذرا ليس لديك مجوهرات بهذا العدد لبيعهن' 
end
if points == "0" then
return '📛 ┊للاسف ليس لديك مجوهرات \n🔖 ┊للحصول على مجوهرات العب احد الالعاب الموجوده في `قائمه الالعاب`'
else
local Total_Point = MsgText[2] * 100
MAXBOT:decrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,MsgText[2])  
MAXBOT:incrby(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_,Total_Point)  
return "💰┊تم خصم {* "..MsgText[2].." *} من مجوهراتك\n📮| تم زياده {* "..Total_Point.."* } من الرسائل \n📑| اصبحت رسائلك { *"..MAXBOT:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_).."* } رساله\n🔖"
end
end
if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
return [[ 
🙋🏻‍♂┊اهلا بك عزيزي 
🎮┊اليك الالعاب ک تالي ...

🚸 ≈ الاسرع » تطابق السمايلات
📬 ≈ معاني » لعبه معاني السمايلات
🎭 ≈ ترتيب » لعبه ترتيب الكلمات
🎮 ≈ روليت » لعبه روليت الشهيره 
📛 ≈ تخمين » لعبه تخمين الارقام 
💥 ≈ محيبس » لعبه المحيبس او بات 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
]]
end
if MsgText[1] == 'روليت' then
MAXBOT:del(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
MAXBOT:del(max..':List_Rolet:'..msg.chat_id_)  
MAXBOT:setex(max..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*🎪┊حسننا لنلعب ,ارسل عدد الاعبين للروليت\n*'
end
if MsgText[1] == 'نعم' and MAXBOT:get(max..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = MAXBOT:smembers(max..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "📛| لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "📛| عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
MAXBOT:incrby(max..':User_Points:'..msg.chat_id_..data.id_,2)
end,nil)
MAXBOT:del(max..':List_Rolet:'..msg.chat_id_) 
MAXBOT:del(max..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '✔┊تم اختيار الشخص الاتي \n🌟┊صاحب الحظ ( ['..UserName..'] ) \n💰┊ ربحت معنا²مجوهرات \n' 
end
if MsgText[1] == 'الاعبين' then
local list = MAXBOT:smembers(max..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return '*📮┊* لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."•  » [" ..v.."] »\n"  
end 
return Text
end
if MsgText[1] == 'قائمه الالعاب' then
sendMsg(msg.chat_id_,msg.id_,[[
🙋🏻‍♂┊اهلا بك عزيزي 
🎮┊اليك الالعاب ک تالي ...

🚸 ≈ الاسرع » تطابق السمايلات
📬 ≈ معاني » لعبه معاني السمايلات
🎭 ≈ ترتيب » لعبه ترتيب الكلمات
🎮 ≈ روليت » لعبه روليت الشهيره 
📛 ≈ تخمين » لعبه تخمين الارقام 
💥 ≈ محيبس » لعبه المحيبس او بات 
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
⚖┊ݪݪـﻤزيد م̷ـــن آݪمعـݪومـآت ݛآسݪنآ
⚖┊مطور آݪـبوت ↓
⚖┊م •⊱ ]]..SUDO_USER..[[ ⊰• √]])
end
end
end
end
local function procces(msg)
if msg.text and not MAXBOT:get(max..'lock_geams'..msg.chat_id_) then
if msg.text == MAXBOT:get(max..':Set_Smile:'..msg.chat_id_) then --//  الاسرع
MAXBOT:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
MAXBOT:del(max..':Set_Smile:'..msg.chat_id_)
goker_sendMsg(msg.chat_id_,msg.id_,'*\n🎊┊احسنت اجابتك صحيحه*')end

if msg.text == MAXBOT:get(max..':Set_Arg:'..msg.chat_id_) then -- // الترتيب
MAXBOT:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
MAXBOT:del(max..':Set_Arg:'..msg.chat_id_)
goker_sendMsg(msg.chat_id_,msg.id_,'*\n🎊┊احسنت اجابتك صحيحه*')end

if msg.text == MAXBOT:get(max..':Set_Name_Meant:'..msg.chat_id_) then --// المعاني
MAXBOT:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
MAXBOT:del(max..':Set_Name_Meant:'..msg.chat_id_)
goker_sendMsg(msg.chat_id_,msg.id_,'*\n🎊┊احسنت اجابتك صحيحه*')end

if MAXBOT:get(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999 then
sendMsg(msg.chat_id_,msg.id_,"*📬┊لا تستطيع اضافة اكثر من 99999999 رساله\n*")   
MAXBOT:del(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = MAXBOT:get(max..'SET:ID:USER'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n📬*┊روح خالي 😉 تم اضافة له { "..msg.text.." }* رساله")
MAXBOT:incrby(max..'msgs:'..GET_IDUSER..':'..msg.chat_id_,msg.text)  
end
MAXBOT:del(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end

if MAXBOT:get(max.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999 then
sendMsg(msg.chat_id_,msg.id_,"*📬┊لا تستطيع اضافة اكثر من 99999999 نقطه\n*")   
MAXBOT:del(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = MAXBOT:get(max..'SET:ID:USER:NUM'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n📬*┊طكو طكو عمي 😻 تم اضافة له { "..msg.text.." }* مجوهره")
MAXBOT:incrby(max..':User_Points:'..msg.chat_id_..GET_IDUSER,msg.text)  
end
MAXBOT:del(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end


if msg.text:match("^(%d+)$") and MAXBOT:get(max..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*📮┊* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
MAXBOT:set(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '\n💬┊تم بدء تسجيل السته\n💱┊يرجى ارسال المعرفات \n🎊┊الفائز يحصل على 2 مجوهرات\n🎯┊عدد الاعبين المطلوب ❪ *'..msg.text..'* ❫\n'
end
MAXBOT:del(max..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_)  
goker_sendMsg(msg.chat_id_,msg.id_,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and MAXBOT:get(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if MAXBOT:sismember(max..':List_Rolet:'..msg.chat_id_,msg.text) then
goker_sendMsg(msg.chat_id_,msg.id_,'*📮┊* المعرف {['..msg.text..']} موجود اساسا' )
end
MAXBOT:sadd(max..':List_Rolet:'..msg.chat_id_,msg.text)
local CountAdd = MAXBOT:get(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = MAXBOT:scard(max..':List_Rolet:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
MAXBOT:del(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
MAXBOT:setex(max..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
goker_sendMsg(msg.chat_id_,msg.id_,"📮┊تم ادخال المعرف  ❪ ["..msg.text.."] ❫\n🔖┊تم اكمال العدد الكلي\n📛┊هل انت مستعد  رسل (نعم) للبدء \n")
end 
goker_sendMsg(msg.chat_id_,msg.id_,"📮┊تم ادخال المعرف ❪ ["..msg.text.."] ❫\n🔖┊تبقى *{ "..CountUser.." }* لاعبين ليكتمل العدد\n📑┊ارسل المعرف التالي\n")
end
end 


if MAXBOT:get(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 6 then
sendMsg(msg.chat_id_,msg.id_,"*📬┊عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*\n")   
return false  end 
local GETNUM = MAXBOT:get(max.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
MAXBOT:del(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*✔┊العب وخوش تلعب \n✔┊حصلت على 3 مجوهرات \n*')   
MAXBOT:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
MAXBOT:del(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*📮┊للاسف لقد خسرت \n📬┊المحبس بيد رقم ❪ '..GETNUM..' ❫\n💥┊حاول مره اخرى للعثور على المحيبس\n*')   


if redis:get(boss.."SET:t" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 10 then
sendMsg(msg.chat_id_,msg.id_,"*📬┊عذرا لا يوجد سواء { 10 } اختيارات فقط ارسل اختيارك مره اخره*\n")   
return false  end 
local GETNUM = redis:get(boss.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(boss.."SET:t" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*💭┊العب وخوش تلعب \n💭┊❪حصلت على 3 مجوهرات\n*')   
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del(boss.."SET:t" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*❌┊اوبس تخمينك غلط \n✔️┊الاجابه هيه ❴ '..GETNUM..' ❵\n*')   
end
end
end
if msg.text then  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_}, function(arg,data) 
if MAXBOT:get(max.."chencher"..msg.sender_user_id_) then 
if MAXBOT:get(max.."chencher"..msg.sender_user_id_) ~= data.first_name_ then 
tahan = '['..(MAXBOT:get(max.."chencher"..msg.sender_user_id_) or '')..']'
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
MAXBOT:set(max.."chencher"..msg.sender_user_id_, data.first_name_) 
end,nil) 
end



end
return {
max = {
"^(نعم)$", 
"^(الاعبين)$",  
"^(الالعاب)$", 
"^(محيبس)$", 
"^(تخمين)$", 
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
 imax = games,
 dmax = procces,
 }
