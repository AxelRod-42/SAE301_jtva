<?php


class Database
{
    private static ?PDO $pdo = null;

    private const HOST = "localhost";
    private const DBNAME = "stmedard_basket";
    private const USER = "root";
    private const PASSWORD = "";

    private function __construct() {}

    public static function getConnection(): PDO
    {
        if (self::$pdo === null) {
            self::$pdo = new PDO(
                "mysql:host=localhost;dbname=stmedard_basket;charset=utf8" . self::HOST . ";dbname=" . self::DBNAME . ";charset=utf8",
                self::USER,
                self::PASSWORD,
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                ]
            );
        }
        return self::$pdo;
    }
}
