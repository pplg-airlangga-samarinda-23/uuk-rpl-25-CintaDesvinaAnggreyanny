<?php
include 'config.php';

$password_baru = password_hash("kader321", PASSWORD_DEFAULT);

mysqli_query($conn, "UPDATE users SET password='$password_baru' WHERE username='ghani'");

echo "Password kader321 sudah disimpan sebagai hash!";
?>