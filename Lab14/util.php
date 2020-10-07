<?php

function conectDB()
{
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "concesionario";

    $con = mysqli_connect($servername, $username, $password, $dbname);

    //Check connection
    if (!$con)
    {
        die("Connection Failed: " . mysqli_connect_error());
    }

    return $con;
}

/*
La variable $mysql es una conexión establecida anteriormente
tomando de ejemplo la imagen anterior, podría mandar a llamar
a la función mandando como parametro $con
*/

function closeDB($mysql)
{
    mysqli_close($mysql);
}

function verClientes()
{
    $conn = conectDB();
    $sql = "SELECT idCliente, nombreCliente, apellidosCliente, direccionCliente, poblacion, codigoPostal, telefono, fechaNac FROM CLIENTE";
    $result = mysqli_query($conn, $sql);
    closeDB($conn);
    return $result;
}

/*
function que regresará los datos de un CLiente dependiendo de un patrón
*/

function searchClienteApe($patron)
{
    $conn = conectDB();
    $sql = "SELECT idCliente, nombreCliente, apellidosCliente, direccionCliente, poblacion, codigoPostal, telefono, fechaNac FROM CLIENTE WHERE apellidosCliente LIKE '%".$patron."%'";
    $result = mysqli_query($conn, $sql);
    closeDB($conn);
    return $result;
}

function clienteTelefono($tel)
{
    $conn = conectDB();
    $sql = "SELECT idCliente, nombreCliente, apellidosCliente, direccionCliente, poblacion, codigoPostal, telefono, fechaNac FROM CLIENTE WHERE telefono LIKE '%".$patron."%'";
    $result = mysqli_query($conn, $sql);
    closeDB($conn);
    return $result;
}
?>