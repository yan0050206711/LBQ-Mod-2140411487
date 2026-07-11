local tbMerchantTime = GameMain:GetMod("MerchantTime");--先注册一个新的MOD模块
local MerchantTime = nil;
function tbMerchantTime:OnBeforeInit()
    if MerchantTime == nil then
        local mod = CS.ModsMgr.Instance:FindMod("MerchantTime","",true);
        local assembly = CS.System.Reflection.Assembly.LoadFrom(mod.Path.."\\Scripts\\MerchantTime.dll");
        local type = assembly:GetType("MerchantTime.Main");
        MerchantTime = CS.System.Activator.CreateInstance(type);
    end
end

function tbMerchantTime:OnSetHotKey()
	local KeyInfo = { {ID = "MerchantTimeKey" , Name = XT("行商时间") , Type = "Mod", InitialKey1 = "LeftControl+P" , InitialKey2 = "" } };
	return KeyInfo;
end

function tbMerchantTime:OnHotKey(ID,state) 
	if ID == "MerchantTimeKey" and state == "down" then 
		MerchantTime:Show();
    end	   	
end

function tbMerchantTime:OnEnter()
    if MerchantTime ~= nil then
        MerchantTime:Enter();
    end
end

function tbMerchantTime:OnStep()
    if MerchantTime ~= nil then
        MerchantTime:Step()
    end
end

function tbMerchantTime:OnSave()--系统会将返回的table存档 table应该是纯粹的KV
    if MerchantTime ~= nil then
        return MerchantTime:Save();
    end
end

function tbMerchantTime:OnLoad(tbLoad)--读档时会将存档的table回调到这里
    if MerchantTime ~= nil then
        MerchantTime:Load(tbLoad)
    end
end