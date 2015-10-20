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
$offset = $_POST['offset'];

if ($perspektive == "Rechts") {
  $tpl = file_get_contents("Left.tpl");

  // Situation
  $tpl = preg_replace('@%SNR%@is', $situation, $tpl);
  $tpl = preg_replace('@%ANZAHL%@is', $anzahl, $tpl);

  echo $tpl;

  $zahlenwerte = preg_match_all ('@%(\d*)%@', $tpl);

  for ($i=0; $i<count($zahlenwerte[0]); $i++) {
    $replacement = $zahlenwerte[0][$i];
    $value = $zahlenwerte[1][$i];

    $newValue = $value + $offset;

    $tpl = str_replace($replacement, $newValue, $tpl);
  }

  echo $tpl;
}



if ($perspektive == "Links") {

  $tpl = file_get_contents("Right.tpl");

}

