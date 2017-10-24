# Script para criação de logins sequenciais no AD. 
Import-Module ActiveDirectory
for($i=10
     $i -le 169
     $i++){
$pass='@'+'pa'+$i+'a'
$login='pa'+$i+'a'	 
New-ADUser -SamAccountName $login -GivenName $login -DisplayName $login -Path 'OU=Operador1,OU=Ativo,OU=Call Center,DC=neospbrf,DC=alliar' -CannotChangePassword $true -passwordNeverExpires $true -UserPrincipalName $login@neospbrf.alliar -name $login -enabled $true -accountpassword (Convertto-securestring -asplaintext $pass -force)
}
