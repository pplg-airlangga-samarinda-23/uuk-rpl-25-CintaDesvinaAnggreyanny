<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start(); 
if($_SESSION['role'] != 'kader') header('Location: index.php');
include 'config.php';

if(isset($_POST['tambah'])) {
    $nama = $_POST['nama'];
    $tgl_lahir = $_POST['tgl_lahir'];
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $created_by = $_SESSION['user_id'];

    mysqli_query($conn, "INSERT INTO bayi (nama, tgl_lahir, jenis_kelamin, created_by) VALUES ('$nama','$tgl_lahir','$jenis_kelamin','$created_by')");
    header('Location: kelola_bayi.php');
}
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
    <h2>Tambah Data Bayi</h2>
    <form method="POST">
        <label>Nama Bayi</label>
        <input type="text" name="nama" required>

        <label>Tanggal Lahir</label>
        <input type="date" name="tgl_lahir" required>

        <label>Jenis Kelamin</label>
        <select name="jenis_kelamin" required>
            <option value="Perempuan">Perempuan</option>
            <option value="Laki-laki">Laki-laki</option>
        </select>

        <button type="submit" name="tambah">Simpan</button>
    </form>
    <a href="kelola_bayi.php">Kembali</a>
</div>
</body>
</html>