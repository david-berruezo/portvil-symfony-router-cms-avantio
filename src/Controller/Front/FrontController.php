<?php
namespace App\Controller\Front;

use App\Entity\DynamicAdminPage;
use App\Entity\DynamicPage;
use App\Entity\Language;
use App\Model\DynamicModel\DynamicModel;
use App\Model\Table\Table;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Memcache;
use Memcached;
use Omines\DataTablesBundle\DataTable;
use Omines\DataTablesBundle\DataTableFactory;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Translation\LocaleSwitcher;
use Symfony\Contracts\Translation\TranslatorInterface;


# php libararies
class FrontController extends AbstractController
{
    # config cache queries  , sessions , languages
    protected $config;

    # entity Manager
    protected $em;

    # doctrine
    protected $doctrine;

    # connection dbal
    protected $connection;

    # cache
    protected $cache;

    protected $urls;
    protected $urlGenerator;

    # mdoels
    protected $dynamicModel  = "";
    protected $languageModel = "";
    protected $dynamicDlistModel = "";

    # avantio
    protected $avantioModel = "";
    protected $avantioPMSModel = "";

    # environment
    protected $environmentGroup = "";
    protected $usuario_session = "";

    # relaciones Portvil Avantio
    protected $relaciones_ids_portvil_avantio;
    protected $relaciones_ids_portvil;
    protected $relaciones_ids_portvil_todos;
    protected $relaciones_ids_avantio;

    # dataAdmin | # data
    protected $dataAdmin;
    protected $data;
    protected $dataObject;

    # database
    protected $db;

    # flags memcache
    protected $flags = false;
    protected $memcache;

    protected $so = "";

    # request para las sesiones y request HTTP
    protected $requestStack;

    # codeigniter table | datatable Object
    protected Table $table;
    protected DataTableFactory $dataTableFactory;
    protected DataTable $datatable;

    protected $output;

    # sesion and request
    protected $session;
    protected $request;

    # variables vista
    protected $tipoVista = 1; // Vista menu superior
    protected $vectorVariablesTwig = array();
    protected $templateTwig = "";

    # traducciones
    protected $translator;
    protected $localSwitcher;
    protected $languages;

    public function __construct(
        DataTableFactory $dataTableFactory, EntityManagerInterface $em , Connection $connection , ManagerRegistry $doctrine , RequestStack $requestStack , TranslatorInterface $translator,
        LocaleSwitcher $localeSwitcher , UrlGeneratorInterface $urlGenerator
    )
    {
        // guardamos los parametros
        $this->em = $em;
        $this->connection = $connection;
        $this->doctrine = $doctrine;
        $this->requestStack = $requestStack;

        # translator
        $this->translator = $translator;
        $this->localeSwitcher = $localeSwitcher;

        # datatable
        $this->dataTableFactory = $dataTableFactory;
        // $this->datatable = $dataTableFactory->create();

        # inicializamos DynamicModel
        $this->dynamicModel = new DynamicModel($em , $connection , $doctrine);

        # request
        // $this->request = Request::createFromGlobals();

        // $this->session = $this->request->getSession();
        $this->session = $this->requestStack->getSession();

        $this->urlGenerator = $urlGenerator;

    }


    protected function init()
    {

        # check url and save environmentGroup
        // $absolute_url = full_url( $_SERVER );
        $absolute_url = baseUrl($this->request);

        $this->environmentGroup = "portvil_extranet";
        $this->usuario_session = "portvilextranet";

        if (strpos($absolute_url,"automocion") != false) {
            $this->environmentGroup = "automocion";
            $this->usuario_session = "automocion";
        }else if (strpos($absolute_url,"davidberruezo") != false) {
            $this->environmentGroup = "david";
            $this->usuario_session = "davidberruezo";
        }else if (strpos($absolute_url,"phpandfriends") != false) {
            $this->environmentGroup = "tests";
            $this->usuario_session = "phpandfriends";
        }else if (strpos($absolute_url,"portvil.net") != false) {
            $this->environmentGroup = "home";
            //$this->environmentGroup = "portvil_intranet_online";
            $this->usuario_session = "portvil";
        }else if (strpos($absolute_url,"tiendapisos") != false) {
            $this->environmentGroup = "tienda_pisos";
            $this->usuario_session = "tiendapisos";
        }else if (strpos($absolute_url,"intranet") != false) {
            $this->environmentGroup = "portvil_intranet";
            $this->usuario_session = "portvilintranet";
        }else if (strpos($absolute_url,"extranet") != false) {
            $this->environmentGroup = "portvil_extranet";
            $this->usuario_session = "portvilextranet";
        }else{
            //$this->environmentGroup = "portvil_extranet";
            //$this->usuario_session = "portvilextranet";
            $this->usuario_session = "default";
            $this->environmentGroup = "default";
        } // end if

        // conectamos entityManger a la conexión que queremos
        $this->em = $this->doctrine->getManager($this->environmentGroup);

        // $acciones = $this->connection->fetchAllAssociative(" SELECT * FROM languages " );
        // print_r($acciones);

        # obtenemos languages
        $languages_repository = $this->em->getRepository(Language::class);
        $languages = $languages_repository->findAll();
        $this->data["languages"] = $languages;

        # obtenemos pages
        $pages_repository = $this->em->getRepository(DynamicPage::class);
        $pages = $pages_repository->findAll();

        # guardamos pages en data
        foreach ($pages as $page) {
            $this->data["pages_".$page->getId()] = array();
            $this->data["pages_".$page->getId()] = $page;
        }

        $this->session->set("grupo" , "gestor-contenidos");

    }



    /**
     * @param $name
     * @param $table
     * @param $lang
     * @param $memcache
     * @return void
     */
    private function saveQueryCache($name , $tableORquery , $lang , $memcache , $typeResult)
    {
        /*
        echo "---------- datos recibidos --------<br>";
        echo "name: ".$name."<br>";
        echo "table: ".$tableORquery."<br>";
        print_r($memcache);
        echo "<br>";
        print_r($lang);
        echo "<br>";
        echo "typeResult: ".$typeResult."<br>";
        echo "---------- datos recibidos --------<br>";
        */

        # si existe lenguage
        if ($lang){

            # delete cache key
            // $memcache->delete($name."_".$lang->id);

            // obetenemos valor de memcache
            if (class_exists('Memcache')){
                $valor = $this->memcache->get($name."_".$lang->language , $this->flags);
            }else if (class_exists('Memcached')){
                $valor = $this->memcache->get($name."_".$lang->language);
            }

            // si no existe valor realizamos la consulta y la guardamos en base de datos
            if ($valor == null){
                echo "guardamos datos 1<br>";
                // realizmos la consulta sql
                $sql = " SELECT * FROM $tableORquery where language = '" . $lang->language . "' ";
                $this->data[$name."_".$lang->language] = indexar_array($this->db->query($sql)->getResult(), "id");
                // guardamos  en memcache o en memcached el dato
                if (class_exists('Memcache')){
                    $this->memcache->set($name."_".$lang->language, $this->data[$name."_".$lang->language], 0 , 3600); // 1h or 3600 seconds
                }else if (class_exists('Memcached')){
                    $this->memcache->set($name . "_" . $lang->language, $this->data[$name."_".$lang->language], 3600); // 1h or 3600 seconds
                }
                // si existe valor lo guardamos en data
            }else if ($valor != null){
                echo "leemos datos 1<br>";
                $this->data[$name."_". $lang->language] = $valor;
            }
            echo "opcion 1<br>";

            # si no existe lenguage
        }else{

            // obetenemos valor de memcache
            if (class_exists('Memcache')){
                $valor = $this->memcache->get($name, $this->flags);
            }else if (class_exists('Memcached')){
                $valor = $this->memcache->get($name);
            }

            // si no existe valor realizamos la consulta y la guardamos en base de datos
            if($valor == null || !isset($this->data[$name]) || $valor != $this->data[$name]) {
                echo "guardamos datos 2<br>";
                // realizmos la consulta sql
                $sql = $tableORquery;
                if($typeResult == "array")
                    $this->data[$name] = $this->db->query($sql)->getResultArray();
                elseif ($typeResult == "object")
                    $this->data[$name] = $this->db->query($sql)->getResult();

                if (class_exists('Memcache')){
                    $this->memcache->set($name,$this->data[$name],0); // 1h or 3600 seconds
                }else if (class_exists('Memcached')){
                    $this->memcache->set($name ,$this->data[$name],0); // 1h or 3600 seconds
                }
            }else if($valor != null && $valor == $this->data[$name] ){
                echo "leemos datos 2<br>";
                $this->data[$name] = $valor;
            }// end if
            echo "opcion 2<br>";
        } // end if


    } // end function



    private function setCacheGeneral()
    {
        # paginas
        if(class_exists('Memcache') || class_exists('Memcached')) {
            foreach ($this->dataAdmin["languages"] as $lang) {
                $this->saveQueryCache("pages", "dynamic_pages", $lang, $this->memcache, "object");
            }
        }

        # accion
        if(class_exists('Memcache') || class_exists('Memcached')) {
            foreach ($this->dataAdmin["languages"] as $lang) {
                $this->saveQueryCache("accion" , "dynamic_accion" , $lang , $this->memcache , "object");
            }
        }


        # url_detalle
        if(class_exists('Memcache') || class_exists('Memcached')) {
            foreach ($this->dataAdmin["languages"] as $lang) {
                $this->saveQueryCache("url_detalle" , "dynamic_url_detalle" , $lang , $this->memcache , "object");
            }// end foreach
            //p_($this->data["url_detalle_es"]);
        }


        # partner
        // $this->saveQueryCache("partner" , "SELECT * FROM partner order by id asc" , null , $memcache , "object");

        # galleries principal
        if(class_exists('Memcache') || class_exists('Memcached')) {
            $this->saveQueryCache("gallery_franquicia_principal" , "SELECT * FROM gallery_franquicia_principal order by id asc" , null , $this->memcache , "object");
        }

        # relaciones de propiedades Portvil Avantio
        if (class_exists('Memcache')){
            $valor = $memcache->get("relaciones_ids_portvil_avantio" , $this->flags);
            $valor_relaciones_ids_avantio = $memcache->get("id_avantio" , $this->flags);
            $valor_relaciones_ids_portvil_todos = $memcache->get("id_portvil_todos" , $this->flags);
            $valor_relaciones_ids_portvil = $memcache->get("id_portvil" , $this->flags);
        }else if (class_exists('Memcached')){
            $valor = $this->memcache->get("relaciones_ids_portvil_avantio");
            $valor_relaciones_ids_avantio = $this->memcache->get("id_avantio");
            $valor_relaciones_ids_portvil_todos = $this->memcache->get("id_portvil_todos");
            $valor_relaciones_ids_portvil = $this->memcache->get("id_portvil");
        }

        // si no existe valor realizamos la consulta y la guardamos en base de datos
        if ($valor == null){
            $sql = " SELECT * FROM avantio_accomodations_id_avantio_portvil ";
            $query = $this->db->query($sql);
            $this->relaciones_ids_portvil_avantio = $query->getResultArray();
            $this->relaciones_ids_avantio = array_column($this->relaciones_ids_portvil_avantio,"id_avantio");
            $this->relaciones_ids_portvil_todos = array_column($this->relaciones_ids_portvil_avantio,"id_portvil_todos");
            $this->relaciones_ids_portvil = array_column($this->relaciones_ids_portvil_avantio,"id_portvil");
            // guardamos  en memcache o en memcached el dato
            if (class_exists('Memcache')){
                $this->memcache->set("relaciones_ids_portvil_avantio", $this->relaciones_ids_portvil_avantio, 0 , 3600); // 1h or 3600 seconds
                $this->memcache->set("id_avantio", $this->relaciones_ids_avantio, 0 , 3600); // 1h or 3600 seconds
                $this->memcache->set("id_portvil_todos", $this->relaciones_ids_portvil_todos, 0 , 3600); // 1h or 3600 seconds
                $this->memcache->set("id_portvil", $this->relaciones_ids_portvil, 0 , 3600); // 1h or 3600 seconds
            }else if (class_exists('Memcached')){
                $this->memcache->set("relaciones_ids_portvil_avantio", $this->relaciones_ids_portvil_avantio, 3600); // 1h or 3600 seconds
                $this->memcache->set("relaciones_ids_portvil_avantio", $this->relaciones_ids_portvil_avantio, 3600); // 1h or 3600 seconds
                $this->memcache->set("id_avantio", $this->relaciones_ids_avantio, 3600); // 1h or 3600 seconds
                $this->memcache->set("id_portvil_todos", $this->relaciones_ids_portvil_todos, 3600); // 1h or 3600 seconds
                $this->memcache->set("id_portvil", $this->relaciones_ids_portvil, 3600); // 1h or 3600 seconds
            }
            if ($_SERVER["REMOTE_ADDR"] == "79.153.22.246"){
                //echo "guardamos datos 3<br>";
            }
            // si existe valor lo guardamos en data
        }else if ($valor != null){
            $this->relaciones_ids_portvil_avantio = $valor;
            $this->relaciones_ids_avantio = $valor_relaciones_ids_avantio;
            $this->relaciones_ids_portvil_todos = $valor_relaciones_ids_portvil_todos;
            $this->relaciones_ids_portvil = $valor_relaciones_ids_portvil;
            if ($_SERVER["REMOTE_ADDR"] == "79.153.22.246"){
                //echo "leemos datos 3<br>";
            }
        }

    }


    /**
     * @param Request $request
     * @return void
     * @throws \Psr\Cache\InvalidArgumentException
     */
    // $locale
    protected function checkLanguage()
    {
        ##### OJO EN PRINCIPIO CAMBIA EL LOCALE TAL Y COMO ESTA EL lang_locale tengo que mirar para que sirve ######
        # forzamos a locale en "es" para no cambiar el idioma
        # guardamos en lang_lcoal el locale
        # asi no se cambia el idioma de la pagina en general y vemos los contenidos traducidos
        $this->session->set("lang_local" , $this->request->getLocale());
        // var_dump($this->request->getLocale());
        // $locale = "es";
        $locale = $this->request->getLocale();

        # cache | Mamcache
        if(class_exists('Memcache')){
            $memcache = new Memcache;
            $memcache->connect("localhost",11211);
        }else if (class_exists('Memcached')){
            $memcache = new Memcached;
            $memcache->addServer("localhost", 11211);
        }

        # get cache fileSystem
        // $cache = new FilesystemAdapter();

        # get all languages y guardamos los lenguage en session
        $languagesRepository = $this->em->getRepository(\App\Entity\Language::class);
        $languages = $languagesRepository->findAll();
        $this->languages = $languages;
        $languages_vector = array();
        foreach ($languages as $language) {
            $languages_vector[$language->getId()] = $language->getLanguage();
        } // end foreach

        # save languages
        $this->session->set("languages" , $languages);
        $this->session->set("languages_vector" , $languages_vector);

        # get languages
        $find_language = false;
        foreach ($languages as $lang){
            $my_lang = $lang->getLanguage();
            if ($my_lang != "es"){
                if($my_lang == $locale){
                    $this->session->set("lang" , $my_lang);
                    $this->session->set("slug_lang" , $my_lang . "/");
                    $this->session->set("lang_id" , $lang->getId());
                    $find_language = true;
                }
                if ($this->session->get("lang_local") == $my_lang){
                    # local lang
                    $this->session->set("slug_lang_local" , $my_lang . "/");
                    $this->session->set("lang_id_local" , $lang->getId());
                }
            }// end if
        } // end foreach

        if(!$find_language){
            $this->session->set("lang" , "es");
            $this->session->set("slug_lang" ,"/");
            $this->session->set("lang_id" , 111);
        }// end if

    }


    /**
     * @return EntityManagerInterface
     */
    public function getEm(): EntityManagerInterface
    {
        return $this->em;
    }

    /**
     * @param EntityManagerInterface $em
     */
    public function setEm(EntityManagerInterface $em): void
    {
        $this->em = $em;
    }

    #[Route('/admin', name: 'app_admin')]
    public function index(): Response
    {
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }
}
