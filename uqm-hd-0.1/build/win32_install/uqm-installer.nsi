; Script generated by the HM NIS Edit Script Wizard.

Var PACKAGEDIR
Var UQMARGS
Var MAKEICON
Var UQMUSERDATA

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Ur-Quan Masters High Definition"
!define PRODUCT_VERSION "Alpha 1"
!define PRODUCT_WEB_SITE "http://code.google.com/p/uqm-hd/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\uqm.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_STARTMENU_REGVAL "NSIS:StartMenuDir"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\win-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\win-uninstall.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "vuxi.bmp"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "dynarri.bmp"
!define MUI_HEADERIMAGE_RIGHT

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_BUTTON "Install"
!define MUI_LICENSEPAGE_TEXT_BOTTOM "Press the Install button to continue."
!insertmacro MUI_PAGE_LICENSE "../../COPYING"
; Components page
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "You can preconfigure the options to mimic the original platforms by selecting those install types.  Note that more complete installs will need to download more packages."
!insertmacro MUI_PAGE_COMPONENTS
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Package Dictory
!define MUI_PAGE_HEADER_TEXT "Choose Package Location"
!define MUI_PAGE_HEADER_SUBTEXT "Choose the folder that holds packages that have already been downloaded."
!define MUI_DIRECTORYPAGE_TEXT_TOP "Setup will look for already-downloaded content packages in the following folder.  To copy them from a different folder, click Browse and select another folder.  If you are doing a net install, leave this field alone. Click Next to continue."
!define MUI_DIRECTORYPAGE_TEXT_DESTINATION "Source Folder"
!define MUI_DIRECTORYPAGE_VARIABLE $PACKAGEDIR
!define MUI_DIRECTORYPAGE_VERIFYONLEAVE
!insertmacro MUI_PAGE_DIRECTORY
; Start menu page
var ICONS_GROUP
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "Games\The Ur-Quan Masters HD"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${PRODUCT_STARTMENU_REGVAL}"
!insertmacro MUI_PAGE_STARTMENU Application $ICONS_GROUP
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_FINISHPAGE_NOREBOOTSUPPORT
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\README.txt"
!define MUI_FINISHPAGE_RUN "$INSTDIR\uqm.exe"
!define MUI_FINISHPAGE_RUN_PARAMETERS $UQMARGS
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!define MUI_UNCONFIRMPAGE_TEXT_TOP "This program will now uninstall The Ur-Quan Masters entirely.  If you wish to preserve content or expansion packs, select Cancel now and back them up.  Otherwise, press Uninstall to continue."
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "uqm-0.6.2-installer.exe"
InstallDir "$PROGRAMFILES\The Ur-Quan Masters\"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show
AllowRootDirInstall true
DirText "" "" "" "Please select a folder."
InstType "Typical"
InstType "Minimal"
InstType "Mimic PC"
InstType "Mimic 3DO"
InstType "No Content"
InstType "All Expansions"

Function .onInit
  Push $0
  StrCpy $PACKAGEDIR $EXEDIR
  StrCpy $UQMARGS ""
  StrCpy $MAKEICON 0
  ReadEnvStr $0 APPDATA
  StrCmp $0 "" NoAppData
  ExpandEnvStrings $UQMUSERDATA "%APPDATA%\uqm"
  Goto GotAppData
NoAppData:
  ReadEnvStr $0 USERPROFILE
  StrCmp $0 "" NoProfile
  ExpandEnvStrings $UQMUSERDATA "%USERPROFILE%\Application Data\uqm"
  Goto GotAppData
NoProfile:
  StrCpy $UQMUSERDATA "$INSTDIR\userdata\uqm"
GotAppData:
FunctionEnd

Function Random
  Exch $0
  Push $1
  System::Call 'kernel32::QueryPerformanceCounter(*l.r1)'
  System::Int64Op $1 % $0
  Pop $0
  Pop $1
  Exch $0
FunctionEnd

Function RandomServer
  Push $0
  Push 15
  Call Random
  Pop  $0
  IntCmp $0 0 0 +4 +4
  StrCpy $0 "ovh"
  Exch $0
  Return
  IntCmp $0 1 0 +4 +4
  StrCpy $0 "mesh"
  Exch $0
  Return
  IntCmp $0 2 0 +4 +4
  StrCpy $0 "easynews"
  Exch $0
  Return
  IntCmp $0 3 0 +4 +4
  StrCpy $0 "switch"
  Exch $0
  Return
  IntCmp $0 4 0 +4 +4
  StrCpy $0 "superb-east"
  Exch $0
  Return
  IntCmp $0 5 0 +4 +4
  StrCpy $0 "jaist"
  Exch $0
  Return
  IntCmp $0 6 0 +4 +4
  StrCpy $0 "ufpr"
  Exch $0
  Return
  IntCmp $0 7 0 +4 +4
  StrCpy $0 "heanet"
  Exch $0
  Return
  IntCmp $0 8 0 +4 +4
  StrCpy $0 "puzzle"
  Exch $0
  Return
  IntCmp $0 9 0 +4 +4
  StrCpy $0 "superb-west"
  Exch $0
  Return
  IntCmp $0 10 0 +4 +4
  StrCpy $0 "optusnet"
  Exch $0
  Return
  IntCmp $0 11 0 +4 +4
  StrCpy $0 "surfnet"
  Exch $0
  Return
  IntCmp $0 12 0 +4 +4
  StrCpy $0 "belnet"
  Exch $0
  Return
  IntCmp $0 13 0 +4 +4
  StrCpy $0 "kent"
  Exch $0
  Return
  IntCmp $0 14 0 +4 +4
  StrCpy $0 "nchc"
  Exch $0
  Return
  StrCpy $0 "umn"
  Exch $0
FunctionEnd

# To use:
# Push the file name.
# Push the installation location.
# It will install it from the Package Directory if necessary; otherwise it
# will download it to a temp file and install that.
Var DOWNLOADTARGET
Var MANDATORY
Var MD5SUM
Function HandlePackage
  Exch $0 # File location
  Exch
  Exch $1 # File name
  Exch
  Push $2
  Push $3
  # Check to make sure the file wasn't already installed
  IfFileExists "$0\$1" 0 NotThere
     md5dll::GetFileMD5 "$0\$1"
     Pop $3
     StrCmp $MD5SUM $3 0 NotThere
     MessageBox MB_ICONINFORMATION|MB_OK "The package $1 has already been installed."
     Goto PackageDone
NotThere:
  SetOutPath "$0"
  SetOverwrite ifdiff
  IfFileExists "$PACKAGEDIR\$1" 0 CheckForZip
    md5dll::GetFileMD5 "$PACKAGEDIR\$1"
    Pop $3
    StrCmp $MD5SUM $3 PackageOK
    MessageBox MB_ICONINFORMATION|MB_OKCANCEL "The file $PACKAGEDIR\$1 appears to be corrupt.  The expected MD5 sum was '$MD5SUM', but the actual MD5 sum was '$3'.  Press OK to attempt to download a fresh copy from the distribution site, or Cancel to skip the package." IDOK AttemptDownload IDCANCEL PackageDone
PackageOK:
      CopyFiles "$PACKAGEDIR\$1" "$0\$1"
      Goto PackageDone
CheckForZip:
  IfFileExists "$PACKAGEDIR\$1.zip" 0 AttemptDownload
    md5dll::GetFileMD5 "$PACKAGEDIR\$1.zip"
    Pop $3
    StrCmp $MD5SUM $3 ZipPackageOK
    MessageBox MB_ICONINFORMATION|MB_OKCANCEL "The file $PACKAGEDIR\$1.zip appears to be corrupt.  The expected MD5 sum was '$MD5SUM', but the actual MD5 sum was '$3'.  Press OK to attempt to download a fresh copy from the distribution site, or Cancel to skip the package." IDOK AttemptDownload IDCANCEL PackageDone
ZipPackageOK:
      CopyFiles "$PACKAGEDIR\$1.zip" "$0\$1"
      Goto PackageDone
AttemptDownload:
  Call RandomServer
  Pop $2
  GetTempFileName $DOWNLOADTARGET
  Delete $DOWNLOADTARGET
  CreateDirectory $DOWNLOADTARGET
  NSISdl::download "http://$2.dl.sourceforge.net/sourceforge/sc2/$1" "$DOWNLOADTARGET\$1"
  Pop $2
  StrCmp $2 "success" DownloadSuccessful
  StrCmp $2 "cancel" DownloadCanceled
  StrCpy $2 "Could not install the package $1 due to the following error: $\"$2$\"."
  Goto CheckMandatory
DownloadCanceled:
  StrCpy $2 "Download was canceled by user."
CheckMandatory:
  IntCmp $MANDATORY 0 NotMandatory
  StrCpy $3 "THIS IS A MANDATORY PACKAGE.  Without this package, $(^Name) will NOT run."
  Goto DisplayError
NotMandatory:
  StrCpy $3 "This is an optional package.  $(^Name) will still run, but some content will not be available."
DisplayError:
  MessageBox MB_ICONEXCLAMATION|MB_YESNO "$2  $3  Do you want to retry from a different mirror?" IDYES AttemptDownload
  Goto DoneWithTempFile
DownloadSuccessful:
  md5dll::GetFileMD5 "$DOWNLOADTARGET\$1"
  Pop $3
  StrCmp $MD5SUM $3 DownloadedPackageOK
  IntCmp $MANDATORY 0 NotMandatory2
  StrCpy $3 "THIS IS A MANDATORY PACKAGE.  Without this package, $(^Name) will NOT run."
  Goto DisplayError2
NotMandatory2:
  StrCpy $3 "This is an optional package.  $(^Name) will still run, but some content will not be available."
DisplayError2:
  MessageBox MB_ICONEXCLAMATION|MB_YESNO "The downloaded file $1 doesn't match the internal MD5 sum.  This probably means the download was corrupt.  $3  Do you want to retry from a different mirror?  (Select NO to install the downloaded package anyway - for instance, if you know that the content pack was upgraded or modified since.)" IDYES AttemptDownload
DownloadedPackageOK:
  CopyFiles "$DOWNLOADTARGET\$1" "$0\$1"
DoneWithTempFile:
  RmDir /r $DOWNLOADTARGET
PackageDone:
  Pop $3
  Pop $2
  Pop $1
  Pop $0
FunctionEnd

SectionGroup "!UQM" SECGRP01
  Section "Executable" SEC01
    SectionIn 1 2 3 4 5 6 RO
    SetOutPath "$INSTDIR"
    SetOverwrite try
    File "AUTHORS.txt"
    File "COPYING.txt"
    File "libpng12.dll"
    File "Manual.txt"
    File "ogg.dll"
    File "OpenAL32.dll"
    File "README.txt"
    File "SDL.dll"
    File "SDL_image.dll"
    File "SDL_gfx.dll"
    File "uqm.exe"
    File "keyjam.exe"
    File "vorbis.dll"
    File "vorbisfile.dll"
    File "WhatsNew.txt"
    File "zlib1.dll"
    SetOverwrite off
    SetOutPath $UQMUSERDATA
    File "keys.cfg" 
    File "uqm.cfg"
    SetOverwrite try
    File "uqm-pc.cfg"
    File "uqm-3do.cfg"
    
    IfFileExists "$INSTDIR\content\packages\uqm-0.5.0-3domusic.uqm" 0 DelOldContent
      StrCpy $MD5SUM "a20cacc8e66f5ff1fdf5e1d3a3b93fd2"
      md5dll::GetFileMD5 "$INSTDIR\content\packages\uqm-0.5.0-3domusic.uqm"
      Pop $0
      StrCmp $MD5SUM $0 0 DelOldContent
      CopyFiles "$INSTDIR\content\packages\uqm-0.5.0-3domusic.uqm" "$INSTDIR\content\packages\uqm-0.6.0-3domusic.uqm"
DelOldContent:
    Delete "$INSTDIR\content\packages\uqm-0.3-3domusic.zip"
    Delete "$INSTDIR\content\packages\uqm-0.3-voice.zip"
    Delete "$INSTDIR\content\packages\uqm-0.3-content.zip"
    Delete "$INSTDIR\content\packages\uqm-0.4.0-3domusic.uqm"
    Delete "$INSTDIR\content\packages\uqm-0.4.0-voice.uqm"
    Delete "$INSTDIR\content\packages\uqm-0.4.0-content.uqm"
    Delete "$INSTDIR\content\packages\uqm-0.5.0-3domusic.uqm"
    Delete "$INSTDIR\content\packages\uqm-0.5.0-voice.uqm"
    Delete "$INSTDIR\content\packages\uqm-0.5.0-content.uqm"

  ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd

  Section "Core Data" SEC02
    SectionIn 1 2 3 4 6
    CreateDirectory "$INSTDIR\content\packages\addons"
    SetOutPath "$INSTDIR\content"
    SetOverwrite ifnewer
    AddSize 12261
    StrCpy $MANDATORY 1
    StrCpy $MD5SUM "7e8f0ed8490e24231431420ea2ba6a03"
    File "content\version"
    Push "uqm-0.6.0-content.uqm"
    Push "$INSTDIR\content\packages"
    Call HandlePackage

    ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd
  
  Section "Desktop Icon" SECICON
    SectionIn 1 2 3 4 5 6
    StrCpy $MAKEICON 1
  SectionEnd
SectionGroupEnd

SectionGroup /e "3DO Content" SECGRP02
  Section "Music" SEC03
    SectionIn 1 4 6
    AddSize 18536
    StrCpy $MANDATORY 0
    StrCpy $MD5SUM "a20cacc8e66f5ff1fdf5e1d3a3b93fd2"
    Push "uqm-0.6.0-3domusic.uqm"
    Push "$INSTDIR\content\packages"
    Call HandlePackage
  ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd

  Section "Voiceovers" SEC04
    SectionIn 1 4 6
    AddSize 112291
    StrCpy $MANDATORY 0
    StrCpy $MD5SUM "d31577b896be935cc2238afd07299b8b"
    Push "uqm-0.6.0-voice.uqm"
    Push "$INSTDIR\content\packages"
    Call HandlePackage
  ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd
SectionGroupEnd

SectionGroup "Modern Remixes" SECGRP03
  Section "Pack 1" SEC05
    SectionIn 6
    AddSize 49012
    StrCpy $MANDATORY 0
    StrCpy $MD5SUM "2df402b2951c0187604a81c3997fbb9d"
    Push "uqm-remix-pack1.zip"
    Push "$INSTDIR\content\packages\addons\remix\"
    Call HandlePackage
    StrCpy $UQMARGS "--addon remix"
  ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd

  Section "Pack 2" SEC06
    SectionIn 6
    AddSize 58869
    StrCpy $MANDATORY 0
    StrCpy $MD5SUM "d5a9fb72b369bf5a5dbca3db9f1e1ea3"
    Push "uqm-remix-pack2.zip"
    Push "$INSTDIR\content\packages\addons\remix\"
    Call HandlePackage
    StrCpy $UQMARGS "--addon remix"
  ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd

  Section "Pack 3" SEC07
    SectionIn 6
    AddSize 38989
    StrCpy $MANDATORY 0
    StrCpy $MD5SUM "567bc2d9e3ca067d21170c5ac5538441"
    Push "uqm-remix-pack3.zip"
    Push "$INSTDIR\content\packages\addons\remix\"
    Call HandlePackage
    StrCpy $UQMARGS "--addon remix"
  ; Shortcuts
    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    !insertmacro MUI_STARTMENU_WRITE_END
  SectionEnd

#  Section "Pack 4" SEC08
#    SectionIn 6
#    AddSize 50000  # ESTIMATE: Update later
#    StrCpy $MANDATORY 0
#    Push "uqm-remix-pack4.zip"
#    Push "$INSTDIR\content\packages\addons\remix\"
#    Call HandlePackage
#    StrCpy $UQMARGS "--addon remix"
#  ; Shortcuts
#    !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
#    !insertmacro MUI_STARTMENU_WRITE_END
#  SectionEnd
SectionGroupEnd

Section -ShortcutsAndIcons
  SetOutPath $INSTDIR
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    CreateDirectory "$SMPROGRAMS\$ICONS_GROUP"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\The Ur-Quan Masters HD.lnk" "$INSTDIR\uqm.exe" $UQMARGS
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\UQM HD (Safe Mode).lnk" "$INSTDIR\uqm.exe" "-x --safe"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\UQM HD (Safe OpenGL).lnk" "$INSTDIR\uqm.exe" "-o --safe"
    CreateDirectory "$SMPROGRAMS\$ICONS_GROUP\Documentation"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\AUTHORS.lnk" "$INSTDIR\AUTHORS.txt"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\COPYING.lnk" "$INSTDIR\COPYING.txt"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\Manual.lnk" "$INSTDIR\Manual.txt"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\README.lnk" "$INSTDIR\README.txt"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Documentation\WhatsNew.lnk" "$INSTDIR\WhatsNew.txt"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Key Configuration.lnk" "$WINDIR\notepad" "$UQMUSERDATA\keys.cfg"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Options Configuration.lnk" "$WINDIR\notepad" "$UQMUSERDATA\uqm.cfg"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Keyboard Test.lnk" "$INSTDIR\keyjam.exe"
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Saved Games.lnk" "$UQMUSERDATA\save"
    IntCmp $MAKEICON 1 0 NoIcon NoIcon
    CreateShortCut "$DESKTOP\The Ur-Quan Masters HD.lnk" "$INSTDIR\uqm.exe" $UQMARGS
NoIcon:
    CreateShortCut "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk" "$INSTDIR\uninst.exe"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -Set3DOConfig
  SectionIn 4
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetOutPath $UQMUSERDATA
    Delete "uqm.cfg"
    CopyFiles "$UQMUSERDATA\uqm-3do.cfg" "$UQMUSERDATA\uqm.cfg"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

Section -SetPCConfig
  SectionIn 3
  !insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    SetOutPath $UQMUSERDATA
    Delete "uqm.cfg"
    CopyFiles "$UQMUSERDATA\uqm-pc.cfg" "$UQMUSERDATA\uqm.cfg"
  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd  

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\uqm.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\uqm.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
SectionEnd

; Section descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SECGRP01} "The core executables and content libraries for The Ur-Quan Masters.  All elements in this section must be installed for the game to be playable."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC01} "Includes the main program, all subsidiary libraries, and basic documentation for The Ur-Quan Masters.  Required for play."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC02} "Graphics, sound, and the PC-edition music for The Ur-Quan Masters.  Required for play.  If this package is selected and not present in the packages directory, the installer will attempt to download it."
  !insertmacro MUI_DESCRIPTION_TEXT ${SECICON} "Adds a desktop icon linking directly to The Ur-Quan Masters."
  !insertmacro MUI_DESCRIPTION_TEXT ${SECGRP02} "Optional content packages containing music and sound unique to the 1993 3DO release."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC03} "Optional package which includes the remixed songs from the 3DO release.  If this package is selected and not present in the packages directory, the installer will attempt to download it."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC04} "Optional package containing the voiceovers from the 3DO release.  If this package is selected and not present in the packages directory, the installer will attempt to download it."
  !insertmacro MUI_DESCRIPTION_TEXT ${SECGRP03} "Optional content packages containing the official UQM remixes by The Precursors.  Selecting any element from this group will also enable the 'remix' addon by default in any shortcuts."
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC05} `Ur-Quan Masters Remix Pack 1 - 'Super Melee!'  Optional add-on music package.  If this package is selected and not present in the packages directory, the installer will attempt to download it.`
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC06} `Ur-Quan Masters Remix Pack 2 - 'Neutral Aliens - Don't Shoot!'  Optional add-on music package.  If this package is selected and not present in the packages directory, the installer will attempt to download it.`
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC07} `Ur-Quan Masters Remix Pack 3 - 'The Ur-Quan Hierarchy.'  Optional add-on music package.  If this package is selected and not present in the packages directory, the installer will attempt to download it.`
#  !insertmacro MUI_DESCRIPTION_TEXT ${SEC08} `Ur-Quan Masters Remix Pack 4 - 'The New Alliance of Free Stars.'  Optional add-on music package.  If this package is selected and not present in the packages directory, the installer will attempt to download it.`
!insertmacro MUI_FUNCTION_DESCRIPTION_END


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  !insertmacro MUI_STARTMENU_GETFOLDER "Application" $ICONS_GROUP
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\content\packages\addons\remix\uqm-remix-pack4.zip"
  Delete "$INSTDIR\content\packages\addons\remix\uqm-remix-pack3.zip"
  Delete "$INSTDIR\content\packages\addons\remix\uqm-remix-pack2.zip"
  Delete "$INSTDIR\content\packages\addons\remix\uqm-remix-pack1.zip"
  Delete "$INSTDIR\content\packages\uqm-0.6.0-voice.uqm"
  Delete "$INSTDIR\content\packages\uqm-0.6.0-3domusic.uqm"
  Delete "$INSTDIR\content\packages\uqm-0.6.0-content.uqm"
  Delete "$INSTDIR\content\version"
  Delete "$INSTDIR\zlib.dll"
  Delete "$INSTDIR\zlib1.dll"
  Delete "$INSTDIR\WhatsNew.txt"
  Delete "$INSTDIR\vorbisfile.dll"
  Delete "$INSTDIR\vorbis.dll"
  Delete "$INSTDIR\uqm.exe"
  Delete "$INSTDIR\keyjam.exe"
  Delete "$INSTDIR\SDL_gfx.dll"
  Delete "$INSTDIR\SDL_image.dll"
  Delete "$INSTDIR\SDL.dll"
  Delete "$INSTDIR\README.txt"
  Delete "$INSTDIR\OpenAL32.dll"
  Delete "$INSTDIR\ogg.dll"
  Delete "$INSTDIR\Manual.txt"
  Delete "$INSTDIR\libpng13.dll"
  Delete "$INSTDIR\libpng12.dll"
  Delete "$INSTDIR\COPYING.txt"
  Delete "$INSTDIR\AUTHORS.txt"
  Delete "$INSTDIR\stderr.txt"

  Delete "$SMPROGRAMS\$ICONS_GROUP\Uninstall.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Options Configuration.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Key Configuration.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Keyboard Test.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Saved Games.lnk"
  Delete "$DESKTOP\The Ur-Quan Masters.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\The Ur-Quan Masters.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\UQM (Safe Mode).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\UQM (Safe OpenGL).lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\AUTHORS.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\COPYING.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\Manual.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\README.lnk"
  Delete "$SMPROGRAMS\$ICONS_GROUP\Documentation\WhatsNew.lnk"
  
  RMDir "$SMPROGRAMS\$ICONS_GROUP\Documentation"
  RMDir "$SMPROGRAMS\$ICONS_GROUP"
  RMDir "$INSTDIR\content\packages\addons\remix"
  RMDir "$INSTDIR\content\packages\addons"
  RMDir "$INSTDIR\content\packages"
  RMDir "$INSTDIR\content"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
