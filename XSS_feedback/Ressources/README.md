# Faille XSS dans le menu Feedback

Une XSS (aussi appelée Cross-Site Scripting) est une faille permettant l'injection de code, dans un site Web afin de modifier sa manière d'afficher. Elle provient majoritairement d'erreurs de programmation ou d'une trop grande confiance accordée aux entrées d’un utilisateur.

Pour cette faille nous allons rentrer le code suivant `<script>alert<script/>` dans le champ message de la page feedback (`/?page=feedback`) et le poster, ce qui nous débloquera le flag : `0FBB54BBF7D099713CA4BE297E1BC7DA0173D8B3C21C1811B916A3A86652724E`

- Pour corriger ce genre de faille XSS, il faut **filtrer les entrées utilisateurs**, des fonctions dans de nombreux langages permettent de filtrer ou échapper ‘<‘ et ‘>’ ou les balises HTML
