<?php
require_once __DIR__ . "/team.php";

$team = new Team();
$teams = $team->getAll();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Équipes</title>
</head>
<body>

<h1>Liste des équipes</h1>

<?php foreach ($teams as $team): ?>
    <p>
        <strong><?= htmlspecialchars($team['nom']) ?></strong>
        (<?= htmlspecialchars($team['categorie']) ?>)
    </p>
<?php endforeach; ?>

</body>
</html>
