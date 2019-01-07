<?php
require_once "pdo.php";
    session_start();

    $idbl=intval($_GET['idbloge']);
    $idus=intval($_GET['idus']);
    
/*
     $sql = 'SELECT * FROM post limit 5';
     $stmt=$pdo->prepare($sql);
     $stmt->execute();
    foreach ($stmt as $datos) {
           $usuario=$datos['idusuario'];
           $contenido=$datos['contenido'];
     }

     $sql1 = 'SELECT * FROM profesor where idProfesor='.$usuario;
     $stmt1=$pdo->prepare($sql1);
     $stmt1->execute();
    foreach ($stmt1 as $us) {
           $nombreusuario=$us['nombresProf'];
           $apellidousuario=$us['apellidosProf'];
     }*/
    

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <?php
    require "head.php"; //la funcion requiere en cada script toma la funcionalidad de dicho script y lo replica en este documento. Sirve para codigo limpio
  ?>

</head>
<style>
  
	#imagen{
		width: 200px;
		height: 200px;
		cursor: pointer;
	}
  ul{
    list-style-type: none;
  }
	#imagen:hover{
		opacity: 0.7;
	}
	.close{
		position: absolute;
    	right: 155px;
	}
	.close:hover{
		cursor: pointer;
	}
	#modalIMG {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 120px;
    top: 40px;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
	}
	.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    align-self: center;
    max-width: 700px;
	}
	#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
	}
	.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
	}

	@-webkit-keyframes zoom {
	    from {-webkit-transform:scale(0)} 
	    to {-webkit-transform:scale(1)}
	}

	@keyframes zoom {
	    from {transform:scale(0)} 
	    to {transform:scale(1)}
	}

/* The Close Button */



	/* 100% Image Width on Smaller Screens */
	@media only screen and (max-width: 700px){
    .modal-content {
        width: 100%;
    }
	}


	#contenedor{
		overflow: scroll;
		overflow: hidden;
	}

	.stuck {
    position: fixed;
    top: 10px;
    left: 10px;
    bottom: 10px;
    width: 180px;
    overflow-y: scroll;
	}


</style>


<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <?php
    require "navbar.php";
  ?>
  <div class="content-wrapper" style="background-color: #415B76;">
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
	<header>
		<div class="conteiner" align="center" style="background-color: #233656; padding: 8px;color: white;">
    		<div>
    			<img src="images/logoEPN.png" alt="" style="width: 60px;height: 60px">
    		</div>
    		<div>
    			<h4>Blog EPN</h4>
    		</div>
    	</div>
	</header>


	<div id="contenido" style="margin-left: 9%; top: 7px;position: relative;">
		<section class="main row">
			<article class="col-md-3" name="info" style="overflow-wrap: break-word; word-wrap: break-word; background-color: #7B9BA6; height: 100%;border-radius: 5px;padding:15px;" >
				<h4 style="padding: 3px">Usuario:</h4>
				<?php
      				/*$idvecino="d";
      				if(isset($_POST['aux'])) $idvecino=$_POST['aux'];
      				echo $_GET['jojo'];*/
        			
        			$sql = 'SELECT * FROM foro WHERE idpost='.$idbl;
         			$stmt=$pdo->prepare($sql);
			        $stmt->execute();
			        foreach ($stmt as $datos) {
						
			        	$asunto=$datos['asunto'];
			        	if(isset($datos['adjunto']))$file_put_contents('files/'.$datos['archivoname'],$datos['archivo']);
			        	

          				if($datos['rol']="prof"){
            				$sql1 = 'SELECT * FROM profesor where idProfesor='.$datos['idusuario'];
          				}

         				$stmt1=$pdo->prepare($sql1);
          				$stmt1->execute();
          
          				foreach ($stmt1 as $us) {
               				$nombreusuario=$us['nombresProf'];
               				$apellidousuario=$us['apellidosProf'];
       					}
     
     					if($datos['rol']="est"){
      						$sql1 = 'SELECT * FROM estudiante where idEstudiante='.$datos['idusuario'];
      					}
         				
         				$stmt1=$pdo->prepare($sql1);
          				$stmt1->execute();
          				
          				foreach ($stmt1 as $us) {
               				$nombreusuario=$us['nombresEst'];
               				$apellidousuario=$us['apellidosEst'];
       					}
     					echo '<h5 style="padding:2px;">'.$nombreusuario.' '.$apellidousuario.'</h5>';
          				echo '<h4 style="padding:3px;">Asunto<h4>';
          				echo '<h5 style="padding:2px;">'.$asunto.'</h5>';
          				echo '<h4 style="padding:3px;">Archivo Adjunto<h4>';
          			//	echo '<a href="/files/'.$datos['archivoname'].'" download>'.$datos['archivoname'].'</a>'
          				if(!empty($datos['archivoname'])){
          				echo '<a href="files/'.$datos['archivoname'].'" download>'.$datos['archivoname'].'</a>';
          				}else{
          					echo '<h6>No hay archivo</h6>';
          				}
          			?>


          			
			</article>
			
			<article class="col-md-8">
				<div  class="conteiner" style="margin-left: 2%;padding: 10px; height: 100%;background-color: #7B9BA6;border-radius: 5px;">					
      			
            					
  						<div id="contenedor" class="container" style="border: solid grey 2px; border-radius: 7px; height: 100%; padding: 10px;background-color: #CDD6D5;">
  							<?php
            						echo $datos['contenido'];
      								if(!empty($datos['imagen'])){
      									  echo '<div style="padding:10px;" align="center">';
            							echo '<img id="imagen"  name="imagen" src="data:image/jpeg;base64,'.base64_encode( $datos['imagen'] ).'"/>';
										
								
            							echo '</div>';
            							?>
            							<div id="modalIMG" class="modal">
											     <span class="close">&times;</span>
											     <img class="modal-content" id="img01">
											    <div id="<caption></caption>"></div>
										    </div>
										<?php
            								
  							     }
                     ?>
                     <div>
                      <?php
							echo '<td><button type="button" style="top:5px;	position:relative;right:-450px;" class="btn btn-primary" onclick="javascript:location.href=' . "'respuesta.php?idbloge=". $idbl ."&iduss=".$idus."&idresp=-1'" . '">Responder</button><td>';
							
							if($idus == $datos['idusuario']){
											echo '<td><button type="button" style="top:5px;	position:relative;right:-270px;" class="btn btn-primary" onclick="javascript:location.href=' . "'crearBlog.php?idbloge=" . $idbl ."&idus=".$idus."'" . '">Editar</button><td>';
										}
        				

					?>
          </div>
              <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse"  href="#respuestasCollapse" data-parent="#exampleAccordion">
              <h4>Ver Respuestas</h4>
              </a>
              
          
            <ul class="sidenav-second-level collapse" id="respuestasCollapse">
          
              <?php

                  $qry="SELECT * FROM respuesta where idforo=".$idbl;

                  $st=$pdo->prepare($qry);
                  $st->execute();
                  if($st->rowCount()==0){
                     echo "No hay respuestas";
                  }else{
                  foreach ($st as $respuestas) {
                  
                  ?>
                    <li>

                  <?php

                  if($respuestas['rol']="prof"){
                    $qry1 = 'SELECT * FROM profesor where idProfesor='.$respuestas['idusuario'];
                  }

                  $st1=$pdo->prepare($qry1);
                  $st1->execute();
          
                  foreach ($st1 as $us1) {
                      $nombrResp=$us1['nombresProf'];
                      $apellResp=$us1['apellidosProf'];
                }
     
              if($respuestas['rol']="est"){
                  $qry1 = 'SELECT * FROM estudiante where idEstudiante='.$respuestas['idusuario'];
                }
                
                $st1=$pdo->prepare($qry1);
                  $st1->execute();
                  
                  foreach ($st1 as $us1) {
                      $nombrResp=$us1['nombresEst'];
                      $apellResp=$us1['apellidosEst'];
                }
                  ?>
                        <div style="border-radius: 7px;padding:10px;background-color: white;border: solid;">
                          <?php
                              echo "<strong>"."$nombrResp".' '."$apellResp</strong>";
                              echo "<br>";
                              echo $respuestas['contenido'];
                              if(!empty($respuestas['imagen'])){
                              echo '<div style="padding:10px;" align="center">';
                              echo '<img id="respimg" name="respimg" style="height:100px;width:100px;" src="data:image/jpeg;base64,'.base64_encode( $respuestas['imagen'] ).'"/>';
                              echo '</div>';
                              }
                              if($idus == $datos['idusuario']){
                              echo '<td><button type="button" style="top:5px; position:relative;margin-left:10px;" class="btn btn-primary" onclick="javascript:location.href=' . "'respuesta.php?idbloge=" . $idbl ."&idresp=".$respuestas['idrespuesta']."'" . '">Editar</button><td>';
                               }
                               ?>
                               </div>
                            </li>
                            <?php
                            }
                            
                            
            
                           }  

                }
                ?>
                </div>  						

     				</div>
    	
    				

    			</div>	
			</article>
		</section>

	</div>
     <!-- <div style="width: 22%;float: left; height: 429px;background-color:steelblue;">
        <h1>Información</h1>
        <h5>En construcción</h5> 
        
      </div>-->
    

    
    </div>
  </div>
    <?php
      require "footer.php";
    ?>
<script src="vendor/jquery/jquery.js"></script>
<script src="vendor/jquery/jquery.min.js"></script>

<script>
	var modal = document.getElementById('modalIMG');

// Get the image and insert it inside the modal - use its "alt" text as a caption
	var img = document.getElementById('imagen');
	var modalImg = document.getElementById("img01");
	var captionText = document.getElementById("caption");
	img.onclick = function(){
	    modal.style.display = "block";
	    modalImg.src = this.src;
	    captionText.innerHTML = this.alt;
	}

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() { 
	    modal.style.display = "none";
}
</script>

	
	
  
</body>


</html>
