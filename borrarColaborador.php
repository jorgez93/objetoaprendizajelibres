<?php
   ## method to file upload in db
    require_once "pdo.php";
    session_start();

   
			
		if($_SESSION['userType'] == 'prof'){
			$sql2 = "delete from colaborador where idUsuario = :idProfesor";
			$stmt2 = $pdo->prepare($sql2);
			$stmt2->execute(array(':idProfesor' => $_SESSION['userID']));
						
			
			}
			else{
			$sql2 = "delete from colaborador where idUsuario = :idEstudiante";
			$stmt2 = $pdo->prepare($sql2);
			$stmt2->execute(array(':idEstudiante' => $_SESSION['userID']));
			
			}
			
			
?>
