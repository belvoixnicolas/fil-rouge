<?php
include $_SERVER['DOCUMENT_ROOT'] . '/include/connect.php';
include $_SERVER['DOCUMENT_ROOT'] . '/include/secur.php';

if (isset($_POST['test'])) {
    $_SERVER["REMOTE_ADDR"];
}

$ip = $_SERVER["REMOTE_ADDR"];
$salt = cryptageip($ip);
$mdp = $salt . 'mot de passe';
$mdp = md5($mdp);
echo $mdp;
?>

<form action="<?php $_SERVER['SCRIPT_FILENAME']; ?>" method="post">
    <input type="text" name="test">
    <input type="submit" value="envoyer">
</form>