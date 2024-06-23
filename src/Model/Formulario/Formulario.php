<?php
namespace App\Model\Formulario;

use App\Form\DynamicAgenciaType;
use App\Form\DynamicPropietarioType;
use App\Form\DynamicUrlDetalleType;
use App\Form\DynamicAccionType;
use App\Form\DynamicGeodistrictType;
use App\Form\DynamicGeolocalityType;
use App\Form\DynamicGeocityType;
use App\Form\DynamicGeoregionType;
use App\Form\DynamicGeocountryType;
use App\Form\AvantioAccomodationsType;
use App\Form\LanguageType;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class Formulario
{
    # container
    private $container;
    private $nombreTypeFormulario;
    private $objeto;
    private $form;

    # database
    private $em;
    private $connection;

    # url
    private $router;

    # session
    private $session;
    private $requestStack;

    # reflector
    private $reflector;

    # segment variables
    protected $segment;
    protected $filter;
    protected $filter_2;
    protected $filter_3;
    protected $filter_4;

    # paginas
    protected $page_id = -1;
    protected $nombre_tabla;
    protected $nombre_objeto;
    protected $url;
    private $classString;

    # http
    private $request;
    private $response;

    # language
    private $slug;
    private $lang;
    private $lang_id;
    private $lang_local;
    private $lang_id_local;
    private $action;

    private $slug_locale_update;
    private $slug_locale_new;
    private $segmento;
    private $identificador;

    # parametros todos
    private $parametros_formulario = array();

    # excepciones twig
    private $twig_excepciones = array();

    # tipo accion | edit | new
    private $tipo_de_accion = "";

    public function __construct(UrlGeneratorInterface $router , ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack )
    {
          // empty
          $this->router = $router;
          $this->em = $em;
          $this->connection = $connection;
          $this->requestStack = $requestStack;

    }

    # se guardan todos los parametros generales
    public function enviarParametros(array $params)
    {
        if (!$params){
            // empty
        }else{
            foreach ($params as $key_param => $value_param){
                $this->{$key_param} = $value_param;
            }
        }

    }

    # damos de alta un formulario
    # se generan los parmetros especificos para cada clase
    public function generarParametrosFormulario()
    {
        $clases_formularios = array(
            "AvantioAccomodationsType",
            "DynamicGeocountryType",
            "DynamicGeoregionType",
            "DynamicGeocityType",
            "DynamicGeolocalityType",
            "DynamicGeodistrictType",
            "DynamicAccionType",
            "DynamicUrlDetalleType",
            "DynamicPropietarioType",
            "DynamicAgenciaType",
            "LanguageType"
        );

        # tambien generamos excepciones para el formulario twig no incluya estos objetos
        if ($this->nombreTypeFormulario == "AvantioAccomodationsType"){
            $this->twig_excepciones = array(
              "dynamic" => array(
                  "dynamicRooms",
                  "dynamicTarifa",
                  "dynamicComisionAgencia",
                  "dynamicKindOfWay",
                  "dynamicKitchenclass",
                  "dynamicKitchentype",
                  "dynamicTaxonomyGeographicLanguageFieldsCustomitzation",
              ),
              "avantio" => array(
                  "avantioAccomodationsNearestPlaces",
                  "avantioAccomodationsExtras",
                  "avantioAccomodationsLocations",
                  "avantioAvailabilities",
                  "avantioRates",
                  "avantioOccupationRules",
                  "avantioPricemodifiers",
                  "avantioAccomodationsPictures",
                  "multipleTaxonomyGeographicLanguageExtra",
                  "multipleTaxonomyGeographicLanguageCarac"
                ),
            );
        }else if ($this->nombreTypeFormulario == "DynamicGeocountryType") {
            $this->twig_excepciones = array(
                "dynamic" => array(
                    "dynamicGeocountry",
                    //"dynamicGeoregion",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicGeoregionType"){
            $this->twig_excepciones = array(
                "dynamic" => array(
                    //"dynamicGeocountry",
                    //"dynamicGeocity",
                    "dynamicGeoregion",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicGeocityType"){
            $this->twig_excepciones = array(
                "dynamic" => array(
                    "dynamicGeocity",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicGeolocalityType"){
            $this->twig_excepciones = array(
                "dynamic" => array(
                    //"dynamicGeocountry",
                    "dynamicGeolocality",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicGeodistrictType"){
            $this->twig_excepciones = array(
                "dynamic" => array(
                    //"dynamicGeocountry",
                    "dynamicGeodistrict",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicAccionType") {
            $this->twig_excepciones = array(
                "dynamic" => array(
                    "dynamicAccion",
                ),
                "avantio" => array(),
            );
        }else if ($this->nombreTypeFormulario == "DynamicUrlDetalleType") {
            $this->twig_excepciones = array(
                "dynamic" => array(
                    "dynamicUrlDetalle",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicPropietarioType"){
            $this->twig_excepciones = array(
                "dynamic" => array(
                    "dynamicPropietario",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "DynamicAgenciaType") {
            $this->twig_excepciones = array(
                "dynamic" => array(
                    "dynamicAgencia",
                ),
                "avantio" => array(),
            );
        }else if($this->nombreTypeFormulario == "LanguageType"){
            $this->twig_excepciones = array(
                "dynamic" => array(),
                "avantio" => array()
            );
        } // end if


        if (in_array($this->nombreTypeFormulario,$clases_formularios)){
            $this->parametros_formulario = array(
                //'avantio_accomodations' => '371247',
                'segment' => $this->segment,
                'filter' => $this->filter,
                'filter_2' => $this->filter_2,
                'filter_3' => $this->filter_3,
                'filter_4' => $this->filter_4,
                'nombre_objeto' => $this->nombre_objeto,
                'classString' => $this->classString,
                'nombre_tabla' => $this->nombre_tabla,
                'segmento' => $this->segmento,
                'url' => $this->url,
                'request' => $this->request,
                'reflector' => $this->reflector,
                'identificador' => $this->identificador,
                'slug' => $this->slug_locale_update,
                'lang' => $this->session->get("lang"),
                'lang_id' => $this->session->get("lang_id"),
                'lang_local' => $this->session->get("lang_local"),
                'lang_id_local' => $this->session->get("lang_id_local"),
                'action' => $this->action,
                'tipo_de_accion' => $this->tipo_de_accion,
                'twig_excepciones' => $this->twig_excepciones
            );
        }


    } // end function


    public function initFomrulario($action)
    {
        # guardamos action como tipo_de_accion
        $this->tipo_de_accion = $action;

        // Agregamos el nombre del formulario Type
        $form_object_vector = explode("\\",$this->nombre_objeto);
        $form_object = $form_object_vector[count($form_object_vector)-1];
        $form_object.= "Type";

        # slug locale
        if ($this->request->getLocale() == "es"){
            // $this->slug_locale_update = "update";
            $this->slug_locale_update = "editar";
            // $this->slug_locale_new = "add";
            $this->slug_locale_new = "new";
        }else{
            //$this->slug_locale_update = "update-idioma";
            $this->slug_locale_update = "editar";
            //$this->slug_locale_new = "add-idioma";
            $this->slug_locale_new = "new";
        }

        # admin area
        if ($this->segment == "admin23111978"){
            $this->segmento = $this->filter;
            $this->identificador = $this->filter_3;
        }else{
            $this->segmento = $this->segment;
            $this->identificador = $this->filter_2;
        }

        if ($action == "new"){
            $url_temp = $this->request->get("_route");
            $this->action = $this->router->generate(
                $url_temp,
                array("id" => $this->identificador)
            );
        }else if ($action == "update"){
            $url_temp = $this->request->get("_route");
            $this->action = $this->router->generate(
                $url_temp,
                array("id" => $this->identificador)
            );
        } // end if


    }


    # creamos el formulario previamente dado de alta
    public function crearFormulario()
    {
        if ($this->nombreTypeFormulario == "AvantioAccomodationsType"){
            $this->form = $this->container->get('form.factory')->create(AvantioAccomodationsType::class, $this->objeto , $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicGeocountryType") {
            $this->form = $this->container->get('form.factory')->create(DynamicGeocountryType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicGeoregionType"){
            $this->form = $this->container->get('form.factory')->create(DynamicGeoregionType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicGeocityType"){
            $this->form = $this->container->get('form.factory')->create(DynamicGeocityType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicGeolocalityType"){
            $this->form = $this->container->get('form.factory')->create(DynamicGeolocalityType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicGeodistrictType"){
            $this->form = $this->container->get('form.factory')->create(DynamicGeodistrictType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicAccionType"){
            $this->form = $this->container->get('form.factory')->create(DynamicAccionType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicUrlDetalleType"){
            $this->form = $this->container->get('form.factory')->create(DynamicUrlDetalleType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicPropietarioType"){
            $this->form = $this->container->get('form.factory')->create(DynamicPropietarioType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "DynamicAgenciaType") {
            $this->form = $this->container->get('form.factory')->create(DynamicAgenciaType::class, $this->objeto, $this->parametros_formulario);
        }else if ($this->nombreTypeFormulario == "LanguageType") {
            $this->form = $this->container->get('form.factory')->create(LanguageType::class, $this->objeto, $this->parametros_formulario);
        }
    }


    /**
     * @return mixed
     */
    public function getForm()
    {
        return $this->form;
    }


    /**
     * @param mixed $form
     */
    public function setForm($form): void
    {
        $this->form = $form;
    }


    /**
     * @return mixed
     */
    public function getContainer()
    {
        return $this->container;
    }

    /**
     * @param mixed $container
     */
    public function setContainer($container): void
    {
        $this->container = $container;
    }

    /**
     * @return mixed
     */
    public function getNombreTypeFormulario()
    {
        return $this->nombreTypeFormulario;
    }

    /**
     * @param mixed $nombreTypeFormulario
     */
    public function setNombreTypeFormulario($nombreTypeFormulario): void
    {
        $this->nombreTypeFormulario = $nombreTypeFormulario;
    }

    /**
     * @return mixed
     */
    public function getObjeto()
    {
        return $this->objeto;
    }


    /**
     * @param mixed $objeto
     */
    public function setObjeto($objeto): void
    {
        $this->objeto = $objeto;
    }

    public function getTwigExcepciones(): array
    {
        return $this->twig_excepciones;
    }

    public function setTwigExcepciones(array $twig_excepciones): void
    {
        $this->twig_excepciones = $twig_excepciones;
    }

}