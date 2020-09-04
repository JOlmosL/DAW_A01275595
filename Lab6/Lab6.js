/*
function hola()
{
    alert("Hola");
}

document.getElementById("semana").onclick = hola;

function cambia_texto()
{
    let element = document.getElementById("semana");
    element.innerHTML = "Bienvenidos al semestre agosto-diciembre 2020";
    element.style.fontSize = "Large";
}

function recupera_texto()
{
    let element = document.getElementById("semana");
    element.innerHTML = "Calendario de actividades";
    element.style.fontSize = "Normal";
}

let semana = document.gerElementById("Semana");
semana.onmouseover = cambia_texto;
semana.onmouseout = recupera_texto;
*/

function estilo_letra1()
{
    let element = document.getElementById("Estilo");
    element.style.fontFamily="Serif";
}

function estilo_letra2()
{
    let element = document.getElementById("Estilo");
    element.style.fontFamily="Monospace";
}

function ayuda() 
{
    var txt;
    if (confirm("¿Te gustaría que traduzca este texto?"))
    {
      window.alert("A pesar de estar escrito en latín, Lorem Ipsun es un texto alterado mediante la omisión, agregado y alteración de letras y palabras, por lo cual no tiene sentido o traducción en sí... ¿No es la respuesta que esperabas, verdad?");
    } 
    else 
    {
      window.alert("Bueno, tu te lo pierdes 7w7");
    }
}

function saludar()
{
    window.alert("Buen día. Mi nombre es Eris, y soy una I.A. programada con el único proposito de asistirlo mientras lee este intento de página web. Le agradezco que se haya tomado la molestia para leer este mensaje. ¡Disfrute su lectura =D!"); 
}

function molestar()
{
    window.alert("I'm watching you...");
}

let header = document.getElementById("Estilo");
header.onmouseleave = estilo_letra1;
header.onmouseover = estilo_letra2;

let lorem = document.getElementById("Lorem");
lorem.onmouseover = ayuda;

msg_inicial = setTimeout(saludar, 0);
msg_molesto = setInterval(molestar, 15000);

function allowDrop(ev)
{
   ev.preventDefault();
}
  
function drag(ev)
{
   ev.dataTransfer.setData("", ev.target.id);
}
  
function drop(ev) 
{
   ev.preventDefault();
   var data = ev.dataTransfer.getData("");
   ev.target.appendChild(document.getElementById(data));
}