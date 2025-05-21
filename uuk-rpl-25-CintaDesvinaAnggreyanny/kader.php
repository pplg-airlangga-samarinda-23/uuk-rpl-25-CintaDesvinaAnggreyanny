<?php session_start(); if($_SESSION['role'] != 'kader') header('Location: index.php'); ?>
<!DOCTYPE html>
<html>
<head>
   <link rel="stylesheet" type="text/css" href="style.css">
    <script src="java.js"></script>
</head>
<body>
<div class="container">
    <h2>Dashboard Kader</h2>
    <button onclick="location.href='kelola_bayi.php'">Kelola Bayi</button>
    <button onclick="location.href='tambah_bayi.php'">Catat Pertumbuhan</button>
    <button onclick="logout()">Logout</button>
</div>
</body>
</html>