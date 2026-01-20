<?php

class Database {
  private static ?PDO $db = null;

  public static function getConnection(): PDO {
    if (self::$db === null) {
      $host = "localhost";
      $dbname = "stmedard_basket";
      $user = "root";
      $pass = "";

      self::$db = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $user,
        $pass,
        [
          PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
          PDO::ATTR_EMULATE_PREPARES => false,
        ]
      );
    }
    return self::$db;
  }
}