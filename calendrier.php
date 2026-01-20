<?php
$host = 'localhost';
$dbname = 'stmedard_basket'; 
$user = 'root';
$pass = ''; 

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur : " . $e->getMessage());
}

// Requête SQL pour récupérer les noms des images de la table 'teams'
$sql = "SELECT 
            m.score_local, 
            m.score_visiteur, 
            t_dom.categorie AS cat_domicile, 
            t_dom.image AS img_domicile, 
            t_ext.categorie AS cat_exterieur,
            t_ext.image AS img_exterieur
        FROM matchs m
        LEFT JOIN teams t_dom ON m.equipe_domicile_id = t_dom.id
        LEFT JOIN teams t_ext ON m.equipe_exterieure_id = t_ext.id
        LIMIT 3";

$stmt = $db->query($sql);
$matchs = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Calendrier - St Médard</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
    <main class="calendrier-container">
        <div class="header-titre">
            <h1>Calendrier des matchs</h1>
        </div>

        <div class="matchs-liste">
            <?php foreach ($matchs as $match): ?>
                <div class="match-card">
                    <div class="equipe">
                        <div class="logo-box">
                            <?php if (!empty($match['img_domicile'])): ?>
                                <img src="images/<?php echo htmlspecialchars($match['img_domicile']); ?>" alt="Logo">
                            <?php else: ?>
                                <div class="cross"></div>
                            <?php endif; ?>
                        </div>
                        <span><?php echo htmlspecialchars($match['cat_domicile'] ?? 'Équipe'); ?></span>
                    </div>

                    <div class="score-text">
                        <?php echo (empty($match['score_local'])) ? "score" : htmlspecialchars($match['score_local'])." - ".htmlspecialchars($match['score_visiteur']); ?>
                    </div>

                    <div class="equipe">
                        <div class="logo-box">
                            <?php if (!empty($match['img_exterieur'])): ?>
                                <img src="images/<?php echo htmlspecialchars($match['img_exterieur']); ?>" alt="Logo">
                            <?php else: ?>
                                <div class="cross"></div>
                            <?php endif; ?>
                        </div>
                        <span><?php echo htmlspecialchars($match['cat_exterieur'] ?? 'Équipe'); ?></span>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </main>
</body>
</html>