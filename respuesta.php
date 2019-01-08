<?php
require_once "pdo.php";
    session_start();
    $idbl=intval($_GET['idresp']);
    $idforo=intval($_GET['idbloge']);
    if(isset($_GET['iduss'])){
    $iduss=intval($_GET['iduss']);  
    }
    

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    require "head.php"; //la funcion requiere en cada script toma la funcionalidad de dicho script y lo replica en este documento. Sirve para codigo limpio
  ?>

</head>
<style>
  #tittle {background-image: url("fondo.jpg");
          padding: 12px 20px 12px 40px;

  }
  #post {
    position: absolute;
    margin-left: 100px;
    margin-right: -100px;

  }
  textarea{
   background-color: white;
   border:solid;
   border-color: grey;
   padding: 5px;
  }
  ::placeholder{
    color: darkslategrey;
    opacity: 1;
  }

 
  #imagen:hover{
  background-color: #2E6B9E;
  }
</style>



<body class="fixed-nav sticky-footer bg-dark" id="page-top" style="background-color: #415B76;">
  <?php
    require "navbar.php";
  ?>
  <div class="content-wrapper" style="background-color: #f2f2f2">
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
	  <div class="page-header" id=tittle; style="background-color: #CDD6D5;">
      <h1 style="color: black;margin-left: 2%;">Responder</h1>
          <img src="images/logoEPN.png" alt="" style="width: 60px;height: 60px;margin-left: 2%;">

    </div>
    <form  method="post" enctype="multipart/form-data">
      <section class="main row">
    <div name="contenedor" style="position: relative;top: 10px">
	<div class="form-group col-md-12" style="margin-left: 2%;" >
      <h2 style="color: black;position: relative;">Mensaje:</h2>
      <textarea  class="formInput" id="post" style="position: relative;width: 100%;height: 100px;border-radius: 10px;" name=mensaje placeholder="Escriba el mensaje"><?php 
          if($idbl!=-1){
              $sql = 'SELECT * FROM respuesta WHERE idrespuesta='.$idbl;
              $stmt=$pdo->prepare($sql);
              $stmt->execute();
              foreach ($stmt as $datos) {
                  echo $datos['contenido'];
              }
          }
        ?></textarea>
    </div>
    <div name="contenedor" style="position: relative;">
    <div  class="form-group col-md-3" style="margin-left: 2%;float: left;">
      <img type="image" src="sub.png" name="im" style="float: left;margin-left: 3%; width: 52px;height: 52px;">
    </div>
  
  <div class="form-group" style="height: 160px;" >
      <h5 style="color: black" >Seleccionar un archivo:</h5>
      <div class="col-md-1" style="width: 9%;float: left;color: white" align="center">
      <input type="file" style="color: black;" name="adjunto" multiple>

    <div name="contenedor" style="position: relative;top: 10px">
    <div  style="width: 100px; height: 52px; margin-left: 3%;position: relative;float: left;">
    <form action="/action_page.php" method="post">
          <input style="box-sizing:border-box;color: black" id="file-input" name="prev" type="file"  accept="image/x-png,image/gif,image/jpeg" />
    </form>
    </div>
</div>
</div>
      

    
    <div class="col-md-12" style="position: relative; margin-left: 158%;">
       <button type="submit" class="btn btn-primary" onclick="javascript:location.href='mostrarBlog.php?idbloge='+idforo+'&idus='+$iduss+'" name=enviar id="boton">Responder</button>
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
      if(isset($_POST['enviar']) && isset($_POST['mensaje'])){
                  $contenido="";
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
                  $newloc="filesResp/".$newname;


                  
                  if($idbl==-1){

                  if (move_uploaded_file($_FILES['adjunto']['tmp_name'], $newloc))
                  {
                      $sql = "INSERT INTO respuesta (contenido, idusuario,rol,imagen,imagename,asunto,archivoname,idforo) VALUES (:post, :idusuario,:cargo,:image,:imgname,:asunto,:filename,:idforo)";
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':idusuario' => $_SESSION["userID"],':cargo'=>$rol,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido,':filename'=>$newname,':idforo'=>$idforo));
                      }catch(PDOException $e){
                          echo $e;
                      }
                  }else{
                      $sql = "INSERT INTO respuesta (contenido, idusuario,rol,imagen,imagename,asunto,idforo) VALUES (:post, :idusuario,:cargo,:image,:imgname,:asunto,:idforo)";
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':idusuario' => $_SESSION["userID"],':cargo'=>$rol,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido,':idforo'=>$idforo));
                      }catch(PDOException $e){

                      }
                  }
                }else{
                  if (move_uploaded_file($_FILES['adjunto']['tmp_name'], $newname))
                  {
                      $sql = "UPDATE respuesta SET contenido=:post,imagen=:image,imagename=:imgname,asunto=:asunto,archivoname=:filename where idrespuesta=".$idbl;
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido,':filename'=>$newname));
                      }catch(PDOException $e){
                          echo $e;
                      }
                  }else{
                      $sql = "UPDATE respuesta SET contenido=:post,imagen=:image,imagename=:imgname,asunto=:asunto where idrespuesta=".$idbl;
                      $stmt = $pdo->prepare($sql);
                      try{
                        $stmt->execute(array(':post' => $mensaje,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido));
                      }catch(PDOException $e){
                          echo $e;
                      }
                  }
                }
               
              unset($_POST['contenido']);
               unset($_POST['post']);
             }
    ?>
    </form>
    </div>
    <?php
      require "footer.php";
    ?>

  
</body>

</html>
