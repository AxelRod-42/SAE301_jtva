<?php

include "../php/connexion.php";
require_once __DIR__ . "/../php/team.php";

$tObj = new Team();
$eq = $tObj->getAll();

$eqF = [];
$eqM = [];

foreach ($eq as $t) {

  $cat = strtolower($t["categorie"] ?? "");
  $gen = strtolower($t["genre"] ?? "");

  if (strpos($gen, "f") !== false || strpos($cat, "f") !== false || strpos($cat, "fémin") !== false) {
    $eqF[] = $t;
  } else {
    $eqM[] = $t;
  }
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Club - Saint-Médard Basket</title>
    <link rel="stylesheet" href="../CSS/style.css"> <!--Lien vers le css-->
    <link rel="icon" type="image/x-icon" href="../image/logo/favicon.ico"><!--icone du site-->
    <script src="../JS/script.js" defer></script>
    <script src="../JS/map.js" defer></script>
</head>

<body>
    <header>
        <section class="top">
            <nav class="menu">
                <ul>
                    <li><a href="club.php">Club</a></li>
                    <li><a href="boutique.php">Boutique</a></li>
                    <li><a href="calendrier.php">Calendrier</a></li>
                    <div class="logo">
                        <a href="../index.php"><img src="../image/logo/logo_StMedard.png" alt="Logo Saint-Médard Basket" width="250" height="200"></a>
                    </div>
                    <li><a href="actualite.php">Actualités</a></li>
                    <li><a href="contact.php">Contact</a></li>
                    <div class="panier">
                        <a href="boutique.php"><img src="../image/icone/panier.png" alt="Panier" width="100" height="100"></a>
                    </div>
                </ul>
            </nav>
        </section>
    </header>
    <main class="mainB">
            <section class="club">

                <h1 class="title">Halle des sports</h1>

                <div class="map" id="mapBox">
                    <span>Chargement de la carte...</span>
                </div>

                <h2 class="subtitle">Notre gymnase</h2>

                <div class="photos">
                <div class="photo"></div>
                <div class="photo"></div>
                </div>

                <h2 class="subtitle">Nos équipes féminines</h2>

                <div class="teams">
                <?php foreach ($eqF as $t): ?>
                    <div class="team">
                        <img
                            class="team-img"
                            src="../image/<?= htmlspecialchars($t["image"] ?? "logo/logo_StMedard.png") ?>"
                            alt="<?= htmlspecialchars($t["categorie"] ?? "Équipe") ?>">
                        <p><?= htmlspecialchars($t["nom"] ?? $t["categorie"] ?? "Équipe") ?></p>
                        </div>
                <?php endforeach; ?>

                <?php if (count($eqF) === 0): ?>
                    <p>Aucune équipe féminine pour le moment.</p>
                <?php endif; ?>
                </div>

                <h2 class="subtitle">Nos équipes masculines</h2>

                <div class="teams">
                <?php foreach ($eqM as $t): ?>
                    <div class="team">
                        <img
                            class="team-img"
                            src="../image/<?= htmlspecialchars($t["image"] ?? "logo/logo_StMedard.png") ?>"
                            alt="<?= htmlspecialchars($t["categorie"] ?? "Équipe") ?>">
                        <p><?= htmlspecialchars($t["nom"] ?? $t["categorie"] ?? "Équipe") ?></p>
                    </div>
                <?php endforeach; ?>

                <?php if (count($eqM) === 0): ?>
                    <p>Aucune équipe masculine pour le moment.</p>
                <?php endif; ?>
                </div>

            </section>
    </main>
    <footer>
        <section class="down">
            <div class="reseau">
                <a href=""><img src="../image/icone/facebook.png" alt="Facebook" width="100" height="100"></a>
                <img src="../image/icone/arrow2.png" alt="flèche" width="100" height="75">
                <img src="../image/icone/arrow.png" alt="flèche" width="100" height="75">
                <a href="https://www.instagram.com/saint.medard.basket/"><img src="../image/icone/instagram.png" alt="Instagram" width="100" height="100"></a>
            </div>
            <br><p><strong>Suivez-nous sur les réseaux sociaux !</strong></p>
            <div class="fil">   
                <p>Page club</p>
            </div>
            <div class="admin">
                <a href="../php/admin/login.php">Espace administration</a>
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