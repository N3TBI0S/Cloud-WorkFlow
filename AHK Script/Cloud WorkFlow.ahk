;---------------------------------------------------------------------
;Cloud WorkFlow
;---------------------------------------------------------------------


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
#NoTrayIcon

;---------------------------------------------------------------------
;Cloud WorkFlow Chat Responses
;---------------------------------------------------------------------

Gui, Add, Text, x12 y19 w110 h20 +Center, Chat Responses

Gui, Add, Text, left x12 y49 w60 h15 +Center, Hi There
Gui, Add, Button, x110 y49 w40 h20 gChatIntro, Select

Gui, Add, Text, left x12 y75 w100 h15 +Center, Have a Good Day
Gui, Add, Button, x110 y75 w40 h20 gChatOutro +Center, Select

Gui, Add, Text, left x12 y100 w60 h15 +Center, Researching
Gui, Add, Button, x110 y100 w40 h20 gChatResearch, Select

Gui, Add, Text, left x12 y125 w100 h15 +Center, Research Update
Gui, Add, Button, x110 y125 w40 h20 gChatUpdate, Select


;---------------------------------------------------------------------
;Cloud WorkFlow Ticket Responses
;---------------------------------------------------------------------

Gui, Add, Text, x182 y19 w110 h20 +Center, Ticket Responses

Gui, Add, Text, x182 y49 w60 h15 , Resolved
Gui, Add, Button, x270 y49 w40 h20 gTicketResolved , Select

Gui, Add, Text, x182 y75 w85 h15 , No Response
Gui, Add, Button, x270 y75 w40 h20 gTicketNoResponse, Select

Gui, Add, Text, x182 y100 w100 h15 , Left Voicemail
Gui, Add, Button, x270 y100 w40 h20 gTicketVoicemail, Select

Gui, Add, Text, x182 y125 w100 h15 , Client Unverified
Gui, Add, Button, x270 y125 w40 h20 gTicketUnverifiable, Select

Gui, Add, Text, x182 y150 w100 h15 , Mystery Resolved
Gui, Add, Button, x270 y150 w40 h20 gTicketUnverifiable, Select

;---------------------------------------------------------------------
;Cloud WorkFlow - Miscellaneous Tasks
;---------------------------------------------------------------------

Gui, Add, Text, x335 y19 w135 h20 +Center, Miscellaneous Searches

Gui, Add, Text, x335 y49 w100 h15 , Confluence
Gui, Add, Button, x425 y49 w40 h20 gConfluenceSearch, Select

Gui, Add, Text, x335 y75 w125 h15 , ConnectWise
Gui, Add, Button, x425 y75 w40 h20 , Select

Gui, Add, Text, x335 y100 w100 h15 , Google
Gui, Add, Button, x425 y100 w40 h20 gGoogle, Select

;---------------------------------------------------------------------
;Cloud WorkFlow Version
;---------------------------------------------------------------------

Gui, Font, W700
Gui, Add, Text, x85 y255 w300 h15 +Center, **Confirmation Messages Timeout After 2 Seconds**
Gui, Add, Text, x130 y279 w250 h15 , Created By: Michael Alestock CST1
Gui, Add, Text, x170 y294 w115 h15 +Center, Version: 2.8.23
Gui, Show, w479 h317, Cloud Workflow
return

;---------------------------------------------------------------------
;Cloud WorkFlow - Chat Commands
;---------------------------------------------------------------------

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

ChatResearch:
{
clipboard := "Please bear with me while I research this issue for you."  ; Start off empty to allow ClipWait to detect when the text has arrived.
ClipWait  ; Wait for the clipboard to contain text.
MsgBox, 1, ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
return
}

ChatUpdate:
{
InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
clipboard := "Hi " UserInput ", I just wanted to keep you updated. I'm still looking into this, I'll let you know when I make headway."  ; Start off empty to allow ClipWait to detect when the text has arrived.
ClipWait  ; Wait for the clipboard to contain text.
MsgBox, 1, ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
SoundBeep, 1000
return
}

;---------------------------------------------------------------------
;Cloud WorkFlow - Miscellaneous Commands
;---------------------------------------------------------------------

ConfluenceSearch:
^k::
{
	MsgBox, 0, ,Confluence Search Initiated. . ., 0.5
	googleLinkStart = C:\Program Files\Google\Chrome\Application\chrome.exe https://rightnetworks.atlassian.net/wiki/search?text=
	AutoTrim, On
	searchTerm = %clipboard%
	if searchTerm =
	{
		MsgBox, 48, Search Confluence, No text in clipboard to search Confluence., 5
		return
	}
	StringReplace, searchTerm, searchTerm, `r`n, +, all
	StringReplace, searchTerm, searchTerm, %A_SPACE%, +, all
	searchTerm = %googleLinkStart%%searchTerm% 
	Run, %searchTerm%
	return
}

Google:
^g::
{
	MsgBox, 0, ,Google Search Initiated. . ., 0.5
	googleLinkStart = C:\Program Files\Google\Chrome\Application\chrome.exe http://www.google.com/search?sourceid=navclient&ie=UTF-8&oe=UTF-8&q=
	AutoTrim, On
	searchTerm = %clipboard%
	if searchTerm =
	{
		MsgBox, 48, Search Google, No text in clipboard to Google., 5
		return
	}
	StringReplace, searchTerm, searchTerm, `r`n, +, all
	StringReplace, searchTerm, searchTerm, %A_SPACE%, +, all
	searchTerm = %googleLinkStart%%searchTerm% 
	Run, %searchTerm%
	return
}

;---------------------------------------------------------------------
;Cloud WorkFlow Ticket Responses
;---------------------------------------------------------------------

Response:

TicketResolved:
{
	InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
	clipboard := "Hi " UserInput ", `n`nAs per our conversation, I'm glad I could help you with.`n`nIf you have any other questions regarding this issues please reply to this email.`n`nBest regards,`nMichael Alestock"
	ClipWait  ; Wait for the clipboard to contain text.
	MsgBox, , ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
	SoundBeep, 1000
	return
}

TicketNoResponse:
{
	InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
	clipboard := "Hi " UserInput ",`n`nI have been unable to reach you and without working with you I cannot resolve the issue. I will be closing the ticket as 'No Response'. `n`nIf you still require our assistance, please reply to this email or give us a call and we'll be happy to help.`n`nBest regards,`nMichael Alestock"
	ClipWait  ; Wait for the clipboard to contain text.
	MsgBox, , ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
	SoundBeep, 1000
	return
}

TicketVoicemail:
{
	InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
	clipboard := "Hi "UserInput ",`n`nI reached out via phone and left a message.`n`nPlease give us a call at 866-923-6874 at your earliest convenience and we’d be happy to assist you. You are welcome to ask for me by name and reference your ticket number.`n`nBest regards,`nMichael Alestock"
	ClipWait  ; Wait for the clipboard to contain text.
	MsgBox, , ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
	SoundBeep, 1000
	return
}

TicketUnverifiable:
{
	InputBox, UserInput, Client Name, Enter the client's name.,, 300, 125
	clipboard := "Hi " UserInput ",`n`nThank you for reaching out today. I apologize, we are unable to unlock an account or update any log in information without verifying your identity first using your security questions. Please reach out to your Cloud Administrator and they should be able to assist you with resetting your account. I will be closing this ticket, but if this requires any further attention, please reply to this email.`n`nBest regards,`nMichael Alestock"
	ClipWait  ; Wait for the clipboard to contain text.
	MsgBox, , ,The following contents have been copied to your clipboard:`n`n%clipboard%, 2
	SoundBeep, 1000
	return
}

;---------------------------------------------------------------------
;Cloud WorkFlow - For Techs by Techs
;---------------------------------------------------------------------




GuiClose:
ExitApp