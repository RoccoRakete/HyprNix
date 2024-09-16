#!/usr/bin/env sh

# Datei zum Speichern des Power-Profils
PROFILE_FILE="$HOME/.cache/.saved_power_profile"

if [ ! -f "$PROFILE_FILE" ]; then
    # Profil speichern und auf 'balanced' setzen, wenn die Datei noch nicht existiert
    CURRENT_PROFILE=$(powerprofilesctl get)
    echo "$CURRENT_PROFILE" >"$PROFILE_FILE"
    powerprofilesctl set balanced
    echo "Aktuelles Profil gespeichert und auf 'balanced' gesetzt."
else
    # Gespeichertes Profil wiederherstellen
    SAVED_PROFILE=$(cat "$PROFILE_FILE")
    powerprofilesctl set "$SAVED_PROFILE"
    # Datei löschen, um beim nächsten Mal wieder zu 'balanced' zu wechseln
    rm "$PROFILE_FILE"
    echo "Gespeichertes Profil wiederhergestellt: $SAVED_PROFILE"
fi
