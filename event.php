<?php

require_once __DIR__ . "/database.php";


class Event
{
    private int $id;
    private string $nom_event;
    private string $date_event;
    private string $description;
    private string $type;

    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getConnection();
    }

    /* =====================
       Méthodes métier
    ====================== */

    public function getUpcoming(): array
    {
        $sql = "SELECT * FROM events WHERE date_event >= CURDATE()";
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

    public function getNomEvent(): string
    {
        return $this->nom_event;
    }

    public function setNomEvent(string $nom_event): void
    {
        $this->nom_event = $nom_event;
    }

    public function getDateEvent(): string
    {
        return $this->date_event;
    }

    public function setDateEvent(string $date_event): void
    {
        $this->date_event = $date_event;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    public function getType(): string
    {
        return $this->type;
    }

    public function setType(string $type): void
    {
        $this->type = $type;
    }
}
