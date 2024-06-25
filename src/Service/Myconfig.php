<?php
namespace App\Service;

# libraries
use Symfony\Component\Cache\Adapter\FilesystemAdapter;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\Cache\ItemInterface;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
# entity
use App\Entity\DynamicAdvantages;
use App\Entity\DynamicTesimonials;
use App\Entity\DynamicPage;
use App\Entity\DynamicTaxonomy;
use App\Entity\DynamicTaxonomyGroup;
use App\Entity\DynamicTaxonomyCity;
use App\Entity\DynamicRooms;
use App\Entity\DynamicOffers;
use App\Entity\DynamicOffersTaxonomy;
use App\Entity\DynamicAgencia;
use App\Entity\DynamicEmpresa;
use App\Entity\DynamicGalleryFranquiciaPrincipal;
use App\Entity\DynamicGalleryInmoPrincipal;
use App\Entity\DynamicGalleryUsuarioPrincipal;
use App\Entity\Users;
use App\Entity\Languages;
use App\Entity\DynamicTestimonials;
use App\Entity\DynamicGeocountry;
use App\Entity\DynamicGeoregion;
use App\Entity\DynamicGeocity;
use App\Entity\DynamicGeolocality;
use App\Entity\DynamicGeodistrict;


class Myconfig{

    # cache
    private $cache = null;

    # entityManager
    private $entityManager;

    # data variable
    private $data = array();


    /**
     * @param EntityManagerInterface $em
     */
    public function __construct(EntityManagerInterface $em)
    {
        $this->entityManager = $em;
    }

    
    /**
     * @param Request $request
     * @return void
     * @throws \Psr\Cache\InvalidArgumentException
     */
    private function checkLanguage(Request $request)
    {

        # get cache fileSystem
        $cache = new FilesystemAdapter();

        # get languages
        $languagesRepository = $this->entityManager->getRepository(\App\Entity\Languages::class);
        $languages = $languagesRepository->findAll();
        $find_language = false;
        foreach ($languages as $lang){
            $my_lang = $lang->getId();
            if ($my_lang != 1){
                if($my_lang == $request->getLocale()){
                    $lang_cache = $cache->getItem('lang');
                    $lang_slug_lang = $cache->getItem('slug_lang');
                    $lang_cache->set($request->getLocale());
                    $lang_slug_lang->set($request->getLocale()."/");
                    $cache->save($lang_cache);
                    $find_language = true;
                }
            }// end if
        } // end foreach
        if(!$find_language){
            $lang_cache = $cache->getItem('lang');
            $lang_slug_lang = $cache->getItem('slug_lang');
            $lang_cache->set(1);
            $lang_slug_lang->set("es/");
            $cache->save($lang_cache);
        }// end if

    }

    /**
     * @param Request $request
     * @return void
     * @throws \Psr\Cache\InvalidArgumentException
     */
    // ManagerRegistry $doctrine
    public function _init(Request $request)
    {

        // $absolute_url = full_url( $_SERVER );
        // echo $absolute_url . "<br>";

        # get cache fileSystem
        $this->cache = new FilesystemAdapter();

        # get locale
        // echo "request locale: " .$request->getLocale(). "<br>";

        # language
        $this->checkLanguage($request);
        $lang_cache = $this->cache->getItem('lang');
        //p_($lang_cache->get());
        // $lang_cache = 1;
        // echo $lang_cache . "<br>";
        // p_($this->data["pages"]);
        # set cache tables

        /*
        # taxonomy_city
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicTaxonomyCity::class;
        $counter_resultset = 0;
        $this->setCacheTable("city_taxonomies" , $clase ,  $lang_cache , $params);
        $counter_resultset = 0;
        foreach ($this->data["city_taxonomies"] as $item) {
            //if ($counter_resultset == 0){
                echo "taxonomy city: " . $item->getTextTitle() . "<br>";
                echo "accion: " . $item->getDynamicAccion()->getTextTitle() . "<br>";
            //}
            $counter_resultset++;
        }
        die();
        */

        # advantatges cache
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicAdvantages::class;
        $this->setCacheTable("advantages" , $clase ,  $lang_cache , $params);
        # pages cache
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicPages::class;
        $this->setCacheTable("pages" , $clase ,  $lang_cache , $params);
        # pages inmobiliaria
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED" , "id" => 21);
        $clase = \App\Entity\DynamicPages::class;
        $this->setCacheTable("page_inmobiliarias" , $clase ,  $lang_cache , $params);
        # pages usuarios
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED" , "id" => 24);
        $clase = \App\Entity\DynamicPages::class;
        $this->setCacheTable("page_usuarios" , $clase ,  $lang_cache , $params);
        # services
        // de momento nada
        # dynamic taxonomy
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicTaxonomy::class;
        $this->setCacheTable("taxonomy" , $clase ,  $lang_cache , $params);
        # dynamic taxonomy group
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicTaxonomyGroup::class;
        $this->setCacheTable("taxonomyGroup" , $clase ,  $lang_cache , $params);
        # dynamic rooms
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicRooms::class;
        $this->setCacheTable("rooms" , $clase ,  $lang_cache , $params);
        # offers
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicOffers::class;
        $this->setCacheTable("offers" , $clase ,  $lang_cache , $params);
        # offers taxonomy
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED" , "dynamicAccion" => 1);
        $clase = \App\Entity\DynamicOffersTaxonomy::class;
        $this->setCacheTable("offers_taxonomy" , $clase ,  $lang_cache , $params);
        # agencias
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicAgencia::class;
        $this->setCacheTable("agencia" , $clase ,  $lang_cache , $params);
        # galleries
        $params = array();
        $clase = \App\Entity\DynamicGalleryFranquiciaPrincipal::class;
        $this->setCacheTable("galleries" , $clase ,  $lang_cache , $params);
        # galleries inmo
        $params = array();
        $clase = \App\Entity\DynamicGalleryInmo::class;
        $this->setCacheTable("galleries_inmo" , $clase ,  $lang_cache , $params);
        # galleries usuario
        $params = array();
        $clase = \App\Entity\DynamicGalleryUsuario::class;
        $this->setCacheTable("galleries_usuario" , $clase ,  $lang_cache , $params);
        // p_($this->data["galleries"]);
        # testimonials cache
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicTestimonials::class;
        $this->setCacheTable("testimonials" , $clase ,  $lang_cache , $params);
        # accion
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicAccion::class;
        $this->setCacheTable("accion" , $clase ,  $lang_cache , $params);
        # taxonomy_city
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED" , "dynamicAccion" => 1);
        $clase = \App\Entity\DynamicTaxonomyCity::class;
        $this->setCacheTable("city_taxonomies" , $clase ,  $lang_cache , $params);
        # taxonomy_city_vector
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED" , "dynamicAccion" => 1);
        $clase = \App\Entity\DynamicTaxonomyCity::class;
        $this->setCacheTable("city_taxonomies_vector" , $clase ,  $lang_cache , $params);
        # taxonomy_city alquiler
        $params = array("language"  => $lang_cache->get() , "dynamicAccion" => 2);
        $clase = \App\Entity\DynamicTaxonomyCity::class;
        $this->setCacheTable("city_taxonomies_alquiler" , $clase ,  $lang_cache , $params);
        # taxonomy_city compartir
        $params = array("language"  => $lang_cache->get() , "dynamicAccion" => 3);
        $clase = \App\Entity\DynamicTaxonomyCity::class;
        $this->setCacheTable("city_taxonomies_compartir" , $clase ,  $lang_cache , $params);
        # geocountry
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicGeocountry::class;
        $this->setCacheTable("geocountry" , $clase ,  $lang_cache , $params);
        # georegion
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicGeoregion::class;
        $this->setCacheTable("georegion" , $clase ,  $lang_cache , $params);
        # geocity
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicGeocity::class;
        $this->setCacheTable("geocity" , $clase ,  $lang_cache , $params);
        # geolocality
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicGeolocality::class;
        $this->setCacheTable("geolocality" , $clase ,  $lang_cache , $params);
        # geodistrict
        $params = array("language"  => $lang_cache->get() , "status" => "ACTIVED");
        $clase = \App\Entity\DynamicGeodistrict::class;
        $this->setCacheTable("geodistrict" , $clase ,  $lang_cache , $params);
        // descartado de momento
        # empresas
        $params = array("language"  => $lang_cache->get());
        $clase = \App\Entity\DynamicEmpresa::class;
        $this->setCacheTable("empresa" , $clase ,  $lang_cache , $params);
        //echo "language: ".$lang_cache->get()."<br>";

    } // end function


    private function tempObjectsQueryParameters()
    {
        $objects_query_parameters = array(
            "city_taxonomies",
            "pages",
            "offers_taxonomy",
            "geolocality"
        );
        
        return $objects_query_parameters;
    }
    

    /**
     * @param $name
     * @param $clase
     * @param $lang_cache
     * @param $params
     * @return void
     * @throws \Psr\Cache\InvalidArgumentException
     */
    private function setCacheTable(String $name , $clase , $lang_cache , $params)
    {
        
        $tables_parameters = $this->tempObjectsQueryParameters();

        # get cache fileSystem
        # !!!!! OJO HAY QUE BORRAR PARA ACTUALIZAR !!!!
        # $this->cache->deleteItem($name);
        if($name == "city_taxonomies" || $name == "city_taxonomies_vector"){
            $this->cache->deleteItem($name);
        }
        ${$name} = $this->cache->getItem($name);
        if(!$this->data[$name] = ${$name}->get()) {
            ${$name."Repository"} = $this->entityManager->getRepository($clase);
            // p_(${$name."Repository"});
            ${$name."_rows"} = ${$name."Repository"}->findAll();
            if (in_array($name,$tables_parameters)){
                ${$name."_rows"} = ${$name."Repository"}->findAllByParameters($params);
            }else{
                ${$name."_rows"} = ${$name."Repository"}->findAll();
            }
            # vector taxonomies
            if ($name == "city_taxonomies_vector"){
                ${$name."_rows"} = ${$name."Repository"}->findAllByParametersOld($params);
            }
            $this->data[$name] = ${$name."_rows"};
            // storing a simple integer
            ${$name}->set(${$name."_rows"});
            $this->cache->save(${$name});
        }else{
            $this->data[$name] = ${$name}->get();
        }// end if

    } // end function





    
    private function setCacheForm()
    {
        # accion
        $accion_param = $this->cache->getItem("accion_param");
        if(!$accion_param->get()) {
            $accion_param->set(1);
            $this->cache->save($accion_param);
        }// end if

        # taxonomy_group
        $taxonomy_group_param = $this->cache->getItem("taxonomy_group_param");
        if(!$taxonomy_group_param->get()) {
            $taxonomy_group_param->set(1);
            $this->cache->save($taxonomy_group_param);
        }// end if

        # taxonomy_group_alquilar
        $taxonomy_group_alquilar_param = $this->cache->getItem("taxonomy_group_alquilar_paraam");
        if(!$taxonomy_group_alquilar_param->get()) {
            $taxonomy_group_alquilar_param->set(1);
            $this->cache->save($taxonomy_group_alquilar_param);
        }// end if

        # geolocality
        $geolocality_param = $this->cache->getItem("geolocality_param");
        if(!$geolocality_param->get()) {
            $geolocality_param->set(1);
            $this->cache->save($geolocality_param);
        }// end if

        # geolocality_alquilar
        $geolocality_alquilar_param = $this->cache->getItem("geolocality_alquilar_param");
        if(!$geolocality_alquilar_param->get()) {
            $geolocality_alquilar_param->set(1);
            $this->cache->save($geolocality_alquilar_param);
        }// end if

        # precio minimo
        $precio_minimo_param = $this->cache->getItem("precio_minimo_param");
        if(!$precio_minimo_param->get()) {
            $precio_minimo_param->set(1);
            $this->cache->save($precio_minimo_param);
        }// end if

        # precio minimo_alquiler
        $precio_minimo_alquilar_param = $this->cache->getItem("precio_minimo_alquilar_param");
        if(!$precio_minimo_alquilar_param->get()) {
            $precio_minimo_alquilar_param->set(1);
            $this->cache->save($precio_minimo_alquilar_param);
        }// end if

        # precio maximo
        $precio_maximo_param = $this->cache->getItem("precio_maximo_param");
        if(!$precio_maximo_param->get()) {
            $precio_maximo_param->set(1000000);
            $this->cache->save($precio_maximo_param);
        }// end if

        # precio maximo_alquilar
        $precio_maximo_alquilar_param = $this->cache->getItem("precio_maximo_alquilar_param");
        if(!$precio_maximo_alquilar_param->get()) {
            $precio_maximo_alquilar_param->set(1000000);
            $this->cache->save($precio_maximo_alquilar_param);
        }// end if

        # particular
        $particular_param = $this->cache->getItem("particular_param");
        if(!$particular_param->get()) {
            $particular_param->set(1);
            $this->cache->save($particular_param);
        }// end if

        # particular_alquilar
        $particular_alquilar_param = $this->cache->getItem("particular_alquilar_param");
        if(!$particular_alquilar_param->get()) {
            $particular_alquilar_param->set(1);
            $this->cache->save($particular_alquilar_param);
        }// end if

    }
    


    /**
     * @param Request $request
     * @return void
     * @throws \Psr\Cache\InvalidArgumentException
     */
    private function _initManual(Request $request)
    {

        # get cache fileSystem
        $cache = new FilesystemAdapter();

        # get locale
        echo "request locale: " .$request->getLocale(). "<br>";

        # language
        $this->checkLanguage($request);
        $lang_cache = $cache->getItem('lang');

        # advantatges cache
        $advantages = $cache->getItem('advantages');
        if(!$this->data['advantages'] = $advantages->get() ) {
            echo "no encontrado advantages<br>";
            $advantagesRepository = $this->entityManager->getRepository(\App\Entity\DynamicAdvantages::class);
            $advantages_rows = $advantagesRepository->findBy(array("language"  => $lang_cache->get()) );
            $this->data['advantages'] = $advantages_rows;
            // storing a simple integer
            $advantages->set($advantages_rows);
            $cache->save($advantages);
        }else{
            echo "encontrado advantages<br>";
            $this->data['advantages'] = $advantages->get();
        }// end if

        foreach ($this->data['advantages'] as $adv){
            echo $adv->getTextTitle() . "<br>";
        }

        # testimonials cache
        $testimonials = $cache->getItem('testimonials');
        if(!$this->data['testimonials'] = $testimonials->get() ) {
            echo "no encontrado testimonials<br>";
            $testimonialsRepository = $this->entityManager->getRepository(\App\Entity\DynamicTestimonials::class);
            $testimonials_rows = $testimonialsRepository->findBy(array("language"  => $lang_cache->get()) );
            $this->data['testimonials'] = $testimonials_rows;
            // storing a simple integer
            $testimonials->set($testimonials_rows);
            $cache->save($testimonials);
        }else{
            echo "encontrado testimonials<br>";
            $this->data['testimonials'] = $testimonials->get();
        }// end if

        foreach ($this->data['testimonials'] as $adv){
            echo $adv->getTextTitle() . "<br>";
        }

        # pages cache
        $pages = $cache->getItem('pages');
        if(!$this->data['pages'] = $pages->get() ) {
            echo "no encontrado pages<br>";
            $pagesRepository = $this->entityManager->getRepository(\App\Entity\DynamicPages::class);
            $pages_rows = $pagesRepository->findBy(array("language"  => $lang_cache->get()) );
            $this->data['pages'] = $pages_rows;
            // storing a simple integer
            $pages->set($pages_rows);
            $cache->save($pages);
        }else{
            echo "encontrado pages<br>";
            $this->data['pages'] = $pages->get();
        }// end if

        foreach ($this->data['pages'] as $adv){
            echo $adv->getTextTitle() . "<br>";
        }

        # taxonomy cache
        $taxonomy = $cache->getItem('taxonomy');
        if(!$this->data['taxonomy'] = $taxonomy->get() ) {
            echo "no encontrado taxonomy<br>";
            $taxonomyRepository = $this->entityManager->getRepository(\App\Entity\DynamicTaxonomy::class);
            $taxonomy_rows = $taxonomyRepository->findBy(array("language"  => $lang_cache->get()) );
            $this->data['taxonomy'] = $taxonomy_rows;
            // storing a simple integer
            $taxonomy->set($taxonomy_rows);
            $cache->save($taxonomy);
        }else{
            echo "encontrado taxonomy<br>";
            $this->data['taxonomy'] = $taxonomy->get();
        }// end if

        foreach ($this->data['taxonomy'] as $adv){
            echo $adv->getTextTitle() . "<br>";
        }

        # taxonomy group
        $taxonomyGroup = $cache->getItem('taxonomyGroup');
        if(!$this->data['taxonomyGroup'] = $taxonomyGroup->get() ) {
            echo "no encontrado taxonomyGroup<br>";
            $taxonomyGroupRepository = $this->entityManager->getRepository(\App\Entity\DynamicTaxonomyGroup::class);
            $taxonomyGroup_rows = $taxonomyGroupRepository->findBy(array("language"  => $lang_cache->get()) );
            $this->data['taxonomyGroup'] = $taxonomyGroup_rows;
            // storing a simple integer
            $taxonomyGroup->set($taxonomyGroup_rows);
            $cache->save($taxonomyGroup);
        }else{
            echo "encontrado taxonomyGroup<br>";
            $this->data['taxonomyGroup'] = $taxonomyGroup->get();
        }// end if

        foreach ($this->data['taxonomyGroup'] as $adv){
            echo $adv->getTextTitle() . "<br>";
        }

        # rooms
        $rooms = $cache->getItem('rooms');
        if(!$this->data['rooms'] = $rooms->get() ) {
            echo "no encontrado rooms<br>";
            $roomsRepository = $this->entityManager->getRepository(\App\Entity\DynamicRooms::class);
            $rooms_rows = $roomsRepository->findBy(array("language"  => $lang_cache->get()) );
            $this->data['rooms'] = $rooms_rows;
            // storing a simple integer
            $rooms->set($rooms_rows);
            $cache->save($rooms);
        }else{
            echo "encontrado rooms<br>";
            $this->data['rooms'] = $rooms->get();
        }// end if

        foreach ($this->data['rooms'] as $adv){
            echo $adv->getTextTitle() . "<br>";
        }

    }


    public function initDbal()
    {

        # dbal connection
        $connection = $this->entityManager->getConnection();
        
        # dbal
        $products = $connection->fetchAllAssociative('SELECT * FROM users');
        
        return $products;
    }

    
    public function initRepository(){

        $id = 1;
        $repository = $this->entityManager->getRepository(Users::class);

        $product = $repository->find($id);

        return $product;
    }


    public function config()
    {
        $ruta = dirname(__DIR__ , 1);
        //echo $ruta . "<br>";
        $this->cache = new FilesystemAdapter(
        // a string used as the subdirectory of the root cache directory, where cache
        // items will be stored
            $namespace = '',
            // the default lifetime (in seconds) for cache items that do not define their
            // own lifetime, with a value 0 causing items to be stored indefinitely (i.e.
            // until the files are deleted)
            $defaultLifetime = 0,
            // the main cache directory (the application needs read-write permissions on it)
            // if none is specified, a directory is created inside the system temporary directory
            $directory = "./cache",
        );
    }

    public function testCache()
    {
        $cache = new FilesystemAdapter();

        // The callable will only be executed on a cache miss.
        $value = $cache->get('my_cache_key_cuatro', function (ItemInterface $item) {
            $item->expiresAfter(3600);
            // ... do some HTTP request or heavy computations
            $computedValue = 'foobar';
            return $computedValue;
        });

        echo $value; // 'foobar'

        // ... and to remove the cache key
        $cache->delete('my_cache_key_cuatro');
    }


    public function testCacheSecond()
    {

        $cache = new FilesystemAdapter();

        // create a new item by trying to get it from the cache
        $productsCount = $cache->getItem('variable');

        // assign a value to the item and save it
        $productsCount->set(4711);
        $cache->save($productsCount);

        // retrieve the cache item
        $productsCount = $cache->getItem('variable');
        if (!$productsCount->isHit()) {
            // ... item does not exist in the cache
            echo "No existe<br>";
        }else{
            echo "existe<br>";
        }// end if

        // retrieve the value stored by the item
        $total = $productsCount->get();

        // remove the cache item
        // $cache->deleteItem('stats.products_count');
    }

    /**
     * @return array
     */
    public function getData(): array
    {
        return $this->data;
    }


    /**
     * @param array $data
     */
    public function setData(array $data): void
    {
        $this->data = $data;
    }


    /**
     * @return null
     */
    public function getCache()
    {
        return $this->cache;
    }

    /**
     * @param null $cache
     */
    public function setCache($cache): void
    {
        $this->cache = $cache;
    }

    /**
     * @return EntityManagerInterface
     */
    public function getEntityManager(): EntityManagerInterface
    {
        return $this->entityManager;
    }

    /**
     * @param EntityManagerInterface $entityManager
     */
    public function setEntityManager(EntityManagerInterface $entityManager): void
    {
        $this->entityManager = $entityManager;
    }

    public function pruebaQueryBuilder()
    {
        # name
        $name = "geocountry";

        # class
        $clase = \App\Entity\DynamicGeocountry::class;

        # repository
        ${$name."Repository"} = $this->entityManager->getRepository($clase);

        # find all
        ${$name."all_rows"} = ${$name."Repository"}->findAll();
        $this->data[$name] = ${$name."all_rows"};

        # find by
        $params = array("textTitle" => "Spain" , "status" => "ACTIVED" , 'id' => 1);
        ${$name."_rows"} = ${$name."Repository"}->findBy($params);
        $this->data[$name."_rows"] = ${$name."_rows"};

        # findOne by
        //$params = array("textTitle" => "Spain" , "status" => "ACTIVED" , 'id_country' => 1);
        ${$name."_rows_one"} = ${$name."Repository"}->findOneBy($params);
        $this->data[$name."_rows_one"] = ${$name."_rows_one"};

        #  getAllCountries
        ${$name."all_rows_language"} = ${$name."Repository"}->getAllCountries();
        $this->data[$name."all_rows_language"] = ${$name."all_rows_language"};

        #  getCountriesByLanguage query builder
        ${$name."all_rows_by_language"} = ${$name."Repository"}->getCountriesByLanguage("España");
        $this->data[$name."all_rows_by_language"] = ${$name."all_rows_by_language"};
        //print_r(${$name."all_rows_language"});

        # getCountriesByParams dynamic params
        $filters = array("textTitle" => "Spain" , "status" => "ACTIVED" , 'id' => 1);
        ${$name."all_rows_by_params"} = ${$name."Repository"}->getCountriesByParams($filters);
        $this->data[$name."all_rows_by_params"] = ${$name."all_rows_by_params"};

        # get status actived | create query
        ${$name."all_rows_by_status"} = ${$name."Repository"}->getAllActived();
        $this->data[$name."all_rows_by_status"] = ${$name."all_rows_by_status"};

        # name
        $name = "georegion";

        # class
        $clase = \App\Entity\DynamicGeoregion::class;

        # repository
        ${$name."Repository"} = $this->entityManager->getRepository($clase);

        # find all
        ${$name."all_rows"} = ${$name."Repository"}->getRegionsAndCountries();
        $this->data[$name."all_rows"] = ${$name."all_rows"};
        //print_r($this->data[$name]);

        # find regions by named parameters
        $parameters = array(
            "id" => 1,
            "language" => 2,
            "status" => "ACTIVED"
        );
        ${$name."parameters"} = ${$name."Repository"}->getRegionsByParameters($parameters);
        $this->data[$name."parameters"] = ${$name."parameters"};

        # find regions by numeric parameters
        $parameters = array(
            1 => 1, // id
            2 => 2, // language
            3 => "ACTIVED" // status
        );
        ${$name."parameters"} = ${$name."Repository"}->getRegionsByNumericParameters($parameters);
        $this->data[$name."parameters"] = ${$name."parameters"};

        # regions by id country
        $idCountry = 1;
        ${$name."by_idcountry"} = ${$name."Repository"}->getRegionsByIdCountry($idCountry);
        $this->data[$name."by_idcountry"] = ${$name."by_idcountry"};

        # regions by id language
        $idLanguage = 2;
        ${$name."by_idlanguage"} = ${$name."Repository"}->getRegionsByIdLanguage($idCountry , $idLanguage);
        $this->data[$name."by_idlanguage"] = ${$name."by_idlanguage"};

        # regions by id language dbal
        ${$name."by_idlanguage_dbal"} = ${$name."Repository"}->getRegionsByIdLanguageDbal($idCountry , $idLanguage);
        $this->data[$name."by_idlanguage_dbal"] = ${$name."by_idlanguage_dbal"};

        # regions by id language and idcountry and language
        $idLanguage = 2;
        $idCountry = 1;
        $language = "en";
        ${$name."by_idlanguage_three_joins"} = ${$name."Repository"}->getRegionsByLanguage($idCountry , $language , $idLanguage);
        $this->data[$name."by_idlanguage_three_joins"] = ${$name."by_idlanguage_three_joins"};

        # dql
        ${$name."dql"} = ${$name."Repository"}->getRegionsByIdLanguageDql($idCountry , $idLanguage);
        $this->data[$name."dql"] = ${$name."dql"};

        # region by name
        $name_parameter = "Catalunya";
        ${$name_parameter."by_name"} = ${$name."Repository"}->getRegionByName($name_parameter);
        $this->data[$name_parameter."by_name"] = ${$name_parameter."by_name"};

        # region expression by name
        $name_parameter = "Catalunya";
        ${$name_parameter."by_expression_name"} = ${$name."Repository"}->getRegionByNameExpresion($name_parameter);
        $this->data[$name_parameter."by_expression_name"] = ${$name_parameter."by_expression_name"};

        # region expression by name and id
        $name_parameter = "Catalunya";
        $id = 1;
        ${$name_parameter."by_expression_name_and_id"} = ${$name."Repository"}->getRegionByNameAndIdExpresion($id , $name_parameter);

        # region expression by name or id
        ${$name_parameter."by_expression_name_or_id"} = ${$name."Repository"}->getRegionByNameOrIdExpresion($id , $name_parameter);

        # region expression by name and id two
        ${$name_parameter."by_expression_name_and_id_two"} = ${$name."Repository"}->getRegionByNameAndIdExpresionTwo($id , $name_parameter);

    }

}// end class
?>