/**
 * objeto paginas
 * @type {{addObject: addObject}}
 */

let paginasObject =  (function() {

    let vector_paginas; 
    
    function addVectorPaginas(vector){
        vector_paginas = vector;    
    }

    function addPagina(object) {
        vector_paginas.push(object);
        //printMessage(object);
    }
    
    
    function checkDashboardPage(){
        for (let index = 0; index < counter_vector_paginas; index++) {
            const element = vector_paginas[index];
            const url_slug = (element.text_slug ? element.text_slug : element.auto_slug);
            if (pathname.search(url_slug) != -1){
                return true;        
            }        
        }
        return false;
    }
        
    function printMessage(object) {
        console.log("Object successfully added:", object);
    }

    function getVectorPaginas(){
        return vector_paginas;
    }

    return {
        insertarPagina: addPagina,
        buscarDashboardPagina: checkDashboardPage,
        devolverVectorPaginas: getVectorPaginas,
        anadirVectorPaginas: addVectorPaginas
    };

})();


/**
 * cargamos paginas
 */
 window.onload = function(){
     //if (location.href.search("phpandfriends") == -1)
        //leerPaginasFetch();
}

const loadUrl = (url) => {
    return new Promise(function (resolve, reject) {
        const request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (this.readyState === 4 && this.status == 200) {
                resolve(this.response);
            } else {
                reject(this.status);
            }
        };
        request.open('GET', url, true);
        request.send();
    });
};

const loadUrlFetch = (url) => {
    const myHeaders = new Headers({
        "Content-Type": "application/json",
         "Accept"      : "application/json"
        }
    );
    const fetchPromise = fetch(url,{
        method: 'GET'
    });
    return fetchPromise;
};


let leerPaginas = () => {
    let nueva_url = url+"JsController/getPaginas";
    loadUrl(nueva_url)
        .then(response => {
            let datos = response.json();
            for (let index = 0; index < datos.length; index++) {
                const element = datos[index];
                console.log(element);
            }
        })
        .catch(error => {
            console.error("Ha habido un error "+error);
        })
}

let leerPaginasFetch = () => {
    // local
    // console.log("la url: "+url);
    let nueva_url = url+"JsController/getPaginas";
    // servidor
    //let nueva_url = url+"JsController/getPaginas";
    let vector_paginas = [];
    loadUrlFetch(nueva_url)
        .then(response => response.json())
        .then(data => {
            for (let index = 0; index < data.length; index++) {
                //console.log(data[index]);
                //paginasObject.insertarPagina(data[index]);
                let element = data[index];
                let url_slug = (element.text_slug ? element.text_slug : element.auto_slug);
                if (pathname.search(url_slug) !== -1 && (url_slug == "dashboard" || url_slug == "noticias" || url_slug == "reservas" || url_slug == "evolucion-reservas") ){
                    //addScriptChart(); 
                //}else if (pathname.search(url_slug) !== -1 && (url_slug == "planning" || url_slug == "planning-reservas" || url_slug == "planning-booking")){
                    //addScriptPlanning();
                }        
            }
        })
        
}

let leerPaginasJquery = () => {
    $.ajax({
        type: "GET",
        url: "https://2automocion.com/paginas",
        success: function (data) {
            console.log("data"+data);
        }
    });
}


let addScriptChart = () => {
    // console.log("agregamos script");
    let myScript = document.createElement("script");
    let src = url+"assets/themes/findhouse/js/chart-custome.js";
    myScript.setAttribute("src", src);
    myScript.setAttribute("type", "text/javascript");
    myScript.defer = true;
    document.body.appendChild(myScript);
    
    // creamos chart pagina dashboard
    /*
    creamos_chart(); // creación reservas
    creamos_chart_llegadas(); // checkin y checkout
    creamos_chart_doughnut_one(); // agencias
    creamos_chart_doughnut_two(); // propietarios
    creamos_chart_benefits(); // beneficios
    */
}

let addScriptPlanning = () => {
    // console.log("agregamos script");
    let myScript = document.createElement("script");
    let src = url+"assets/themes/findhouse/js/planning.js";
    myScript.setAttribute("src", src);
    myScript.setAttribute("type", "text/javascript");
    myScript.defer = true;
    document.body.appendChild(myScript);
}

/* ----- Employee Dashboard Chart Js For Applications Statistics ----- */
let createConfigAjax = () => {
    return {
        type: 'line',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'Dataset',
                borderColor: window.chartColors.red,
                backgroundColor: window.chartColors.red,
                data: [10, 30, 46, 2, 8, 50, 0],
                fill: false,
            }]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: 'Sample tooltip with border'
            },
            tooltips: {
                position: 'nearest',
                mode: 'index',
                intersect: false,
                yPadding: 10,
                xPadding: 10,
                caretSize: 8,
                backgroundColor: 'rgba(72, 241, 12, 1)',
                titleFontColor: window.chartColors.black,
                bodyFontColor: window.chartColors.black,
                borderColor: 'rgba(0,0,0,1)',
                borderWidth: 4
            },
        }
    };
}


/********************************** Descatalogado ************************************  */
    /*
    // Example POST method implementation:
    async function postData(url = '', data = {}) {
        // Default options are marked with *
        const response = await fetch(url, {
            method: 'GET', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json'
                // 'Content-Type': 'application/x-www-form-urlencoded',
            },
            redirect: 'follow', // manual, *follow, error
            referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
            body: JSON.stringify(data) // body data type must match "Content-Type" header
        });
        return response.json(); // parses JSON response into native JavaScript objects
    }

    postData('https://example.com/answer', { })
        .then((data) => {
            console.log(data); // JSON data parsed by `data.json()` call
        });

    //const fetchPromise = fetch(url);
    //const fetchPromise = fetch("https://ghibliapi.herokuapp.com/people");
    const fetchPromise = fetch(url , {
        method: 'GET', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json'
            // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
        //body: JSON.stringify(data) // body data type must match "Content-Type" header
    });
    fetchPromise.then(response => {
        return response;
    }).then(paginas => {
        //const names = paginas.map(pagina => pagina.text_title).join("\n");
        console.log(paginas.body);
    });
    return fetchPromise;
    */