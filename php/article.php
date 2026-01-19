<?php

require_once __DIR__ . "/database.php";


class Article
{
    private int $id;
    private string $titre;
    private string $contenu;
    private string $date_creation;
    private string $image_url;
    private int $auteur_id;

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
    $sql = "SELECT * 
            FROM articles 
            WHERE statut = 'publie'
            ORDER BY publie_le DESC";

    return $this->db->query($sql)->fetchAll();
}


    /* =====================
       Getters / Setters
    ====================== */

    public function getId(): int
    {
        return $this->id;
    }

    // Pas de setter pour l'id

    public function getTitre(): string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): void
    {
        $this->titre = $titre;
    }

    public function getContenu(): string
    {
        return $this->contenu;
    }

    public function setContenu(string $contenu): void
    {
        $this->contenu = $contenu;
    }

    public function getDateCreation(): string
    {
        return $this->date_creation;
    }

    public function setDateCreation(string $date_creation): void
    {
        $this->date_creation = $date_creation;
    }

    public function getImageUrl(): string
    {
        return $this->image_url;
    }

    public function setImageUrl(string $image_url): void
    {
        $this->image_url = $image_url;
    }

    public function getAuteurId(): int
    {
        return $this->auteur_id;
    }

    public function setAuteurId(int $auteur_id): void
    {
        $this->auteur_id = $auteur_id;
    }
}
