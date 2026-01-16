<?php
require_once __DIR__ . "/article.php";

$articleObj = new Article();
$articles = $articleObj->getAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Actualités</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/actualite.css">
</head>

<body>

<header class="hero">
    <h1>Nos équipes ont du talent !</h1>
    <p>Résumé des matchs 2025/2026</p>
</header>

<section class="actus-container">

<?php foreach ($articles as $article): ?>
    <article class="card">
        <div class="card-image">
            <?php if (!empty($article['image_url'])): ?>
                <img src="<?= htmlspecialchars($article['image_url']) ?>" alt="">
            <?php else: ?>
                <div class="placeholder"></div>
            <?php endif; ?>
        </div>

        <div class="card-content">
            <h2><?= htmlspecialchars($article['titre']) ?></h2>
            <p><?= htmlspecialchars(substr($article['contenu'], 0, 80)) ?>...</p>
            <a href="#" class="btn">Lire le résumé</a>
        </div>
    </article>
<?php endforeach; ?>

</section>

<footer class="footer">
    <p>Suivez-nous sur nos réseaux sociaux !</p>
</footer>

</body>
</html>
