<?php

$result = verClientes();

if(mysqli_num_rows($result) > 0)
{
    //Output data of each row
    while ($row = mysqli_fetch_assoc($result))
    {
        echo "<tr>";
        echo "<td>" . $row["idCliente"] . "</td>";
        echo "<td>" . $row["nombreCliente"] . "</td>";
        echo "<td>" . $row["apellidosCliente"] . "</td>";
        echo "<td>" . $row["direccionCliente"] . "</td>";
        echo "<td>" . $row["poblacion"] . "</td>";
        echo "<td>" . $row["codigoPostal"] . "</td>";
        echo "<td>" . $row["telefono"] . "</td>";
        echo "<td>" . $row["fechaNac"] . "</td>";
        echo "</tr>";
    }
}
?>