# Réponses aux questions de réflexion - TP 2

## Exercice 2.1
**Question :** Que donne chmod 644 sur un fichier ? Est-il exécutable par son propriétaire ?
**Réponse :** `chmod 644` donne les droits de lecture (4) et d'écriture (2) au propriétaire (total 6), et la lecture seule (4) au groupe et aux autres. Non, le fichier n'est pas exécutable par son propriétaire (ni par personne d'autre), car le bit d'exécution (1) n'est pas activé.

## Exercice 2.2
**Question :** Pourquoi utilise-t-on des guillemets autour de "$UTILISATION" dans le test if ?
**Réponse :** On utilise des guillemets pour éviter les erreurs si la variable est vide. Si `$UTILISATION` est vide et qu'on ne met pas de guillemets, le test devient `if [ -ge 80 ]` ce qui provoque une erreur de syntaxe de Bash.

## Exercice 2.3
**Question :** Que se passe-t-il si vous enlevez set -Eeuo pipefail et que tar échoue ? Le script continue-t-il à tort ?
**Réponse :** Oui, sans `set -e`, le script continue de s'exécuter même si la commande `tar` échoue. Le script supprimerait alors les anciennes sauvegardes sans qu'une nouvelle n'ait été créée, ce qui est dangereux.

## Exercice 2.4
**Question :** Pourquoi cron nécessite-t-il des chemins absolus alors qu'un script fonctionne très bien depuis votre terminal avec des chemins relatifs ?
**Réponse :** Le démon cron n'exécute pas les tâches depuis votre dossier personnel, mais depuis un répertoire système (souvent la racine `/`). Les chemins relatifs comme `./data` ne fonctionneront donc pas, il faut utiliser des chemins absolus.

## Exercice 2.5
**Question :** Quelles étapes ajouteriez-vous pour transformer ce script en un vrai pipeline CI ? Quels seraient les points de défaillance à gérer avec des codes de retour ?
**Réponse :** On pourrait ajouter des étapes de linting (analyse du code), de build (compilation) et de déploiement. Les points de défaillance à gérer sont l'échec du `git clone/pull` (code retour 128), l'échec des tests (code retour différent de 0), et les erreurs de connexion au serveur de déploiement.
