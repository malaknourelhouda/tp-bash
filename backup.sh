#!/bin/bash
set -Eeuo pipefail

DOSSIER="./data"
DESTINATION="./backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : Le dossier $DOSSIER n'existe pas." >&2
    exit 1
fi

mkdir -p "$DESTINATION"
ARCHIVE="$DESTINATION/backup_$DATE.tar.gz"

echo "Création de l'archive $ARCHIVE..."
tar -czf "$ARCHIVE" "$DOSSIER"

echo "Suppression des sauvegardes de plus de 7 jours..."
find "$DESTINATION" -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Sauvegarde terminée avec succès."
