// funcion de pintado de cualquier lista de tipo paciente


var seccionEventos = document.getElementById('cajaseventos');
function pintarEventos(pListaEventos) {
    seccionEventos.innerHTML = '';
    if (pListaEventos.length != 0){
        seccionEventos.innerHTML +=  `<div class="prueba">`
        pListaEventos.forEach((evento) => 
        {
            seccionEventos.innerHTML +=
           `<div class="caja">
            <div class="card">
                <div class="card-body" >
                    <div class="">
                        <div class="">
                            <h4 class="card-title">${evento.titulo}</h4>
                            <h6 class="card-title">${evento.asociacion}</h6>
                        </div>
                        <hr>
                        <div class="caja_info">
                            <p class="card-text">${evento.descripcion}</p>
                            <p class="card-text">${evento.mes}</p>
                            <p class="card-text">${evento.campus}</p>
                        </div>
                    </div>
                </div>
            </div>
            </div>`
        })
        seccionEventos.innerHTML +=  `</div>`;
    } else {
        seccionEventos.innerHTML = `<h2>No hay registros con esas condiciones</h2>`;
    }
}


pintarEventos(listaEventos);
var buscador = document.getElementById('search');
buscador.addEventListener('keyup', buscarElemento);
function buscarElemento(e) {
    var busqueda = e.target.value
    console.log(busqueda)
    if (busqueda != '') {
        let listaFiltradaBusqueda = filtrarXBusqueda(listaEventos, busqueda); //asigna a la variable listaFiltradaBusqueda los valores que se obtienen en la funcion filtrarXBusqueda
        pintarEventos(listaFiltradaBusqueda) //muestra el resultado
    } else {
        alert('no has rellenado el campo')
    }
}

// filtro de asociaciones
var selectorAsociacion = document.querySelector('#asociacion');
selectorAsociacion.addEventListener('change', recogeAsociacion);
function recogeAsociacion(e) {
    // console.log(e.target.value);
    let asociacion = e.target.value;
    if (asociacion != '') {
        let listaFiltradaAsociacion = filtrarXasociaciones(listaEventos, asociacion);
        pintarEventos(listaFiltradaAsociacion)
    } else {
        pintarEventos(listaEventos);
    }
}

//filtro de mes
var selectorMes = document.querySelector('#mes');
selectorMes.addEventListener('change', recogeMes);
function recogeMes(e) {
    // console.log(e.target.value);
    let mes = e.target.value;
    if (mes != '') {
        let listaFiltradaMes = filtrarXmes(listaEventos, mes);
        pintarEventos(listaFiltradaMes)
    } else {
        pintarEventos(listaEventos)
    }
}

//filtro de campus
var selectorCampus = document.querySelector('#campus');
selectorCampus.addEventListener('change', recogeCampus);
function recogeCampus(e) {
    // console.log(e.target.value);
    let campus = e.target.value;
    if (campus != '') {
        let listaFiltradaCampus = filtrarXcampus(listaEventos, campus) ;
        pintarEventos(listaFiltradaCampus)
    } else {
        pintarEventos(listaEventos)
    }
}

