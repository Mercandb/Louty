<!-- Ce code est super moche mais c'est un exemple pour commencer php -->

<!DOCTYPE html>
<html >
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Rascalou Montéty</title>
      <link rel="shortcut icon" href="index/images/icone_rm.png">
      <meta name="description" content="Rascalou-Montéty - Site Histoire et Famille - France.">
      <meta name="keywords" content="rascalou, montéty, montety, 1914, 1918">
      <meta name="author" content="Brigitte Mercandalli, Jonathan Mercandalli">
      <meta name="geo.placename" content="Paris, France">
      <meta name="theme-color" content="#AD1457">
      <link rel="stylesheet" href="index/css/materialize.min.css">
      <link rel="stylesheet" href="index/css/style.css">
      <link rel="stylesheet" href="index/css/persist-title.css">
   </head>
   <body>

		<?php
		try {
			// On se connecte à MySQL
			$bdd = new PDO('mysql:host=localhost;dbname=louty;charset=utf8', 'root', '');
		}
		catch(Exception $e) {
			// En cas d'erreur, on affiche un message et on arrête tout
		    die('Erreur : '.$e->getMessage());
		}

		// Si tout va bien, on peut continuer

		// On récupère tout le contenu de la table user
		$reponse = $bdd->query('SELECT * FROM user');

		// On affiche chaque entrée une à une
		while ($donnees = $reponse->fetch()) {
		?>
		    <p>
		    <strong>Username</strong> : <?php echo $donnees['username']; ?><br />    
		   	</p>
		<?php
		}

		// On récupère toute les images
		$reponse = $bdd->query('SELECT * FROM file');
		$bdd = null;

		// On affiche chaque entrée une à une
		while ($donnees = $reponse->fetch()) {
			echo '<img src="' . $donnees['url'] . '" width="150">';			
		}

		$reponse->closeCursor(); // Termine le traitement de la requête

		?>

		<form action="upload.php" method="post" enctype="multipart/form-data">
		    Select image to upload:
		    <input type="file" name="file" id="fileToUpload">
		    <input type="submit" value="Upload Image" name="submit">
		</form>


   </body>
</html>      