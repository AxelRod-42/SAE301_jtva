<?php

require_once __DIR__ . "/database.php";


class MatchGame
{
    private int $id;
    private string $date_match;
    private string $adversaire;
    private string $lieu;
    private int $score_smb;
    private int $score_adv;
    private string $resume;
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
        $sql = "SELECT * FROM matchs WHERE team_id = :team_id";
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

    public function getDateMatch(): string
    {
        return $this->date_match;
    }

    public function setDateMatch(string $date_match): void
    {
        $this->date_match = $date_match;
    }

    public function getAdversaire(): string
    {
        return $this->adversaire;
    }

    public function setAdversaire(string $adversaire): void
    {
        $this->adversaire = $adversaire;
    }

    public function getLieu(): string
    {
        return $this->lieu;
    }

    public function setLieu(string $lieu): void
    {
        $this->lieu = $lieu;
    }

    public function getScoreSmb(): int
    {
        return $this->score_smb;
    }

    public function setScoreSmb(int $score_smb): void
    {
        $this->score_smb = $score_smb;
    }

    public function getScoreAdv(): int
    {
        return $this->score_adv;
    }

    public function setScoreAdv(int $score_adv): void
    {
        $this->score_adv = $score_adv;
    }

    public function getResume(): string
    {
        return $this->resume;
    }

    public function setResume(string $resume): void
    {
        $this->resume = $resume;
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
