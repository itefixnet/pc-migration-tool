RequestExecutionLevel admin ;Require admin rights on NT6+ (When UAC is turned on)
!define VERSION "1.0.0"
!define NAME "pc_migration_tool"

SetCompressor /SOLID LZMA
Icon logo.ico
Caption "PC Migration Tool"
CompletedText "Completed"
InstallButtonText "Copy"

!include "${NSISDIR}\Include\WinMessages.nsh"
!include MUI2.nsh
!include 'LogicLib.nsh'

Name "${NAME}"
OutFile "${NAME}.exe"

VIAddVersionKey  "ProductName" "${NAME}"
VIAddVersionKey  "CompanyName" "itefix.net"
VIAddVersionKey  "FileDescription" "${NAME}"
VIAddVersionKey  "FileVersion" "${VERSION}"
VIProductVersion "${VERSION}.0"

!define MUI_ICON "logo.ico"

!define MUI_WELCOMEFINISHPAGE_BITMAP "logo-164x314.bmp"

!define MUI_WELCOMEPAGE_TITLE "Welcome to the local files copy wizard"
!define MUI_WELCOMEPAGE_TEXT "This wizard will help you copy your local files from the old PC to a USB flash drive.$\r$\n$\r$\nPlease connect the USB flash drive now."
!insertmacro MUI_PAGE_WELCOME

!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_TITLE "Local files copy has been completed."
!define MUI_FINISHPAGE_TEXT "You can remove the USB flash drive now."
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Function .onInit
	
	InitPluginsDir
	File /oname=$PLUGINSDIR\UserBackup.cmd UserBackup.cmd
	
FunctionEnd


Section "UserBackup"

	nsExec::Exec "$PLUGINSDIR\UserBackup.cmd"

SectionEnd