<?php

require_once "Database.php";

class User
{
    private int $id;
    private string $email;
    private string $password;
    private string $role;

    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getConnection();
    }

    /* =====================
       Méthodes métier
    ====================== */

    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }

    public function getById(int $id): ?array
    {
        $sql = "SELECT * FROM users WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id' => $id]);
        return $stmt->fetch() ?: null;
    }

    /* =====================
       Getters / Setters
    ====================== */

    public function getId(): int
    {
        return $this->id;
    }

    // Pas de setter pour l'id (bonne pratique)

    public function getEmail(): string
    {
        return $this->email;
    }

    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): void
    {
        $this->password = $password;
    }

    public function getRole(): string
    {
        return $this->role;
    }

    public function setRole(string $role): void
    {
        $this->role = $role;
    }
}
