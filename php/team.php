<?php

require_once __DIR__ . "/database.php";


class Team
{
    private int $id;
    private string $nom;
    private string $genre;
    private string $categorie;
    private int $entraineur_id;

    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getConnection();
    }

    /* =====================
       Méthodes métier
    ====================== */

    public function getAll(): array
    {
        $stmt = $this->db->query("SELECT * FROM teams");
        return $stmt->fetchAll();
    }

    /* =====================
       Getters / Setters
    ====================== */

    public function getId(): int
    {
        return $this->id;
    }

    // Pas de setter pour l'id (bonne pratique)

    public function getNom(): string
    {
        return $this->nom;
    }

    public function setNom(string $nom): void
    {
        $this->nom = $nom;
    }

    public function getGenre(): string
    {
        return $this->genre;
    }

    public function setGenre(string $genre): void
    {
        $this->genre = $genre;
    }

    public function getCategorie(): string
    {
        return $this->categorie;
    }

    public function setCategorie(string $categorie): void
    {
        $this->categorie = $categorie;
    }

    public function getEntraineurId(): int
    {
        return $this->entraineur_id;
    }

    public function setEntraineurId(int $entraineur_id): void
    {
        $this->entraineur_id = $entraineur_id;
    }
}
