#!/bin/bash
set -Eeuo pipefail

LOG_FILE="ci.log"
URL_DEPOT=${1:-""}

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

if [ -z "$URL_DEPOT" ]; then
    log "Erreur : Aucune URL de dépôt fournie."
    exit 1
fi

log "Début du pipeline..."

if [ -d "depot" ]; then
    log "Mise à jour du dépôt..."
    cd depot && git pull
    cd ..
else
    log "Clonage du dépôt..."
    git clone "$URL_DEPOT" depot
fi

log "Exécution des tests..."
if [ -f "depot/test.sh" ]; then
    bash depot/test.sh
else
    log "Aucun test trouvé, on simule un succès."
fi

log "Pipeline terminé avec succès."
exit 0
