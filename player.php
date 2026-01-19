<?php

require_once __DIR__ . "/database.php";


class Player
{
    private int $id;
    private string $nom;
    private string $prenom;
    private string $date_naissance;
    private string $num_licence;
    private string $statut_dossier;
    private int $team_id;

    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getConnection();
    }

    /* =====================
       Méthodes métier
    ====================== */

    public function getByTeam(int $teamId): array
    {
        $sql = "SELECT * FROM players WHERE team_id = :team_id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['team_id' => $teamId]);
        return $stmt->fetchAll();
    }

    /* =====================
       Getters / Setters
    ====================== */

    public function getId(): int
    {
        return $this->id;
    }

    // Pas de setter pour l'id

    public function getNom(): string
    {
        return $this->nom;
    }

    public function setNom(string $nom): void
    {
        $this->nom = $nom;
    }

    public function getPrenom(): string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): void
    {
        $this->prenom = $prenom;
    }

    public function getDateNaissance(): string
    {
        return $this->date_naissance;
    }

    public function setDateNaissance(string $date_naissance): void
    {
        $this->date_naissance = $date_naissance;
    }

    public function getNumLicence(): string
    {
        return $this->num_licence;
    }

    public function setNumLicence(string $num_licence): void
    {
        $this->num_licence = $num_licence;
    }

    public function getStatutDossier(): string
    {
        return $this->statut_dossier;
    }

    public function setStatutDossier(string $statut_dossier): void
    {
        $this->statut_dossier = $statut_dossier;
    }

    public function getTeamId(): int
    {
        return $this->team_id;
    }

    public function setTeamId(int $team_id): void
    {
        $this->team_id = $team_id;
    }
}
