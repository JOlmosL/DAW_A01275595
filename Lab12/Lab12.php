<?php
 session_start();
    if($_SESSION["Usuario"] == "J.Olmos")
    {
        $target_dir = "Uploads/";
        $target_file = $target_dir . basename($_FILES["Imagen"]["name"]);
        $subida = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));


        if(isset($_POST["submit"])) 
        {
            $check = getimagesize($_FILES["Imagen"]["tmp_name"]);
            if($check !== false) 
            {
                echo "El archivo es una imagen - " . $check["mime"] . ".";
                $subida = 1;
            }

            else 
            {
                echo "El archivo no es una imagen";
                $subida = 0;
            }
        }
 
        if (file_exists($target_file)) 
        {
            echo "La imagen ya existe";
            $subida = 0;
        }
   
        if ($_FILES["Imagen"]["size"] > 500000) 
        {
            echo "La imagen es demasiado grande";
            $subida = 0;
        }

        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") 
        {
            echo "Lo lamento, solo se permiten archivos de tipo JPG, JPEG, PNG y GIF. =(";
            $subida = 0;
        }

        if ($subida == 0) {
            echo "La imagen no pudo ser cargada =(";

        } else {
            if (move_uploaded_file($_FILES["Imagen"]["tmp_name"], $target_file)) 
            {
                echo "El archivo ". basename( $_FILES["Imagen"]["name"]). " ha sido subido.";
                $_SESSION["imagen"]= $target_file;
                header("location:Sesion.php");
            } 

            else 
            {
                echo "Desafortunadamente hubo un error al intentar cargar la imagen";
            }
        }
    }else
    {
        header("location: Lab12Control.php");
    }
?>