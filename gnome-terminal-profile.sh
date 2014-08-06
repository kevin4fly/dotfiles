#!/usr/bin/env sh

# the absolute path of gnome terminal profile: ~/.gconf/apps/gnome-terminal/profiles/
# you can remove the profiles and replace it with what you like

PROFILE=Default
CONF_TOOL=gconftool-2
CONF_PATH="/apps/gnome-terminal/profiles/$PROFILE"
# $CONF_TOOL -s -t string "$CONF_PATH/palette" "#121212121212:#F9F926267272:#8282B4B41414:#FDFD97971F1F:#5656C2C2D6D6:#8C8C5454FEFE:#464654545757:#CCCCCCCCC6C6:#121212121212:#E5E522222222:#A6A6E3E32D2D:#FCFC95951E1E:#C4C48D8DFFFF:#FAFA25257373:#6767D9D9F0F0:#F2F2F2F2F2F2"
$CONF_TOOL -s -t string "$CONF_PATH/palette" "#121212121212:#F9F926267272:#8282B4B41414:#FDFD97971F1F:#8C8C5454FEFE:#D3D336368282:#5656C2C2D6D6:#CCCCCCCCC6C6:#121212121212:#E5E522222222:#A6A6E3E32D2D:#FCFC95951E1E:#C4C48D8DFFFF:#FAFA25257373:#6767D9D9F0F0:#F2F2F2F2F2F2"
$CONF_TOOL -s -t string "$CONF_PATH/background_color" "#121212121212"
$CONF_TOOL -s -t string "$CONF_PATH/foreground_color" "#F8F8F8F8F2F2"
$CONF_TOOL -s -t string "$CONF_PATH/bold_color" "#8A8ABEBEB7B7"
$CONF_TOOL -s -t bool "$CONF_PATH/bold_color_same_as_fg" "false"
$CONF_TOOL -s -t bool "$CONF_PATH/use_theme_colors" "false"
$CONF_TOOL -s -t bool "$CONF_PATH/use_theme_background" "false"
$CONF_TOOL -s -t string "$CONF_PATH/font" "Monospace 10"
