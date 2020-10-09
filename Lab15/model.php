<?php
//Libreria de interacciones

function conectar() 
{

    $conexion_bd = mysqli_connect("localhost","root","","concesionario");
    
    if ($conexion_bd == NULL) 
    {
        die("No se pudo conectar a la base de datos");
    }
    
    $conexion_bd->set_charset("utf8");
    
    return $conexion_bd;
}

function desconectar($conexion_bd) 
{
    mysqli_close($conexion_bd);
}

function select($name, $tabla, $id="id", $nombre="nombre") 
{
    $resultado = '<select name="'.$name.'" class="browser-default">';
    $resultado .= '<option value="" disabled selected>Selecciona un '.$tabla.'</option>';
    $conexion_bd = conectar();
    
    $consulta = 'SELECT '.$id.', '.$nombre.' FROM '.$tabla.' ORDER BY '.$nombre.' ASC'; //SELECT idCliente, nombreCliente FROM CLIENTE ORDER BY nombreCliente 
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_BOTH)) 
    {
        
        $resultado .= '<option value="'.$row[$id].'">'.$row[$nombre].'</option>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</select><label>'.$tabla.'</label>';
    
    desconectar($conexion_bd);
    return $resultado;
}
//echo select("cliente", "cliente", "idCliente", "nombreCliente");

function tablaCocheVenta() 
{
    $consulta = 'SELECT * ';
    $consulta .= 'FROM COCHE_VENDIDO';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table class="striped">';
    $resultado .= '<tr><th>Matricula</th><th>Marca</th><th>Modelo</th><th>Color</th><th>Precio</th><th>ExtrasInstalados</th><th>Cliente</th></tr>';

    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC)) 
    { 
    //MYSQLI_NUM: Devuelve los resultados en un arreglo numérico
        //$row[0]
    //MYSQLI_ASSOC: Devuelve los resultados en un arreglo asociativo
        //$row["acusador"]
    //MYSQL_BOTH: Devuelve los resultados en un arreglo numérico y asociativo (Utiliza el doble de memoria)
        //$row[0] y $row["acusador"]
        
        $resultado .= '<tr>';
        $resultado .= '<td>'.$row["matricula"].'</td>';
        $resultado .= '<td>'.$row["marca"].'</td>';
        $resultado .= '<td>'.$row["modelo"].'</td>';
        $resultado .= '<td>'.$row["color"].'</td>';
        $resultado .= '<td>'.$row["precio"].'</td>';
        $resultado .= '<td>'.$row["extrasInstalados"].'</td>';
        $resultado .= '<td>'.$row["cliente"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}
//echo tablaCocheVenta();

function tablaClientes() 
{
    $consulta = 'SELECT * ';
    $consulta .= 'FROM CLIENTE';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table class="striped">';
    $resultado .= '<tr><th>IdCliente</th><th>Nombre</th><th>Apellido</th><th>Dirección</th><th>Población</th><th>Código Postal</th><th>Teléfono</th><th>Fecha de Nacimiento</th></tr>';

    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC)) 
    {    
        $resultado .= '<tr>';
        $resultado .= '<td>'.$row["idCliente"].'</td>';
        $resultado .= '<td>'.$row["nombreCliente"].'</td>';
        $resultado .= '<td>'.$row["apellidosCliente"].'</td>';
        $resultado .= '<td>'.$row["direccionCliente"].'</td>';
        $resultado .= '<td>'.$row["poblacion"].'</td>';
        $resultado .= '<td>'.$row["codigoPostal"].'</td>';
        $resultado .= '<td>'.$row["telefono"].'</td>';
        $resultado .= '<td>'.$row["fechaNac"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function updateTemplate($matricula, $nuevoColor = 'Negro') 
{
     
    $conexion_bd = conectar();
    
    $consulta = "UPDATE coche_vendido SET color = ? WHERE matricula = ?";
    //Parametros son los signos de interrogación


    //Verifica que la consulta sea correcta
    if(!($statement = $conexion_bd->prepare($consulta))) 
    {
        die("Error(".$conexion_bd->errno."): ".$conexion_bd->error);
    }
    
    //Evita +- SQL inyection | Hace la union entre los parametros con las cosultas/Sustituye ??s por datos
    if(!($statement->bind_param("ss",$nuevoColor, $matricula))) 
    {
        die("Error de vinculación(".$statement->errno."): ".$statement->error);
    }
    
    if(!$statement->execute()) 
    {
        die("Error en ejecución de la consulta(".$statement->errno."): ".$statement->error);
    }
    
    desconectar($conexion_bd);
}
//updateTemplate('V8018LJ', 'Verde');
//echo tablaCocheVenta();
?>