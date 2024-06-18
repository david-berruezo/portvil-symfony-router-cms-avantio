<?php
/*
 * Tratamiento de urls
 */

if (!function_exists("baseUrl")){
    function baseUrl($request)
    {
        $baseurl = $request->getScheme() . '://' . $request->getHttpHost() . $request->getBasePath();
        return $baseurl;
    }
}

if (!function_exists("obtener_url")){
    function obtener_url( $s, $use_forwarded_host = false )
    {
        $ssl      = ( ! empty( $s['HTTPS'] ) && $s['HTTPS'] == 'on' );
        $sp       = strtolower( $s['SERVER_PROTOCOL'] );
        $protocol = substr( $sp, 0, strpos( $sp, '/' ) ) . ( ( $ssl ) ? 's' : '' );
        $port     = $s['SERVER_PORT'];
        $port     = ( ( ! $ssl && $port=='80' ) || ( $ssl && $port=='443' ) ) ? '' : ':'.$port;
        $host     = ( $use_forwarded_host && isset( $s['HTTP_X_FORWARDED_HOST'] ) ) ? $s['HTTP_X_FORWARDED_HOST'] : ( isset( $s['HTTP_HOST'] ) ? $s['HTTP_HOST'] : null );
        $host     = isset( $host ) ? $host : $s['SERVER_NAME'] . $port;

        return $protocol . '://' . $host;
    }
}


if (!function_exists("url_origin")){
    function url_origin( $s, $use_forwarded_host = false )
    {
        $ssl      = ( ! empty( $s['HTTPS'] ) && $s['HTTPS'] == 'on' );
        $sp       = strtolower( $s['SERVER_PROTOCOL'] );
        $protocol = substr( $sp, 0, strpos( $sp, '/' ) ) . ( ( $ssl ) ? 's' : '' );
        $port     = $s['SERVER_PORT'];
        $port     = ( ( ! $ssl && $port=='80' ) || ( $ssl && $port=='443' ) ) ? '' : ':'.$port;
        $host     = ( $use_forwarded_host && isset( $s['HTTP_X_FORWARDED_HOST'] ) ) ? $s['HTTP_X_FORWARDED_HOST'] : ( isset( $s['HTTP_HOST'] ) ? $s['HTTP_HOST'] : null );
        $host     = isset( $host ) ? $host : $s['SERVER_NAME'] . $port;

        return $protocol . '://' . $host;
    }
}

# $absolute_url = full_url( $_SERVER );
if (!function_exists("full_url")) {
    function full_url($s, $use_forwarded_host = false)
    {
        return url_origin($s, $use_forwarded_host) . $s['REQUEST_URI'];
    }
}

if (!function_exists("full_url_without_parameters")) {
    function full_url_without_parameters()
    {
        $url = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'] . explode('?', $_SERVER['REQUEST_URI'], 2)[0];
        return $url;
    }
}

if (!function_exists("look_for_something_in_url")) {
    function look_for_something_in_url($param)
    {
        $absolute_url = full_url($_SERVER);
        $found_it = strpos($absolute_url, $param);
        //echo "posicion: ".$found_it."del parametro: ".$param."<br>";
        $found_it ? $found_it = true : $found_it = false;
        return $found_it;
    }
}


if (!function_exists("indexar_array")) {
    function indexar_array($array,$index){
        if(!is_array($array)) return array($array->$index => $array);
        $return_array = array();
        foreach($array as $data){
            if(is_object($data))
                $return_array[$data->$index] = $data;
            else
                $return_array[$data[$index]] = $data;
        }
        return $return_array;
    }
}

if (!function_exists("scrapeBetween")) {
    function scrapeBetween($item, $start, $end) {
        if (($startPos = stripos($item, $start)) === false) { // If
            //$start string is not found
            return false; // Return false
        } else if (($endPos = stripos($item, $end)) === false) { // If
            //$end string is not found
            return false; // Return false
        } else {
            $substrStart = $startPos + strlen($start); // Assigning start
            //position
            return substr($item, $substrStart, $endPos - $substrStart);
            // Returning string between start and end positions
        }// end if
    }// end function
}

if (!function_exists("url_semantica")) {
    function url_semantica($string , $keyReplace = "-" , $minuscula = true){
        $string     =  RemoveSign($string);
        // neu muon de co dau
        // $string  =  trim(preg_replace("/[^A-Za-z0-9àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠ$
        $string     =  trim(preg_replace("/[^A-Za-z0-9]/i"," ",$string)); // khong dau
        $string     =  str_replace(" ","-",$string);
        $string     =  str_replace("--","-",$string);
        $string     =  str_replace("--","-",$string);
        $string     =  str_replace("--","-",$string);
        $string     =  str_replace($keyReplace,"-",$string);
        $string     =  ($minuscula) ? strtolower($string) : $string;

        return $string;
    }
}

/**
 * @param $field
 * @return mixed|string|string[]|null
 */
if (!function_exists("clean_to_utf8")) {
    function clean_to_utf8($field){
        $str = utf8_decode($field);
        $str = str_replace("&nbsp;", " ", $str);
        $str = preg_replace('/\s+/', ' ',$str);
        $str = trim($str);

        return $str;
    }// end function
}


/**
 * @param $str
 * @return string
 */
if (!function_exists("clean_space")) {
    function clean_space($str){
        $str = ltrim(trim(rtrim($str)));
        return $str;
    }// end function
}



if (!function_exists("RemoveSign")) {
    function RemoveSign($str){

        $coDau = array("à","á","ạ","ả","ã","â","ầ","ấ","ậ","ẩ","ẫ","ă",
            "ằ","ắ","ặ","ẳ","ẵ",
            "è","é","ẹ","ẻ","ẽ","ê","ề" ,"ế","ệ","ể","ễ",
            "ì","í","ị","ỉ","ĩ",
            "ò","ó","ọ","ỏ","õ","ô","ồ","ố","ộ","ổ","ỗ","ơ"
        ,"ờ","ớ","ợ","ở","ỡ",
            "ù","ú","ụ","ủ","ũ","ư","ừ","ứ","ự","ử","ữ",
            "ỳ","ý","ỵ","ỷ","ỹ",
            "đ",
            "À","Á","Ạ","Ả","Ã","Â","Ầ","Ấ","Ậ","Ẩ","Ẫ","Ă"
        ,"Ằ","Ắ","Ặ","Ẳ","Ẵ",
            "È","É","Ẹ","Ẻ","Ẽ","Ê","Ề","Ế","Ệ","Ể","Ễ",
            "Ì","Í","Ị","Ỉ","Ĩ",
            "Ò","Ó","Ọ","Ỏ","Õ","Ô","Ồ","Ố","Ộ","Ổ","Ỗ","Ơ"
        ,"Ờ","Ớ","Ợ","Ở","Ỡ",
            "Ù","Ú","Ụ","Ủ","Ũ","Ư","Ừ","Ứ","Ự","Ử","Ữ",
            "Ỳ","Ý","Ỵ","Ỷ","Ỹ",
            "Đ","ê","ù","à",
            "Ñ","ñ"
        );

        $khongDau = array("a","a","a","a","a","a","a","a","a","a","a"
        ,"a","a","a","a","a","a",
            "e","e","e","e","e","e","e","e","e","e","e",
            "i","i","i","i","i",
            "o","o","o","o","o","o","o","o","o","o","o","o"
        ,"o","o","o","o","o",
            "u","u","u","u","u","u","u","u","u","u","u",
            "y","y","y","y","y",
            "d",
            "A","A","A","A","A","A","A","A","A","A","A","A"
        ,"A","A","A","A","A",
            "E","E","E","E","E","E","E","E","E","E","E",
            "I","I","I","I","I",
            "O","O","O","O","O","O","O","O","O","O","O","O"
        ,"O","O","O","O","O",
            "U","U","U","U","U","U","U","U","U","U","U",
            "Y","Y","Y","Y","Y",
            "D","e","u","a",
            "N","n"
        );

        return str_replace($coDau,$khongDau,$str);

    }// end function
}


if (!function_exists("quitarAcentos")) {
    function quitarAcentos($text)
    {
        $text = htmlentities($text, ENT_QUOTES, 'UTF-8');
        $text = strtolower($text);
        $patron = array (
            // Espacios, puntos y comas por guion
            '/[\., ]+/' => '-',

            // Vocales
            '/&agrave;/' => 'a',
            '/&egrave;/' => 'e',
            '/&igrave;/' => 'i',
            '/&ograve;/' => 'o',
            '/&ugrave;/' => 'u',

            '/&aacute;/' => 'a',
            '/&eacute;/' => 'e',
            '/&iacute;/' => 'i',
            '/&oacute;/' => 'o',
            '/&uacute;/' => 'u',

            '/&acirc;/' => 'a',
            '/&ecirc;/' => 'e',
            '/&icirc;/' => 'i',
            '/&ocirc;/' => 'o',
            '/&ucirc;/' => 'u',

            '/&atilde;/' => 'a',
            '/&etilde;/' => 'e',
            '/&itilde;/' => 'i',
            '/&otilde;/' => 'o',
            '/&utilde;/' => 'u',

            '/&auml;/' => 'a',
            '/&euml;/' => 'e',
            '/&iuml;/' => 'i',
            '/&ouml;/' => 'o',
            '/&uuml;/' => 'u',
            '/&auml;/' => 'a',
            '/&euml;/' => 'e',
            '/&iuml;/' => 'i',
            '/&ouml;/' => 'o',
            '/&uuml;/' => 'u',

            // Otras letras y caracteres especiales
            '/&aring;/' => 'a',
            '/&ntilde;/' => 'n',
            // Agregar aqui mas caracteres si es necesario
        );

        $text = preg_replace(array_keys($patron),array_values($patron),$text);
        return $text;
    }
}


if (!function_exists("limpiar_archivo")) {
    function limpiar_archivo($name)
    {
        if(stristr($name, '.jpg'))
        {
            //quitamos la extension al archivo
            $nombre = str_replace('.jpg', '', $name);
            //limpiamos el nombre
            $nombre = url_semantica($nombre);
            //añadimos la extension al archivo
            $nombre = $nombre.'.jpg';
        }
        elseif(stristr($name, '.jpeg'))
        {
            //quitamos la extension al archivo
            $nombre = str_replace('.jpeg', '', $name);
            //limpiamos el nombre
            $nombre = url_semantica($nombre);
            //añadimos la extension al archivo
            $nombre = $nombre.'.jpeg';
        }
        elseif(stristr($name, '.gif'))
        {
            //quitamos la extension al archivo
            $nombre = str_replace('.gif', '', $name);
            //limpiamos el nombre
            $nombre = url_semantica($nombre);
            //añadimos la extension al archivo
            $nombre = $nombre.'.gif';
        }
        elseif(stristr($name, '.png'))
        {
            //quitamos la extension al archivo
            $nombre = str_replace('.png', '', $name);
            //limpiamos el nombre
            $nombre = url_semantica($nombre);
            //añadimos la extension al archivo
            $nombre = $nombre.'.png';
        }
        elseif(stristr($name, '.pdf'))
        {
            //quitamos la extension al archivo
            $nombre = str_replace('.pdf', '', $name);
            //limpiamos el nombre
            $nombre = url_semantica($nombre);
            //añadimos la extension al archivo
            $nombre = $nombre.'.pdf';
        }

        return $nombre;
    }
}

if (!function_exists("str_pre")) {
    function str_pre($var,$tags=0,$die=0){
        $iVerbose = true;
        $tag = "<pre>";
        $debug = false;
        echo ($iVerbose) ? (($tag)?"<pre>":"").print_r($var,1).(($tag)?"</pre>":"") : "";
        if($debug && $die) die();
        return true;
    }
}

if (!function_exists("p2bd")) {
    function p2bd($fecha){
        list($iDia,$iMes,$iAnyo) = explode("/",$fecha);
        return date("Y-m-d",mktime(0,0,0,$iMes,$iDia,$iAnyo));
    }
}

if (!function_exists("date2bd")) {
    function date2bd($fecha){
        list($iDia,$iMes,$iAnyo)=explode("/",$fecha);
        return date("Y-m-d",mktime(0,0,0,$iMes,$iDia,$iAnyo));
    }
}

if (!function_exists("bd2p")) {
    function bd2p($fecha){
        list($iAnyo,$iMes,$iDia)=explode("-",$fecha);
        return date("d/m/Y",mktime(0,0,0,$iMes,$iDia,$iAnyo));
    }
}

if (!function_exists("bd2date")) {
    function bd2date($fecha){
        list($iAnyo,$iMes,$iDia)=explode("-",$fecha);
        return date("d/m/Y",mktime(0,0,0,$iMes,$iDia,$iAnyo));
    }
}



if (!function_exists("interval")) {
    function interval($fecha_ini,$fecha_fin){
        $format = "d/m/Y";
        $datetime1 = DateTime::createFromFormat($format, $fecha_ini);
        $datetime2 = DateTime::createFromFormat($format, $fecha_fin);
        //$datetime1 = new DateTime($fecha_ini);
        //$datetime2 = new DateTime($fecha_fin);
        $interval = $datetime1->diff($datetime2);
        $num_dias = $interval->days;

        return $num_dias;
    }
}

if (!function_exists("inteval_days")) {
    function inteval_days($fecha_ini,$fecha_fin){
        $datetime1 = new DateTime($fecha_ini);
        $datetime2 = new DateTime($fecha_fin);
        $interval = $datetime1->diff($datetime2);
        $num_dias = $interval->days;
        return $num_dias;
    }
}

if (!function_exists("show_errors")) {
    function show_errors(){
        error_reporting(E_ALL);
        ini_set("display_errors",1);
    } // end function
}


if (!function_exists("no_show_errors")) {
    function no_show_errors(){
        error_reporting(0);
        ini_set("display_errors",0);
    } // end function
}



if (!function_exists("p_")) {
    function p_()
    {

        $args = func_get_args();
        $num_args = func_num_args();
        $label = "";

        $font_size = '14';
        $box_size = '10';
        $has_todo = false;
        $bg_color_div = 'white';
        $show_div = true;

        if ($num_args > 0) {
            $last_arg = func_get_arg($num_args - 1);
            echo "<div><pre>";
            echo "<div style='margin: 10px; margin-top: 70px; border:0px; padding: 2px;'>";
            $background_color = 'green';
            if (is_string($last_arg) && ($last_arg != "") && substr($last_arg, 0, 6) === '__lab:') {
                $label = substr($last_arg, 6, strlen($last_arg));
                unset($args[$num_args - 1]);
                $label_error = strtolower($label);
                $background_color = '#FF8000';
                if ($label_error == 'error' || $label_error == 'exception') {
                    $label = 'Exception';
                    $background_color = '#C42732';
                }
                if ($label_error == 'dev_info') {
                    $label = 'Development info';
                    $background_color = '#C42732';
                    $font_size = '12';
                    $box_size = '5';
                }
                if ($label_error == 'todo') {
                    $label = '!!!!!!!!!! Todo !!!!!!!!!!';
                    $background_color = '#f442b0';
                    $bg_color_div = '';
                    $font_size = '12';
                    $box_size = '5';
                    $has_todo = true;
                }
                if ($label_error == 'empty') {
                    $show_div = false;
                }
            } else {
                $label = "PRINT";
            }

            $file_info_used = print_debug('1', false, true);

            // if(is_string($last_arg) && ($last_arg!="") && substr($last_arg,0,4)==='__^:'){
            // 	$key_begins_with = substr($last_arg, 3, strlen($last_arg));
            // 	unset($args[$num_args-1]);
            // 	$label = "BEGINS WITH";
            // }
            if ($show_div) {
                echo "<div style='margin:10px; margin-bottom:10px;'>" .
                    "<span style=\"background-color: $background_color; color: white; font-size: 12px; padding: " . $box_size . "px; border: 2px solid black;\"><b>"
                    . $label . "</b></span></div>";
            }

            $count = 1;

            foreach ($args as $arg) {
                if ($show_div) {
                    echo "<div style='margin: 10px 10px 2px 10px; border:2px solid black; padding: 5px; background-color: $bg_color_div;'>";
                }
                if (count($args) > 1) {
                    echo "<span style='font-size: 12px; font-weight: bold; color: red; padding:2px;'>Variable: " . $count . "</span></br>";
                }
                if (is_string($arg)) {
                    if (is_null($arg) || $arg == 'null') {
                        echo "<span style='color:red; font-weight: bold; font-size:" . $font_size . "px;'>" . $arg . "</span>";
                    } else {
                        echo "<span style='color:green; font-weight: bold; font-size: " . $font_size . "px;'>" . $arg . "</span>";
                    }
                } else {
                    print_r($arg);
                }
                if ($show_div) {
                    echo "</div>";
                }
                // echo "<div style=\"height:10px;\"></div>";
                ++$count;
            }
            echo "<div style='font-style:italic; padding-left: 10px; font-size: 10px; text-align:right; margin:0px; padding: 0px;'>$file_info_used</div></div>";
            echo "</pre></div>";
            // echo "<br/>";
        }
        return;
    }
}

if (!function_exists("print_debug")) {
    function print_debug($step_back=2, $fb=false, $file_info_only=false){

        $debug = debug_backtrace();
        $function = $debug[$step_back]['function'];
        $line = isset($debug[$step_back]['line']) ? $debug[$step_back]['line'] : -1;
        $args = isset($debug[$step_back]['args']) ? $debug[$step_back]['args'] : -1;
        $file = isset($debug[$step_back]['file']) ? $debug[$step_back]['file'] : -1;
        if($file_info_only){
            return $file.' => LINE:'.$line;
        }

        if($fb==false){
            d_('called function:'.$function);
            d_('called line:'.$line);
            d_('called arguments:'.$args);
            d_('called file:'.$file);
        }else{
            fb_('called function:'.$function);
            fb_('called line:'.$line);
            fb_('called arguments:'.$args);
            fb_('called file:'.$file);
        }
    }
}


if (!function_exists("count_same_elements_several_arrays")) {
    function count_same_elements_several_arrays(){
        $content_arrays = func_get_args();
        $num_arrays = func_num_args();
        $coincidencies = call_user_func_array('array_intersect', $content_arrays);
        $num_coincidencies = count($coincidencies);
        return $num_coincidencies;
    }// end function
}

if (!function_exists("get_same_elements_several_arrays")) {
    function get_same_elements_several_arrays(){
        $content_arrays = func_get_args();
        $num_arrays = func_num_args();
        $coincidencies = call_user_func_array('array_intersect', $content_arrays);
        return $coincidencies;
    }// end function
}

if (!function_exists("count_different_elements_several_arrays")) {
    function count_different_elements_several_arrays(){
        $content_arrays = func_get_args();
        $num_arrays = func_num_args();
        $differences = call_user_func_array('array_diff', $content_arrays);
        $num_differences = count($differences);
        return $num_differences;
    }// end function
}

if (!function_exists("get_different_elements_several_arrays")) {
    function get_different_elements_several_arrays(){
        $content_arrays = func_get_args();
        $num_arrays = func_num_args();
        $differences = call_user_func_array('array_diff', $content_arrays);
        return $differences;
    }// end function
}

if (!function_exists("set_join_arrays")) {
    function set_join_arrays(){
        $content_arrays = func_get_args();
        $num_arrays = func_num_args();
        $join = call_user_func_array('array_merge', $content_arrays);
        return $join;
    }// end function
}


if (!function_exists("set_explode_by_character")) {
    function set_explode_by_character($delimiter,$vector){
        $result = explode($delimiter,$vector);
        return $result;
    }// end function
}

if (!function_exists("set_implode_by_character")) {
    function set_implode_by_character($delimiter,$vector){
        $result = implode($delimiter,$vector);
        return $result;
    }// end function
}


if (!function_exists("get_vector_lectura_fichero_xml_checkbox")) {
    function get_vector_lectura_fichero_xml_checkbox(){

        # para los checooxx lectura xml

        $vector_lectura_fichero_xml_checkbox = array(
            "Acceso Pmr"                                    => "checkbox_acceso_pmr",
            "Adaptado Minus."                               => "checkbox_adaptado_minusvalido",
            "Agua"                                          => "checkbox_agua",
            "Aire acondicionado"                            => "checkbox_aire_acondicionado",
            "Aire Acondicionado"                            => "checkbox_aire_acondicionado",
            "Aire Acond. Central"                           => "checkbox_aire_acondicionado_centralizado",
            "Aire Acond. Central"                           => "checkbox_airecentral",
            "Alarma"                                        => "checkbox_alarma",
            "Alarma Incendio"                               => "checkbox_alarma_incendio",
            "Alarma Robo"                                   => "checkbox_alarma_robo",
            "Altillo"                                       => "checkbox_altillo",
            "Apart. Separado"                               => "checkbox_aprt_separado",
            "Arboles"                                       => "checkbox_arboles",
            "Arma. Empotrados"                              => "checkbox_armarios_empotrados",
            "Armaarios Empotrados"                          => "checkbox_armarios_empotrados",
            "Ascensor"                                      => "checkbox_ascensor",
            "Autobuses"                                     => "checkbox_autobuses",
            "Balcón"                                        => "checkbox_balcon",
            "Bar"                                           => "checkbox_bar",
            "Barbacoa"                                      => "checkbox_barbacoa",
            "Bomba Frío Y Calor"                            => "checkbox_bomba_frio_y_calor",
            "Buhardilla"                                    => "checkbox_buhardilla",
            "Caja Fuerte"                                   => "checkbox_caja_fuerte",
            "Calefacción"                                   => "checkbox_calefaccion",
            "Calefacción Central"                           => "checkbox_calefaccion_central",
            "Calefac Central"                               => "checkbox_calefaccion_central",
            "Centros Comerciales"                           => "checkbox_centros_comerciales",
            "Chimenea"                                      => "checkbox_chimenea",
            "Colegios"                                      => "checkbox_colegios",
            "Gastos Comunidad"                              => "checkbox_comunidad_incluida",
            "Deposito Agua"                                 => "checkbox_deposito_agua",
            "Descalcificador"                               => "checkbox_descalcificador",
            "Despensa"                                      => "checkbox_despensa",
            "Diáfano"                                       => "checkbox_diafano",
            "Distancia al mar"                              => "checkbox_primera_linea_de_mar",
            "Electrodomésticos"                             => "checkbox_electrodomesticos",
            "Esquina"                                       => "checkbox_esquina",
            "Galería"                                       => "checkbox_galeria",
            "Garaje Doble"                                  => "checkbox_garaje_doble",
            "Garaje Incluido"                               => "checkbox_garaje_incluido",
            "Garaje Opcional"                               => "checkbox_garaje_opcional",
            "Gas Ciudad"                                    => "checkbox_gas_ciudad",
            "Golf"                                          => "checkbox_golf",
            "Hab. Juegos"                                   => "checkbox_habitacion_juegos",
            "Hidromasaje"                                   => "checkbox_hidromasaje",
            "Hilo Musical"                                  => "checkbox_hilo_musical",
            "Hospitales"                                    => "checkbox_hospitales",
            "Jacuzzi"                                       => "checkbox_jacuzzi",
            "Jardín"                                        => "checkbox_jardin",
            "Lavandería"                                    => "checkbox_lavanderia",
            "Línia Telefónica"                              => "checkbox_linea_teleronica",
            "Línia Telefónica"                              => "checkbox_linia_telefonica",
            "Luminoso"                                      => "checkbox_luminoso",
            "Luz"                                           => "checkbox_luz",
            "Mirador"                                       => "checkbox_mirador",
            "Montacargas"                                   => "checkbox_montacargas",
            "Muebles"                                       => "checkbox_muebles",
            "Ojos De Buey"                                  => "checkbox_ojo_de_buey",
            "Parabólica"                                    => "checkbox_parabolica",
            "parking"                                       => "checkbox_parking",
            "Parking Opcional"                              => "checkbox_parking_opcional",
            "Patio"                                         => "checkbox_patio",
            "Pérgola"                                       => "checkbox_pergola",
            "Piscina Comunitaria"                           => "checkbox_piscina_comunitaria",
            "Piscina Propia"                                => "checkbox_piscina_de_propiedad",
            "Preinst. Aacc"                                 => "checkbox_preinstalacion_aire_acondicionado",
            "Puerta Blindada"                               => "checkbox_puerta_blindada",
            "Puertas Automático"                            => "checkbox_puertas_automaticas",
            "Puertas Auto"                                  => "checkbox_puertas_automatico",
            "Riego.Auto"                                    => "checkbox_riego_automatico",
            "Riego Automático"                              => "checkbox_riego_automatico",
            "Satélite"                                      => "checkbox_satelite",
            "Solárium"                                      => "checkbox_solarium",
            "Sótano"                                        => "checkbox_sotano",
            "Terraza"                                       => "checkbox_terraza",
            "Terraza Acristalada"                           => "checkbox_terraza_acristalada",
            "Terraza Acrist."                               => "checkbox_terraza_acristalada",
            "Todo Exterior"                                 => "checkbox_todo_exterior",
            "Tranvía"                                       => "checkbox_tranvia",
            "Trastero"                                      => "checkbox_trastero",
            "Tren"                                          => "checkbox_tren",
            "Trifásica"                                     => "checkbox_trifasica",
            "T.v"                                           => "checkbox_tv",
            "Urbanización"                                  => "checkbox_urbanizacion",
            "Vallado"                                       => "checkbox_vallado",
            "Videoportero"                                  => "checkbox_video_portero",
            "Video Portero"                                 => "checkbox_videoportero",
            "Vistas"                                        => "checkbox_vistas",
            "Vistas Despejadas"                             => "checkbox_vistas_despejadas",
            "Zona De Costa"                                 => "checkbox_zona_de_costa",
            "Zona Montaña"                                  => "checkbox_zona_montana",
            "Zonas Infantiles"                              => "checkbox_zonas_infantiles",
            "Zonas Verdes"                                  => "checkbox_zonas_verdes"
        );

        return $vector_lectura_fichero_xml_checkbox;

    }// end function
}


if (!function_exists("get_vector_escritura_fichero_xml_checkbox")) {
    function get_vector_escritura_fichero_xml_checkbox(){

        # para los checooxx lectura xml

        $vector_escritura_fichero_xml_checkbox = array(
            "accesopmr"                                     => "checkbox_acceso_pmr",
            "adaptadominus"                                 => "checkbox_adaptado_minusvalido",
            "agua"                                          => "checkbox_agua",
            "aire_con"                                      => "checkbox_aire_acondicionado",
            "aire_con"                                      => "checkbox_aire_acondicionado",
            "airecentral"                                   => "checkbox_aire_acondicionado_centralizado",
            "airecentral"                                   => "checkbox_airecentral",
            "alarma"                                        => "checkbox_alarma",
            "alarmaincendio"                                => "checkbox_alarma_incendio",
            "alarmarobo"                                    => "checkbox_alarma_robo",
            "altillo"                                       => "checkbox_altillo",
            "apartseparado"                                 => "checkbox_aprt_separado",
            "arboles"                                       => "checkbox_arboles",
            "armaempotrados"                                => "checkbox_armarios_empotrados",
            "armaariosempotrados"                           => "checkbox_armarios_empotrados",
            "ascensor"                                      => "checkbox_ascensor",
            "autobuses"                                     => "checkbox_autobuses",
            "balcon"                                        => "checkbox_balcon",
            "bar"                                           => "checkbox_bar",
            "barbacoa"                                      => "checkbox_barbacoa",
            "bombafríoycalor"                               => "checkbox_bomba_frio_y_calor",
            "buhardilla"                                    => "checkbox_buhardilla",
            "cajafuerte"                                    => "checkbox_caja_fuerte",
            "calefacción"                                   => "checkbox_calefaccion",
            "calefaccióncentral"                            => "checkbox_calefaccion_central",
            "calefaccentral"                                => "checkbox_calefaccion_central",
            "centroscomerciales"                            => "checkbox_centros_comerciales",
            "chimenea"                                      => "checkbox_chimenea",
            "colegios"                                      => "checkbox_colegios",
            "gastosgomunidad"                               => "checkbox_comunidad_incluida",
            "depositoagua"                                  => "checkbox_deposito_agua",
            "descalcificador"                               => "checkbox_descalcificador",
            "despensa"                                      => "checkbox_despensa",
            "diafano"                                       => "checkbox_diafano",
            "distanciaalmar"                                => "checkbox_primera_linea_de_mar",
            "electrodomesticos"                             => "checkbox_electrodomesticos",
            "esquina"                                       => "checkbox_esquina",
            "galería"                                       => "checkbox_galeria",
            "garajedoble"                                   => "checkbox_garaje_doble",
            "garajeincluido"                                => "checkbox_garaje_incluido",
            "garajeopcional"                                => "checkbox_garaje_opcional",
            "gasciudad"                                     => "checkbox_gas_ciudad",
            "golf"                                          => "checkbox_golf",
            "habjuegos"                                     => "checkbox_habitacion_juegos",
            "hidromasaje"                                   => "checkbox_hidromasaje",
            "hilomusical"                                   => "checkbox_hilo_musical",
            "hospitales"                                    => "checkbox_hospitales",
            "jacuzzi"                                       => "checkbox_jacuzzi",
            "jardín"                                        => "checkbox_jardin",
            "lavanderia"                                    => "checkbox_lavanderia",
            "líniatelefonica"                               => "checkbox_linea_teleronica",
            "línia_telefonica"                              => "checkbox_linia_telefonica",
            "luminoso"                                      => "checkbox_luminoso",
            "luz"                                           => "checkbox_luz",
            "mirador"                                       => "checkbox_mirador",
            "montacargas"                                   => "checkbox_montacargas",
            "muebles"                                       => "checkbox_muebles",
            "ojosdebuey"                                    => "checkbox_ojo_de_buey",
            "parabolica"                                    => "checkbox_parabolica",
            "parking"                                       => "checkbox_parking",
            "parkingopcional"                               => "checkbox_parking_opcional",
            "patio"                                         => "checkbox_patio",
            "pergola"                                       => "checkbox_pergola",
            "piscinacomunitaria"                            => "checkbox_piscina_comunitaria",
            "piscinapropia"                                 => "checkbox_piscina_de_propiedad",
            "preinstaacc"                                   => "checkbox_preinstalacion_aire_acondicionado",
            "puertablindada"                                => "checkbox_puerta_blindada",
            "puertasautomatico"                             => "checkbox_puertas_automaticas",
            "puertasauto"                                   => "checkbox_puertas_automatico",
            "riegoauto"                                     => "checkbox_riego_automatico",
            "riegoautomatico"                               => "checkbox_riego_automatico",
            "satelite"                                      => "checkbox_satelite",
            "solarium"                                      => "checkbox_solarium",
            "sotano"                                        => "checkbox_sotano",
            "terraza"                                       => "checkbox_terraza",
            "terrazaacristalada"                            => "checkbox_terraza_acristalada",
            "terrazaacrist"                                 => "checkbox_terraza_acristalada",
            "todoexterior"                                  => "checkbox_todo_exterior",
            "tranvía"                                       => "checkbox_tranvia",
            "trastero"                                      => "checkbox_trastero",
            "tren"                                          => "checkbox_tren",
            "trifasica"                                     => "checkbox_trifasica",
            "tv"                                            => "checkbox_tv",
            "urbanización"                                  => "checkbox_urbanizacion",
            "vallado"                                       => "checkbox_vallado",
            "videoportero"                                  => "checkbox_video_portero",
            "video_ortero"                                  => "checkbox_videoportero",
            "vistas"                                        => "checkbox_vistas",
            "vistasdespejadas"                              => "checkbox_vistas_despejadas",
            "zonadecosta"                                   => "checkbox_zona_de_costa",
            "zonamontana"                                   => "checkbox_zona_montana",
            "zonasinfantiles"                               => "checkbox_zonas_infantiles",
            "zonasverdes"                                   => "checkbox_zonas_verdes"
        );

        return $vector_escritura_fichero_xml_checkbox;

    }// end function
}