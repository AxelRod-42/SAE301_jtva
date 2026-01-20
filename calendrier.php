<?php
// Activation des erreurs pour le développement
ini_set('display_errors', 1);
error_reporting(E_ALL);

$host = 'localhost';
$dbname = 'stmedard_basket'; // Nom de ta base
$user = 'root';
$pass = ''; 

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    // CORRECTION : La constante exacte est PDO::ERRMODE_EXCEPTION
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

// Requête SQL basée sur ton fichier .sql
$sql = "SELECT 
            m.score_local, 
            m.score_visiteur, 
            m.date_match,
            t_dom.categorie AS cat_domicile, 
            t_ext.categorie AS cat_exterieur
        FROM matchs m
        LEFT JOIN teams t_dom ON m.equipe_domicile_id = t_dom.id
        LEFT JOIN teams t_ext ON m.equipe_exterieure_id = t_ext.id
        ORDER BY m.date_match ASC";

$stmt = $db->query($sql);
$matchs = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Calendrier - St Médard Basket</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <main class="calendrier-container">
        <div class="header-titre">
            <h1>Calendrier des matchs</h1>
        </div>

        <div class="matchs-liste">
            <?php if (count($matchs) > 0): ?>
                <?php foreach ($matchs as $match): ?>
                    <div class="match-card">
                        <div class="equipe">
                            <div class="logo-box">
                                <div class="cross"></div>
                            </div>
                            <span><?php echo htmlspecialchars($match['cat_domicile'] ?? 'Équipe'); ?></span>
                        </div>

                        <div class="score-container">
                            <span class="score-text">
                                <?php 
                                    echo (empty($match['score_local']) && $match['score_local'] !== '0') 
                                    ? "score" 
                                    : htmlspecialchars($match['score_local']) . " - " . htmlspecialchars($match['score_visiteur']); 
                                ?>
                            </span>
                        </div>

                        <div class="equipe">
                            <div class="logo-box">
                                <div class="cross"></div>
                            </div>
                            <span><?php echo htmlspecialchars($match['cat_exterieur'] ?? 'Équipe'); ?></span>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php else: ?>
                <p>Aucun match prévu pour le moment.</p>
            <?php endif; ?>
        </div>
    </main>
</body>
</html>