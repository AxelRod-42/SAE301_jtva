<?php
    session_start();
    if (empty($_SESSION["admin"])) {
    header("Location: login.php");
    exit;
    }

    require_once __DIR__ . "/../connexion.php";

    $sql = "SELECT id, nom_joueur, prenom, email_contact, telephone_contact, genre, message, date_envoi
            FROM inscriptions
            WHERE id <> '' AND id IS NOT NULL
            ORDER BY date_envoi DESC";
    $rows = $db->query($sql)->fetchAll();
?>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Saint-Médard Basket</title>
    <link rel="stylesheet" href="../../CSS/style.css"> <!--Lien vers le css-->
    <link rel="icon" type="image/x-icon" href="../../image/logo/favicon.ico"><!--icone du site-->
    <script src="../../JS/script.js" defer></script>
</head>
<body>
    <section class="inboxAdmin">
        <h1>Messages reçus (Contact)</h1>
        <p><a href="logout.php">Se déconnecter</a></p>

        <?php if (count($rows) === 0): ?>
            <p>Aucun message.</p>
        <?php else: ?>
            <?php foreach ($rows as $r): ?>
            <div style="border:1px solid #ccc; padding:12px; margin:12px 0;">
                <strong><?= htmlspecialchars(($r["prenom"] ?? "")." ".($r["nom_joueur"] ?? "")) ?></strong>
                <div><?= htmlspecialchars($r["email_contact"] ?? "") ?> • <?= htmlspecialchars($r["telephone_contact"] ?? "") ?> • <?= htmlspecialchars($r["genre"] ?? "") ?></div>
                <div><em><?= htmlspecialchars($r["date_envoi"] ?? "") ?></em></div>
                <p><?= nl2br(htmlspecialchars($r["message"] ?? "")) ?></p>

                <form method="post" action="delete.php" onsubmit="return confirm('Supprimer ce message ?');">
                <input type="hidden" name="id" value="<?= htmlspecialchars($r["id"]) ?>">
                <button type="submit">Supprimer</button>
                </form>
            </div>
            <?php endforeach; ?>
        <?php endif; ?>
</body>
</html>