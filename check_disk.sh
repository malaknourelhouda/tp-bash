#!/bin/bash
SEUIL=${1:-80}
UTILISATION=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE : Espace disque utilisé à $UTILISATION% (Seuil : $SEUIL%)"
    exit 1
else
    echo "OK : Espace disque à $UTILISATION% (Seuil : $SEUIL%)"
    exit 0
fi
