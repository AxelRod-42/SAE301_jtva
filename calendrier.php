<?php
$host = 'localhost';
$dbname = 'stmedard_basket'; 
$user = 'root';
$pass = ''; 

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    
    // CORRECTION : On utilise ATTR_ERRMODE pour définir le mode, 
    // et ERRMODE_EXCEPTION comme valeur.
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

// Requête SQL adaptée à ton fichier .sql
$sql = "SELECT 
            m.score_local, 
            m.score_visiteur, 
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
    <title>Calendrier des matchs</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <main class="calendrier-container">
        <div class="titre-container">
            <h1 class="titre-page">Calendrier des matchs</h1>
        </div>

        <?php foreach ($matchs as $match): ?>
            <div class="match-card">
                <div class="equipe-bloc">
                    <div class="logo-placeholder"></div>
                    <p><?php echo htmlspecialchars($match['cat_domicile'] ?? 'Équipe'); ?></p>
                </div>

                <div class="score-label">
                    <?php 
                        if (empty($match['score_local']) && $match['score_local'] !== '0') {
                            echo "score";
                        } else {
                            echo htmlspecialchars($match['score_local']) . " - " . htmlspecialchars($match['score_visiteur']);
                        }
                    ?>
                </div>

                <div class="equipe-bloc">
                    <div class="logo-placeholder"></div>
                    <p><?php echo htmlspecialchars($match['cat_exterieur'] ?? 'Équipe'); ?></p>
                </div>
            </div>
        <?php endforeach; ?>
    </main>
</body>
</html>