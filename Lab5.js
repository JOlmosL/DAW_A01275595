/*
Con JavaScript y HTML5 [y quizás CSS], desarrolla una página para validar passwords.
La página debe tener una forma con 2 campos, el campo de password, y el campo de verificar password.
Utiliza al máximo tu creatividad e ingeniería para que la página sea un validador de passwords de estado del arte, con la mejor experiencia para el usuario.
*/
function Verificar() {
    var PWord1 = document.Contraseña.Password_1.value
    var PWord2 = document.Contraseña.Password_2.value

    var espacios = false;
    var cont = 0;

    while (!espacios && (cont < PWord1.length)) {
        if (PWord1.charAt(cont) == " ")
            espacios = true;
        cont++;
    }

    if (espacios) {
        alert("La contraseña NO puede contener espacios en blanco");
        return false;
    }

    if (PWord1.length == 0 || PWord2.length == 0) {
        alert("La contraseña NO puede estar vacía");
        return false;
    }

    if (PWord1 != PWord2) {
        alert("La contraseña ingresada no coincide");
        return false;
    }
    else {
        alert("Ha sido validada con exito la contraseña =)");
        return true;
    }
}

/*
Con JavaScript y HTML5 [y quizás CSS], desarrolla una página para vender 3 productos de tu interés,
con los precios y promociones a tu gusto. La página debe permitir al usuario escoger la cantidad de 
unidades de cada producto, y debe mostrar el precio total, el IVA que se está cargando, y toda la
información que consideres pertinente para que la experiencia del usuario sea la mejor. La página
debe validar los rangos de las unidades de cada producto.
*/
