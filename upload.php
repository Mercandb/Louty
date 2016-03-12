<!-- Je sais, ce code est super moche mais c'est un exemple pour commencer php -->

<?php

	$target_dir = "upload/";
	$target_file = $target_dir . basename($_FILES["file"]["name"]);
	$uploadOk = 0; // false
	$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
	    $check = getimagesize($_FILES["file"]["tmp_name"]);
	    if($check !== false) {
	        println("File is an image - " . $check["mime"] . ".");
	        $uploadOk = 1;
	    } else {
	        println("File is not an image.");
	        $uploadOk = 0;
	    }
	}

	// Check if file already exists
	if ($uploadOk == 1 && file_exists($target_file)) {
	    println("Sorry, file already exists.");
	    $uploadOk = 0;
	}

	// Check file size
	if ($uploadOk == 1 && $_FILES["file"]["size"] > 5000000) { // 5Mo
	    println("Sorry, your file is too large.");
	    $uploadOk = 0;
	}

	// Allow certain file formats
	if($uploadOk == 1 && $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
	    println("Sorry, only JPG, JPEG, PNG & GIF files are allowed.");
	    $uploadOk = 0;
	}

	println('File location = ' . $target_file);

	if($uploadOk == 1 &&
		move_uploaded_file($_FILES["file"]["tmp_name"], $target_file) ) {
		println("Cool c'est bon.");

		// Insert on bdd
		try {
			// On se connecte à MySQL
			$bdd = new PDO('mysql:host=localhost;dbname=louty;charset=utf8', 'root', '');
		}
		catch(Exception $e) {
			// En cas d'erreur, on affiche un message et on arrête tout
		    die('Erreur : '.$e->getMessage());
		}
		$req = $bdd->prepare("INSERT INTO File (url) VALUES (:url)");
		$req->bindParam(":url", $target_file, PDO::PARAM_STR);
		$req->execute();
		$req->closeCursor();		
		$bdd = null;

	} else {
		println("Mince c'est pas bon.");
	}

	function println($message) {
		echo "<a>" . $message . "</a><br>";
	}

?>