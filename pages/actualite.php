<?php
<<<<<<< HEAD
require_once "database.php";
=======

include "../php/connexion.php";

require_once __DIR__ . "/../php/event.php";
>>>>>>> origin/main

$pdo = Database::getConnection();

$sql = "
    SELECT titre, description, url_image, debut, lieu, public
    FROM evenements
    WHERE url_image IS NOT NULL
      AND url_image != ''
    ORDER BY debut ASC
";

$events = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
<<<<<<< HEAD
    <title>Actualités - Saint Médard Basket</title>

    <!-- CSS -->
    <link rel="stylesheet" href="/SAE_301/css/style.css">
=======
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualités - Saint-Médard Basket</title>
    <link rel="stylesheet" href="../CSS/style.css"> <!--Lien vers le css-->
    <link rel="icon" type="image/x-icon" href="../image/logo/favicon.ico"><!--icone du site-->
    <script src="../JS/script.js" defer></script>
>>>>>>> origin/main
</head>
<body>

<main class="actualite-page">

    <!-- TITRE -->
    <section class="actualite-title">
        <h1>Nos équipes ont du talent !</h1>
        <p>Événements et temps forts du club</p>
    </section>

    <!-- CARDS -->
    <section class="events-grid">

        <?php foreach ($events as $event): ?>
            <article class="event-card"
                style="background-image: url('/SAE_301/<?= htmlspecialchars($event['url_image']) ?>');">

                <div class="event-overlay"></div>

                <div class="event-content">

                    <span class="event-badge <?= $event['public'] ? 'public' : 'staff' ?>">
                        <?= $event['public'] ? 'Événement public' : 'Réunion staff' ?>
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

</body>
</html>
