--[[
Have Fun!

Visit Deathsoft.com
    
Greez H3llf!re
]]--
        
function TheSpammerMenuToggle()
if ( TheSpammer:IsVisible() ) then
			HideUIPanel(TheSpammer);
		else
			ShowUIPanel(TheSpammer);
		end
end    
SlashCmdList["THESPAMMERMENUT"] = TheSpammerMenuToggle;
SLASH_THESPAMMERMENUT1 = "/Spam";
SLASH_THESPAMMERMENUT2 = "/Spammer";
SLASH_THESPAMMERMENUT3 = "/TheSpammer";
SLASH_THESPAMMERMENUT4 = "/ts";



function Spartaftw()
PlaySoundFile("Interface\\AddOns\\TheSpammer\\This is Sparta.mp3")
end

AutospammerON=0
function timerbot_callback()
if AutospammerON==1 then
    autospamwithtime_callback()
end
end


function AutomsgspammerON()
if AutospammerON==0 then
AutospammerON=1
ChatFrame1:AddMessage("|cffFF4500The |cff404040Spammer|r:\124cffFF4500 is now running")
else 
ChatFrame1:AddMessage("|cffFF4500The |cff404040Spammer|r:\124cffFF4500 is still running")    
end
end

function AutomsgspammerOFF()
if AutospammerON==1 then
AutospammerON=0
ChatFrame1:AddMessage("|cffFF4500The |cff404040Spammer|r:\124cffFF4500 is now stopped")
autospamwithtimestop();
end
end

    
function autospamwithtimestop()
rrecounter = 0
end
    

timestampautospam = time();
rrecounter = 0
function autospamwithtime_callback()
autospamtext = spamtext:GetText();
autopamwaittime = spamwaittime:GetNumber();
autospamrecurrences = spamrecurrences:GetNumber();
autospamchannel = spamchannel:GetNumber();
autowhisperspam = whisperspam:GetText();
currentautospam_time = time();

if autospamrecurrences==0 then 
 autospamrecurrences = 999999999999999   
end

if (currentautospam_time - timestampautospam > (autopamwaittime)) and (autospamrecurrences > (rrecounter)) then
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
    UIErrorsFrame:AddMessage("|cffFF4500The |cff404040Spammer|r:\124cffFF4500 You must enter some text!")
    timestampautospam = currentautospam_time;
    
    elseif (autospamchannel>0) and not (autowhisperspam=="") then
    UIErrorsFrame:AddMessage("|cffFF4500The |cff404040Spammer|r:\124cffFF4500 You must choose between Channel and Whisper!")
    timestampautospam = currentautospam_time;
    
    elseif (autospamchannel=="") and (autowhisperspam=="") then
    UIErrorsFrame:AddMessage("|cffFF4500The |cff404040Spammer|r:\124cffFF4500 You must choose between Channel and Whisper!")
    timestampautospam = currentautospam_time;
    end
end
end
    
function autospamwithtimestop()
rrecounter = 0
end
    
 