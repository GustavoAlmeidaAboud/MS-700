# Powershell commandes pour gérer Microsoft Teams ainsi que des groupes Microsoft 365

# Comment créer un Groupe Microsoft 365 + une Team.
Install-module -name MicrosoftTeams
Connect-MicrosoftTeams
New-Team -DisplayName "Test Team" -MailNickname  "TestTeam" -Visibility "private"
New-Team -DisplayName "Test Team" -MailNickname  "TestTeam" -Visibility "public"

# Comment créer un Groupe Microsoft 365.
Install-module -name Exchangeonlinemanagement
Connect-ExchangeOnline
New-UnifiedGroup -DisplayName "Engineering Department" -Alias "engineering" -AcessType "Private"
New-UnifiedGroup -DisplayName "Engineering Department" -Alias "engineering" -AcessType "Public"

# Ajouter un utilisateur A un groupe Microsoft 365
Install-module -name MicrosoftTeams
Connect-MicrosoftTeams
Add-Teamuser -Groupid "groupid" -User "bob@contoso.com" -Role Owner
Add-Teamuser -Groupid "groupid" -User "bob@contoso.com" -Role Member

# Enlever un utilisateur d'un groupe Microsoft 365
Install-module -name MicrosoftTeams
Connect-MicrosoftTeams
Remove-teamuser -groupid "Groupid" -User "bob@contoso.com"

# Enlever le droit d'un propriétaire d'un groupe d'inviter des personnes externes.
install-module -name "Azuread" -scope CurrentUser
connect-azuread
$Setting = Get-AzureADObjectSetting -TargetObjectId a74f595b-d21b-47e4-9604-6b7182e03e76 -TargetType Groups
$Setting["AllowToAddGuests"] = $false

# Set-Csteamschannelpolicy

Set-csteamschannelPolicy -Identity $groupidentity -AllowPrivateChannelcreation $false