<?php
   ## method to file upload in db
    require_once "pdo.php";
    session_start();

    $fileName = $_FILES["file1"]["name"]; // The file name
    $fileTmpLoc = $_FILES["file1"]["tmp_name"]; // File in the PHP tmp folder
    $fileType = $_FILES["file1"]["type"]; // The type of file it is
    $fileSize = $_FILES["file1"]["size"]; // File size in bytes
    $fileErrorMsg = $_FILES["file1"]["error"]; // 0 for false... and 1 for true

    if (!$fileTmpLoc) { // if file not chosen
        echo "ERROR: Please browse for a file before clicking the upload button.";
        exit();
    }

    if(move_uploaded_file($fileTmpLoc, "zip/$fileName")){
        echo "$fileName upload is complete";
        $sql = "INSERT INTO objetoaprendizaje (nombre, autor, descripcion, fecha, p_clave, institucion, tamano, tipo, ruta_zip, idProfesor)
                VALUES (:nombre, :autor, :descripcion, :fecha, :p_clave, :institucion, :fileSize, :tipo, :ruta_zip, :idProfesor)";
        $stmt = $pdo->prepare($sql);
        $size = $fileSize . ' bytes';
        $tipo = 'WinRAR ZIP';
        $stmt->execute(array(
            ':nombre' => $_POST["nombreOA"],
            ':autor' => $_POST["autorOA"],
            ':descripcion' => $_POST["descripcion"],
            ':fecha' => $_POST["fechaCreacionOA"],
            ':p_clave' => $_POST["palabraClaveOA"],
            ':institucion' => $_POST["institucionOA"],
            ':fileSize' => $size,
            ':tipo' => $tipo,
            ':ruta_zip' => 'zip/'.$fileName,
            ':idProfesor' => $_SESSION['userID']));
       
       if($_SESSION['userType'] == 'prof'){
			$sql2 = "select * from profesor where idProfesor = :idProfesor";
			$stmt2 = $pdo->prepare($sql2);
			$stmt2->execute(array(':idProfesor' => $_SESSION['userID']));
			
			}
			else{
			$sql2 = "select * from estudiante where idEstudiante = :idEstudiante";
			$stmt2 = $pdo->prepare($sql2);
			$stmt2->execute(array(':idEstudiante' => $_SESSION['userID']));
			}
			
			foreach($stmt2 as $datos){
                            if($_SESSION['userType']=='est'){
								$cedula= $datos['cedulaEst'];
								$nombres= $datos['nombresEst'];
								$apellidos= $datos['apellidosEst'];
								$correo= $datos['correoEst'];
								$idColaborador = $datos['idcolaborador'];
                            }else{
                                $cedula= $datos['cedulaProf'];
								$nombres= $datos['nombresProf'];
								$apellidos= $datos['apellidosProf'];
								$correo= $datos['correoProf'];
								$idColaborador = $datos['idcolaborador'];	
                            }
                        }
						
			if($idColaborador === NULL){
				
				$sql3 = "INSERT INTO colaborador (cedula, nombres, apellidos, correo, idUsuario) VALUES(:cedula, :nombres, :apellidos, :correo,:idUsuario)";
		
				$stmt3 = $pdo->prepare($sql3);
				$stmt3->execute(
				array(':cedula' => $cedula,
				':nombres' => $nombres,
				':apellidos' => $apellidos,
				':correo' => $correo,
				':idUsuario'=> $_SESSION['userID'],
				));
				
				
				if($_SESSION['userType'] == 'prof'){
				$sql4 = "SELECT * FROM colaborador ORDER BY idcolaborador DESC LIMIT 1";
				$stmt4 = $pdo->prepare($sql4);
				$stmt4->execute();
				foreach($stmt4 as $datos2){
				$idColaborador = $datos2['idcolaborador'];
				}
				
				$sql5 = "UPDATE profesor set idcolaborador = :idColaborador where idProfesor = :idProfesor";
				$stmt5 = $pdo->prepare($sql5);
				$stmt5->execute(array(
				':idColaborador' => $idColaborador,
				':idProfesor' => $_SESSION['userID']));
			
			}
			else{
				$sql4 = "SELECT * FROM colaborador ORDER BY idcolaborador DESC LIMIT 1";
				$stmt4 = $pdo->prepare($sql4);
				$stmt4->execute();
				
				foreach($stmt4 as $datos2){
				$idColaborador = $datos2['idcolaborador'];
				}
				
				$sql5 = "UPDATE estudiante set idcolaborador = :idColaborador where idEstudiante = :idEstudiante";
				$stmt5 = $pdo->prepare($sql5);
				$stmt5->execute(array(
				':idColaborador' => $idColaborador,
				':idEstudiante' => $_SESSION['userID']));
			
			}
				
				
				
				
			}
			
       
    } else {
        echo "move_uploaded_file function failed";
    }
?>
