<?php
header("Content-Type: application/json; charset=utf-8");

$data = [
  "title"   => "Halle des sports",
  "address" => "Halle des sports - Basket, 42330 Saint-Médard-en-Forez",
  "zoom"    => 15
];

// Pour éviter une clé Google : on utilise Google Maps “Search” (simple)
$data["embed_url"] = "https://www.google.com/maps?q=" . urlencode($data["address"]) . "&output=embed";

echo json_encode($data);
?>