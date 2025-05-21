<?php
include 'config.php'; // menghubungkan ke database kamu

// buat akun admin
$username_admin = "admin";
$password_admin = password_hash("admin123", PASSWORD_DEFAULT);
$role_admin = "admin";

mysqli_query($conn, "INSERT INTO users (username, password, role) VALUES ('$username_admin', '$password_admin', '$role_admin')");

// buat akun kader
$username_kader = "ghani";
$password_kader = password_hash("kader123", PASSWORD_DEFAULT);
$role_kader = "kader";

mysqli_query($conn, "INSERT INTO users (username, password, role) VALUES ('$username_kader', '$password_kader', '$role_kader')");

echo "Berhasil membuat akun admin dan kader!";
?>