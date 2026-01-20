<?php
include "../php/connexion.php";

$sql = "
  SELECT titre, description, url_image, debut, lieu, public
  FROM evenements
  WHERE url_image IS NOT NULL AND url_image <> ''
  ORDER BY debut ASC
";

$events = $db->query($sql)->fetchAll(); // FETCH_ASSOC par défaut
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Actualités - Saint-Médard Basket</title>
  <link rel="stylesheet" href="../CSS/style.css">
  <link rel="icon" type="image/x-icon" href="../image/logo/favicon.ico">
  <script src="../JS/script.js" defer></script>
</head>
<body>

<main class="actualite-page">

  <section class="actualite-title">
    <h1>Nos équipes ont du talent !</h1>
    <p>Événements et temps forts du club</p>
  </section>

  <section class="events-grid">
    <?php foreach ($events as $event): ?>
      <article class="event-card"
        style="background-image: url('../image/<?= htmlspecialchars($event['url_image']) ?>');">

        <div class="event-overlay"></div>

        <div class="event-content">
          <span class="event-badge <?= !empty($event['public']) ? 'public' : 'staff' ?>">
            <?= !empty($event['public']) ? 'Événement public' : 'Réunion staff' ?>
          </span>

          <h2><?= htmlspecialchars($event['titre']) ?></h2>

          <?php if (!empty($event['description'])): ?>
            <p class="event-desc"><?= htmlspecialchars($event['description']) ?></p>
          <?php endif; ?>

          <?php if (!empty($event['debut'])): ?>
            <p class="event-date">
              <?= date('d/m/Y H:i', strtotime($event['debut'])) ?>
              <?php if (!empty($event['lieu'])): ?>
                — <?= htmlspecialchars($event['lieu']) ?>
              <?php endif; ?>
            </p>
          <?php endif; ?>
        </div>

      </article>
    <?php endforeach; ?>
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
      <p>Page actualités</p>
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