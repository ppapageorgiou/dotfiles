#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"


execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
   "Avoid creating '.DS_Store' files on network or USB volumes"

execute "defaults write com.apple.menuextra.battery ShowPercent -string 'YES'" \
    "Show battery percentage from the menu bar"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
    "Save screenshots to the Desktop"

execute "defaults write com.apple.screencapture type -string 'png'" \
    "Save screenshots as PNGs"

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'Panos Laptop' && \
         sudo scutil --set ComputerName 'panos-laptop' && \
         sudo scutil --set HostName 'panos-laptop' && \
         sudo scutil --set LocalHostName 'panos-laptop'" \
    "Set computer name"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

killall "SystemUIServer" &> /dev/null
