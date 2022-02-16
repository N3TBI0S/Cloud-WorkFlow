#SingleInstance Force
#NoTrayIcon

;---------------------------------------------------------------------
;Right Networks: Cloud Workflow
;---------------------------------------------------------------------

;---------------------------------------------------------------------
;Right Networks: Cloud Service Technican Chat Responses
;---------------------------------------------------------------------

Gui, Add, Text, x12 y19 w110 h20 +Center, Chat Responses
Gui, Add, Text, x12 y150 w110 h20 +Center, Miscellaneous Tasks
Gui, Add, Text, left x12 y49 w60 h15 +Center, Introduction
Gui, Add, Button, x110 y49 w40 h20 gChatIntro, Select
Gui, Add, Text, left x12 y75 w60 h15 +Center, Outro
Gui, Add, Button, x110 y75 w40 h20 gChatOutro +Center, Select
Gui, Add, Text, left x12 y100 w60 h15 +Center, Research
Gui, Add, Button, x110 y100 w40 h20 , Select
Gui, Add, Text, left x12 y125 w60 h15 +Center, Update
Gui, Add, Button, x110 y125 w40 h20 , Select
Gui, Add, Text, left x12 y165 w80 h15 +Center, Google Search
Gui, Add, Button, x110 y165 w58 h20 gGoogleSearch, Reminder
Gui, Add, Text, left x12 y190 w126 h15 +Center, Confluence Search
Gui, Add, Button, x110 y190 w58 h20 gConfluence, Reminder


;---------------------------------------------------------------------
;Right Networks: Cloud Service Technican Ticket Responses
;---------------------------------------------------------------------

Gui, Add, Text, x182 y19 w110 h20 +Center, Ticket Responses
Gui, Add, Text, x182 y49 w60 h15 , Introduction
Gui, Add, Button, x252 y49 w40 h20 , Select
Gui, Add, Text, x182 y99 w60 h15 , Outro
Gui, Add, Button, x252 y99 w40 h20 , Select
Gui, Add, Text, x182 y199 w60 h15 , Research
Gui, Add, Button, x252 y199 w40 h20 , Select
Gui, Add, Text, x182 y149 w60 h15 , Update
Gui, Add, Button, x252 y149 w40 h20 , Select

;---------------------------------------------------------------------
;Right Networks: Cloud Service Technican Email Responses
;---------------------------------------------------------------------

Gui, Add, Text, x352 y19 w110 h20 +Center, Email Responses
Gui, Add, Text, x352 y199 w60 h15 , Voicemail
Gui, Add, Button, x422 y199 w40 h20 gVoicemail , Select
Gui, Add, Text, x352 y149 w70 h15 , No Response
Gui, Add, Button, x422 y149 w40 h20 , Select
Gui, Add, Text, x352 y99 w60 h15 , Response
Gui, Add, Button, x422 y99 w40 h20 , Select
Gui, Add, Text, x352 y49 w60 h15 , Update
Gui, Add, Button, x422 y49 w40 h20 , Select

;---------------------------------------------------------------------
;Right Networks: Cloud Service Technican Responses Version
;---------------------------------------------------------------------

Gui, Font, W700
Gui, Add, Text, x100 y255 w300 h15 +Center, **Confirmation Messages Timeout After 2 Seconds**
Gui, Add, Text, x152 y279 w250 h15 , Created By: Michael Alestock CST1
Gui, Add, Text, x200 y294 w115 h15 +Center, Version: 0.1.5
Gui, Show, w479 h317, Cloud Workflow
return

;---------------------------------------------------------------------
;Right Networks: Cloud Service Technican Scripts
;---------------------------------------------------------------------

Voicemail:
{
InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
clipboard := UserInput ",`n`nI reached out via phone and left a message.`n`nPlease give us a call at 866-923-6874 at your earliest convenience and we’d be happy to assist you. You are welcome to ask for me by name and reference your ticket number.`n`nBest regards,`nMichael Alestock"
ClipWait  ; Wait for the clipboard to contain text.
MsgBox, 1, ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
SoundBeep, 1000
return
}

ChatIntro:
{
InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
clipboard := "Hi " UserInput ", my name is Michael. I am here to help you today. `n`nPlease give me a moment to pull up your account information."  
ClipWait  ; Wait for the clipboard to contain text.
MsgBox, 1, ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
SoundBeep, 1000
return
}

ChatOutro:
{
clipboard := "It was a pleasure working with you today. `n`nFeel free to close the chat when you are ready."  ; Start off empty to allow ClipWait to detect when the text has arrived.
ClipWait  ; Wait for the clipboard to contain text.
MsgBox, 1, ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
return
}

Confluence:
{
MsgBox, 1, ,Use the HotKey combination CTRL + K to search Confluence from your clipboard
return
}

GoogleSearch:
{
MsgBox, 1, ,Use the HotKey combination CTRL + G to search Google from your clipboard
return
}

Google:
^g::
{
	googleLinkStart = C:\Program Files\Google\Chrome\Application\chrome.exe http://www.google.com/search?sourceid=navclient&ie=UTF-8&oe=UTF-8&q=
	AutoTrim, On
	searchTerm = %clipboard%
	if searchTerm =
	{
		MsgBox, 48, Search Google, No text in clipboard to google., 5
		return
	}
	StringReplace, searchTerm, searchTerm, `r`n, +, all
	StringReplace, searchTerm, searchTerm, %A_SPACE%, +, all
	searchTerm = %googleLinkStart%%searchTerm% 
	Run, %searchTerm%
	return
}

ConfluenceSearch:
^k::
{
	googleLinkStart = C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe https://rightnetworks.atlassian.net/wiki/search?text=
	AutoTrim, On
	searchTerm = %clipboard%
	if searchTerm =
	{
		MsgBox, 48, Search Google, No text in clipboard to google., 5
		return
	}
	StringReplace, searchTerm, searchTerm, `r`n, +, all
	StringReplace, searchTerm, searchTerm, %A_SPACE%, +, all
	searchTerm = %googleLinkStart%%searchTerm% 
	Run, %searchTerm%
	return
}
GuiClose:
ExitApp