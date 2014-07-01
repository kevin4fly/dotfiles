#!/usr/bin/env sh

gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette "#121212121212:#F9F926267272:#8282B4B41414:#FDFD97971F1F:#5656C2C2D6D6:#8C8C5454FEFE:#464654545757:#CCCCCCCCC6C6:#121212121212:#E5E522222222:#A6A6E3E32D2D:#FCFC95951E1E:#C4C48D8DFFFF:#FAFA25257373:#6767D9D9F0F0:#F2F2F2F2F2F2"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color "#121212121212"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color "#F8F8F8F8F2F2"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/bold_color "#8A8ABEBEB7B7"
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/bold_color_same_as_fg "false"
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/use_theme_colors "false"
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/use_theme_background "false"
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/font "Monospace 10"
