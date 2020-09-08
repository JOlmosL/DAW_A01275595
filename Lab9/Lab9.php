<?php 
include("Lab9.html");
$x = array(25, 69, 97, 15, 27, 14, 39, 75, 1.25, 2.36, 9);
$n = 9;

function promedio($x)
{
  echo "El promedio del arreglo es de = ".(array_sum($x)/count($x))."\n";
} 

function mediana($x)
{
  $y = sort($x);
  $contador = count($x);
  $mitad = floor(($contador-1)/2);
  if($contador % 2) 
  {
    $median = $x[$mitad];
  } 
  
  else
  {
    $low = $x[$mitad];
    $high = $x[$mitad+1];
    $median = (($low+$high)/2);
  }
  echo "La mediana es de ".$median;
}

function lista($x)
{
  foreach ($x as $clave => $valor) 
  {
    echo "".$valor."\n";
  }
}

function MayMen($x)
{
  $y = sort($x);
  echo "De mayor a menor: ";
  foreach ($x as $clave => $valor) 
  {
    echo "".$valor."\n";
  }
}

function MenMay($x)
{
  $x = rsort($x);
  echo "De menor a mayor: ";
  foreach ($x as $clave => $valor)
  {
      echo "".$valor."\n";
  }
}

function cuadrados($n)
{
  echo "<th> Los cuadrados son... </th>";
  for($x = 1; $x <= $n; $x++)
  {
    echo "<td>".(pow($x, 2))."</td>";
  }
}

function cubos($n)
{
  echo "<th>CUBOS: </th>";
  for($x = 1; $x <= $n; $x++)
  {
    echo "<td>".(pow($x,3))."</td>"; 
  }
}

function hashAbierta($n)
{
  //suponiendo que es un espacio de 15
  $size = 15;
  $h1 = $n -($size *($n / $size));
  $h2 = $n % $size;
  echo "H1 a guardarse en".$h1;
  echo "H2 a guardarse en".$h2;
} 
?> 

<h3>Función 1</h3>
<p>Recibe un arreglo de números y devuelve el promedio.</p>
<?= promedio($x)?>
<h3>Función 2</h3>
<p>Recibe un arreglo de números y devuelve la mediana.</p>
<?= mediana($x)?>
<h3>Función 3</h3>
<p>Recibe un arreglo de números y los muestra, además de desplegar el promedio, la mediana y el arreglo ordenado de mayor a menor y al contrario como items de una lista html.</p>
<ul>
  <?=lista($x)?>
  <?=promedio($x)?>
  <?=mediana($x)?>
  <?=MayMen($x)?>
  <?=MenMay($x)?>
</ul>
<h3>Función 4</h3>
<p>Recibe un número 'n' e imprime una tabla con los cuadrados y cubos hasta ese mismo.</p>
<table>
  <tr><?=cuadrados($n)?></tr>
  <tr><?=cubos($n)?></tr>    
</table>

<h3>Función 5</h3>
<p>Problema libre donde se le de solución en php y con una vista agradable para el usuario.</p>
<h2>Tabla Hash Abierta</h2>
<?= hashAbierta($n)?>