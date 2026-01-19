<?php
include "../php/connexion.php";

$message_confirmation = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {

  $nom = trim($_POST["nom"] ?? "");
  $prenom = trim($_POST["prenom"] ?? "");
  $email = trim($_POST["email"] ?? "");
  $telephone = trim($_POST["telephone"] ?? "");
  $genre = trim($_POST["genre"] ?? "");
  $message = trim($_POST["message"] ?? "");

  if ($nom && $prenom && $email && $message) {
    $sql = "INSERT INTO inscriptions (nom, prenom, email, telephone, genre, message)
            VALUES (:nom, :prenom, :email, :telephone, :genre, :message)";

    $stmt = $db->prepare($sql);
    $stmt->execute([
      ":nom" => $nom,
      ":prenom" => $prenom,
      ":email" => $email,
      ":telephone" => $telephone,
      ":genre" => $genre,
      ":message" => $message
    ]);

    $message_confirmation = "Votre message a bien été envoyé.";
  } else {
    $message_confirmation = "Veuillez remplir les champs obligatoires.";
  }
}
?>
?>
<!DOCTYPE html>
<html lang="fr">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Accueil - Saint-Médard Basket</title>
      <link rel="stylesheet" href="../CSS/style.css"> <!--Lien vers le css-->
      <link rel="icon" type="image/x-icon" href="../image/logo/favicon.ico"><!--icone du site-->
  </head>
<body>
  <header>
        <section class="top">
            <nav class="menu">
                <ul>
                    <li><a href="club.php">Club</a></li>
                    <li><a href="boutique.php">Boutique</a></li>
                    <li><a href="calendrier.php">Calendrier</a></li>
                    <div class="logo">
                        <a href="../index.php"><img src="../image/logo/logo_StMedard.png" alt="Logo Saint-Médard Basket" width="250" height="200"></a>
                    </div>
                    <li><a href="actualite.php">Actualités</a></li>
                    <li><a href="contact.php">Contact</a></li>
                    <div class="panier">
                        <a href="boutique.php"><img src="../image/icone/panier.png" alt="Panier" width="100" height="100"></a>
                    </div>
                </ul>
            </nav>
        </section>
    </header>

    <main>

      <div class="container">
        <div class="contact-tag">Contact</div>

        <?php if (!empty($message_confirmation)): ?>
          <div class="confirmation"><?= $message_confirmation ?></div>
        <?php endif; ?>

        <form method="POST" action="">

          <div class="row">
            <input type="text" name="nom" placeholder="Nom" required>
            <input type="text" name="prenom" placeholder="Prénom" required>
          </div>

          <div class="row">
            <input type="email" name="email" placeholder="Adresse e-mail" required>
            <input type="tel" name="telephone" placeholder="Téléphone">
          </div>

          <select name="genre" required>
            <option value="homme">Homme</option>
            <option value="femme">Femme</option>
            <option value="autre">Autre</option>
          </select>

          <textarea name="message" placeholder="Message" required></textarea>

          <button type="submit">Envoyer →</button>

        </form>
      </div>
    </main>
    <footer>
        <section class="down">
            <div class="reseau">
                <a href=""><img src="../image/icone/facebook.png" alt="Facebook" width="100" height="100"></a>
                <img src="../image/icone/arrow2.png" alt="flèche" width="100" height="75">
                <img src="../image/icone/arrow.png" alt="flèche" width="100" height="75">
                <a href="https://www.instagram.com/saint.medard.basket/"><img src="../image/icone/instagram.png" alt="Instagram" width="100" height="100"></a>
            </div>
            <br><p><strong>Suivez-nous sur les réseaux sociaux !</strong></p>
            <div class="fil">   
                <p>Page d'accueil</p>
            </div>
            <div class="mentions">
                <hr>
                <p><strong>© 2026 [St Médard Basket].</strong> Tous droits réservés. Mentions légales | Politique de confidentialité</p>
            </div>
        </section>
    </footer>
</body>
</html>