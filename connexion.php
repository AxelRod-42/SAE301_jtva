<?php 

session_start();

// 1. CONNEXION À LA BASE DE DONNÉES
$host = 'localhost';
$dbname = 'stmedard_basket'; // /!\ À MODIFIER AVEC TON NOM DE BDD
$user = 'root';
$pass = ''; // Sur Mac (MAMP), c'est souvent 'root'

try {
    $db = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ATTR_ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

