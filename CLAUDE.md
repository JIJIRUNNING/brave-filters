# brave-filters

- Référence : `README.md` (URL des listes, règle absolue, listes Brave activées). Le relire avant de toucher à un filtre.
- Règle absolue de JS : commentaires et description des vidéos toujours visibles. Avant de proposer une liste Brave, grep ses règles (`comment`, `metadata`, `descri`).
- Chaque filtre a une ligne `!` au-dessus qui dit ce qu'il masque.
- Publier : `./update.sh "message"` (commit, push, vérif sha256 ; cache raw GitHub de 5 min).
- Dépôt public : les commits doivent rester signés avec l'adresse noreply (config locale déjà en place), jamais l'email global.
