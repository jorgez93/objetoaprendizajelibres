<?php
  require_once "pdo.php";

require_once "cedula.php";
  //session_start();
  $done=$_GET['done'];
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

        $qy="SELECT * FROM colaborador WHERE IDUSUARIO=".$_SESSION['userID'];
        $stm=$pdo->prepare($qy);
      $stm->execute();
      foreach($stm as $row){
      $cedula=$row['cedula'];
      $nombre=$row['nombres'];
      $apellido=$row['apellidos'];
      $correo=$row['correo'];
      $bday=$row['fechanacimiento'];
      $sector=$row['sector'];
      $calle=$row['dircalle'];
      $transversal=$row['dirtransversal'];
      $numCalle=$row['dirnumcalle'];
      $convencional=$row['telefono'];
      $ciudad=$row['dirciudad'];
      
        }
      


    ?>
    <div class="card card-register mx-auto mt-5">



      <h4 class="card-header">Registro Colaborador</h4>
      <?php
      if($done==1){
        ?>
      <h5 class="card-header">Registro Exitoso</h5>
      <?php
  }
      ?>
      <div class="card-body">
        <form action="" method="post">
          <div class="form-group">
            <label for="cedula">Cédula</label>
            <input class="form-control" id="cedula" readonly name="cedula" type="text"  placeholder="Ingrese su cédula" value="<?php echo $cedula ?>"  required>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="nombre">Nombres</label>


                <input class="form-control" id="nombre"  name="nombre" type="text" maxlength="50" placeholder="Ingrese sus nombres" value="<?php echo $nombre ?>"  required>
              </div>
              <div class="col-md-6">
                <label for="apellido">Apellidos</label>
                <input class="form-control" id="apellido"  name="apellido" type="text" placeholder="Ingrese sus Apellidos" value="<?php echo $apellido ?>"  required>
              </div>
            </div>
            
      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="fechanac">Fecha de Nacimiento</label>
                <input class="form-control" style="border-radius: 5px;background-color: " type="text" name="bday" readonly value="<?php echo date('d/m/Y',strtotime($bday)) ?>" required>
              </div>
              <div class="col-md-6">
                <label for="genero">Genero</label><br>
                <select class="form-control" style="border-radius: 5px;" name=genero >
                  <option>Masculino</option>
                  <option>Femenino</option>
                  <option>Otro</option>
                </select>
              </div>
            </div>
      
      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="calle">Calle</label>
                <input class="form-control" id="nombre" name="direccion" type="text" maxlength="50" placeholder="Ingrese la calle de su dirección" value="<?php echo $calle ?>"required>
              </div>
              <div class="col-md-6">
                <label for="numcalle">Número de calle</label>
                <input class="form-control" id="apellido" name="calle" type="text" placeholder="Ingrese número de calle" required value="<?php echo $numCalle ?>">
              </div>
            </div>
      
      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="transversal">Transversal</label>
                <input class="form-control" id="nombre" name="transversal" type="text" maxlength="50" placeholder="Ingrese transversal" value="<?php echo $transversal ?>" required>
              </div>
              <div class="col-md-6">
                <label for="numcalle">Sector</label>
                <input class="form-control" id="apellido" name="sector" type="text" placeholder="Ingrese Sector" value="<?php echo $sector ?>" required>
              </div>
            </div>
      
      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="ciudad">Ciudad</label>
                <input class="form-control" id="nombre" name="ciudad" type="text" maxlength="50" placeholder="Ingrese su Ciudad" value="<?php echo $ciudad ?>" required>
              </div>
              <div class="col-md-6">
                <label for="tlf">Convencional</label>
                <input class="form-control" id="apellido" name="convencional" type="text" placeholder="Ingrese número de telefono" value="<?php echo $convencional ?>" required>
              </div>
            </div>
      
      
      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="correo">Correo</label>
                <input class="form-control" id="nombre" name="correo" type="text" maxlength="50" placeholder="Ingrese correo" value="<?php echo $correo ?>" readonly required>
              </div>
            </div>
      
      
      <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="foto">Foto</label>
                <div class="form-group" style="height: 80px;" >
      <h5 style="color: black;" >Seleccionar un archivo:</h5>
      <div class="col-md-1" style="width: 9%;float: left;color: white" align="center">
      <form action="" method="post">
      <input style="box-sizing:border-box;color: black;" id="file-input" name="prev" type="file"  accept="image/x-png,image/gif,image/jpeg" />
      </form>
            </div>
        </div>
      </div>
    </div>
    <button type="submit" class="btn btn-primary btn-lg btn-block" name=enviar id="boton">Publicar</button><br>
    <form>
         <input onClick="window.location.href='index.php'" type="button" class="btn btn-secondary btn-lg btn-block" Value="Cancelar">
      </form>
    <?php
      if (isset($_POST['enviar'])) {
        $cedula=$_POST['cedula'];
        $genero=$_POST['genero'];
          $nombre=$_POST['nombre'];
          $apellido=$_POST['apellido'];
          $corre=$_POST['correo'];
          $bday=$_POST['bday'];
          $ciudad=$_POST['ciudad'];
          $calle=$_POST['direccion'];
          $numCalle=$_POST['calle'];
          $transversal=$_POST['transversal'];
          $convencional=$_POST['convencional'];
          $sector=$_POST['sector'];

          $imagetmp="";
                $imgn="";

                $qry="UPDATE Colaborador SET cedula='".$cedula."', nombres='".$nombre."',apellidos='".$apellido."', fechanacimiento='".$bday."',genero='".$genero."', dircalle='".$calle."',dirnumcalle='".$numCalle."', dirtransversal='".$transversal."', dirciudad='".$ciudad."',telefono='".$convencional."',correo='".$corre."',sector='".$sector."' WHERE idUsuario=".$_SESSION['userID'];

                $stm=$pdo->prepare($qry);
                $stm->execute();
      } 
    ?>
  </form>
  </div>
  <div>
    
  </div>