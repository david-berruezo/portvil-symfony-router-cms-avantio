<?php
namespace App\Controller\Admin;

use App\Controller\DynamicRooms;
use App\Entity\DynamicAgencia;
use App\Entity\DynamicAccion;
use App\Entity\DynamicGeocity;
use App\Entity\DynamicGeocountry;
use App\Entity\DynamicGeodistrict;
use App\Entity\DynamicGeolocality;
use App\Entity\DynamicGeoregion;
use App\Form\AvantioAccomodationsType;
use App\Form\DynamicGeocountryType;
use App\Form\LanguageType;
use App\Model\CodeTable\HtmlTable;
use App\Model\Formulario\Formulario;
use App\Model\Pagina\IPagina;
use App\Model\Table\Table;
use App\Repository\DynamicGeocityRepostory;
use App\Repository\DynamicGeoregionRepostory;
use AppBundle\Form\EventListener\ContextualOptionsFormListener;
use DateTime;
use Omines\DataTablesBundle\DataTableFactory;
use ReflectionClass;
use ReflectionProperty;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Profiler\Profile;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Translation\TranslatorInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;


# table codeigniter
# php libararies
class AdminPageController extends AdminSegmentController implements IPagina
{

    # objeto a consultar
    private string $classString = "";

    # parametros a consultar
    private array $parametrosConsulta = array();

    # parametros datatable
    private array $parametros_consulta = array();

    private $id_paginas = array(
        39 => "paises",
        40 => "regiones",
        41 => "ciudades",
        42 => "localidades",
        43 => "distritos"
    );

    private string $banderas_img = "";

    // multi language o no en la tabla
    private $is_language_group = true;

    # formulario
    private $formulario;


    private function getParametros($pagina = "list")
    {
        // guardamos class String como el nombre_objeto de base de datos
        $this->classString = $this->nombre_objeto;

        # evaluamos los parámetros de consultas
        $num_pagina = str_replace($this->session->get("lang_id"),"",$this->page_id);
        // $lang = ($this->session->get("lang_id") != $this->session->get("lang_id_local")) ? $this->session->get("lang_id_local") : $this->session->get("lang_id");
        # si recibimos query string para ver el el detalle de una region con el idioma correspondiente
        # consultamos por el detalle como parametro
        if ($this->request->get("lang")){
            if (in_array($this->request->get("lang"),$this->session->get("languages_vector"))){
                $lang = array_search($this->request->get("lang"),$this->session->get("languages_vector"));
            }
        }else{
            $lang = $this->session->get("lang_id");
        }

        if ($pagina == "list"){
            $this->getParametrosList($num_pagina , $lang);
        }else if($pagina == "edit"){
            $this->getParametrosEdit($num_pagina , $lang);
        }
    }

    
    private function getParametrosList($num_pagina , $lang)
    {
        // guardamos el parametro consulta por idioma
        if ($this->is_language_group){
            $this->parametrosConsulta = array("language" => $lang);
        }else{
            $this->parametrosConsulta = array();
        }

        switch ($num_pagina){
            // es ficticio por si hay que poner alguno específico
            case 1:
                $this->parametros_idioma = array("id");
                $this->parametros_status = array("id");
                $this->parametros_borrar = array("id");
            break;
            // todos irán por el default
            default:
                $this->parametros_idioma = array("id");
                $this->parametros_status = array("id");
                $this->parametros_borrar = array("id");
                break;
        } // end switch
    }


    private function getParametrosEdit($num_pagina , $lang)
    {
        // guardamos el parametro consulta por idioma
        if ($this->is_language_group){
            if ($this->segment == "admin23111978"){
                $this->parametrosConsulta = array("language" => $lang , "id" => $this->filter_3);
            }else{
                $this->parametrosConsulta = array("language" => $lang , "id" => $this->filter_2);
            }
        }else{
            if ($this->segment == "admin23111978"){
                $this->parametrosConsulta = array("id" => $this->filter_3);
            }else{
                $this->parametrosConsulta = array("id" => $this->filter_2);
            }
        }

        switch ($num_pagina){
            // es ficticio por si hay que poner alguno específico
            case 1:
                $this->parametros_idioma = array("id");
                $this->parametros_status = array("id");
                $this->parametros_borrar = array("id");
            break;
            // todos irán por el default
            default:
                $this->parametros_idioma = array("id");
                $this->parametros_status = array("id");
                $this->parametros_borrar = array("id");
            break;
        } // end switch
    }


    private function getDatos($pagina = "list")
    {
        # evaluamos los parámetros
        $num_pagina = str_replace($this->session->get("lang_id"),"",$this->page_id);

        if ($pagina == "list"){
            switch ($num_pagina){
                case 1:
                    $data = $this->getGeo($this->classString , $this->parametrosConsulta);
                break;
                default:
                    $data = $this->getGeo($this->classString , $this->parametrosConsulta);
                break;
           } // end switch
        }else if ($pagina == "edit") {
            switch ($num_pagina) {
                case 1:
                    $data = $this->getGeoEdit($this->classString, $this->parametrosConsulta);
                    break;
                default:
                    $data = $this->getGeoEdit($this->classString, $this->parametrosConsulta);
                    break;
            } // end switch
        }else if($pagina == "new"){
            $data = new $this->classString($this->em,$this->connection,$this->doctrine);
        }

        return $data;
    }


    private function getGeo(string $class_string , array $parameters)
    {
        # obtenemos registros
        $datos = $this->em->getRepository($this->classString)->getList($this->session->get("lang_id"));
        //var_dump($datos);
        //die();
        return $datos;
    }


    public function getGeoEdit(string $class_string , array $parameters)
    {
        # obtenemos registros
        /*
        if ($class_string == "App\Entity\AvantioAccomodations"){
            // $datos = $this->em->getRepository($class_string)->findBy($parameters);
            $datos = $this->em->getRepository($class_string)->getPropiedades($parameters);
        }else if ($class_string == "App\Entity\HshvAvantioAccomodations"){
            $datos = $this->em->getRepository($class_string)->findBy($parameters);
        }else{
            $datos = $this->em->getRepository($class_string)->findBy($parameters);
        }
        */

        // Borramos el parametro language que esta como 111 o 222 y la tabla language esta como "es" o "en"
        if ($this->classString == "App\Entity\Language"){
            unset($parameters["language"]);
        }

        $datos = $this->em->getRepository($class_string)->findBy($parameters);

        return $datos;
    }

    
    private function getUrl()
    {
        # evaluamos los parámetros
        $num_pagina = str_replace($this->session->get("lang_id"),"",$this->page_id);

        switch($num_pagina){
            case 39:$url = 'geo-pais-editar';
                break;
            case 40:$url = 'geo-region-editar';
                break;
            case 41:$url = 'geo-ciudad-editar';
                break;
            case 42:$url = 'geo-localidad-editar';
                break;
            case 43:$url = 'geo-distrito-editar';
                break;
        }

        return $url;
    }



    private function getUrlListar()
    {
        # evaluamos los parámetros
        $num_pagina = str_replace($this->session->get("lang_id"),"",$this->page_id);

        if ($this->session->get("lang_id") != 111){
            //$idioma = "-idioma";
            $idioma = "";
        }else{
            $idioma = "";
        }

        switch($num_pagina){
            case 39:$url = 'geo-pais'.$idioma;
                break;
            case 40:$url = 'geo-region'.$idioma;
                break;
            case 41:$url = 'geo-ciudad'.$idioma;
                break;
            case 42:$url = 'geo-localidad'.$idioma;
                break;
            case 43:$url = 'geo-distrito'.$idioma;
                break;
        }
        return $url;
    }



    private function getFormulario($objeto , $reflector, $action)
    {

        // Agregamos el nombre del formulario Type
        $form_object_vector = explode("\\",$this->nombre_objeto);
        $form_object = $form_object_vector[count($form_object_vector)-1];
        $form_object.= "Type";

        # creamos el modelo formulario
        $this->formulario = new Formulario($this->urlGenerator , $this->doctrine , $this->connection , $this->em , $this->requestStack);

        # eviamos el container y el nombre del type
        $this->formulario->setContainer($this->container);
        $this->formulario->setNombreTypeFormulario($form_object);
        $this->formulario->setObjeto($objeto);

        # action new or update
        # slug locale
        if ($this->request->getLocale() == "es"){
            $slug_locale_update = "update";
            //$slug_locale_new = "add";
            $slug_locale_new = "new";
        }else{
            $slug_locale_update = "update";
            //$slug_locale_new = "add-idioma";
            $slug_locale_new = "new";
        }

        # enviamos parametros
        $parametrosFormulario = array(
            'segment' => $this->segment,
            'filter' => $this->filter,
            'filter_2' => $this->filter_2,
            'filter_3' => $this->filter_3,
            'filter_4' => $this->filter_4,
            'nombre_objeto' => $this->nombre_objeto,
            'classString' => $this->classString,
            'nombre_tabla' => $this->nombre_tabla,
            'session' => $this->session,
            'url' => $this->url,
            'request' => $this->request,
            'reflector' => $reflector,
            'lang' => $this->session->get("lang"),
            'lang_id' => $this->session->get("lang_id"),
            'lang_local' => $this->session->get("lang_local"),
            'lang_id_local' => $this->session->get("lang_id_local"),
            'tipo_de_accion' => $action,
            'twig_excepciones' => null
        );

        # enviamos los parametros
        $this->formulario->enviarParametros($parametrosFormulario);
        $this->formulario->initFomrulario($action);
        $this->formulario->generarParametrosFormulario();
        $this->formulario->crearFormulario();

        $form = $this->formulario->getForm();

        return $form;
    }


    private function exceptions()
    {

    }

    private function getVista()
    {
        # evaluamos los parámetros
        $num_pagina = str_replace($this->session->get("lang_id"),"",$this->page_id);

        // vistas especificas
        $view = "propiedad/editar_general.html.twig";

        return $view;
    }



    private function getSlugTable()
    {
        # slug table
        $slug_table = $this->classString;
        $slug_table = str_replace("App\Entity\\" , " " , $slug_table);
        $slug_table = str_replace("Dynamic","Dynamic_",$slug_table);
        $slug_table = strtolower($slug_table);
        $slug_table = trim($slug_table);

        // var_dump($this->classString);
        return $slug_table;
    }

    private function habilitarDeshabilitarProfile(Profile $profiler, $option)
    {
        # deshabilitamos el profiler
        // $profiler won't be set if your environment doesn't have the profiler (like prod, by default)
        if (null !== $profiler) {
            // if it exists, disable the profiler for this particular controller action
            $profiler->disable();
        }
    }

    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'segment_idioma' , methods:["GET","POST"])]
    public function segmentGeoIdioma(TranslatorInterface $translator , Request $request , DataTableFactory $dataTableFactory): ?Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->segmentGeo($request , $dataTableFactory);

    }

    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'segment' , methods:["GET","POST"])]
    public function segmentGeoNoIdioma(TranslatorInterface $translator , Request $request , DataTableFactory $dataTableFactory):?Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->segmentGeo($request , $dataTableFactory);

    }


    #[Route('/{slug}/{one}/{two}/{three}/{four}', name: 'segment' , methods:["GET","POST"])]
    public function segmentGeo(Request $request , DataTableFactory $dataTableFactory):?Response
    {

        # peticion http
        $this->request = $request;
        $this->dataTableFactory = $dataTableFactory;

        # llamamos a la inicialización admin controller
        $this->init();

        // die();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        // creamos la tabla Omines
        $table = $this->list();

        $table->handleRequest($request);

        if ($table->isCallback()) {
            return $table->getResponse();
        }

        return $this->render('listar/table.html.twig', [
            'controller_name' => 'GeoController',
            'datatable' => $table,
            'banderas' => $this->banderas_img,
            "slug" => $this->generateUrl(
                $this->request->get("_route")."-new",
                array(
                    "id" => 0,
                    "_locale" => $this->session->get("lang")
                ),
            ),
            "data" => $this->data,
        ]);

    }


    private function getSlugTablExceptions()
    {
        $exceptions = array(
              "dynamic_taxonomygroup" => "dynamic_taxonomy_group",
              "dynamic_urldetalle" => "dynamic_url_detalle",
              "galleryfranquiciaprincipal" => "dynamic_url_detalle",
              "dynamic_propiedadesdestacadas" => "dynamic_propiedades_destacadas",
              "galleryblog" => "gallery_blog",

        );

        return $exceptions;
    }


    //:Response
    public function list(){

        # guardamos si es multi idioma o no
        $this->dynamicModel->setTable($this->nombre_tabla);
        $this->is_language_group = false;
        $this->is_language_group = $this->dynamicModel->checkFieldExist("language");

        # leemos parametros
        $this->getParametros("list");

        # slug table | OJO ANTERIORMENTE ESTO
        /*
        $slug_table = $this->classString;

        // $slug_table = $this->classString;
        $slug_table = str_replace("App\Entity\\" , " " , $slug_table);
        if(strpos($slug_table,"Dynamic") != false)
            $slug_table = str_replace("Dynamic","Dynamic_",$slug_table);
        $slug_table = strtolower($slug_table);
        $slug_table = trim(ltrim(rtrim($slug_table)));

        $is_dynamic = true;
        # exception
        $exceptions = $this->getSlugTablExceptions();
        if (array_key_exists($slug_table,$exceptions)){
            $slug_table = $exceptions[$slug_table];
        }
        */
        // Actualmente esto otro
        $slug_table = $this->nombre_tabla;

        # language
        $is_language_group = false;
        $this->dynamicModel->setTable($slug_table);
        $is_language_group = $this->dynamicModel->checkFieldExist("language");
        if ($is_language_group)
            $is_language_group = true;
        else
            $is_language_group = false;
        # languages
        // $languages_vector = $this->data["languages"];
        $keys_country = $this->dynamicModel->getKeys();

        # creamos table pasandole datatableFactory
        $table = new Table($this->dataTableFactory , $this->translator , $this->request , $this->dynamicModel , $this->urlGenerator, $this->classString);

        # pasamos otros datos
        if ($this->segment == "admin23111978"){
            $table->getRegistro()->setSlugTable($this->filter);
        }else{
            $table->getRegistro()->setSlugTable($this->segment);
        }

        $url_temp = baseUrl($this->request);

        # pasamos language
        $table->getRegistro()->setLanguages($this->languages);
        $table->getRegistro()->setIsLanguageGroup($is_language_group);
        $table->getRegistro()->setUrl($url_temp);
        $table->getCabecera()->setLanguages($this->languages);
        $table->getCabecera()->setIsLanguageGroup($is_language_group);

        # guaramos los img banderas en variable global para enviar a twig directamente
        $table->getCabecera()->setBanderas();
        $banderas_img = $table->getCabecera()->getBanderas();
        $this->banderas_img = $banderas_img;
        $banderas = "idioma";

        if ($this->session->get("grupo") == "gestor-contenidos"){
            $definicionLabelColumnasCabecera = array("id" , $this->translator->trans('tienes_alguna_duda_text_nombre') , $banderas, $this->translator->trans('theme_title_fotos_acciones'));
            $table->getCabecera()->setDefinicionLabelColumnasCabecera($definicionLabelColumnasCabecera);
            # id
            $definicionIdColumnasCabecera = array("id" , $this->translator->trans('tienes_alguna_duda_text_nombre') , $this->translator->trans('theme_title_fotos_idioma') , $this->translator->trans('theme_title_fotos_acciones'));
            $table->getCabecera()->setDefinicionIdColumnasCabecera($definicionIdColumnasCabecera);
            # raw
            $definicionRawColumnasCabecera = array("false" , "false" , "true" , "true");
            $table->getCabecera()->setDefinicionRawColumnasCabecera($definicionRawColumnasCabecera);
        }else if ($this->session->get("grupo") == "agencia"){
            $definicionLabelColumnasCabecera = array("id" , $this->translator->trans('tienes_alguna_duda_text_nombre') , $banderas, $this->translator->trans('theme_title_fotos_acciones'));
            $table->getCabecera()->setDefinicionLabelColumnasCabecera($definicionLabelColumnasCabecera);
            # id
            $definicionIdColumnasCabecera = array("id" , $this->translator->trans('tienes_alguna_duda_text_nombre') , $this->translator->trans('theme_title_fotos_idioma') , $this->translator->trans('theme_title_fotos_acciones'));
            $table->getCabecera()->setDefinicionIdColumnasCabecera($definicionIdColumnasCabecera);
            # raw
            $definicionRawColumnasCabecera = array("false" , "false" , "true" , "true");
            $table->getCabecera()->setDefinicionRawColumnasCabecera($definicionRawColumnasCabecera);
        }else if ($this->session->get("grupo") == "propietario"){
            $definicionLabelColumnasCabecera = array("id" , $this->translator->trans('tienes_alguna_duda_text_nombre') , $banderas, $this->translator->trans('theme_title_fotos_acciones'));
            $table->getCabecera()->setDefinicionLabelColumnasCabecera($definicionLabelColumnasCabecera);
            # id
            $definicionIdColumnasCabecera = array("id" , $this->translator->trans('tienes_alguna_duda_text_nombre') , $this->translator->trans('theme_title_fotos_idioma') , $this->translator->trans('theme_title_fotos_acciones'));
            $table->getCabecera()->setDefinicionIdColumnasCabecera($definicionIdColumnasCabecera);
            # raw
            $definicionRawColumnasCabecera = array("false" , "false" , "true" , "true");
            $table->getCabecera()->setDefinicionRawColumnasCabecera($definicionRawColumnasCabecera);
        } // end if

        # cremos la columnas cabecera
        $table->crearColumnasCabecera();

        # consulta datos segun slug
        $data = ""; $datos = array();

        # obentemos los datos con los parametros enviados
        $data = $this->getDatos("list");

        foreach ($data as $item) {
            # guardamos datos
            $dato = array(
                'id' => $item->getId(),
                $this->translator->trans('tienes_alguna_duda_text_nombre') => $item->getTextTitle(),
                $this->translator->trans('theme_title_fotos_idioma') => $item->getId(),
                $this->translator->trans('theme_title_fotos_acciones') => $item->getId(),
            );
            array_push($datos,$dato);
        } // end foreach

        # enviamos datos a datatable
        # data general del admin
        $table->getRegistro()->setData($this->data);
        $table->getRegistro()->setPageId($this->page_id);
        # parametros idioma | boton status | boton borrar
        $table->getRegistro()->setParametrosIdioma($this->parametros_idioma);
        $table->getRegistro()->setParametrosStatus($this->parametros_status);
        $table->getRegistro()->setParametrosBorrar($this->parametros_borrar);
        # enviamos datos datatable | datos consulta
        $table->getRegistro()->setDatosConsulta($data);
        $table->getRegistro()->setDatos($datos);
        $table->crearRegistrosTabla();
        // $table->finalizarTabla();

        $table = $table->getDatatable()->getTable();

        return $table;

    }

    public function listCodeigniter()
    {

        # set spanish language
        $this->session->set("lang","es");

        # creamos HtmlTable
        $htmlTable = new HtmlTable();
        # cabecera parametros
        $htmlTable->getCabecera()->setIsLanguageGroup(true);
        $htmlTable->getCabecera()->setLanguages($this->languages);
        $htmlTable->getCabecera()->setSlugTable("nombre tabla");
        $htmlTable->getCabecera()->setTranslator($this->translator);
        $htmlTable->getCabecera()->setSession($this->session);
        $htmlTable->getCabecera()->setRequest($this->request);
        # registro parametros
        $htmlTable->getRegistro()->setIsLanguageGroup(true);
        $htmlTable->getRegistro()->setLanguages($this->languages);
        $htmlTable->getRegistro()->setSlugTable("nombre tabla");
        $htmlTable->getRegistro()->setSession($this->session);
        $htmlTable->getRegistro()->setRequest($this->request);

        # iniciamos datatable Codeigniter Table
        $htmlTable->getDatatable()->initDatatable();
        # agregamos banderas y devolvemas banderas rellenadas
        $htmlTable->getCabecera()->setBanderas();
        $banderas = $htmlTable->getCabecera()->getBanderas();
        //print_r($banderas);
        # agregamos registros cabecera
        // definición de tablas para gestor | agencia | propietario
        if ($this->session->get("grupo") == "gestor-contenidos"){
            $definicionTablasCabecera = array("id" , "nombre" , $banderas , "acciones");
        }else if ($this->session->get("grupo") == "agencia"){
            $definicionTablasCabecera = array("vista_previa" , "propiedad" , "localidad" , $banderas);
        }else if ($this->session->get("grupo") == "propietario"){
            $definicionTablasCabecera = array("vista_previa" , "propiedad" , "localidad" , $banderas);
        } // end if
        $htmlTable->getCabecera()->setDefinicionLabelColumnasCabecera($definicionTablasCabecera);
        # creamos los headings para los roles
        $htmlTable->crearColumnasCabecera();

        # creamos vectores de datos
        $data = array();
        $data_consulta = array();

        # limitamos a 100
        $counter = 0;

        # get agencias
        $geos = $this->getDatos("list");

        foreach ($geos as $propiedad) {
            if ($counter < 100){
                # status
                $nombre_link_status = ($propiedad->getStatus() == "ACTIVED") ? 'play' : 'pause';
                $pregunta_status = ($propiedad->getStatus() == "ACTIVED") ? 'return confirm("¿ Quieres pausar esta entrada ?")' : 'return confirm("¿ Quieres activar esta entrada ?")';
                $parametros_status = $nombre_link_status ."/" .$propiedad->getId();
                # parametros idioma
                $parametros_idioma = $propiedad->getId();
                $vector_status = array($parametros_status,$pregunta_status);
                $parametros_borrar = $propiedad->getId();
                $parametros_acciones = array($parametros_borrar,$vector_status);
                $dato = array(
                    "id" => $propiedad->getId(),
                    "nombre" => $propiedad->getTextTitle(),
                    "idioma" => $parametros_idioma,
                    "acciones" => $parametros_acciones
                );
                array_push($data,$dato);
                array_push($data_consulta,$propiedad);
            } // end restriction
            $counter++;


        } // end foreach

        $htmlTable->getRegistro()->setDatosConsulta($data_consulta);
        $htmlTable->getRegistro()->setDatos($data);
        $datos = $htmlTable->getRegistro()->getDatos();
        $htmlTable->crearColumnasResultado();
        $tabla = $htmlTable->getDatatable()->getTable();

        return $tabla;

    }


    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'editar_idioma' , methods:["GET","POST"])]
    public function editarIdioma(TranslatorInterface $translator , Request $request , DataTableFactory $dataTableFactory , ValidatorInterface $validator):Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        $this->translator = $translator;

        return $this->edit($request , $dataTableFactory , $validator);
    }


    // en/admin23111978/country/edit/1222?lang=en
    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'editar' , methods:["GET","POST"])]
    public function editarNoIdioma(Request $request , DataTableFactory $dataTableFactory , ValidatorInterface $validator):Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->edit($request , $dataTableFactory , $validator);
    }


    public function edit(Request $request , DataTableFactory $dataTableFactory, ValidatorInterface $validator):Response
    {

        # peticion http
        $this->request = $request;
        $this->dataTableFactory = $dataTableFactory;

        // var_dump($this->request);
        // var_dump($this->request->getLocale());

        # llamamos a la inicialización admin controller
        $this->init();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        # guardamos si es multi idioma o no
        $this->dynamicModel->setTable($this->nombre_tabla);
        $this->is_language_group = false;
        $this->is_language_group = $this->dynamicModel->checkFieldExist("language");

        $slug_table = $this->nombre_tabla;

        # languages
        // $languages_vector = $this->data["languages"];

        # dynamicModel
        $this->dynamicModel->setTable($slug_table);
        $keys = $this->dynamicModel->getKeys();

        // evaluamos pagina
        $this->getParametros("edit");

        # obtenemos el objeto con Reflection | obtenemos columnas con getClassMetadata | normalizamos columnas entre reflexion y getClassMetadata
        $reflector = new ReflectionClass($this->classString);
        // $datos_variable = new ReflectionProperty($this->classString,$property->name);
        # nombre de las columnas de la tabla
        $nombres_columnas = $this->em->getClassMetadata($this->classString)->getColumnNames();
        $contador_columnas = 0;
        foreach ($reflector->getProperties() as $cont_property => $property) {
            # normalizamos nombre | todo a minusculas y con subguion
            # buscamos por letras mayúscuñas y devolvemos la posición
            preg_match_all('/[A-Z]/', $property->name, $matches, PREG_OFFSET_CAPTURE);
            # remplazamos mayúsculas por _ y cambiamos a minusuculas
            $propiedad_normalizada = $property->name;
            $contador_match = 0;
            foreach($matches[0] as $key_match => $value_match){
                $propiedad_normalizada = substr($propiedad_normalizada,0,$value_match[1]+$contador_match) . "_" . strtolower(substr($propiedad_normalizada,$value_match[1]+$contador_match,1)) . substr($propiedad_normalizada,$value_match[1]+$contador_match+1,strlen($propiedad_normalizada));
                $contador_match++;
            }
            if ($propiedad_normalizada != $nombres_columnas[$cont_property]){
                $temp_columnas = array_values($nombres_columnas);
                for ($j = count($temp_columnas)-1; $j >= $cont_property; $j--) {
                    $temp_columnas[$j+1] = $temp_columnas[$j];
                }
                $temp_columnas[$cont_property] = $propiedad_normalizada;
                $nombres_columnas = $temp_columnas;
            } // end if
            $cont_property++;
        } // end foreach

        // var_dump($nombres_columnas);

        # generamos slug table
        /*
        $slug_table = $this->getSlugTable();
        $is_dynamic = true;
        $slug_table = trim(ltrim(rtrim($slug_table)));
        # exception
        $exceptions = $this->getSlugTablExceptions();
        if (array_key_exists($slug_table,$exceptions)){
            $slug_table = $exceptions[$slug_table];
        }
        */

        # consulta datos segun slug
        $data = ""; $datos = array();

        # obentemos los datos con los parametros enviados
        $objeto = $this->getDatos("edit");
        if(is_array($objeto)){
            $objeto = $objeto[0];
        }

        // $objeto["id"] = $this->filter_2;
        // print_r($objeto["id"]);

        # validaciones |getionamos los errores
        $errors = array();
        $errors = $validator->validate($objeto);
        //var_dump($errors);

        # creamos el formulario
        // $form = $this->getFormularioColecciones($objeto,$reflector);
        $action = "update";
        $form = $this->getFormulario($objeto,$reflector,$action);

        # creamos la vista
        $vista = $this->getVista();

        # manejamos el formulario
        $form->handleRequest($request);

        // var_dump($form->getData());

        if ($form->isSubmitted() && $form->isValid()) {
            //var_dump($form->getData());
            //die();

            # guardamos el formulario para nuevo producto o actualizado
            $form_data = $form->getData();
            $this->em->persist($form_data);
            /*
            # si el formulario es nuevo guardamos el objeto en los otros idiomas
            if ((is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId() == 0){
                foreach ($this->session->get("languages_vector") as $index => $value) {
                        $objeto_lenguage = clone $form_data;
                        $nuevo_id = $objeto_lenguage->getDynamicGeocountry();
                        if ($index != $objeto_lenguage->getLanguage()){
                           $objeto_lenguage->setLanguage($index);
                           $objeto_lenguage->setId($nuevo_id.$index);
                           $this->em->persist($objeto_lenguage);
                        }
                } // end foreach

            } // end if
            */

            # realizamos el flush de todos los objetos
            $this->em->flush();

            # modificamos el nombre del route editar por new
            $texto_url = $this->request->get("_route");
            $url = $this->generateUrl($texto_url, array(
                "id" => (is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId(),
            ));

            return $this->redirect($url);

            # generamos una url para el action
            // $direccion_url = $this->getUrl();

        }else if($form->isSubmitted() && !$form->isValid()){
            //var_dump($form->getData());
            //die();
            # guardamos errores de validacion
            $errors = $validator->validate($objeto);
            /*
            var_dump($errors);
            foreach ($errors as $error) {
                $propiedad = $error->getPropertyPath();
                var_dump($propiedad);
            }
            */
        }else{
            // empty
        }

        $this->translator->setLocale($this->request->getLocale());

        $twig_excepciones = $this->formulario->getTwigExcepciones();

        return $this->render($vista, [
            'controller_name' => 'GeoController',
            'data_objeto' => $objeto,
            'nombres_columnas' => $nombres_columnas,
            'nombre_objeto' => $slug_table,
            'methods' => $reflector->getMethods(),
            'properties' => $reflector->getProperties(),
            'form' => $form->createView(),
            'id' => $this->filter_2,
            'twig_excepciones' => $twig_excepciones,
            "data" => $this->data,
            //'parametro_lang' => $this->request->get("lang")
            "errors" => $errors
        ]);

        return new Response("Estamos en el edit");
    }


    public function newNoIdioma(Request $request , ValidatorInterface $validator , $id):Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        $this->request = $request;
        return $this->new($request , $validator , $id);
    }


    public function newIdioma(Request $request , ValidatorInterface $validator , $id):Response
    {

        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        $this->request = $request;
        return $this->new($request , $validator , $id);
    }


    public function new(Request $request , ValidatorInterface $validator , $id):Response
    {
        # peticion http
        $this->request = $request;

        # llamamos a la inicialización admin controller
        $this->init();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        /*
        # generamos slug table
        $slug_table = $this->getSlugTable();
        $is_dynamic = true;
        */

        # language
        $is_language_group = false;
        $this->dynamicModel->setTable($this->nombre_tabla);
        $is_language_group = $this->dynamicModel->checkFieldExist("language");
        if ($is_language_group)
            $is_language_group = true;
        else
            $is_language_group = false;
        # languages
        // $languages_vector = $this->data["languages"];

        $slug_table = $this->nombre_tabla;

        # dynamicModel
        //$this->dynamicModel->setTable($slug_table);
        $keys = $this->dynamicModel->getKeys();

        // evaluamos pagina
        $this->getParametros();

        // $this->translator->getLocale();

        # obtenemos el objeto con Reflection | obtenemos columnas con getClassMetadata | normalizamos columnas entre reflexion y getClassMetadata
        $reflector = new ReflectionClass($this->classString);
        // $datos_variable = new ReflectionProperty($this->classString,$property->name);
        # nombre de las columnas de la tabla
        $nombres_columnas = $this->em->getClassMetadata($this->classString)->getColumnNames();
        $contador_columnas = 0;
        foreach ($reflector->getProperties() as $cont_property => $property) {
            # normalizamos nombre | todo a minusculas y con subguion
            # buscamos por letras mayúscuñas y devolvemos la posición
            preg_match_all('/[A-Z]/', $property->name, $matches, PREG_OFFSET_CAPTURE);
            # remplazamos mayúsculas por _ y cambiamos a minusuculas
            $propiedad_normalizada = $property->name;
            $contador_match = 0;
            foreach($matches[0] as $key_match => $value_match){
                $propiedad_normalizada = substr($propiedad_normalizada,0,$value_match[1]+$contador_match) . "_" . strtolower(substr($propiedad_normalizada,$value_match[1]+$contador_match,1)) . substr($propiedad_normalizada,$value_match[1]+$contador_match+1,strlen($propiedad_normalizada));
                $contador_match++;
            }
            if ($propiedad_normalizada != $nombres_columnas[$cont_property]){
                $temp_columnas = array_values($nombres_columnas);
                for ($j = count($temp_columnas)-1; $j >= $cont_property; $j--) {
                    $temp_columnas[$j+1] = $temp_columnas[$j];
                }
                $temp_columnas[$cont_property] = $propiedad_normalizada;
                $nombres_columnas = $temp_columnas;
            } // end if
            $cont_property++;
        } // end foreach

        # consulta datos segun slug
        $data = ""; $datos = array();

        /*
        # obentemos los datos con los parametros enviados
        if ($form->isSubmitted()) {
            $objeto = $form->getData();
        }else{
            $objeto = new $this->nombre_objeto();
        }
        */

        // var_dump($this->nombre_objeto);
        // $this->em,$this->connection,$this->doctrine
        $objeto = new $this->nombre_objeto();
        //$objeto = new DynamicGeocountry();

        # validaciones |getionamos los errores
        $errors = array();
        // var_dump($errors);

        # creamos el formulario
        $action = "new";
        $form = $this->getFormulario($objeto,$reflector,$action);
        //var_dump($form->getData());

        // $this->inicializar($reflector);

        # creamos la vista
        $vista = 'propiedad/editar_general.html.twig';

        # manejamos el formulario
        $form->handleRequest($request);

        // $this->translator->setLocale("es_ES");
        // $this->translator->setLocale($this->request->getLocale());
        // echo "valor: " . $this->translator->trans('theme_gobernanta_multiple_rooms');

        $twig_excepciones = $this->formulario->getTwigExcepciones();

        $form_errors = $form->getErrors();

        if ($form->isSubmitted() && $form->isValid()) {
            # guardamos el formulario para nuevo producto o actualizado
            $form_data = $form->getData();
            //var_dump($form_data);
            //die();
            $this->em->persist($form_data);
            # si el formulario es nuevo guardamos el objeto en los otros idiomas
            if ($this->classString != "App\Entity\Language"){
                foreach ($this->session->get("languages_vector") as $index => $value) {
                    # clonamos el objeto enviado
                    $objeto_lenguage = clone $form_data;
                    # obtenemos el nombre la propiedad
                    $nombre_clase_actual_vector = explode("\\",$this->nombre_objeto);
                    $nombre_clase_actual = $nombre_clase_actual_vector[count($nombre_clase_actual_vector)-1];
                    $nombre_clase_actual = ucfirst($nombre_clase_actual);
                    $metodo_objeto = "get".$nombre_clase_actual;
                    # obtenemos el valor de la propiedad
                    $id_objeto = $objeto_lenguage->{$metodo_objeto}();
                    if ($index != $this->session->get("lang_id")){
                        $objeto_lenguage->setId($id_objeto.$index);
                        $objeto_lenguage->setLanguage($index);
                        $this->em->persist($objeto_lenguage);
                    } // end if

                } // end foreach
            }

            # realizamos el flush de todos los objetos
            $this->em->flush();

            # generamos una url para la redirección
            if ($this->session->get("lang") != "es"){
                $slug_url = "editar";
            }else{
                $slug_url = "editar";
            }

            $texto_url = $this->request->get("_route");
            $url = $this->generateUrl($texto_url, array(
                "id" => (is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId(),
            ));

            $url = $this->generateUrl("geo-" . $this->url . "-" . $slug_url ,array(
                "id" => (is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId() ,
            ));

            $url.= "?lang=".$this->session->get("lang");
            // $url.= "?lang=" . $form->get("language_local")->getData();
            return $this->redirect($url);

        }else if ($form->isSubmitted() && !$form->isValid()){
            //echo "no valido is_valid";
            # guardamos errores de validacion
            $errors = $validator->validate($objeto);
            //var_dump($objeto);
            //var_dump($form_errors);
            //var_dump($form->getErrorsAsString());
            //var_dump($errors);
            //die();
        }else{
            //echo "no submit";
            //die();
            // empty
        }

        return $this->render($vista, [
            'controller_name' => 'GeoController',
            'data_objeto' => $objeto,
            'nombres_columnas' => $nombres_columnas,
            'nombre_objeto' => $slug_table,
            'methods' => $reflector->getMethods(),
            'properties' => $reflector->getProperties(),
            'form' => $form->createView(),
            'id' => $this->filter_2,
            'twig_excepciones' => $twig_excepciones,
            'data' => $this->data,
            'errors' => $errors
        ]);

        return new Response("Estamos en el edit");


    }


    public function inicializar($reflector)
    {

        if (!$_POST){
            echo "esta entrando";
            # recorremos con reflector las propieaddes del objeto | INICIALIZAMOS LAS PROPIEDADES DEL NUEVO OBJETO
            foreach ($reflector->getProperties() as $property){
                # obtenemos el nombre la propiedad y la ponemos la primera en mayusculas | ponemos metodo seter
                $nombrePropiedad = ucfirst($property->name);
                $metodo = "set".$nombrePropiedad;
                # miramos el tipo de dato de la propiedad
                $datos_variable = new ReflectionProperty($this->classString,$property->name);
                $nombre_clase = str_replace("App\\Entity\\","",$this->nombre_objeto);
                $nombre_clase = lcfirst($nombre_clase);
                if ($datos_variable->getType() != null){
                    if ($datos_variable->getType()->getName() == "Doctrine\Common\Collections\Collection") {
                        # fill data collection
                        //echo "coleccion " .$property->name. "<br>";

                        //if ($forms[$property->name]->getData()){
                        //    # Dynamic collection | DynamicGeoregion
                        //    $colecciones = $forms[$property->name]->getData();
                        //    $nombreColeccion = ucfirst($nombrePropiedad);
                        //    $metodo_coleccion = "add".$nombreColeccion;
                        //    $nombre_coleccion = str_replace("_", "", $nombreColeccion);
                        //    $nombre_repositorio = "App\\Repository\\" . $nombreColeccion . "Repository";
                        //    $dynamicColeccion = $this->em->getRepository("App\Entity\\" . $nombre_coleccion);
                        //    $dynamic = $dynamicColeccion->findBy(array("id" => $colecciones , "language" => $this->session->get("lang_id")));
                        //    foreach ($dynamic as $dyn){
                        //        $viewData->{$metodo_coleccion}($dyn);
                        //    }
                        //} // end if

                    }else if ($nombrePropiedad == "UpdateStatusAt" || $nombrePropiedad == "UpdateAt" || $nombrePropiedad == "DeletedAt") {
                        //echo "update " . $property->name . "<br>";

                        //if ($forms[$property->name]->getData()) {
                        //    $fecha = new DateTime($forms[$property->name]->getData());
                        //} else {
                        //    $fecha = new DateTime();
                        //}
                        //$viewData->{$metodo}($fecha);

                    }else if ($datos_variable->getType()->getName() == "string"){
                        // echo "string " .$property->name. "<br>";
                        $objeto->{$metodo}("");
                    }else if ($datos_variable->getType()->getName() == "int"){
                        // echo "int " .$property->name. "<br>";
                        $objeto->{$metodo}(0);
                    }else if ($datos_variable->getType()->getName() == "bool"){
                        // echo "bool " .$property->name. "<br>";
                        $objeto->{$metodo}(false);
                        # cogemos el identificador del dynamic
                    }else if (strpos($nombrePropiedad, "Dynamic") !== false){
                        //echo "dynamic " .$property->name. "<br>";
                        # Dynamic
                        $nombreColeccion = ucfirst($nombrePropiedad);
                        $nombre_coleccion = str_replace("_", "", $nombreColeccion);
                        $nombre_repositorio = "App\\Repository\\" . $nombreColeccion . "Repository";
                        $dynamicColeccion = $this->em->getRepository("App\Entity\\" . $nombre_coleccion);
                        $dynamic = $dynamicColeccion->findBy(array("language" => $this->session->get("lang_id")));
                        if (is_array($dynamic))
                            $dynamic = $dynamic[0];
                        $objeto->{$metodo}($dynamic);
                    }else if($property->name != $nombre_clase){
                        // echo "otros " .$property->name. "<br>";
                        $objeto->{$metodo}($form[$property->name]->getData());
                    } // end if
                } // end if null variable

            } // end foreach
        } // end if post

    }



    public function updateIdioma($id , Request $request , ValidatorInterface $validator):Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->update($id , $request , $validator);
    }

    public function updateNoIdioma($id , Request $request , ValidatorInterface $validator): Response
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->update($id , $request , $validator);
    }


    public function update($id , Request $request , ValidatorInterface $validator): Response
    {
        # peticion http
        $this->request = $request;

        # llamamos a la inicialización admin controller
        $this->init();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        # guardamos si es multi idioma o no
        $this->dynamicModel->setTable($this->nombre_tabla);
        $this->dynamicModel->setNombreTabla($this->nombre_tabla);
        $this->dynamicModel->setNombreObjeto($this->nombre_objeto);
        $this->is_language_group = false;
        $this->is_language_group = $this->dynamicModel->checkFieldExist("language");

        // evaluamos pagina
        $this->getParametros("edit");

        # consulta datos segun slug
        $data = ""; $datos = array();

        # obentemos los datos con los parametros enviados
        $objeto = $this->getDatos("edit");
        if(is_array($objeto)){
            $objeto = $objeto[0];
        }

        $reflector = new ReflectionClass($this->classString);

        # generamos slug table
        $slug_table = $this->getSlugTable();
        $is_dynamic = true;

        # validaciones |getionamos los errores
        $errors = array();
        $errors = $validator->validate($this->request);
        //var_dump($errors);

        // $form = $this->getFormularioColecciones($objeto,$reflector);
        $action = "update";
        $form = $this->getFormulario($objeto,$reflector,$action);

        # creamos la vista
        // $vista = $this->getVista();

        # manejador del formulario
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            # guardamos el formulario para nuevo producto o actualizado
            $form_data = $form->getData();
            $this->em->persist($form_data);
            /*
            # si el formulario es nuevo guardamos el objeto en los otros idiomas
            if ((is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId() == 0){
                foreach ($this->session->get("languages_vector") as $index => $value) {
                        $objeto_lenguage = clone $form_data;
                        $nuevo_id = $objeto_lenguage->getDynamicGeocountry();
                        if ($index != $objeto_lenguage->getLanguage()){
                           $objeto_lenguage->setLanguage($index);
                           $objeto_lenguage->setId($nuevo_id.$index);
                           $this->em->persist($objeto_lenguage);
                        }
                } // end foreach

            } // end if
            */

            # realizamos el flush de todos los objetos
            $this->em->flush();

            if ($this->session->get("lang") != "es"){
                $slug_url = "editar-idioma";
            }else{
                $slug_url = "editar";
            }

            $url = $this->generateUrl("geo-" . $this->url . "-" . $slug_url ,array(
                "id" => (is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId() ,
            ));

            $url.= "?lang=".$this->session->get("lang");
            // $url.= "?lang=" . $form->get("language_local")->getData();
            return $this->redirect($url);

            # generamos una url para el action
            // $direccion_url = $this->getUrl();

        }else{
            /*
            $errorsString = (string) $errors;
            //return new Response($errorsString);
            var_dump($errors);
            return new Response("Ha habido un error".$form->getErrors());
            */
            if ($this->session->get("lang") != "es"){
                $slug_url = "editar-idioma";
            }else{
                $slug_url = "editar";
            }

            $url = $this->generateUrl("geo-" . $this->url . "-" . $slug_url ,array(
                "id" => (is_array($objeto) && isset($objeto["id"])) ? $objeto["id"] : $objeto->getId() ,
            ));

            $url.= "?lang=".$this->session->get("lang");
            // $url.= "?lang=" . $form->get("language_local")->getData();
            return $this->redirect($url);
        }

        return new Response("Todo OK");

    }



    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'remove_idioma' , methods:["GET","POST"])]
    public function removeIdioma($id , Request $request):Response
    {
        return $this->remove($id , $request);
    }

    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'remove_noidioma' , methods:["GET","POST"])]
    public function removeNoIdioma($id , Request $request):Response
    {
        return $this->remove($id , $request);
    }


    public function remove($id , Request $request):Response
    {
        # peticion http
        $this->request = $request;

        # llamamos a la inicialización admin controller
        $this->init();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        // evaluamos pagina
        $this->getParametros();

        # obtenemos el identificador que necesitamos para el update
        $nombre_campo_bd_vector = explode("\\",$this->classString);
        $nombre_campo_bd = $nombre_campo_bd_vector[count($nombre_campo_bd_vector)-1];
        $nombre_campo_bd = lcfirst($nombre_campo_bd);

        # guardamos los id en todos los idiomas
        $temp_id = str_replace($this->session->get("lang_id"),"",$id);
        foreach ($this->session->get("languages_vector") as $key_idioma => $idioma) {
            $fecha = new DateTime();
            $fecha_string = $fecha->format("Y-m-d");
            $sql = " UPDATE $this->classString u SET u.deletedAt = '".$fecha_string."' , u.status = 'DELETED'  WHERE u.".$nombre_campo_bd." = $temp_id ";
            $query = $this->em->createQuery($sql);
            $id = $query->getResult();
        }

        # generamos una url para el action
        $direccion_url = $this->getUrlListar();

        $url = $this->generateUrl($direccion_url,array());
        return $this->redirect($url);

    }

    public function playIdioma($id , Request $request)
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->play($id , $request);
    }

    public function playNoIdioma($id , Request $request)
    {
        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->play($id , $request);
    }


    public function play($id , Request $request):Response
    {
        # peticion http
        $this->request = $request;

        # llamamos a la inicialización admin controller
        $this->init();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        // evaluamos pagina
        $this->getParametros();

        # obtenemos el identificador que necesitamos para el update
        $nombre_campo_bd_vector = explode("\\",$this->classString);
        $nombre_campo_bd = $nombre_campo_bd_vector[count($nombre_campo_bd_vector)-1];
        $nombre_campo_bd = lcfirst($nombre_campo_bd);

        # guardamos los id en todos los idiomas
        $temp_id = str_replace($this->session->get("lang_id"),"",$id);
        foreach ($this->session->get("languages_vector") as $key_idioma => $idioma) {
            $fecha = new DateTime();
            $fecha_string = $fecha->format("Y-m-d");
            $sql = " UPDATE $this->classString u SET u.updatedAt = '".$fecha_string."' , u.status = 'ACTIVED'  WHERE u.".$nombre_campo_bd." = $temp_id ";
            $query = $this->em->createQuery($sql);
            $id = $query->getResult();
        }

        # generamos una url para el action
        $direccion_url = $this->getUrlListar();

        $url = $this->generateUrl($direccion_url,array());
        return $this->redirect($url);

    }

    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'pause_idioma' , methods:["GET","POST"])]
    public function pauseIdioma($id , Request $request)
    {

        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->pause($id ,$request);
    }

    #[Route('/{_locale}/{slug}/{one}/{two}/{three}/{four}', name: 'pause' , methods:["GET","POST"])]
    public function pauseNoIdioma($id , Request $request)
    {

        # validamos tengamos permisos
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');

        return $this->pause($id ,$request);
    }


    public function pause($id , Request $request)
    {
        # peticion http
        $this->request = $request;

        # llamamos a la inicialización admin controller
        $this->init();

        // $this->request->getLocale()
        $this->checkLanguage();

        // guardamos los segmentos de la ur
        $this->segment();

        // evaluamos pagina
        $this->getParametros();

        # obtenemos el identificador que necesitamos para el update
        $nombre_campo_bd_vector = explode("\\",$this->classString);
        $nombre_campo_bd = $nombre_campo_bd_vector[count($nombre_campo_bd_vector)-1];
        $nombre_campo_bd = lcfirst($nombre_campo_bd);

        # guardamos los id en todos los idiomas
        $temp_id = str_replace($this->session->get("lang_id"),"",$id);
        foreach ($this->session->get("languages_vector") as $key_idioma => $idioma) {
            $fecha = new DateTime();
            $fecha_string = $fecha->format("Y-m-d");
            $sql = " UPDATE $this->classString u SET u.updatedAt = '".$fecha_string."' , u.status = 'PAUSED'  WHERE u.".$nombre_campo_bd." = $temp_id ";
            $query = $this->em->createQuery($sql);
            $id = $query->getResult();
        }

        # generamos una url para el action
        $direccion_url = $this->getUrlListar();

        $url = $this->generateUrl($direccion_url,array());
        return $this->redirect($url);

    }


    /**
     * @return string
     */
    public function getClassString(): string
    {
        return $this->classString;
    }

    /**
     * @param string $classString
     */
    public function setClassString(string $classString): void
    {
        $this->classString = $classString;
    }

    /**
     * @return array
     */
    public function getParametrosConsulta(): array
    {
        return $this->parametrosConsulta;
    }

    /**
     * @param array $parametrosConsulta
     */
    public function setParametrosConsulta(array $parametrosConsulta): void
    {
        $this->parametrosConsulta = $parametrosConsulta;
    }


    /**
     * @return array
     */
    public function getParametrosIdioma(): array
    {
        return $this->parametros_idioma;
    }

    /**
     * @param array $parametros_idioma
     */
    public function setParametrosIdioma(array $parametros_idioma): void
    {
        $this->parametros_idioma = $parametros_idioma;
    }

    /**
     * @return array
     */
    public function getParametrosStatus(): array
    {
        return $this->parametros_status;
    }

    /**
     * @param array $parametros_status
     */
    public function setParametrosStatus(array $parametros_status): void
    {
        $this->parametros_status = $parametros_status;
    }

    /**
     * @return array
     */
    public function getParametrosBorrar(): array
    {
        return $this->parametros_borrar;
    }

    /**
     * @param array $parametros_borrar
     */
    public function setParametrosBorrar(array $parametros_borrar): void
    {
        $this->parametros_borrar = $parametros_borrar;
    }

    /**
     * @return string[]
     */
    public function getIdPaginas(): array
    {
        return $this->id_paginas;
    }

    /**
     * @param string[] $id_paginas
     */
    public function setIdPaginas(array $id_paginas): void
    {
        $this->id_paginas = $id_paginas;
    }

}
