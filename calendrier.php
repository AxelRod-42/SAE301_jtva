<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendrier - Saint-Médard Basket</title>
    <link rel="stylesheet" href="style.css">
    
    <style>
        /* STYLE DE SECOURS (Si le fichier CSS externe bug) */
        body { margin: 0; font-family: sans-serif; display: flex; flex-direction: column; align-items: center; }
        header, footer { width: 100%; background: #eee; text-align: center; }
        .menu ul { display: flex; justify-content: center; list-style: none; gap: 20px; padding: 20px; background: #1e1e1e; }
        .menu a { color: white; text-decoration: none; font-weight: bold; }
        .calendrier-container { width: 90%; max-width: 500px; padding: 20px; }
        .match-card { background: #999; border: 2px solid #333; border-radius: 20px; margin-bottom: 20px; display: flex; justify-content: space-around; align-items: center; padding: 15px; height: 120px; }
        .logo-equipe { width: 80px; height: 80px; object-fit: cover; border-radius: 10px; }
        .score-label { font-weight: bold; color: white; }
        .down { background: #f6ec28; padding: 40px; width: 100%; text-align: center; }
        .reseau img { width: 50px; height: auto; }
    </style>
</head>
<body>

    <header>
        <nav class="menu">
            <ul>
                <li><a href="#">Club</a></li>
                <li><a href="#">Boutique</a></li>
                <li><a href="#">Calendrier</a></li>
                <li><img src="image/logo/logo_StMedard.png" alt="Logo" width="80"></li>
                <li><a href="#">Actualités</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
    </header>

    <main class="calendrier-container">
        <h1 style="text-align:center;">Calendrier des matchs</h1>

        <div class="match-card">
            <img src="31997446-terrain-basket.webp" alt="Domicile" class="logo-equipe">
            <div class="score-label">SCORE</div>
            <img src="logo-basket.png" alt="Extérieur" class="logo-equipe">
        </div>

        <div class="match-card">
            <img src="31997446-terrain-basket.webp" alt="Domicile" class="logo-equipe">
            <div class="score-label">SCORE</div>
            <img src="logo-basket.png" alt="Extérieur" class="logo-equipe">
        </div>
    </main>

    <footer>
        <section class="down">
            <div class="reseau">
                <img src="image/icone/facebook.png" alt="FB">
                <img src="image/icone/instagram.png" alt="IG">
            </div>
            <p><strong>© 2026 Saint-Médard Basket</strong></p>
        </section>
    </footer>

</body>
</html>