// domain name
let domain  	    = location.protocol+'//'+document.domain;
let domain_cookie   = document.domain;
let protocol        = window.location.protocol;
let host            = window.location.host;
let pathname        = window.location.pathname;
let location_search = window.location.search;
let url = domain + "/";
// pagina
let pagina = "";
let menu_vector = [];
// calendario
let calendario_numero_de_meses = 2;

$(function(){

    // buscador home
    listen_buscador_form_accion_field();

    // events prevent default
    change_all_anchors_event_prevent_default();

    // guardar menu
    guardarMenu();

    // calendarios idiomas
    //if(!language) language = "es";
    //calendarios_idiomas(language);

    // guardamos el calendario
    //calendario_front();

    // calendario back
    //calendarios_admin();

    // tabla exportacion show hide
    exportacion_show_hide();

    // print
    // printLocations();

});


let printLocations = () => {
    console.log("-------- location ----------\n");
    console.log("domain: "+domain);
    console.log("domain  cookie: "+domain_cookie);
    console.log("protocol: "+protocol);
    console.log("host: "+host);
    console.log("pathname: "+pathname);
    console.log("location_search: "+location_search);
    console.log("url: "+url);
    console.log("-------- end location ----------\n");
}


let guardarMenu = () => {

    let is_dlist = pathname.indexOf("dlist");
    let is_dedit = pathname.indexOf("dedit");
    let is_avantio_booking = pathname.indexOf("avantio_booking/");
    let is_urls = pathname.indexOf("/urls");
    let is_dictionary = pathname.indexOf("/dictionary");
    let is_resume = pathname.indexOf("/resume");
    let menu     = "";
    let vector   = "";

    if (is_dlist != -1 && is_avantio_booking == -1) {
        // dlist
        vector = pathname.split("/");
        //console.log(is_dlist);
        menu = vector[vector.length - 1];
        //console.log(menu);
    }else if (is_dlist != -1 && is_avantio_booking != -1){
        // dlist
        vector = pathname.split("/");
        menu = vector[vector.length - 4];
    }else if (is_dedit != -1 || is_avantio_booking != -1) {
        // dedit
        vector = pathname.split("/");
        let indice_seleccionado = 0;
        for (let i = 0; i < vector.length; i++) {
            if (vector[i] == "dedit" || vector[i] == "dlist") {
                indice_seleccionado = i + 1;
            }
        }// end for
        menu = vector[indice_seleccionado];
        //console.log("el menu"+menu);
    }else if(is_urls != -1){
        vector = pathname.split("/");
        menu = vector[vector.length - 1];
    }else if(is_dictionary != -1){
        vector = pathname.split("/");
        menu = vector[vector.length - 1];
    }else if(is_resume != -1){
        vector = pathname.split("/");
        menu = vector[vector.length - 1];
    }// end if

    $("ul.sidebar-menu a").each(function (index) {
       //console.log("menu: "+menu);
       let clase = $(this).attr("class");
       let comparador = "";
       if(menu == "avantio_booking"){
           //comparador = "avantio_booking_accommodation";
           comparador = menu;
        }else{
           comparador = menu;
       }
       if (comparador == clase) {
           $(this).addClass("active");
           let parents = $(this).parents('ul.treeview-menu');
           parents.addClass("menu-open");
       }// end if
    });

}



/**
* mostramos los calenarios
*/
let calendario_front = () => {

    var currentDay = new Date();
    var nextDate   = new Date();
    var dateFormat = "dd/mm/yy";

    // console.log("creando calendario");

    // booking
    $(".search_checkin").datepicker({
        dateFormat: "dd/mm/yy",
        numberOfMonths: calendario_numero_de_meses,
        firstDay: 1,
        changeMonth: false,
        //minDate: 'today',
        onClose: function () {
            $(".search_checkout").datepicker("show");
        },
        onSelect: function(selectedDate) {
            let fecha_seleccionada = moment(selectedDate , "DD/MM/YYYY");
            fecha_seleccionada.add(1,'days');
            $( ".search_checkout" ).datepicker("setDate",fecha_seleccionada.format("DD/MM/YYYY"));
            $(".search_checkout" ).datepicker( "option","minDate",  $(".buscador_search_checkin").datepicker("getDate"));
        },
    });

    $(".search_checkout").datepicker({
        dateFormat: "dd/mm/yy",
        numberOfMonths: calendario_numero_de_meses,
        firstDay: 1,
        changeMonth: false,
    });


    // booking-list
    $(".search_checkin_booking").datepicker({
        dateFormat: "dd/mm/yy",
        numberOfMonths: calendario_numero_de_meses,
        firstDay: 1,
        changeMonth: false,
        //minDate: 'today'
        onClose: function () {
            $(".search_checkout_booking").datepicker("show");
        },
        onSelect: function(selectedDate) {
            let fecha_seleccionada = moment(selectedDate , "DD/MM/YYYY");
            fecha_seleccionada.add(1,'days');
            $( ".search_checkout_booking" ).datepicker("setDate",fecha_seleccionada.format("DD/MM/YYYY"));
            $(".search_checkout_booking" ).datepicker( "option","minDate",  $(".search_checkin_booking").datepicker("getDate"));
        },
    });


    $(".search_checkout_booking").datepicker({
        dateFormat: "dd/mm/yy",
        numberOfMonths: calendario_numero_de_meses,
        firstDay: 1,
        changeMonth: false,
    });

    //$("#buscador_search_checkin").datepicker('DD/MM/YY', "dateFormat", $(this).val());

}// end function


let calendarios_idiomas = (language) => {

    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };

    $.datepicker.regional['ru'] = {
        closeText: 'Закрыть',
        prevText: '>Пред',
        nextText: 'След>',
        currentText: 'Сегодня',
        monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        monthNamesShort: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
        dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
        dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
        weekHeader: 'Нед',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };

    $.datepicker.regional['fr'] = {
        closeText: "Fermer",
        prevText: "Précédent",
        nextText: "Suivant",
        currentText: "Aujourd'hui",
        monthNames: [ "Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre" ],
        monthNamesShort: [ "Janv.", "Févr.", "Mars", "Avr.", "Mai", "Juin", "Juil.", "Août", "Sept.", "Oct.", "Nov.", "Déc." ],
        dayNames: [ "Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi" ],
        dayNamesShort: [ "Dim.", "Lun.", "Mar.", "Mer.", "Jeu.", "Ven.", "Sam." ],
        dayNamesMin: [ "D","L","M","M","J","V","S" ],
        weekHeader: "Sem.",
        dateFormat: "dd/mm/yy",
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ""
    };

    $.datepicker.setDefaults($.datepicker.regional[language]);


}// end function



let calendarios_admin = () => {

    let currentDay = new Date();
    let nextDate = new Date();
    // nextDate.setDate(nextDate.getDate() + 2)
    let dateFormat = "yy-mm-dd";

    $(".search_checkin_admin").datepicker({
        dateFormat:"dd/mm/yy",
        //dateFormat:"yy-mm-dd",
        numberOfMonths: calendario_numero_de_meses,
        firstDay: 1,
        changeMonth: false,
        minDate: 'today',
        beforeShowDay: function (date) {
            return [true, "", "Available"];
        },

        // datesDisabled: arr_dates_selected,
        onClose: function () {
            $(".search_checkout_admin").datepicker("show");
        },
        onSelect: function(selectedDate) {
            let date = $(this).datepicker("getDate"); //Get the Date object with actual date
            date.setDate(date.getDate() + 1); //Set date object adding 3 days.
            $(".search_checkout_admin").datepicker("setDate", date); //Set the date of the datepicker with our date object
            $(".search_checkout_admin").datepicker( "option", "minDate", selectedDate );
        }
        }).on("change", function () {
    });


    $(".search_checkout_admin").datepicker({
        dateFormat: "dd/mm/yy",
        //dateFormat: "yy-mm-dd",
        numberOfMonths: calendario_numero_de_meses,
        firstDay: 1,
        changeMonth: false,
        minDate: 'today',
        beforeShowDay: function (date) {
            return [true, "", "Available"];
        },
        onChange:function() {

        }
        //}).on("change", function () {

    });

    function getDate(element) {
        let date;
        try {
            date = $.datepicker.parseDate(dateFormat, element.value);
        } catch (error) {
            date = null;
        }
        return date;
    }

    //$("#buscador_search_checkin_admin").val($("#fecha_in").val());
    //$("#search_checkout_admin").val($("#fecha_out").val());

}// end function




/**
 * Home, when user click comprar o alquilar form
 * change hidden field  
 * 
 */
let listen_buscador_form_accion_field = () => {
    $("#pills-home-tab").on("click",function(){
        $("#accion").val(1);
    });

    $("#pills-profile-tab").on("click",function(){
        $("#accion").val(2);
    });
}


/**
 * Cambaimos todos los anchors
 * para que tengan event prevent default
 * 
 */

let change_all_anchors_event_prevent_default = () => {
  
    // menu
  $(".inmo_menu").click(function(event){
    event.preventDefault();
  });

  $(".propietario_menu").click(function(event){
    event.preventDefault();
  });

  // ofertas
  $(".popup_video_btn").click(function(event){
    event.preventDefault();
  });

  // inmobiliarias
  $(".no_link_event").click(function(event){
    event.preventDefault();
  });

}// end function

/*
// get parametters by GET
let findGetParameter = (parameterName)  => {
    var result = null,
        tmp = [];
    location.search
        .substr(1)
        .split("&")
        .forEach(function (item) {
            tmp = item.split("=");
            if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
        });
    return result;
}
*/


let plusSlides = (n) => {
    showSlides(slideIndex += n);
}

let currentSlide = (n) =>  {
    showSlides(slideIndex = n);
}


let showSlides = (n) => {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("demo");
    var captionText = document.getElementById("caption");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    captionText.innerHTML = dots[slideIndex-1].alt;
}

let exportacion_show_hide = () => {
    // show hide exportaciones
    $(".exportar_button").click(function(){
        $("#exportar_table").toggle();
        $(".barra_exportacion").toggle();
    });
}


/*
 * Function to set and get cookies (FUNCTIONS:)
 * setCookie, getCookie, checkCookie, pre_set_cookie, $(".btn-borde-rojo").submit
 */

/*
function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    //return "";
    return null;
}

function checkCookie() {
    var variable = getCookie("ofiprix");
    if (variable != "") {
        // ya tiene cookies
    } else {
        // jQuery('.modal-cookies').modal('show');
        $('.modal-cookies').modal('show');
    }
}


// Write cookie
function write_cookie(){
    document.cookie = "new_cookie=value_cookie;domain=."+document.domain+";path=/";
}

// read cookie
function read_cookie(name) {
    var result = document.cookie.match(new RegExp(name + '=([^;]+)'));
    result && (result = JSON.parse(result[1]));
    return result;
}
*/


/*
 * Function to validate email
 * boton_newsletter
 * formulario-newsletter
 */

let validateEmail = (email) => {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

let validate = (email) => {
    if (validateEmail(email)) {
        // Enviamos formulario
    } else {
        // no es válido, por favor vuelve a escribirlo");
    }
    return false;
}