<?php

require_once "Team.php";

$team = new Team();
$teams = $team->getAll();

print_r($teams);
