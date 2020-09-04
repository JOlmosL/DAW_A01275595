/* 1
Entrada: un número pedido con un prompt. 
Salida: Una tabla con los números del 1 al número dado con sus cuadrados y cubos. 
Utiliza document.write para producir la salida
*/
document.write("<h2>Primer Ejercicio</h2>");

function Ejer_1(numero) {
    document.write("<table>");
    for (let i = 1; i <= numero; i++) {
        document.write("<tr><td>" + i + "</td>" + "<td>" + i * i + "</td>" + "<td>" + i * i * i + "</td></tr>");
    }
    document.write("</table>");
}
const num = prompt("Ejercicio 1 - Dame un número");
Ejer_1(num);


/* 2
Entrada: Usando un prompt se pide el resultado de la suma de 2 números generados de manera aleatoria.
Salida: La página debe indicar si el resultado fue correcto o incorrecto, y el tiempo que tardó el usuario en escribir la respuesta.
*/
document.write("<h2>Segundo Ejercicio</h2>");

function Ejer_2(numero2) {
    var Resultado = NumRandom1 + NumRandom2;
    document.write("El resultado de la suma es " + Resultado + "<br>");
    document.write("Tu respondiste " + Respuesta + "<br><br>")

    if (numero2 === Resultado)
        document.write("Tu respuesta es correcta =)");

    else if (numero2 !== Resultado)
        document.write("Tu respuesta es incorrecta =/");
}

var NumRandom1 = Math.floor(Math.random() * (101 - 0) + 0);
var NumRandom2 = Math.floor(Math.random() * (101 - 0) + 0);
const num2 = prompt("Ejercicio 2 - La respuesta de " + NumRandom1 + " + " + NumRandom2 + " = ?");
var Respuesta = parseFloat(num2);
Ejer_2(Respuesta);


/* 3
Función: contador.
Parámetros: Un arreglo de números.
Regresa: La cantidad de números negativos en el arreglo, la cantidad de 0's, y la cantidad de valores mayores a 0 en el arreglo.
 */
document.write("<h2>Tercer Ejercicio</h2>");
document.write("Números almacenados en el Arreglo:<br>");
function Contador(size) {

    var arreglo = new Array(size);
    var NumsNegativos = 0;
    var CantZeros = 0;
    var MayZero = 0;
    document.write("<table><tr>");
    for (let i = 0; i < size; i++) {
        arreglo[i] = prompt("Número a insertar en la posición " + (i + 1) + " de " + size);
        document.write("<td>"+arreglo[i]+"</td>");
        if (arreglo[i] < 0) {
            NumsNegativos++;
        }

        else if (arreglo[i] === 0) //Al quitar el "===", no me funciona el else de abajo...
        {
            CantZeros++;
        }

        else if (arreglo[i] > 0) {
            MayZero++;
        }
    }
    document.write("</tr></table>");

    document.write("<br>Numeros negativos en el Arreglo: " + NumsNegativos + "<br>");
    document.write("Cantidad de 0s en el Arreglo: " + CantZeros + "<br>");
    document.write("Numeros mayores a 0 en el Arreglo: " + MayZero + "<br>");
}

const num3 = prompt("Ejercicio 3 - ¿Cuantos numeros tendría tu arreglo?");
var TamArreglo = parseInt(num3);
Contador(TamArreglo);

/* 4
Función: promedios.
Parámetros: Un arreglo de arreglos de números.
Regresa: Un arreglo con los promedios de cada uno de los renglones de la matriz.
*/
document.write("<h2>Cuarto Ejercicio</h2>");
function Promedios(filas, columnas) {
    var matriz = new Array(columnas);
    for (let x = 0; x < filas; x++) {
        matriz[x] = new Array(filas);
    }

    var respuestas = new Array(columnas);

    document.write("Matriz de " + columnas + " por " + filas + "<br><br>");
    document.write("<table>");
    for (let i = 0; i < columnas; i++) 
    {
        document.write("<tr>")
        for (let j = 0; j < filas; j++) 
        {
            matriz[j][i] = prompt("Número en la posición " + (j + 1) + " de " + filas + " del renglón " + (i + 1));
            document.write("<td>" + matriz[j][i] + "</td>");
        }
        document.write("</tr>")
    }
    document.write("</table>");

    let sumador = 0;
    let contador = 0;
    document.write("<p>Promedios de cada fila:</p>");
    for (let d = 0; d < columnas; d++) 
    {
        sumador = 0;
        for (let i = 0; i < columnas; i++)
        {
            
            for (let j = 0; j < filas; j++)
            {
                sumador === matriz[j][i];
                contador =+ (sumador);
            }
            document.write("Suma hasta el momento = "+contador+"<br>");
            respuestas[d] = contador / filas;
        }
        document.write("Promedio de la fila "+(d+1)+" es: "+respuestas[d]+"<br>");
    }


}

const num4_1 = prompt("Ejercicio 4 - ¿Cuántos renglones tendría tu arreglo?");
const num4_2 = prompt("¿Cuántos numeros guardarías en cada renglón?");
var Renglones = parseInt(num4_1);
var Numeros = parseInt(num4_2);
Promedios(Numeros, Renglones)

/* 5
Función: inverso.
Parámetros: Un número.
Regresa: El número con sus dígitos en orden inverso.
*/
function Inverso() {

}

/*
Crea una solución para un problema de tu elección (puede ser algo relacionado con tus intereses, alguna problemática que hayas identificado en algún ámbito,
un problema de programación que hayas resuelto en otro lenguaje, un problema de la ACM, entre otros).
El problema debe estar descrito en un documento HTML, y la solución implementada en JavaScript, utilizando al menos la creación de un objeto,
el objeto además de su constructor deben tener al menos 2 métodos. Muestra los resultados en el documento HTML.
*/

