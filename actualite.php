<?php
require_once __DIR__ . "/event.php";

$eventObj = new Event();
$events = $eventObj->getAllEvents();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Actualités</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<main>

    <!-- TITRE DANS BLOC GRIS -->
    <div class="actus-title">
        <h1>Nos équipes ont du talent !</h1>
        <p>Événements et temps forts du club</p>
    </div>

    <!-- CONTAINER DES CARDS -->
    <div class="cards-container">

        <?php foreach ($events as $event): ?>
            <article class="card">

                <!-- Badge -->
                <?php if ($event['public']): ?>
                    <span class="badge badge-public">Événement public</span>
                <?php else: ?>
                    <span class="badge badge-staff">Réunion staff</span>
                <?php endif; ?>

                <h2><?= htmlspecialchars($event['titre']) ?></h2>

                <p class="description">
                    <?= htmlspecialchars($event['description']) ?>
                </p>

                <p class="infos">
                    <?= date('d/m/Y H:i', strtotime($event['debut'])) ?>
                    — <?= htmlspecialchars($event['lieu']) ?>
                </p>

            </article>
        <?php endforeach; ?>

    </div>

</main>

</body>
</html>
