--Made by H3llf!re (Deathsoft.com)
--Code reviewed, refactored and completed by Manik (Sirus.su)

mesDB = {}  

function init_DropDownMenu()

    if #mesDB < 1 then print("|cffFF4500The Spammer:|r Сообщений в базе не найдено") else
        for i = 1, #mesDB do
            mesDB[i].func = onSelect_DropDownMenu 
            UIDropDownMenu_AddButton(mesDB[i])
        end
    end
end

function saveToDB(temp)

    local mesDB_info = UIDropDownMenu_CreateInfo();
    
    match = false
    for i=1, #mesDB do
        if temp == mesDB[i].value then 
            match = true 
            break
        end
    end

    if not match and temp ~= "" then 
        mesDB_info = {text=temp, value = temp, notCheckable = 1}
        tinsert(mesDB, mesDB_info)
        print("|cffFF4500The Spammer:|r Запись сохранена") 
    else 
        print("|cffFF4500The Spammer:|r Запись уже существует")    
    end
end

function onSelect_DropDownMenu(self)

    if spamtext1:HasFocus() then spamtext1:SetText(self.value) end
    if spamtext2:HasFocus() then spamtext2:SetText(self.value) end 
    if spamtext3:HasFocus() then spamtext3:SetText(self.value) end
end
        
function TheSpammerMenuToggle()

    if ( TheSpammer:IsVisible() ) then
	    	HideUIPanel(TheSpammer)
		else
			ShowUIPanel(TheSpammer)
    end
end

SlashCmdList["THESPAMMERMENUT"] = TheSpammerMenuToggle;
SLASH_THESPAMMERMENUT1 = "/Spam";
SLASH_THESPAMMERMENUT2 = "/Spammer";
SLASH_THESPAMMERMENUT3 = "/TheSpammer";
SLASH_THESPAMMERMENUT4 = "/ts";

AutospammerON=0

function timerbot_callback()

    if AutospammerON==1 then
        autospamwithtime_callback()
    end
end

function AutomsgspammerON()

    if AutospammerON==0 then
        AutospammerON=1
        ChatFrame1:AddMessage("|cffFF4500The Spammer:|r Запущен!")
    else 
        ChatFrame1:AddMessage("|cffFF4500The Spammer:|r Работа выполняется")    
    end
end

function AutomsgspammerOFF()

    if AutospammerON==1 then
        AutospammerON=0
        ChatFrame1:AddMessage("|cffFF4500The Spammer:|r Остановлен")
        autospamwithtimestop();
    end
end

    
function autospamwithtimestop()

    rrecounter = 0
end
    
function lfgMessage (name)

    for i=1, 10 do id, chName = GetChannelName(i) 
        if (chName == name) then 
            autospamchannel = id; break
        end 
    end
end

function logicFunc(autospamchannel, autowhisperspam, autospamtext, rrecounter)

    if (autospamchannel>0) and (autowhisperspam=="") and not (autospamtext=="") then 
        SendChatMessage(""..autospamtext.."", "CHANNEL", GetDefaultLanguage("Player"), ""..autospamchannel.."");
        timestampautospam = currentautospam_time;
        rrecounter = rrecounter+1
            
    elseif (autospamchannel==0) and (autowhisperspam=="") and not (autospamtext=="") then
        SendChatMessage(""..autospamtext.."");         
        timestampautospam = currentautospam_time;
        rrecounter = rrecounter+1
            
    elseif  not (autowhisperspam=="") and not (autospamchannel>0) and not (autospamtext=="") then
        SendChatMessage(""..autospamtext.."", "WHISPER", ""..GetDefaultLanguage("Player").."", ""..autowhisperspam.."");
        timestampautospam = currentautospam_time;
        rrecounter = rrecounter+1

        --Error messages:    
    elseif (autospamtext=="") then
        UIErrorsFrame:AddMessage("|cffFF4500The Spammer:|r You must enter some text!")
        timestampautospam = currentautospam_time;
    
    elseif (autospamchannel>0) and not (autowhisperspam=="") then
        UIErrorsFrame:AddMessage("|cffFF4500The Spammer:|r Отправить сообщение в выбранный канал ИЛИ отправить личное сообщение")
        timestampautospam = currentautospam_time;
    
    elseif (autospamchannel=="") and (autowhisperspam=="") then
        UIErrorsFrame:AddMessage("|cffFF4500The Spammer:|r You must choose between Channel and Whisper!")
        timestampautospam = currentautospam_time;
    end
end

timestampautospam = time();
rrecounter = 0

function autospamwithtime_callback()

    autospamtext_1 = spamtext1:GetText();
    autospamtext_2 = spamtext2:GetText();
    autospamtext_3 = spamtext3:GetText();
    spamcheck_1 = spamcheck1:GetChecked();
    spamcheck_2 = spamcheck2:GetChecked();
    spamcheck_3 = spamcheck3:GetChecked();
    lfg = lfgSpam:GetChecked();
    autopamwaittime = spamwaittime:GetNumber();
    autospamrecurrences = spamrecurrences:GetNumber();
    autospamchannel = spamchannel:GetNumber();
    autowhisperspam = whisperspam:GetText();
    currentautospam_time = time();

    if autospamrecurrences==0 then 
        autospamrecurrences = 999999999999999   
    end

    if (currentautospam_time - timestampautospam > (autopamwaittime)) and (autospamrecurrences > (rrecounter)) then
        
        if (lfg) then
            lfgMessage("Поиск спутников")
        end
        
        if (spamcheck_1) then
            logicFunc(autospamchannel, autowhisperspam, autospamtext_1, rrecounter) end
        if (spamcheck_2) then
            logicFunc(autospamchannel, autowhisperspam, autospamtext_2, rrecounter) end
        if (spamcheck_3) then
            logicFunc(autospamchannel, autowhisperspam, autospamtext_3, rrecounter) 
        end
    end
end

function autospamwithtimestop()

    rrecounter = 0
end
