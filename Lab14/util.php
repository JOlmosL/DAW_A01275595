<?php

function conectDB()
{
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "dbname";

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

function getFruits()
{
    $conn = conectDB();
    $sql = "SELECT name, units, quantity, price, country FROM Fruit";
    $result = mysqli_query($conn, $sql);
    closeDB($conn);
    return $result;
}

/*
function que regresará los datos de una fruta que tengan en su nombre el parámetro
Ejemplo: si pongo manzana, me puede regresar manzana roja, manzana washington, etc
*/

function getFruitsByName($fruit_name)
{
    $conn = conectDB();
    $sql = "SELECT name, units, quantity, price, country, FROM fruit WHERE name LIKE '%".$fruit_name."%'";
    $result = mysqli_query($conn, $sql);
    closeDB($conn);
    return $result;
}

/*
Regresa todas las frutas donde su precio sea igula o menos que el parametro que recibe
*/

function getCheapestFruits($fruit_name)
{
    $conn = conectDB();
    $sql = "SELECT name, units, quantity, price, country, FROM fruit WHERE price <= '".$cheap_price."'";
    $result = mysqli_query($conn, $sql);
    closeDB($conn);
    return $result;
}
?>