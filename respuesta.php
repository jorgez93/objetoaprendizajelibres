<?php
require_once "pdo.php";
    session_start();

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
   height: 20%;
   width: 70%;
   padding:10px;
   position: absolute;
   border-left: solid blue;
   background-color: lightblue;
  }
  ::placeholder{
    color: darkslategrey;
    opacity: 1;
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

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <?php
    require "navbar.php";
  ?>
  <div class="content-wrapper" style="background-color: steelblue">
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
	  <div class="page-header" align="center" id=tittle style="height: 240px">
      <h1> Responder</h1>
			
	  </div>
    <form  method="post" enctype="multipart/form-data">
    <div class="form-group" style="height: 160px;" >
			<h1>Asunto:</h1>
      <div style="width: 9%;float: left;" align="center">
      
       
     
</div>
			<textarea  class="formInput" id="post" name=contenido placeholder="Escriba el asunto"></textarea>
    </div>
    <div name="contenedor" style="position: relative;top: 10px">
	<div class="form-group" style="height: 160px;" >
			<h1>Mensaje:</h1>
      <div style="width: 9%;float: left;" align="center">
      
       
     </div>
			<textarea  class="formInput" id="post" name=mensaje placeholder="Escriba el mensaje"></textarea>
    </div>
      
    <div name="contenedor" style="position: relative;top: 10px">
    <div  style="margin-left: 2%;float: left;">
      <img type="image" src="sub.png" name="im" style="float: left;margin-left: 3%; width: 52px;height: 52px;">
    </div>
	
	<div class="form-group" style="height: 160px;" >
			<h1>Seleccionar un archivo:</h1>
      <div style="width: 9%;float: left;" align="center">
      <input type="file" name="adjunto"  accept=".pdf,.docx,.xls" multiple>
    <div name="contenedor" style="position: relative;top: 10px">
   
	
    <div style="width: 100px; height: 52px; margin-left: 3%;position: relative; top: 10px;float: left;">
    <form action="/action_page.php" method="post">
          <input style="box-sizing:border-box;" id="file-input" name="prev" type="file"  accept="image/x-png,image/gif,image/jpeg" />
    </form>
    </div>
    <div style="position: relative; margin-left: 88%;">
       <input type="submit" name=enviar id="boton">
    </div>
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
                  $imgn=($_FILES['prev']['name']);
                  $imgn1=($_FILES['prev']['tmp_name']);
                  $imagenN=addslashes($_FILES['prev']['tmp_name']);

                  //Get content image

                  

                  $imagetmp=(file_get_contents($imagenN));




               $sql = "INSERT INTO respuesta (contenido, idusuario,rol,imagen,imagename,asunto)
                 VALUES (:post, :idusuario,:cargo,:image,:imgname,:asunto)";
                 $stmt = $pdo->prepare($sql);
              try{
                $stmt->execute(array(':post' => $mensaje,':idusuario' => $_SESSION["userID"],':cargo'=>$rol,':image'=>$imagetmp,':imgname'=>$imgn,':asunto'=>$contenido));
              }catch(PDOException $e){

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