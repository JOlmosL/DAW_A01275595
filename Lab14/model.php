<?php

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

echo select("cliente", "cliente", "idCliente", "nombreCliente");

function tabla_acusaciones() 
{
    $consulta = 'SELECT t.id as acusador_id, t.nombre as acusador, s.nombre as acusado, created_at as fecha ';
    $consulta .= 'FROM acusa, tripulante  t, tripulante s ';
    $consulta .= 'WHERE  t.Id = acusa.acusador_id AND s.Id = acusa.acusado_id';
    $consulta .= ' ORDER BY fecha DESC';
    
    $conexion_bd = conectar();
    $resultados_consulta = $conexion_bd->query($consulta);  
    
    $resultado = '<table class="striped">';
    $resultado .= '<tr><th>Acusador</th><th>Acusado</th><th>Fecha</th><tr>';
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC)) { 
    //MYSQLI_NUM: Devuelve los resultados en un arreglo numérico
        //$row[0]
    //MYSQLI_ASSOC: Devuelve los resultados en un arreglo asociativo
        //$row["acusador"]
    //MYSQL_BOTH: Devuelve los resultados en un arreglo numérico y asociativo (Utiliza el doble de memoria)
        //$row[0] y $row["acusador"]
        
        $resultado .= '<tr>';
        $resultado .= '<td><a href="editar.php?id='.$row["acusador_id"].'">'.$row["acusador"].'</a></td>';
        $resultado .= '<td>'.$row["acusado"].'</td>';
        $resultado .= '<td>'.$row["fecha"].'</td>';
        $resultado .= '</tr>';
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    $resultado .= '</table>';
    
    desconectar($conexion_bd);
    return $resultado;
}

function acusa($acusador_id, $acusado_id) 
{
     
    $conexion_bd = conectar();
    
    $consulta = "INSERT INTO acusa(acusador_id, acusado_id) VALUES (?,?)";
    
    if(!($statement = $conexion_bd->prepare($consulta))) {
        die("Error(".$conexion_bd->errno."): ".$conexion_bd->error);
    }
    
    if(!($statement->bind_param("ss",$acusador_id, $acusado_id))) {
        die("Error de vinculación(".$statement->errno."): ".$statement->error);
    }
    
    if(!$statement->execute()) {
        die("Error en ejecución de la consulta(".$statement->errno."): ".$statement->error);
    }
    
    desconectar($conexion_bd);
}

function get_nombre($id) {
    $resultado = "";
    $conexion_bd = conectar();
    
    $consulta = "SELECT nombre
                 FROM tripulante
                 WHERE id = ".$id;
    
    $resultados_consulta = $conexion_bd->query($consulta); 
    
    while ($row = mysqli_fetch_array($resultados_consulta, MYSQLI_ASSOC)) {
        
        $resultado = $row["nombre"]; 
    }
    
    mysqli_free_result($resultados_consulta); //Liberar la memoria
    
    desconectar($conexion_bd);
    return $resultado;
}

function set_tripulante($id, $nombre) {
    $conexion_bd = conectar();
    
    $consulta = "UPDATE tripulante SET nombre=? WHERE id=?";
    
    if(!($statement = $conexion_bd->prepare($consulta))) {
        die("Error(".$conexion_bd->errno."): ".$conexion_bd->error);
    }
    
    if(!($statement->bind_param("ss",$nombre, $id))) {
        die("Error de vinculación(".$statement->errno."): ".$statement->error);
    }
    
    if(!$statement->execute()) {
        die("Error en ejecución de la consulta(".$statement->errno."): ".$statement->error);
    }
    
    desconectar($conexion_bd);
    
    $_SESSION["info"] = "Se actualizó el tripulante $id";
}

//acusa(5,6);
//echo tabla_acusaciones();
?>