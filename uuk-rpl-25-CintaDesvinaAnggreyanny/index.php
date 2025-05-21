<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script src="java.js"></script>
</head>
<body>
<div class="container">
    <h3>Login</h3>
    <form method="POST">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit" name="login">Login</button>
    </form>

    <?php
    if(isset($_POST['login'])) {
        include 'config.php';
        $username = $_POST['username'];
        $password = $_POST['password'];

        $query = mysqli_query($conn, "SELECT * FROM users WHERE username='$username'");
        if(mysqli_num_rows($query) == 1) {
            $user = mysqli_fetch_assoc($query);
            if(password_verify($password, $user['password'])) {
                $_SESSION['role'] = $user['role'];
                $_SESSION['user_id'] = $user['id'];

                if($user['role'] == 'admin') {
                    header('Location: admin.php');
                } else {
                    header('Location: kader.php');
                }
            } else {
                echo "<p>Password salah!</p>";
            }
        } else {
            echo "<p>Username tidak ditemukan!</p>";
        }
    }
    ?>

</div>
</body>
</html>