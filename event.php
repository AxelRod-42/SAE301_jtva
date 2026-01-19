<?php

require_once __DIR__ . "/database.php";

class Event
{
    private PDO $db;

    public function __construct()
    {
        $this->db = Database::getConnection();
    }

    public function getAllEvents(): array
    {
        $sql = "
            SELECT *
            FROM evenements
            ORDER BY debut ASC
        ";

        return $this->db->query($sql)->fetchAll();
    }
}
