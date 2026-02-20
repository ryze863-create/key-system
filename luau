local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ryze863-create/ui-library/refs/heads/main/luau"))()
local Window = Library:Window({
Title = 'Astryx ・ Key System',
Desc = 'discord.gg/astryx',
Icon = 93727374257490,
Theme = 'Midnight',
Config = {
Keybind = Enum.KeyCode.T,
Size = UDim2.new(0, 500, 0, 400),
},
CloseUIButton = {
Enabled = true,
Text = 'close',
},
})
local tab1 = Window:Tab({ Title = 'Get Key', Icon = 97442082616064 })
local tab2 = Window:Tab({ Title = 'Redeem', Icon = 79647974941236 })
tab1:Section({ Title = 'Get Key' })
tab2:Section({ Title = 'Enter Key' })
tab1:Code({
Title = 'Get Key',
Code = "rekonise.com/astryx-hub-key-system-c4dsz",
})
tab1:Button({
Title = 'Copy Key Link',
Desc = 'Copies the Rekonise link',
Callback = function()
setclipboard('https://rekonise.com/astryx-hub-key-system-c4dsz')
Window:Notify({
Title = 'Copied',
Desc = 'Invite link copied to clipboard',
Time = 4,
})
end,
})
local key = ''
tab2:Textbox({
Title = 'Key',
Desc = 'Enter your key',
Placeholder = '',
Value = '',
ClearTextOnFocus = false,
Callback = function(Text)
key = tostring(Text or ''):gsub('%s+', '')
end,
})
tab2:Button({
Title = 'Activate',
Desc = 'Check key',
Callback = function()
if #key == 0 then
Window:Notify({ Title = 'Error', Desc = 'Invalid key', Time = 3 })
return
end
local valid_key = game:HttpGet("https://raw.githubusercontent.com/hadezinzx/key-generate/refs/heads/main/luau"):gsub('%s+', '')
if key == valid_key then
game:GetService('StarterGui'):SetCore('SendNotification', {
Title = 'Success',
Text = 'Key valid',
Duration = 5,
})
game:GetService('CoreGui')['Astryx']:Destroy()
else
Window:Notify({
Title = 'Error',
Desc = 'Incorrect key',
Time = 5,
})
end
end,
})
