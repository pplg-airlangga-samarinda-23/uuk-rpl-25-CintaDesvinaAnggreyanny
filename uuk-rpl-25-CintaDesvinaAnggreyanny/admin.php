<?php session_start(); if($_SESSION['role'] != 'admin') header('Location: index.php'); ?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="java.js"></script>
</head>
<body>
<div class="container">
    <h2>Dashboard Admin</h2>
    <button onclick="location.href='kelola_kader.php'">Kelola Data Kader</button>
    <button onclick="logout()">Logout</button>
</div>
</body>
</html>