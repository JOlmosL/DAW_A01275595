<?php
    session_start();
    if(empty ($_SESSION["Usuario"]))
    {
        if(empty($_POST["Usuario"]))
        {
            header('Location: Lab12Control.php');
        }
        else
        {
            $_SESSION["Usuario"] = $_POST["Usuario"];
            $_SESSION["Clave"] = $_POST["Clave"];
        }
    }


    if(htmlspecialchars($_POST["Usuario"]) == "J.Olmos" && htmlspecialchars($_POST["Clave"]) == "0000")
    {
        if(($_SESSION["Usuario"] == "J.Olmos")&&($_SESSION["Clave"] == "0000")) 
        {
          include("_Lab12Header.html");
          include("Lab12.html");
          include("_Lab12footer.html");
    	}
    }

    else 
    if(isset($_POST["usuario"]) || isset($_POST["Clave"])) 
    {
        include("Lab12Control.php");

    }

    else 
    {
        include("Lab12Control.php");
    }
?>