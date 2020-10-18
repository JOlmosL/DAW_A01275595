<?php

require_once("model.php");

conectar();

$idCliente = htmlspecialchars($_POST["idCliente"]);

if (isset($_POST["idCliente"]) && isset($_POST["idCliente"]) != "")
{
    if (is_numeric($idCliente))
    {
        EliminarCliente($idCliente);
        include("Lab15Bone.php");
    }
}
else
{
    header("location:Lab15Bone.php");
}
?>