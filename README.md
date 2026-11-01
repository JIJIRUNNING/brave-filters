# brave-filters
Listes de filtres Brave perso (syntaxe uBlock Origin / Brave Shields) : `youtube-mobile.txt` pour l'iPhone, `youtube-desktop.txt` pour le Mac. Publier une modification : `./update.sh "message"`.

- Brave iOS : Réglages → Shields & Privacy → Content Filtering → listes de filtres personnalisées → coller https://raw.githubusercontent.com/JIJIRUNNING/brave-filters/main/youtube-mobile.txt puis « Update Lists ».
- Brave Mac : brave://settings/shields/filters → listes de filtres personnalisées → coller https://raw.githubusercontent.com/JIJIRUNNING/brave-filters/main/youtube-desktop.txt

## Règle absolue
Les commentaires et la description des vidéos doivent toujours rester visibles. Aucun filtre ne doit les masquer, ni ici ni dans une liste activée dans Brave.
- Ne pas activer la liste Brave « YouTube distractions elements blocker (mobile-only) » : elle masque l'accès aux commentaires (`ytm-comments-entry-point-header-renderer`) et le bloc de description (`ytm-slim-video-metadata-section-renderer`).
- Mac, extension Unhook : laisser « Hide Comments » et « Hide Video Info » désactivés.

## Listes Brave activées en plus de ces fichiers
- iPhone et Mac : YouTube Playables blocker, YouTube autodubbed videos blocker, YouTube members-only video blocker (vérifiées le 01/11/2026 : rien sur les commentaires ni la description).
- iPhone seulement : YouTube Shorts blocker, YouTube recommendations blocker (mobile-only). Sur le Mac, Unhook s'en charge.
