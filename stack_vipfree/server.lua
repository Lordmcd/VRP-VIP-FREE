local Proxy = module('vrp', 'lib/Proxy')
local vRP = Proxy.getInterface('vRP')


RegisterCommand('vipfree', function(source)
    local user_id = vRP.getUserId(source)
    if parseInt(vRP.getUData(user_id, 'vipfree')) == 0 then 
        vRP.giveBankMoney(user_id, 50000)
        vRP.giveInventoryItem(user_id,'celular',1)
        vRP.giveInventoryItem(user_id,'mochila',3)
        vRP.giveInventoryItem(user_id,'repairkit',3)
        vRP.giveInventoryItem(user_id,'agua',3)
        vRP.giveInventoryItem(user_id,'chips',3)
        vRP.execute("creative/add_vehicle",{ user_id =  user_id, vehicle = 'akuma', ipva = parseInt(os.time()) })
        vRP.setUData(user_id, 'vipfree', 1)
        TriggerClientEvent("Notify",source,"sucesso","Voce Resgatou seu Vip Gratis!")
    else 
        TriggerClientEvent("Notify",source,"aviso","Voce já Resgatou seu Vip Gratis!")
    end
end)





