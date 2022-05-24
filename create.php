<?php

    if (
      $_POST &&
      isset($_POST['cheese_name']) && $_POST['cheese_name'] !== '' &&
      isset($_POST['family']) && $_POST['family'] !== '' && 
      isset($_POST['milk']) && $_POST['milk'] !== '' &&
      isset($_POST['sigle']) && $_POST['sigle']
    ) {
        include('Config/db.php');

        $req = $db->prepare('INSERT INTO fromage(cheese_name, family, milk, sigle) VALUES(:cheese_name, :family, :milk, :sigle)');

        $req->execute([
            'cheese_name' => $_POST['cheese_name'],
            'family' => $_POST['family'],
            'milk' => $_POST['milk'],
            'sigle' => $_POST['sigle']
        ]);

        header('Location: index.php');
        exit;
    } 

    $errors = '';
    if (isset($_POST['name']) && $_POST['name'] === '') {
      $errors .= 'Nom invalide. ';
    }
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <title>Création d'un paquet de céréal</title>
</head>
<body>
    <nav class="teal">
        <div class="nav-wrapper container">
            <a href="#" class="brand-logo">Logo</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="index.php">Liste des céréals</a></li>
                <li><a href="create.php">Création d'un céréal</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1 class="teal-text">Création d'un paquet de céréal</h1>

        <form action="" method="POST">
            Nom : <input type="text" name="name"> <br>
            Famille : <input type="text" name="surname"> <br>
            Lait : <input type="text" name="cheese_name" ><br>
            Sigle : <input type="text" name="quantity"> <br>

            <span class="red white-text"><?php echo $errors; ?></span> <br>

            <input type="submit" value="Envoyer" class="teal btn">
        </form>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html