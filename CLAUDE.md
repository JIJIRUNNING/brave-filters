# brave-filters

- Référence : `README.md` (URL des listes, règle absolue, listes Brave activées). Le relire avant de toucher à un filtre.
- Règle absolue de JS : commentaires et description des vidéos toujours visibles. Avant de proposer une liste Brave, grep ses règles (`comment`, `metadata`, `descri`).
- Chaque filtre a une ligne `!` au-dessus qui dit ce qu'il masque.
- Publier : `./update.sh "message"` (commit, push, vérif sha256 ; cache raw GitHub de 5 min).
- Dépôt public : les commits doivent rester signés avec l'adresse noreply (config locale déjà en place), jamais l'email global.
- Brave iOS n'a pas appliqué `:matches-path` (01/11/2026) : préférer du CSS simple. Pour trouver un sélecteur, ouvrir m.youtube.com dans le navigateur intégré (preset mobile, refuser les cookies), lire le DOM en JS et chercher un attribut stable (ex. `tab-identifier="FEwhat_to_watch"` = accueil). Sans compte connecté, pas de fil ni de barre de thèmes : la vérif finale se fait sur l'iPhone de JS.
