<?php
namespace App\Tests\Functional\Controller\Api;

use App\Entity\DynamicAdminPages;
use PHPUnit\Framework\TestCase;

class SegmentApiController extends TestCase
{
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

    # response
    protected $response;
    protected $request;


    protected function segment()
    {
        # call to segments
        $this->initSegment();
    }


    protected function segment_idioma()
    {

        # call to segments
        $this->initSegment($this->request);
        // printemaos el formulario

    }


    private function checkSession()
    {
        /*
        if (!$this->session->get('isLoggedIn'))
            return false;
        else
            return true;
        */
        return true;
    }


    private function initSegment()
    {

        # recogemos idioma
        $locale = $this->request->getLocale();

        # llamamos a la inicialización admin controller
        // $this->init();
        // $this->checkLanguage($this->request->getLocale());

        # guardamos roles y bookings en session
        /*
        $this->session->set("grupo","gestor-contenidos");
        $this->session->set("isLoggedIn",true);
        $vector_booking = array(
            "portvil-avantio-no-duplicadas" => 1,
            "avantio-portvil-no-duplicadas" => 0,
            "avantio-portvil" => 0,
            "portvil" => 0,
            "avantio" => 0
        );
        */

        # check session
        if (!$this->checkSession())
            return $this->redirectToRoute("login");

        //$vector_booking_json = json_encode($vector_booking);
        //$this->session->set("preferences_booking",$vector_booking_json);

        // entity manager
        $em = $this->getEm();

        # dynamic agencia
        // $dynamicAgenciaRepository = $em->getRepository(DynamicAgencia::class);
        // $dynamicAgencias = $dynamicAgenciaRepository->findAll();

        # dynamic pages
        //$dynamicPagesRepository = $em->getRepository(DynamicPages::class);

        # pages all
        // analizamos la url
        $segments = $this->request->getPathInfo();
        $segments = explode("/",$segments);
        // borramos si existe cualquier lenguage en el semento 1
        if (in_array($segments[1],$this->session->get("languages_vector"))){
            unset($segments[1]);
        }
        // actualizamos indices
        $segments = array_values($segments);
        //p_($segments);

        # cogemos todos los segmentos excepto el 0 que no contiene ningún dato
        $segment = $filter = $filter_2 = $filter_3 = $filter_4 = null;
        if (isset($segments[1]))
            $this->segment = $segments[1];
        if (isset($segments[2]))
            $this->filter = $segments[2];
        if (isset($segments[3]))
            $this->filter_2 = $segments[3];
        if (isset($segments[4]))
            $this->filter_3 = $segments[4];
        if (isset($segments[5]))
            $this->filter_4 = $segments[5];

        // echo "el segmento<br>";
        // print_r($segments);
        // die();

        # status
        $status = "ACTIVED";

        // $this->page_id = 40;
        // $this->list();
        $pages = $this->checkUrls($this->data);

    }


    public function checkUrls(&$data)
    {

        $find_it = false;

        # details | propieades avantio | propieades portvil | limpiadora | blog

        # detail property avantio
        if (!$find_it)
            $find_it = $this->check_detail_page_portvil($data);

        # detail property
        if (!$find_it)
            $find_it = $this->check_detail_page($data);

        # details limpiadora
        if (!$find_it)
            $find_it = $this->check_detail_page_limpiadoras($data);

        # details blog
        if (!$find_it)
            $find_it = $this->check_detail_page_blog($data);

        /*
        # detail property preview (actived and paused)
        if (!$find_it)
            $find_it = $this->check_detail_page_preview_paused_and_actived($segment , $filter , $filter_2 , $filter_3);
        */

        # theme lang slug
        if (!$find_it)
            $find_it = $this->checkUrlsTheme($data);

        # backend pages
        if (!$find_it)
            $find_it = $this->checkUrlsAdminPages($data);

        # front end pages | prioridad ante theme
        // if (!$find_it)
        // $find_it = $this->checkUrlsPages($data);

    }


    private function check_detail_page(&$data)
    {

        // entity manager
        $entityManager = $this->getEm();

        # dbal connection
        $connection = $this->getEm()->getConnection();

        # keep language in session
        //$this->session = $this->request->getSession();

        //$id_language = $this->session->get("lang_id");
        //$id_language = $this->session->get("lang_id");

        # query para comprobar que contiene la url detalle de las propiedades portvil
        /*
        $sql = " SELECT distinct ds.id FROM App\Entity\DynamicUrlDetalle ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language AND ds.id = :id ";
        $consulta = $entityManager->createQuery($sql);
        $consulta->setParameters(array(
            'filter' => $segment,
            'status'  => 'ACTIVED',
            'language' => $id_language,
            'id' => 1
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();
        */

        # forzamos salida
        $result = array();

        if (count($result) > 0) {
            $sql = " SELECT distinct ds.id FROM App\Entity\DynamicRooms ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language ";
            $consulta = $entityManager->createQuery($sql);
            $consulta->setParameters(array(
                'filter' => $this->segment,
                'status'  => 'ACTIVED',
                'language' => $id_language,
            ));
            $sql = $consulta->getDQL();
            $result = $consulta->getResult();
            if (count($result) > 0 && $this->filter_2 == 1) {
                //$row = $query->getFirstRow();
                //p_($row);
                //die();
                //$this->show_room($row->id, $row->id_avantio);
                //header("HTTP/1.1 200 OK");
                return true;
            } else if (count($result) > 0 && (!$this->filter_2 || $this->filter_2 != 1)) {
                //header("HTTP/1.0 404 Not Found");
                //$this->show_404();
                //die();
                return false;
            }// end if

        }else{
            return false;
        }

        # acciones
        /*
        // $sql = "SELECT * FROM dynamic_url_detalle WHERE ( ( text_slug = '" . $filter . "' AND LENGTH(text_slug) > 0 ) OR (auto_slug='" . $filter . "' AND LENGTH(auto_slug) > 0 AND LENGTH(text_slug) = 0) ) AND language='" . $language . "' ";
        $sql = " SELECT distinct ds.id FROM App\Entity\DynamicUrlDetalle ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language ";
        $consulta = $entityManager->createQuery($sql);
        $consulta->setParameters(array(
            'filter' => $segment,
            'status'  => 'ACTIVED',
            'language' => $id_language,
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();
        */

        # forzamos salida
        $result = array();


        if (count($result) > 0) {
            // $row = $query->getFirstRow();
            if ($result[0]["id"] == 1) {
                # intranet property
                # own property
                // AND status = '".$status."'
                // $sql = "SELECT distinct(id) as id, id_avantio FROM hshv_dynamic_rooms WHERE ( ( text_slug = '" . $filter_2 . "' AND LENGTH(text_slug) > 0 ) OR (auto_slug='" . $filter_2 . "' AND LENGTH(auto_slug) > 0 AND LENGTH(text_slug) = 0) ) AND language='" . $language . "' ";
                $sql = " SELECT distinct ds.id , ds.id_avantio FROM App\Entity\HshvDynamicRooms ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language ";
                $consulta = $entityManager->createQuery($sql);
                $consulta->setParameters(array(
                    'filter' => $this->segment,
                    'status'  => 'ACTIVED',
                    'language' => $id_language,
                ));
                $sql = $consulta->getDQL();
                //$query = $this->db->query($sql);
                if (count($result) > 0 && !$this->filter_2) {
                    //$row = $query->getFirstRow();
                    //$this->show_room($row->id, $row->id_avantio);
                    //header("HTTP/1.1 200 OK");
                    return true;
                } else if (count($result) > 0 && $this->filter_2) {
                    //header("HTTP/1.0 404 Not Found");
                    $this->show_404();
                    //die();
                    return true;
                }// end if
            }
        } else {
            return false;
        } // end if

    }



    private function check_detail_page_portvil(&$data)
    {

        // entity manager
        $entityManager = $this->getEm();

        # dbal connection
        $connection = $this->getEm()->getConnection();

        # keep language in session
        //$this->session = $this->request->getSession();

        //$id_language = $this->session->get("lang_id");
        //$id_language = $this->session->get("lang_id");

        /*
        # query para comprobar que contiene la url detalle de las propiedades portvil
        $sql = " SELECT distinct ds.id FROM App\Entity\DynamicUrlDetalle ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language AND ds.id = :id ";
        $consulta = $entityManager->createQuery($sql);
        $consulta->setParameters(array(
            'filter' => $segment,
            'status'  => 'ACTIVED',
            'language' => $id_language,
            'id' => 3
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();
        */


        # de momento desactivo la consulta hasta que ponga la clase
        $result = array();

        if (count($result) > 0) {
            // $sql = "SELECT distinct(id) as id, id_avantio FROM hshv_dynamic_rooms_real WHERE ( ( text_slug = '" . $filter_2 . "' AND LENGTH(text_slug) > 0 ) OR (auto_slug='" . $filter_2 . "' AND LENGTH(auto_slug) > 0 AND LENGTH(text_slug) = 0) ) AND language='" . $language . "' ";
            $sql = " SELECT distinct ds.id FROM App\Entity\HshvDynamicRoomsReal ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language  ";
            $consulta = $entityManager->createQuery($sql);
            $consulta->setParameters(array(
                'filter' => $this->segment,
                'status'  => 'ACTIVED',
                'language' => $id_language,
            ));
            $sql = $consulta->getDQL();
            $result = $consulta->getResult();

            # pasamos un parametro ficticio id_avantio == 3 !!! OJO ES FICTICIO
            if (count($result) > 0 && $this->filter_2 == 2) {
                //$row = $query->getFirstRow();
                //$this->show_room($row->id, 3);
                //header("HTTP/1.1 200 OK");
                return true;
            } else if (count($result) > 0 && (!$this->filter_2 || $this->filter_2 != 2)) {
                //header("HTTP/1.0 404 Not Found");
                //$this->show_404();
                return false;
            }// end if

        }else{
            return false;
        }

    }


    private function check_detail_page_limpiadoras(&$data)
    {

        // entity manager
        $entityManager = $this->getEm();

        # dbal connection
        $connection = $this->getEm()->getConnection();

        # keep language in session
        //$this->session = $this->request->getSession();

        //$id_language = $this->session->get("lang_id");
        //$id_language = $this->session->get("lang_id");

        /*
        $sql = " SELECT distinct ds.id FROM App\Entity\DynamicLimpiadora ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language  ";
        $consulta = $entityManager->createQuery($sql);
        $consulta->setParameters(array(
            'filter' => $segment,
            'status'  => 'ACTIVED',
            'language' => $id_language,
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();
        */

        # de momento desactivo la consulta hasta que ponga la clase
        $result = array();

        if (count($result) > 0){
            if (count($result) > 0 && !$this->filter_2){
                //$row = $query->getFirstRow();
                //$this->show_limpiadora($row->id, 3);
                //header("HTTP/1.1 200 OK");
                return true;
            }else if (count($result) > 0 && $this->filter_2){
                //header("HTTP/1.0 404 Not Found");
                //$this->show_404();
                return true;
            }
        }else{
            return false;
        }

    }


    private function check_detail_page_blog(&$data)
    {
        // entity manager
        $entityManager = $this->getEm();

        # dbal connection
        $connection = $this->getEm()->getConnection();

        # keep language in session
        //$this->session = $this->request->getSession();

        //$id_language = $this->session->get("lang_id");

        /*
        $sql = " SELECT distinct ds.id FROM App\Entity\DynamicBlog ds WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language  ";
        $consulta = $entityManager->createQuery($sql);
        $consulta->setParameters(array(
            'filter' => $segment,
            'status'  => 'ACTIVED',
            'language' => $id_language,
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();
        */

        # de momento desactivo la consulta hasta que ponga la clase
        $result = array();

        if (count($result) > 0){
            if (count($result) > 0 && !$this->filter_2){
                //$row = $query->getFirstRow();
                //$this->show_limpiadora($row->id, 3);
                //header("HTTP/1.1 200 OK");
                return true;
            }else if (count($result) > 0 && $this->filter_2){
                //header("HTTP/1.0 404 Not Found");
                //$this->show_404();
                return true;
            }
        }else{
            return false;
        }

    }


    private function checkUrlsTheme(&$data)
    {
        // entity manager
        $entityManager = $this->getEm();

        # dbal connection
        $connection = $this->getEm()->getConnection();

        # keep language in session
        //$this->session = $this->request->getSession();

        //$id_language = $this->session->get("lang_id");

        //$this->translator = $translator;
        //$this->localeSwitcher = $localSwitcher;

        # prueba
        if ($this->segment == $this->translator->trans('pagina_prueba')) {

        } // end if prueba

        # galeria | gallery
        if ($this->segment == $this->translator->trans('gallery')){
            //header("HTTP/1.1 200 OK");
            //$this->makeGallery($segment , $filter , $filter_2 , $filter_3 , $filter_4);
            return true;
        } // end if

        if ($this->segment == $this->translator->trans('gallery-portvil')){
            //header("HTTP/1.1 200 OK");
            //$this->makeGalleryPortvil($segment , $filter , $filter_2 , $filter_3 , $filter_4);
            return true;
        } // end if

        # formularios | tienes alguna duda form
        if ($this->segment == $this->translator->trans('tienes_alguna_duda_url')){
            # insert data
            //$this->form_dudas();
            # write message
            //session()->setFlashdata("message", lang("Text.tienes_alguna_duda_gracias"));
            # redirect
            //$url = $this->request->getPost("text_url");
            //header('Location: '.$url);
            exit;
        } // end if

        # dictionary
        if ($this->segment == $this->translator->trans('guardar-dictionary')){
            //header('Content-type: application/json; charset=utf-8');
            //header("HTTP/1.1 200 OK");
            //$this->guardar_dictionary();
            //exit;
            //return true;
        }// end if


        # devolver idioma actual
        if ($this->segment == $this->translator->trans('leer-idioma-ajax')){
            //header('Content-type: application/json; charset=utf-8');
            //die();
            //header("HTTP/1.1 200 OK");
            //$this->devolver_idioma();
            //exit;
            //return true;
        }// end if

        return false;
    }


    private function checkUrlsPages(&$data){

        $id_language = $this->session->get("lang_id");

        # query mismo idioma pagina
        $sql = " SELECT distinct ds , t , o  
        FROM App\Entity\DynamicPages ds 
        LEFT JOIN ds.tabla t
        LEFT JOIN t.objeto o
        WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language ";
        $consulta = $this->em->createQuery($sql);
        $consulta->setParameters(array(
            'filter' => $this->segment,
            'status'  => 'ACTIVED',
            'language' => $id_language
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();
        // var_dump($result);
        // die();
        if (count($result) > 0) {
            $this->page_id = $result[0]->getId();
            if (!is_null($result[0]->getTabla()->getTextTitle())){
                $this->nombre_tabla = $result[0]->getTabla()->getTextTitle();
            }
            if (!is_null($result[0]->getTabla()->getObjeto()->getTextTitle())){
                $this->nombre_objeto = $result[0]->getTabla()->getObjeto()->getTextTitle();
            }
            /*
            var_dump($this->page_id);
            var_dump($this->nombre_tabla);
            var_dump($this->nombre_objeto);
            die();
            */
            $this->gotoUrlPage($data);
            // header("HTTP/1.1 200 OK");
            return true;
        }else if (count($result) > 0 ){
            // p_("404 Not Found");
            // header("HTTP/1.0 404 Not Found");
            $this->show_404();
            return true;
            # comrprobamos si estamos en segmento
            # query mismo idioma pagina como parametro
        }else{
            # query mismo idioma pagina
            $sql = " SELECT distinct ds , t , o 
        FROM App\Entity\DynamicPages ds 
        LEFT JOIN ds.tabla t
        LEFT JOIN t.objeto o
        WHERE (ds.textSlug = :segment OR ds.autoSlug = :segment) AND ds.status = :status AND ds.language = :language ";
            $consulta = $this->em->createQuery($sql);
            $consulta->setParameters(array(
                'filter' => $this->segment,
                'status'  => 'ACTIVED',
                'language' => $id_language
            ));
            $sql = $consulta->getDQL();
            $result = $consulta->getResult();

            if (count($result) > 0) {
                $this->page_id = $result[0]->getId();
                if (!is_null($result[0]->getTabla()->getTextTitle())) {
                    $this->nombre_tabla = $result[0]->getTabla()->getObjeto()->getTextTitle();
                }
                if (!is_null($result[0]->getTabla()->getObjeto()->getTextTitle())) {
                    $this->nombre_objeto = $result[0]->getTabla()->getObjeto()->getTextTitle();
                }
                $this->gotoUrlPage($data);
                // header("HTTP/1.1 200 OK");
                return true;
                # query diferente idioma pagina como parametro
            }else{
                # query mismo idioma pagina
                $sql = " SELECT distinct ds , t , o 
        FROM App\Entity\DynamicPages ds 
        LEFT JOIN ds.tabla t
        LEFT JOIN t.objeto o
        WHERE (ds.textSlug = :segment OR ds.autoSlug = :segment) AND ds.status = :status AND ds.language <> :language ";
                $consulta = $this->em->createQuery($sql);
                $consulta->setParameters(array(
                    'filter' => $this->segment,
                    'status'  => 'ACTIVED',
                    'language' => $id_language
                ));
                $sql = $consulta->getDQL();
                $result = $consulta->getResult();
                if (count($result) > 0) {
                    $this->page_id = $result[0]->getId();
                    if (!is_null($result[0]->getTabla()->getTextTitle())) {
                        $this->nombre_tabla = $result[0]->getTabla()->getObjeto()->getTextTitle();
                    }
                    if (!is_null($result[0]->getTabla()->getObjeto()->getTextTitle())) {
                        $this->nombre_objeto = $result[0]->getTabla()->getObjeto()->getTextTitle();
                    }
                    $this->gotoUrlPage($data);
                    // header("HTTP/1.1 200 OK");
                    return true;
                }
            } // end if
        } // end if
        // return $result;

    }


    private function checkUrlsAdminPages(&$data){

        // var_dump($this->filter);
        // die();

        # chequeamos segmnento por admin23111978
        if ($this->segment == "admin23111978" || $this->segment == "api"){
            $id_language = $this->session->get("lang_id");
            # query mismo idioma pagina
            $sql = " SELECT distinct ds , t , o  
        FROM App\Entity\DynamicAdminPages ds 
        LEFT JOIN ds.tabla t
        LEFT JOIN t.objeto o
        WHERE (ds.textSlug = :filter OR ds.autoSlug = :filter) AND ds.status = :status AND ds.language = :language ";
            $consulta = $this->em->createQuery($sql);
            $consulta->setParameters(array(
                'filter' => $this->filter,
                'status'  => 'ACTIVED',
                'language' => $id_language
            ));
            $sql = $consulta->getDQL();
            $result = $consulta->getResult();
            // var_dump($result);
            // die();
            if (count($result) > 0) {
                $this->page_id = $result[0]->getId();
                if (!is_null($result[0]->getTabla()->getTextTitle())){
                    $this->nombre_tabla = $result[0]->getTabla()->getTextTitle();
                }
                if (!is_null($result[0]->getTabla()->getObjeto()->getTextTitle())){
                    $this->nombre_objeto = $result[0]->getTabla()->getObjeto()->getTextTitle();
                }
                if (!is_null($result[0]->getTextSlug())){
                    $this->url = $result[0]->getTextSlug();
                }
                if (!is_null($result[0]->getAutoSlug())){
                    $this->url = $result[0]->getAutoSlug();
                }
                /*
                var_dump($this->page_id);
                var_dump($this->nombre_tabla);
                var_dump($this->nombre_objeto);
                die();
                */

                # page
                $pages_repository = $this->em->getRepository(DynamicAdminPages::class);
                $page = $pages_repository->findBy(array("id" => $this->page_id));
                if ($page){
                    $this->data["page"] = $page;
                }

                $this->gotoUrlPage($data);
                // header("HTTP/1.1 200 OK");
                return true;
            }else if (count($result) > 0 ){
                // p_("404 Not Found");
                // header("HTTP/1.0 404 Not Found");
                $this->show_404();
                return true;
                # comrprobamos si estamos en segmento
                # query mismo idioma pagina como parametro
            }else{
                # query mismo idioma pagina
                $sql = " SELECT distinct ds , t , o 
        FROM App\Entity\DynamicAdminPages ds 
        LEFT JOIN ds.tabla t
        LEFT JOIN t.objeto o
        WHERE (ds.textSlug = :segment OR ds.autoSlug = :segment) AND ds.status = :status AND ds.language = :language ";
                $consulta = $this->em->createQuery($sql);
                $consulta->setParameters(array(
                    'filter' => $this->filter_2,
                    'status'  => 'ACTIVED',
                    'language' => $id_language
                ));
                $sql = $consulta->getDQL();
                $result = $consulta->getResult();

                if (count($result) > 0) {
                    $this->page_id = $result[0]->getId();
                    if (!is_null($result[0]->getTabla()->getTextTitle())) {
                        $this->nombre_tabla = $result[0]->getTabla()->getObjeto()->getTextTitle();
                    }
                    if (!is_null($result[0]->getTabla()->getObjeto()->getTextTitle())) {
                        $this->nombre_objeto = $result[0]->getTabla()->getObjeto()->getTextTitle();
                    }

                    # page
                    $pages_repository = $this->em->getRepository(DynamicAdminPages::class);
                    $page = $pages_repository->findBy(array("id" => $this->page_id));
                    if ($page){
                        $this->data["page"] = $page;
                    }

                    $this->gotoUrlPage($data);
                    // header("HTTP/1.1 200 OK");
                    return true;
                    # query diferente idioma pagina como parametro
                }else{
                    # query mismo idioma pagina
                    $sql = " SELECT distinct ds , t , o 
        FROM App\Entity\DynamicAdminPages ds 
        LEFT JOIN ds.tabla t
        LEFT JOIN t.objeto o
        WHERE (ds.textSlug = :segment OR ds.autoSlug = :segment) AND ds.status = :status AND ds.language <> :language ";
                    $consulta = $this->em->createQuery($sql);
                    $consulta->setParameters(array(
                        'filter' => $this->segment,
                        'status'  => 'ACTIVED',
                        'language' => $id_language
                    ));
                    $sql = $consulta->getDQL();
                    $result = $consulta->getResult();
                    if (count($result) > 0) {
                        $this->page_id = $result[0]->getId();
                        if (!is_null($result[0]->getTabla()->getTextTitle())) {
                            $this->nombre_tabla = $result[0]->getTabla()->getObjeto()->getTextTitle();
                        }
                        if (!is_null($result[0]->getTabla()->getObjeto()->getTextTitle())) {
                            $this->nombre_objeto = $result[0]->getTabla()->getObjeto()->getTextTitle();
                        }

                        # page
                        $pages_repository = $this->em->getRepository(DynamicAdminPages::class);
                        $page = $pages_repository->findBy(array("id" => $this->page_id));
                        if ($page){
                            $this->data["page"] = $page;
                        }

                        $this->gotoUrlPage($data);
                        // header("HTTP/1.1 200 OK");
                        return true;
                    }
                } // end if
            } // end if
            // return $result;

        } // end if chequeamos segmnento por admin23111978

    }


    private function gotoUrlPage(&$data)
    {

        // entity manager
        $entityManager = $this->getEm();

        # dbal connection
        $connection = $this->getEm()->getConnection();

        # keep language in session
        //$this->session = $this->request->getSession();
        $id_language = $this->session->get("lang_id");

        # get others languages slugs and auto slugs
        # filter = alquileres/buscador page_id = 12
        # filter = alquileres/busqueda-filtros page_id = 32
        # save slug of others languages
        $data["pages_all"]    = array();
        $data["acciones_all"] = array();
        $data["detalle_all"]  = array();

        # obtenemos el id de la pagina
        $id_pagina = str_replace($id_language,"",$this->page_id);


        # , ds.id , ds.textSlug , ds.autoSlug
        # query de las paginas con diferente idioma
        $sql = " SELECT ds FROM App\Entity\DynamicAdminPages ds WHERE ds.dynamicAdminPages = :page_id AND ds.status = :status AND ds.language <> :language ";
        $consulta = $entityManager->createQuery($sql);
        $consulta->setParameters(array(
            'page_id' => $id_pagina,
            'status'  => 'ACTIVED',
            'language' => $id_language
        ));
        $sql = $consulta->getDQL();
        $result = $consulta->getResult();

        # guardamos todas las url de las paginas con diferente idioma
        $data["pages_all"] = array();
        # comprobamos si existe id
        $existe_id = false;
        $id_url = $this->request->get('id');
        if ($id_url || $id_url == 0){
            $existe_id = true;
        }else{
            $existe_id = false;
        }

        if (count($result) > 0){
            foreach ($result as $row){
                if (array_key_exists($row->getLanguage(),$this->session->get("languages_vector")) ){
                    $language_actual = $this->session->get("languages_vector")[$row->getLanguage()];
                    $temp_url = $this->generateUrl(
                        $this->request->get("_route"),
                        array(
                            '_locale' => $language_actual,
                            'id' => ($existe_id) ? $id_url : ""
                        )
                    );
                    $data["pages_all"][$language_actual] = $temp_url;
                }
            }
        }

        switch($this->page_id){
            case 3:
                if ($this->request->getMethod() == "POST"){
                    $this->fichas_listado_resultados($this->page_id);
                }else if ($this->request->getMethod() == "GET"){
                    $this->fichas_listado($this->page_id);
                }
                break;
            case 6:
                if ($this->request->getMethod() == "POST"){
                    return $this->list_booking_resultados($this->page_id);
                }else if ($this->request->getMethod() == "GET"){
                    return $this->list_booking($this->page_id);
                }
                break;
            case 15:
                return $this->getHome();
                break;
            case 36:
                # guardamos la vista
                if ($this->segment && !$this->filter && $this->request->getMethod() == "GET"){
                    //$this->list();
                }else if ($this->segment && $this->filter){
                    //$this->response = $this->edit();
                } // end if
                break;
            case 37:
                # guardamos la vista
                if ($this->segment && !$this->filter && $this->request->getMethod() == "GET"){
                    //$this->list();
                }else if ($this->segment && $this->filter){
                    //$this->response = $this->edit();
                } // end if
                break;
            case 38:
                # guardamos la vista
                if ($this->segment && !$this->filter && $this->request->getMethod() == "GET"){
                    //$this->list();
                }else if ($this->segment && $this->filter){
                    //$this->response = $this->edit();
                } // end if
                break;
            case 39:
                # guardamos la vista
                if ($this->segment && !$this->filter && $this->request->getMethod() == "GET"){
                    //$this->list();
                }else if ($this->segment && $this->filter){
                    //$this->response = $this->edit();
                } // end if
                break;
            case 40:
                # guardamos la vista
                if ($this->segment && !$this->filter && $this->request->getMethod() == "GET"){
                    //$this->list();
                }else if ($this->segment && $this->filter){
                    //$this->response = $this->edit();
                } // end if
                break;

        } // end switch
    }

}
