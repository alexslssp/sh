'Reseta senha de logins do AD utilizando uma lista.
'On error resume next
Const FOR_READING = 1
Const FOR_APPENDING = 8

'---- Abrindo Arquivo de Origem de usuários ----
Fileread = "c:\vbs\Reset_Senha\users.txt"
Set objFSr = CreateObject("Scripting.FileSystemObject")
Set objTSr = objFSr.OpenTextFile(Fileread, FOR_READING)

'----- Abrindo Arquivo de Gravação de Status de Reset ----
FileWrite = "c:\vbs\Reset_Senha\reset2.txt"
Set objFSW = CreateObject("Scripting.FileSystemObject")
Set objTSW = objFSW.OpenTextFile(FileWrite,FOR_APPENDING)

userdomain = "neospbrf.alliar"


Do While Not (objTSR.atEndOfStream)

username = objTSR.Readline
'wscript.echo username
'username = inputbox("Digite o usuário")
newpass = username

select case username

case "fim"
	wscript.quit
case else

Set ObjUser = GetObject("WinNT://neospbrf.alliar/"& UserName,User)


Achei = ObjUser.Name

If  Achei <> " " then
		ObjUser.SetPassword "@" & username
		On Error GoTo 0
	        'objUser.AccountDisabled = False
	        'objUser.Put "PasswordExpired", 1
	        On Error Resume Next
	        objUser.SetInfo
		If err.number = 0 Then
		    'Wscript.Echo "Senha Alterada com sucesso"
		    objTSW.Write "Alterada senha com sucesso de "&UserName
                    objTSW.writeline
		Else
		    objTSW.Write "Erro no reset do usuário "&UserName
                    objTSW.writeline
		End if
else
	'wscript.echo "Usuário Não encontrado"
	objTSW.Write "Não foi encontrado o usuário "&Username
	objTSW.writeline
end if

achei = " "
set objuser = nothing
end select

loop

Wscript.echo "Fim"
