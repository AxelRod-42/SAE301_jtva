<?php
// CONFIGURATION
$host = "localhost";
$user = "root";
$pass = "";
$dbname = "stmedard_basket";

// Connexion MySQL
$conn = new mysqli($host, $user, $pass, $dbname);

// Vérification connexion
if ($conn->connect_error) {
    die("Erreur de connexion à la base : " . $conn->connect_error);
}

$message_confirmation = "";

// Traitement du formulaire
if ($_SERVER["REQUEST_METHOD"] === "POST") {

    // Sécurisation des données
    $nom = $conn->real_escape_string($_POST["nom"]);
    $prenom = $conn->real_escape_string($_POST["prenom"]);
    $email = $conn->real_escape_string($_POST["email"]);
    $telephone = $conn->real_escape_string($_POST["telephone"]);
    $genre = $conn->real_escape_string($_POST["genre"]);
    $message = $conn->real_escape_string($_POST["message"]);

    // Insertion en base
    $sql = "INSERT INTO inscriptions (nom, prenom, email, telephone, genre, message)
            VALUES ('$nom', '$prenom', '$email', '$telephone', '$genre', '$message')";

    if ($conn->query($sql) === TRUE) {
        $message_confirmation = "Votre message a bien été envoyé et enregistré.";
    } else {
        $message_confirmation = "Erreur lors de l'enregistrement : " . $conn->error;
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Contact – Saint Médard Basket</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: system-ui, sans-serif;
      background: #f9fafb;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 480px;
      margin: 40px auto;
      padding: 0 16px;
    }

    .contact-tag {
      text-align: center;
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    form {
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    .row {
      display: flex;
      gap: 12px;
    }

    input, select, textarea {
      width: 100%;
      padding: 12px;
      border: 1px solid #d1d5db;
      border-radius: 8px;
      font-size: 14px;
      background: #fff;
    }

    textarea {
      resize: vertical;
      min-height: 120px;
    }

    button {
      padding: 12px;
      background: #111827;
      color: #fff;
      font-size: 14px;
      font-weight: 600;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
    }

    button:hover {
      background: #1f2937;
    }

    .confirmation {
      background: #d1fae5;
      color: #065f46;
      padding: 12px;
      border-radius: 8px;
      margin-bottom: 20px;
      text-align: center;
      font-weight: 600;
    }
  </style>
</head>
<body>

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

</body>
</html>