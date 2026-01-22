<?php
    session_start();
    if (empty($_SESSION["admin"])) {
    header("Location: login.php");
    exit;
    }

    include "../connexion.php";

    $id = $_POST["id"] ?? null;
    if ($id) {
    $stmt = $db->prepare("DELETE FROM inscriptions WHERE id = :id");
    $stmt->execute(["id" => $id]);
    }

    header("Location: inbox.php");
    exit;
?>