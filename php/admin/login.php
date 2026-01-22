<?php
session_start();

$ADMIN_LOGIN = "jtva_admin";

$ADMIN_PASS = "jtva301";

$error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $login = $_POST["login"] ?? "";
    $pass = $_POST["password"] ?? "";

    if ($login === $ADMIN_LOGIN && $pass === $ADMIN_PASS) {
        $_SESSION["admin"] = true;
        header("Location: inbox.php");
        exit;
    } else {
        $error = "Mot de passe incorrect.";
    }
}
?>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>administration - Saint-Médard Basket</title>
    <link rel="stylesheet" href="../../CSS/style.css"> <!--Lien vers le css-->
    <link rel="icon" type="image/x-icon" href="../../image/logo/favicon.ico"><!--icone du site-->
    <script src="../../JS/script.js" defer></script>
</head>
<body>
    <section class="loginS">
        <p><a href="../../index.php">← Retour à l’accueil</a></p>
        <fieldset class="loginF">
            <h1>Connexion admin</h1>

            <?php if ($error): ?>
                <p style="color:red;"><?= htmlspecialchars($error) ?></p>
            <?php endif; ?>

            <form method="post">
                <input type="text" name="login" placeholder="Identifiant" required>
                <input type="password" name="password" placeholder="Mot de passe" required>
                <button type="submit">Se connecter</button>
            </form>
        </fieldset>
    </section>
</body>
</html>