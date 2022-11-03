#!/bin/bash
# Small script tp call Midnight Commander with Joy2Key
#
# Config: DPAD = Arrows; A = Enter; B = F10; X = Spacee; Y = F9
# Arrows move curosor, Enter operates as executive key
# F10 quits menus and quits MC, F9 navigates to PD-menu
# Space selects dialog boxes and marks files
#
# I make some default installs without overwrting excisting ones
# skin dark, disable command prompt, confirm exit, confirm exe
#
# by cyperghost
# for https://retropie.org.uk/
#
# some changes by rasprague
# - mc no longer supports MC_HOME
# - overwrites existing mc defaults

# --------- FUNC ---------
function first_start {
    touch "conf_ready"
    echo -e "[panel]\nMark = insert; ctrl-t; space" > mc.keymap
    echo -e "[Midnight-Commander]\nconfirm_exit=1\nconfirm_execute=1\nskin=dark\nuse_internal_edit=1\ndrop_menus=1" > ini
    echo -e "[Layout]\nmessage_visible=0\ncommand_prompt=0" >> ini
    echo -e "[Panels]\nauto_save_setup_panels=true" >> ini
}

# --------- PREP ---------
sudo pkill -f joy2key # kill old instance
sleep 0.5 #Debouncing

# --------- INIT ---------
readonly MC_CONFSTD="$HOME/.config/mc"
readonly CONFIG=(kcub1 kcuf1 kcuu1 kcud1 0x0a kf10 0x20 kf9)


# ------- PROC -------
if [[ ! -f $MC_CONFSTD/conf_ready ]]; then
    mkdir -p $MC_CONFSTD; pushd $MC_CONFSTD
    first_start
    popd
fi

if [[ -f $MC_CONFSTD/conf_ready ]]; then
    /opt/retropie/admin/joy2key/joy2key start "${CONFIG[@]}"
    mc
    /opt/retropie/admin/joy2key/joy2key stop
else
    echo "Error! Can not acess config data!"
fi
