<?php
/**
 * Created by PhpStorm.
 * User: david_000
 * Date: 20.10.2015
 * Time: 14:56
 */

$situation = $_POST['situation'];
$perspektive =  $_POST['perspektive'];
$anzahl = $_POST['anzahl'];
$offset = 4000;

if ($perspektive == "Rechts") {
  $tpl = file_get_contents("Left.tpl");

  // Situation
  $tpl = preg_replace('@%SNR%@is', $situation, $tpl);

  echo $tpl;

  $tpl =

}



if ($perspektive == "Links") {

  $tpl = file_get_contents("Right.tpl");

}

