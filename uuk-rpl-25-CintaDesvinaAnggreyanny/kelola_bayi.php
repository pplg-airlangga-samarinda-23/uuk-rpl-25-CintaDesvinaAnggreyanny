<?php session_start(); if($_SESSION['role'] != 'kader') header('Location: index.php'); include 'config.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
    <h2>Data Bayi</h2>
    <table class="table">
        <tr><th>Nama</th><th>Tanggal Lahir</th><th>Jenis Kelamin</th></tr>
        <?php
        $user_id = $_SESSION['user_id'];
        $result = mysqli_query($conn, "SELECT * FROM bayi WHERE created_by='$user_id'");
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>
                <td>{$row['nama']}</td>
                <td>{$row['tgl_lahir']}</td>
                <td>{$row['jenis_kelamin']}</td>
            </tr>";
        }
        ?>
    </table>
    <button onclick="location.href='tambah_bayi.php'">Tambah Data Bayi Baru</button>
</div>
</body>
</html>