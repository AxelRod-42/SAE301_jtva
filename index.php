<?php

include "php/connexion.php";

?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Saint-Médard Basket</title>
    <link rel="stylesheet" href="CSS/style.css"> <!--Lien vers le css-->
    <link rel="icon" type="image/x-icon" href="image/logo/favicon.ico"><!--icone du site-->
    <script src="JS/script.js" defer></script>
</head>

<body>
    <header>
        <section class="top">
            <nav class="menu">
                <ul>
                    <li><a href="pages/club.php">Club</a></li>
                    <li><a href="pages/boutique.php">Boutique</a></li>
                    <li><a href="pages/calendrier.php">Calendrier</a></li>
                    <div class="logo">
                        <a href="index.php"><img src="image/logo/logo_StMedard.png" alt="Logo Saint-Médard Basket" width="250" height="200"></a>
                    </div>
                    <li><a href="pages/actualite.php">Actualités</a></li>
                    <li><a href="pages/contact.php">Contact</a></li>
                    <div class="panier">
                        <a href="pages/boutique.php"><img src="image/icone/panier.png" alt="Panier" width="100" height="100"></a>
                    </div>
                </ul>
            </nav>
        </section>
    </header>
    <main>
        <section class="prochain">
            <h2>Rencontre du week-end</h2>

            <div class="match">
                <span class="team">SMB</span>
                <span class="vs">VS</span>
                <span class="team">ADVERSAIRE</span>
            </div>

            <p class="countdown">[Compte à rebours]</p>
        </section> 

        <section class="news">
            <article class="carte">
                <div class="newsText">
                <h3>The More Important the Work, the More Important the Rest</h3>
                </div>
                <div class="newsimg"></div>
            </article>

            <article class="carte">
                <div class="newsText">
                <h3>The Walt Disney company is about to close</h3>
                </div>
                <div class="newsimg"></div>
            </article>
        </section>

        <section class="barre"></section>

        <section class="slider">
            <button class="left">‹</button>

            <div class="carteS">
                <div class="cardT">Titre article / photo</div>
                <div class="cardT">Titre article / photo</div>
            </div>

            <button class="right">›</button>
        </section>

        <section class="une">
            <div class="uneIMG"></div>
            <h2>Article à la une</h2>
        </section>
    </main>
    <footer>
        <section class="down">
            <div class="reseau">
                <a href=""><img src="image/icone/facebook.png" alt="Facebook" width="100" height="100"></a>
                <img src="image/icone/arrow2.png" alt="flèche" width="100" height="75">
                <img src="image/icone/arrow.png" alt="flèche" width="100" height="75">
                <a href="https://www.instagram.com/saint.medard.basket/"><img src="image/icone/instagram.png" alt="Instagram" width="100" height="100"></a>
            </div>
            <br><p><strong>Suivez-nous sur les réseaux sociaux !</strong></p>
            <div class="fil">   
                <p>Page d'accueil</p>
            </div>
            <div class="admin">
                <a href="php/admin/login.php">Espace administration</a>
            </div>
            <div class="mentions">
                <hr>
                <p><strong>© 2026 [St Médard Basket].</strong> Tous droits réservés. Mentions légales | Politique de confidentialité</p>
            </div>
            
        </section>
    </footer>
    <button id="retourTop">⬆</button>
</body>
</html>


