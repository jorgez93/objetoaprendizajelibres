<?php
  require_once "pdo.php";
require_once "mail.php";

require_once "cedula.php";
  //session_start();
  if ( isset($_POST["cedula"]) && isset($_POST["nombre"]) && isset($_POST["apellido"])
    && isset($_POST["correo"]) && isset($_POST["departamento"]) ) {
    if (validarCedula($_POST["cedula"])) 
    {
        $sql =' CALL registrarProfesor(:cedulaProf, :nombresProf, :apellidosProf, :correoProf, :idDepartamento, :usuarioProf, :pwProf, :bloqueo)';
        $pwd_hash = password_hash($_POST["nombre"], PASSWORD_DEFAULT);
        $stmt = $pdo->prepare($sql);
      $stmt->execute(array(
      ':cedulaProf' => $_POST["cedula"],
      ':nombresProf' => $_POST["nombre"],
      ':apellidosProf' => $_POST["apellido"],
      ':correoProf' => $_POST["correo"],
      ':idDepartamento' => $_POST["departamento"],
      ':usuarioProf' => $_POST["nombre"],
      ':pwProf' => $pwd_hash,
	  ':bloqueo' => 1));
      $_SESSION["reg"] = "Formulario enviado correctamente! El administrador le enviara su usuario y contraseña a su correo.";
      $nameto = $_POST["nombre"] . ' ' . $_POST["apellido"];
      //sendMailA($_POST["correo"], $nameto);
      header( 'Location: index.php' ) ;
     // enviarcorreo($_POST["nombre"],$_POST["apellido"],$_POST["correo"]);
	 sendMail($_POST["correo"], $_POST["apellido"], $_POST["nombre"], $_POST["nombre"]);
      return;
    }
  }
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <?php
    require "head.php";
  ?>
</head>

<body class="bg-dark">
  <div class="container">
    <?php
      if ( isset($_SESSION["errorRE"]) ) {
        echo('<div class="alert alert-danger alert-dismissable">');
        echo('<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>');
        echo('<strong>Error! </strong>' . $_SESSION["errorRE"]);
        echo('</div>');
        unset($_SESSION["errorRE"]);
      }
    ?>
    <div class="card card-register mx-auto mt-5">
      <h4 class="card-header">Editar Colaborador</h4>
      <div class="card-body">
        <form method="post">
          <div class="form-group">
            <label for="cedula">Cédula</label>
            <input class="form-control" id="cedula" name="cedula" type="text" pattern="\d*" maxlength="10" placeholder="Ingrese su cédula" required>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="nombre">Nombres</label>
                <input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" placeholder="Ingrese sus nombres" required>
              </div>
              <div class="col-md-6">
                <label for="apellido">Apellidos</label>
                <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Ingrese sus Apellidos" required>
              </div>
            </div>
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="fechanac">Fecha de Nacimiento</label>
                <input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" placeholder="Ingrese su Fecha de Nacimiento" required>
              </div>
              <div class="col-md-6">
                <label for="genero">Genero</label>
                <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Ingrese su Género" required>
              </div>
            </div>
			
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="calle">Calle</label>
                <input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" placeholder="Ingrese la calle de su dirección" required>
              </div>
              <div class="col-md-6">
                <label for="numcalle">Número de calle</label>
                <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Ingrese número de calle" required>
              </div>
            </div>
			
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="transversal">Transversal</label>
                <input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" placeholder="Ingrese transversal" required>
              </div>
              <div class="col-md-6">
                <label for="numcalle">Sector</label>
                <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Ingrese Sector" required>
              </div>
            </div>
			
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="ciudad">Ciudad</label>
                <input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" placeholder="Ingrese su Ciudad" required>
              </div>
              <div class="col-md-6">
                <label for="tlf">Convencional</label>
                <input class="form-control" id="apellido" name="apellido" type="text" placeholder="Ingrese número de telefono" required>
              </div>
            </div>
			
			
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="correo">Correo</label>
                <input class="form-control" id="nombre" name="nombre" type="text" maxlength="50" placeholder="Ingrese correo" required>
              </div>
            </div>
			
			
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="foto">Foto</label>
                <div class="form-group" style="height: 160px;" >
			<h5 style="color: black;" >Seleccionar un archivo:</h5>
      <div class="col-md-1" style="width: 9%;float: left;color: white" align="center">
      <input type="file" style="color:black;" name="adjunto" multiple>
            </div>