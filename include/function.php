<?php
function age($date) {
    $jour = date('d');
    $mois = date('m');
    $anner = date('Y');

    $jourN = $date[8] . $date[9];
    $moisN = $date[5] . $date[6];
    $annerN = $date[0] . $date[1] . $date[2] . $date[3];

    $age = $anner - $annerN;

    if ($moisN > $mois) {
        $age--;
    }elseif ($mois == $moisN && $jourN > $jour) {
        $age--;
    }


    return array('jour' => $jourN, 'mois' => $moisN, 'anner' => $moisN, 'age' => $age);
}
?>