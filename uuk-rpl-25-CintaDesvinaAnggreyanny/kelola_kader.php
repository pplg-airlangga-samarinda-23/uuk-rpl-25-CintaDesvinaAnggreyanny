<?php session_start(); if($_SESSION['role'] != 'admin') header('Location: index.php'); include 'config.php'; ?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
    <h2>Kelola Data Kader</h2>
    <table class="table">
        <tr><th>Nama</th><th>Username</th><th>Wilayah</th><th>Aksi</th></tr>
        <?php
        $result = mysqli_query($conn, "SELECT kader.*, users.username FROM kader JOIN users ON kader.user_id = users.id");
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>
                <td>{$row['nama']}</td>
                <td>{$row['username']}</td>
                <td>{$row['wilayah']}</td>
                <td><a href='#'>Edit</a> | <a href='#'>Hapus</a></td>
            </tr>";
        }
        ?>
    </table>
    <a href="admin.php">Kembali</a>
</div>
</body>
</html>