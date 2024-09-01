#!/usr/bin/env sh

# Holt das aktuelle Profil
current_profile=$(powerprofilesctl get)

# Wechselt zum nächsten Profil und springt nach dem letzten Profil zurück zum ersten
case "$current_profile" in
    "power-saver")
        powerprofilesctl set balanced
        ;;
    "balanced")
        powerprofilesctl set performance
        ;;
    "performance")
        powerprofilesctl set power-saver
        ;;
    *)
        echo "Unbekanntes Profil: $current_profile"
        ;;
esac
