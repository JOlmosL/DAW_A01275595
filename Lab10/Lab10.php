<?php

$ErrorNombre = $ErrorCorreo = $ErrorGenero = $ErrorSitio = $Nombre = $Correo = $Genero = $Comentario = $Sitio_Web = "";

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
  if (empty($_POST["Nombre"]))
  {
    $ErrorNombre = "Es necesario insertar un Nombre";
  }
  else 
  {
    $Nombre = test_input($_POST["Nombre"]);
    if (!preg_match("/^[a-zA-Z-' ]*$/",$Nombre)) 
    {
      $ErrorNombre = "Solo se permiten letras y espacios en blanco";
    }
  }
  
  if (empty($_POST["Correo"])) 
  {
    $ErrorCorreo = "Es necesario insertar un correo";
  } 
  else 
  {
    $Correo = test_input($_POST["Correo"]);
    if (!filter_var($Correo, FILTER_VALIDATE_EMAIL)) 
    {
      $ErrorCorreo = "Formato de correo inválido";
    }
  }
    
  if (empty($_POST["Sitio_Web"])) 
  {
    $Sitio_Web = "";
  } 
  else 
  {
    $Sitio_Web = test_input($_POST["Sitio_Web"]);
    if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$Sitio_Web)) 
    {
      $ErrorSitio = "El URL es invalido";
    }
  }

  if (empty($_POST["Comentario"])) 
  {
    $Comentario = "";
  } 
  else 
  {
    $Comentario = test_input($_POST["Comentario"]);
  }

  if (empty($_POST["Genero"])) 
  {
    $ErrorGenero = "Es necesario elegir un género";
  } 
  else 
  {
    $Genero = test_input($_POST["Genero"]);
  }
}

function test_input($data) 
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

?>