// vars
var pagina = "";

$(function(){
        
        console.log("ready");

        // call to functions
        setTimeout(function(){
            make_pagina_values();
            make_required_fields();
            make_toggle();
        },2000);
        

        // promocion clave a disabled
        //  poner posiciones mapa google maps

        // DATATABLE
        // Near places table
        /*
        $('#near-places, #extra-table').DataTable({
            "paging": false,
            "info": false,
            "searching": false,
            "ordering": false,
            fixedColumns: true
        });

        
        // DATATABLE
        // Pictures table
        $('#pictures-table').DataTable({
            "paging": true,
            "info": false,
            "searching": false,
            "ordering": false,
            fixedColumns: true
        });
        

        // SELECT2
        $('#mp_gallery').select2({
                placeholder: '',
                formatResult: function (item, container) {
                    if (item.element[0].dataset.img) {
                        return "<img width='100px' height='100px' src='" + item.element[0].dataset.img + "'/><span>" + item.text + "</span>";
                    } else
                        return item.text;
                }
            }
        ).on("change", function (e) {
            var elements_selected = $('#mp_gallery').select2("data");
            var salida = '';
            for (i = 0; i < elements_selected.length; i++) {
                salida += elements_selected[i].id + ',';
            }
            salida = (salida == '') ? salida : salida.slice(0, -1);
            $('#multiple_gallery').val(salida);
        });

        //$('#mp_gallery').select2("data", [<?php //echo implode(",", $selected_gallery);?>]);

        $('.autoselect2').select2(
            {
                placeholder: '',
                formatResult: function (item, container) {
                    if (item.element[0].dataset.img) {
                        return "<img width='100px' height='100px' src='" + item.element[0].dataset.img + "'/><span>" + item.text + "</span>";
                    } else
                        return item.text;
                }
            }
        );
        
        // DROPDOWN
        $("#dynamic_gallery").msDropDown();
        $("#dynamic_gallery_1").msDropDown();
        $("#dynamic_gallery_2").msDropDown();
        $("#dynamic_gallery_3").msDropDown();
        $("#dynamic_gallery_4").msDropDown();
        $("#dynamic_gallery_5").msDropDown();
        $("#dynamic_gallery_6").msDropDown();
        $("#dynamic_gallery_7").msDropDown();
        $("#dynamic_gallery_8").msDropDown();
        */
});


/**
 * make pagina values
 */
function make_pagina_values(){
   pagina = $("input[name='pagina']").val();
   console.log("rooms: "+pagina); 
}

/**
 * Make required fields
 */
function make_required_fields(){
    var required_text_fields           = [];
    var required_number_fields         = [];
    var required_textarea_fields       = [];
    var required_select_fields         = [];
    // rooms
    if (pagina == "rooms"){
        required_text_fields           = ["text_title","text_ref", "text_zona"];
        required_number_fields         = ["number_precio decimal","number_precioinmo","number_precioalq"];
        required_textarea_fields       = ["textarea_description"];
        required_select_fields         = ["dynamic_agencia,dynamic_usuario,dynamic_taxonomy,dynamic_taxonomy_group,dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,dynamic_geodistrict,dynamic_accion"];
        // dynamic_gallery_usuario dynamic_gallery_inmo
        required_text_fields.forEach(function(element,index,array){
            $("input[name='"+element+"']").attr("required",true);
            $("input[name='"+element+"']").prop('required',true);
            //console.log("elemento: "+element);
        });
        required_number_fields.forEach(function(element,index,array){
            $("input[name='"+element+"']").attr("required",true);
        });
        required_textarea_fields.forEach(function(element,index,array){
            $("input[name='"+element+"']").attr("required",true);
        });
        required_select_fields.forEach(function(element,index,array){
            $("input[name='"+element+"']").attr("required",true);
        });
    }// end if
}// end function

/**
 * function toggle
 * seo and 
 *
 * @return void
 */
function make_toggle(){
    // TOGGLE
    // SEO section Toggle
    $('#seo-header').click(function () {
        $("#seo-section").slideToggle();
    });
    // Avantio section toggle
    $('#avantio-header').click(function () {
        $("#avantio-section").slideToggle();
    });
}
   

/**
 * function check size files
 *
 * @return void
 */
function checkSize() {
    var peso = $('.file-to-check')[0].files[0].size;
    if (peso > 1000000) {
        alert("Imagen demasiado grande, tamaño máximo: 1MB");
        return false;
    }
    return true;
}
    
/**
 *  function get editor pages
 *  @return void 
 */
function get_editor(editor_id) {
    editor = CodeMirror.fromTextArea(document.getElementById(editor_id), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "text/html",
        indentUnit: 2,
        indentWithTabs: true,
        enterMode: "keep",
        tabMode: "shift"
    });
}