<?php
require_once "pdo.php";
    session_start();
    $idbl=intval($_GET['idbloge']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    require "head.php"; //la funcion requiere en cada script toma la funcionalidad de dicho script y lo replica en este documento. Sirve para codigo limpio
  ?>

</head>
<style>
  
  #post {
    position: absolute;
    margin-left: 100px;
    margin-right: -100px;

  }
  textarea{
   background-color: #7B9BA6;
  }
  ::placeholder{
    color: darkslategrey;
    opacity: 1;
  }
  #post{
  	width: 100%;
  	height: 100px;
  	border-radius: 10px;
  }

 #boton{
  background : url("publish.png") no-repeat center center;
  width : 72px;
  height :72px;
  margin-left: 12px;
  border : none;
  color : transparent;
  }
  #boton:hover{
  background-color: white;
  }
  #imagen:hover{
  background-color: #2E6B9E;
  }
</style>

<body class="fixed-nav sticky-footer bg-dark" id="page-top" style="background-color: #415B76;">
  <?php
    require "navbar.php";
  ?>
  <div class="content-wrapper" style="background-color: #415B76">
    <?php //En esta parte el $_SESSION[] succes controla que un usuario se haya logueado correctamente
      if ( isset($_SESSION["success"]) ) {
          echo('<div class="alert alert-success alert-dismissable">');
          echo('<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>');
          echo('<strong>Ingreso Correcto!</strong> Ahora puede usar el sistema.');
          echo('</div>');
          unset($_SESSION["success"]);
      }

      //esta parte del codigo es el anuncia cuando un usuario se registro correctamente
      //<button>Probando <i class="fas fa-play"></i></button>
      if ( isset($_SESSION["reg"]) ) {
        echo('<div class="alert alert-success alert-dismissable">');
        echo('<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>');
        echo($_SESSION["reg"]);
        echo('</div>');
        unset($_SESSION["reg"]);
      }
    ?>
	  <div class="page-header" align="center" id=tittle; style="background-color: #233656;">
      <h1 style="color: white;"> Bienvenido al Foro</h1>
          <img src="images/logoEPN.png" alt="" style="width: 60px;height: 60px">

	  </div>
    <form  method="post" enctype="multipart/form-data">
      <section class="main row">
    <div class="form-group col-md-3" style="margin-right: 3%" >
			<h2 style="left: 10%;color: white;position: relative;">Asunto:</h2>
			<textarea  class="formInput" id="post" style="position: relative;width: 150px;height: 50px;border-radius: 10px" name=contenido placeholder="Escriba el asunto"></textarea>
    </div>
	<div class="form-group col-md-10" style="margin-left: 2%;" >
			<h2 style="color: white;position: relative;">Mensaje:</h2>
			<textarea  class="formInput" id="post" style="position: relative;width: 90%;height: 100px;border-radius: 10px;" name=mensaje placeholder="Escriba el mensaje"></textarea>
    </div>
   
    <div name="contenedor" style="position: relative;">
    <div  class="form-group col-md-3" style="margin-left: 2%;float: left;">
      <img type="image" src="sub.png" name="im" style="float: left;margin-left: 3%; width: 52px;height: 52px;">
    </div>
	
	<div class="form-group" style="height: 160px;" >
			<h5 style="color: white" >Seleccionar un archivo:</h5>
      <div class="col-md-1" style="width: 9%;float: left;color: white" align="center">
      <input type="file" name="adjunto" multiple>

    <div name="contenedor" style="position: relative;top: 10px">
    <div style="width: 100px; height: 52px; margin-left: 3%;position: relative;float: left;">
    <form action="/action_page.php" method="post">
          <input style="box-sizing:border-box;" id="file-input" name="prev" type="file"  accept="image/x-png,image/gif,image/jpeg" />
    </form>
    </div>
</div>
</div>
      

    <div class="col-md-3" style="position: relative; margin-left: 158%;">
       <input type="submit" name=enviar id="boton">
    </div>
    </section>
</div>
    
    
    <?php
    $rol="";

    if ( $_SESSION["userType"] == 'prof' ) {
      $rol="prof";
    }
    if ( $_SESSION["userType"] == 'est' ) {
      $rol="est";
    }
      if(isset($_POST['enviar']) && isset($_POST['contenido'])){
                  $contenido=$_POST['contenido'];
				          $mensaje=$_POST['mensaje'];
                  $imagetmp="";
                  $imgn="";
                  if(!empty($_FILES['prev']['name'])){
                      $imgn=($_FILES['prev']['name']);
                      $imgn1=($_FILES['prev']['tmp_name']);
                      $imagenN=addslashes($_FILES['prev']['tmp_name']);
                      $imagetmp=(file_get_contents($imagenN));
                    }

                  $flname=$_FILES['adjunto']['name'];
                  $newname=$flname;
                  $newloc="files/".$newname;

                  
                  if($idbl==-1){

                  if (move_uploaded_file($_FILES['adjunto']['tmp_name'], $newloc))
                  {

                      move_uploaded_file($_FILES['adjunto']['tmp_name'], $newname);
                      $sql = "INSERT INTO foro (contenido, idusuario,rol,imagen,imagename,asunto,archivoname) VALUES (:post, :idusuario,:cargo,:image,:imgname,:asunto,:filename)";
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':idusuario' => $_SESSION["userID"],':cargo'=>$rol,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido,':filename'=>$newname));
                      }catch(PDOException $e){
                          echo $e;
                      }
                  }else{
                      $sql = "INSERT INTO foro (contenido, idusuario,rol,imagen,imagename,asunto) VALUES (:post, :idusuario,:cargo,:image,:imgname,:asunto)";
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':idusuario' => $_SESSION["userID"],':cargo'=>$rol,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido));
                      }catch(PDOException $e){

                      }
                  }
                }else{
                  if (move_uploaded_file($_FILES['adjunto']['tmp_name'], $newname))
                  {
                      $sql = "UPDATE foro SET contenido=:post,imagen=:image,imagename=:imgname,asunto=:asunto,archivoname=:filename where idpost=".$idbl;
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido,':filename'=>$newname));
                      }catch(PDOException $e){
                          echo $e;
                      }
                  }else{
                      $sql = "UPDATE foro SET contenido=:post,imagen=:image,imagename=:imgname,asunto=:asunto where idpost=".$idbl;
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido));
                      }catch(PDOException $e){
                          echo $e;
                      }
                  }
                }
               
              

             }
      
    ?>
    </form>
    </div>
    <?php
      require "footer.php";
    ?>

  
</body>

</html>