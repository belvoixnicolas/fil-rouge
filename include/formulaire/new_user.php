<?php
include $_SERVER['DOCUMENT_ROOT'] . '/include/connect.php';
include $_SERVER['DOCUMENT_ROOT'] . '/include/secur.php';
include $_SERVER['DOCUMENT_ROOT'] . '/include/function.php';

if (isset($_POST['test'])) {
    $_SERVER["REMOTE_ADDR"];
}

$ip = $_SERVER["REMOTE_ADDR"];
$salt = cryptageip($ip);
$mdp = $salt . 'mot de passe';
$mdp = hash('sha512', $mdp);
echo $mdp;

$date = age($_POST['date']);
echo $_POST['date'];

echo '<p>' . $date['jour'] . '/' . $date['mois'] . '/' . $date['anner'] . ' qui font ' . $date['age'] . 'ans.';  
?>

<form action="<?php $_SERVER['SCRIPT_FILENAME']; ?>" method="post">
    <input type="text" name="test">
    <input type="date" name="date">
    <input type="submit" value="envoyer">
</form>