<?php

require_once("model.php");

conectar();

$idCliente = htmlspecialchars($_POST["idCliente"]);
$nombreCliente = htmlspecialchars($_POST["nombreCliente"]);
$apellidosCliente = htmlspecialchars($_POST["apellidosCliente"]);
$direccionCliente = htmlspecialchars($_POST["direccionCliente"]);
$poblacion = htmlspecialchars($_POST["poblacion"]);
$codigoPostal = htmlspecialchars($_POST["codigoPostal"]);
$telefono = htmlspecialchars($_POST["telefono"]);
$fechaNac = htmlspecialchars($_POST["fechaNac"]);

if (isset($_POST["idCliente"]) && isset($_POST["idCliente"]) != ""
 && isset($_POST["nombreCliente"]) && isset($_POST["nombreCliente"]) != ""
 && isset($_POST["apellidosCliente"]) && isset($_POST["apellidosCliente"]) != "" 
 && isset($_POST["direccionCliente"]) && isset($_POST["direccionCliente"]) != "" 
 && isset($_POST["poblacion"]) && isset($_POST["poblacion"]) != ""
 && isset($_POST["codigoPostal"]) && isset($_POST["codigoPostal"]) != ""
 && isset($_POST["telefono"]) && isset($_POST["telefono"]) != ""
 && isset($_POST["fechaNac"]) && isset($_POST["fechaNac"]) != "")
{
    if (is_numeric($idCliente) && is_numeric($codigoPostal) && is_numeric($telefono))
    {
        InsertNuevoCliente($idCliente, $nombreCliente, $apellidosCliente, $direccionCliente, $poblacion, $codigoPostal, $telefono, $fechaNac);
        include("Lab15Bone.php");
    }
}
else
{
    header("location:Lab15Bone.php");
}
?>