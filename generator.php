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
$modul = $_POST['modul'];

if ($perspektive == "Rechts") {
  $tpl = file_get_contents("Right.tpl");
} else {
  $tpl = file_get_contents("Left.tpl");
}

  // Situation
  $tpl = preg_replace('@%SNR%@is', $situation, $tpl);
  $tpl = preg_replace('@%ANZAHL%@is', $anzahl, $tpl);
  $tpl = preg_replace('@%MODUL%@is', $modul, $tpl);

  $offsetCount = preg_match_all ('@%(\d*)%@', $tpl, $zahlenwerte);

  for ($i=0; $i<$offsetCount; $i++) {
    $replacement = $zahlenwerte[0][$i];
    $value = $zahlenwerte[1][$i];

    $newValue = $value + ($situation - 1) * $offset;

    $tpl = str_replace($replacement, $newValue, $tpl);
  }

 $spurwechselAnzahl= preg_match_all ('@\$(\d*)\$@', $tpl, $spurwechselwerte);

for ($i=0; $i<$spurwechselAnzahl; $i++) {
  $replacement = $spurwechselwerte[0][$i];
  $value = $spurwechselwerte[1][$i];

  $newValue = $value  + $offset * ($situation - 1) + ($anzahl - 2)*100;

  $tpl = str_replace($replacement, $newValue, $tpl);
}

  // Ausgabe
  echo "<pre>".$tpl."</pre>";



