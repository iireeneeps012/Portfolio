
function filtrarXBusqueda(pListaEventos, pBusqueda) {
    var listaFiltrada = new Array();
    listaFiltrada = pListaEventos.filter(evento => {
        var titulo = evento.titulo.toLowerCase();
        return titulo.includes(pBusqueda);
    })
    return listaFiltrada;
}

//asociaciones
function filtrarXasociaciones(pListaEventos, pAsociacion) {
    var listaFiltrada = new Array(); // creamos una variable de tipo ARRAY, llamada LISTA donde vamos a ir almacenando los datos
    var contador = 0;
    for (evento of pListaEventos) {
        if (evento.asociacion.toLowerCase() == pAsociacion.toLowerCase()) { // si coincide el diagnostico marcado, con el diagnostico de  los pacientes entonces
            listaFiltrada[contador] = evento; //a lista le metemos el nombre del paciente
            contador++; // ++ para sumar 1
        }
    }//esto lo va a seguir haciendo esto hasta que se acaba
    return listaFiltrada;
}

//mes
function filtrarXmes(pListaEventos, pMes) {
    var listaFiltrada = new Array(); // creamos una variable de tipo ARRAY, llamada LISTA donde vamos a ir almacenando los datos
    var contador = 0;
    for (evento of pListaEventos) {
        if (evento.mes.toLowerCase() == pMes.toLowerCase()) { // si coincide el diagnostico marcado, con el diagnostico de  los pacientes entonces
            listaFiltrada[contador] = evento; //a lista le metemos el nombre del paciente
            contador++; // ++ para sumar 1
        }
    }//esto lo va a seguir haciendo esto hasta que se acaba
    return listaFiltrada;
}


//campus
function filtrarXcampus(pListaEventos, pCampus) {
    var listaFiltrada = new Array(); // creamos una variable de tipo ARRAY, llamada LISTA donde vamos a ir almacenando los datos
    var contador = 0;
    for (evento of pListaEventos) {
        if (evento.campus.toLowerCase() == pCampus.toLowerCase()) { // si coincide el diagnostico marcado, con el diagnostico de  los pacientes entonces
            listaFiltrada[contador] = evento; //a lista le metemos el nombre del paciente
            contador++; // ++ para sumar 1
        }
    }//esto lo va a seguir haciendo esto hasta que se acaba
    return listaFiltrada;
}

//filtro combinado
function filtrarXCombinado(pListaEventos, pMes, pCampus) {
    var listaFiltrada = new Array();
    var contador =0;
    for (evento of pListaEventos) {
        if (evento.mes.toLowerCase() == pMes.toLowerCase() && evento.campus.toLowerCase() == pCampus.toLowerCase() ){
            listaFiltrada[contador]=evento;
            contador++;
        }
    }
    return listaFiltrada;
}
