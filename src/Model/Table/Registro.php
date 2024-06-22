<?php
namespace App\Model\Table;

use App\Model\Table\Table;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\Translation\TranslatorInterface;

class Registro
{

    # datos de las columnas de los registros
    private $datos = array();
    private $datos_consulta;

    # general data
    private $data;
    private $page_id;

    # columna idioma
    private $parametros_idioma = array();

    # columna acciones
    private $parametros_status = array();
    private $parametros_borrar = array();

    # translator
    protected TranslatorInterface $translator;

    protected string $url;

    protected Request $request;
    protected $session;

    # languages
    protected ?array $languages = null;
    protected ?bool $is_language_group = null;

    # table slug
    protected string $slugTable;

    public function __construct(TranslatorInterface $translator , Request $request)
    {
        $this->translator = $translator;
        $this->request = $request;
        $this->session = $request->getSession();
    }


    /**
     * @return array
     */
    public function getDatos(): array
    {
        return $this->datos;
    }


    /**
     * @param array $datos
     */
    public function setDatos(array $datos): void
    {
        $this->datos = $datos;

        # datos idioma
        $this->prepararDatosIdioma();

        # datos acciones
        $this->prepararDatosAcciones();

        /*
        # datos idioma
        if (count($this->parametros_idioma) > 0){
            $this->prepararDatosIdioma();
        }
        # datos acciones
        if (count($this->parametros_borrar) > 0 || count($this->parametros_status) > 0){
            $this->prepararDatosAcciones();
        }
        */
    }


    private function prepararDatosIdioma()
    {
        // buscamos por la clave idioma
        $temp_vector = array();
        $temp_vector = array_column($this->datos,"idioma");

        # cogemos la url
        // $url = $this->url . "/edit/".$this->getSlugTable()."/";

        $id_pagina = $this->data["pages_".$this->page_id]->getDynamicAdminPages();
        $slug = ($this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getTextSlug()) ? $this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getTextSlug() : $this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getAutoSlug() ;

        $counter_columns = 0;
        foreach ($this->datos as &$dato) {
            $cadena_idioma = "";
            foreach ($dato as $index => $valor) {
                if ($index == $this->translator->trans('theme_title_fotos_idioma')){
                    // multilanguage
                    if ($this->is_language_group){
                        foreach ($this->languages as $language) {
                            $slug = ($this->data["pages_".$id_pagina.$language->getId()]->getTextSlug()) ? $this->data["pages_".$id_pagina.$language->getId()]->getTextSlug() : $this->data["pages_".$id_pagina.$language->getId()]->getAutoSlug() ;
                            $lang = $language->getLanguage();
                            if ($lang == "es"){
                                if ($this->session->get("lang") != $lang){
                                    $valor_es = substr_replace($valor,$language->getId() ,strlen($valor)-3,3);
                                }else{
                                    $valor_es = $valor;
                                }
                                $url = $this->url . "/admin23111978/" . $slug . '/editar/' . $valor_es . '?lang='.$language->getLanguage();
                            }else{
                                if ($this->session->get("lang") != $lang){
                                    $valor_en = substr_replace($valor,$language->getId() ,strlen($valor)-3,3);
                                }else{
                                    $valor_en = $valor;
                                }
                                $url = $this->url .  "/" . $lang . "/admin23111978/" . $slug . '/edit/' . $valor_en . '?lang='.$language->getLanguage();
                            }
                            $cadena_idioma.= '<a href="'.$url.'" target="_blank"><i class="fa fa-pencil fa-fw"></i></a>';
                        } // end if
                    // no multilanguage
                    }else{
                        // $slug = ($this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getTextSlug()) ? $this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getTextSlug() : $this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getAutoSlug() ;
                        $lang = $this->session->get("lang");
                        if ($this->session->get("lang") != "es"){
                            $url = $this->url .  "/" . $this->session->get("slug_lang") . "admin23111978/" .  $slug . '/edit/' . $valor . '?lang="'.$lang.'"';
                        }else{
                            $url = $this->url . "/admin23111978/" .  $slug . '/editar/' . $valor . '?lang="'.$lang.'"';
                        }
                        $cadena_idioma.= '<a href="'.$url.'" target="_blank"><i class="fa fa-pencil fa-fw"></i></a>';
                    } // end if
                } // end if
            } // end foreach
            $dato[$this->translator->trans('theme_title_fotos_idioma')] = $cadena_idioma;
        } // end foreach
    } // end function



    private function prepararDatosAcciones()
    {
        # predeterminados | solo para consulta
        $cadena_status_actived = '<a href="#" class="btn btn-warning" onclick="return confirm("¿ Quieres pausar esta entrada ?")"><i class="fa fa-pause fa-fw"></i></a>';
        $cadena_status_paused  = '<a href="#" class="btn btn-success" onclick="return confirm("¿ Quieres activar esta entrada ?")"><i class="fa fa-play fa-fw"></i></a>';

        # cogemos la url
        $url = $this->url . "/edit/".$this->getSlugTable()."/";

        # delete
        //$cadena_delete = '<a href="https://www.portvil-intranet.com/dynamic/ddelete/agencia/2" class="btn btn-danger" onclick="return confirm("¿ Quieres eliminar esta entrada permanentemente ?")"><i class="fa fa-trash-o fa-fw"></i></a>';
        $cadena_delete = '';

        $id_pagina = $this->data["pages_".$this->page_id]->getDynamicAdminPages();
        $slug = ($this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getTextSlug()) ? $this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getTextSlug() : $this->data["pages_".$id_pagina.$this->session->get("lang_id")]->getAutoSlug() ;

        # primero agregamos el borrar
        $counter_status_borrar = 0;
        foreach ($this->datos as &$dato) {
            $cadena_idioma = "";
            $primer_valor_id_u_otro = "";
            foreach ($dato as $index => $valor) {
                if ($index == $this->translator->trans('theme_title_fotos_acciones')){
                    if ($this->session->get("lang") != "es"){
                        //$url = $this->url . "/" . $this->session->get("lang"). "/" .  $slug .  "/remove/" . $valor;
                        $url = $this->url . "/" . $this->session->get("lang"). "/admin23111978/" .  $slug .   "/remove/" . $valor;
                    }else{
                        // $url = $this->url . "/" .$slug .  "/remove/" . $valor;
                        $url = $this->url . "/admin23111978/" .  $slug .  "/borrar/" . $valor;
                    }
                    $cadena_delete = '<a href="'.$url.'" class="btn btn-danger" onclick="return confirm(\'¿ Quieres eliminar esta entrada permanentemente ?\')"><i class="fa fa-trash-o fa-fw"></i></a>&nbsp;';
                    $url = "";
                    if (method_exists(get_class($this->datos_consulta[$counter_status_borrar]),"getStatus") && $this->datos_consulta[$counter_status_borrar]->getStatus() != null && $this->datos_consulta[$counter_status_borrar]->getStatus() == "ACTIVED" ){
                        if ($this->session->get("lang") != "es"){
                            $url = $this->url . "/" .  $this->session->get("lang"). "/" . "admin23111978/" .  $slug .    "/pause/" . $valor;
                        }else{
                            $url = $this->url . "/" . "admin23111978/" .  $slug .  "/pause/" . $valor;
                        }
                        $cadena_status = '<a href="'.$url.'" class="btn btn-warning" onclick="return confirm(\' ¿ Quieres pausar esta entrada ? \')"><i class="fa fa-pause fa-fw"></i></a>';
                    }else if (method_exists(get_class($this->datos_consulta[$counter_status_borrar]),"getStatus") && $this->datos_consulta[$counter_status_borrar]->getStatus() != null && $this->datos_consulta[$counter_status_borrar]->getStatus() == "PAUSED" ) {
                        if ($this->session->get("lang") != "es") {
                            $url = $this->url . "/" . $this->session->get("lang") . "/admin23111978/"  . $slug . "/play/" . $valor;
                        } else {
                            $url = $this->url . "/" . "admin23111978/" . $slug . "/play/" . $valor;
                        }
                        $cadena_status = '<a href="' . $url . '" class="btn btn-success" onclick="return confirm(\' ¿ Quieres activar esta entrada ? \')"><i class="fa fa-play fa-fw"></i></a>';
                    }else if (isset($this->datos_consulta[$counter_status_borrar]->status) && $this->datos_consulta[$counter_status_borrar]->status != null && $this->datos_consulta[$counter_status_borrar]->status == "ACTIVED"  ){
                        if ($this->session->get("lang") != "es"){
                            $url = $this->url  . "/" . $this->session->get("lang"). "/admin23111978/" .  $slug .    "/pause/" . $valor;
                        }else{
                            $url = $this->url . "/admin23111978" .  "/" . $slug .  "/pause/" . $valor;
                        }
                        $cadena_status = '<a href="'.$url.'" class="btn btn-warning" onclick="return confirm(\' ¿ Quieres pausar esta entrada ? \')"><i class="fa fa-pause fa-fw"></i></a>';
                    }else if (isset($this->datos_consulta[$counter_status_borrar]->status) && $this->datos_consulta[$counter_status_borrar]->status != null && $this->datos_consulta[$counter_status_borrar]->status == "PAUSED"  ){
                        if ($this->session->get("lang") != "es") {
                            $url = $this->url  .  "/" . $this->session->get("lang") . "/admin23111978/"  . $slug . "/play/" . $valor;
                        } else {
                            $url = $this->url . "/admin23111978" . "/" . $slug . "/play/" . $valor;
                        }
                        $cadena_status = '<a href="' . $url . '" class="btn btn-success" onclick="return confirm(\' ¿ Quieres activar esta entrada ? \')"><i class="fa fa-play fa-fw"></i></a>';
                    } // end if

                    $counter_status_borrar++;
                } // end if
            } // end foreach
            $dato[$this->translator->trans('theme_title_fotos_acciones')] = $cadena_delete . $cadena_status;
        } // end foreach
        
    }


    /**
     * @return array|null
     */
    public function getLanguages(): ?array
    {
        return $this->languages;
    }

    /**
     * @param array|null $languages
     */
    public function setLanguages(?array $languages): void
    {
        $this->languages = $languages;
    }

    /**
     * @return bool|null
     */
    public function getIsLanguageGroup(): ?bool
    {
        return $this->is_language_group;
    }

    /**
     * @param bool|null $is_language_group
     */
    public function setIsLanguageGroup(?bool $is_language_group): void
    {
        $this->is_language_group = $is_language_group;
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
     * @return array
     */
    public function getDatosConsulta(): array
    {
        return $this->datos_consulta;
    }

    /**
     * @param array $datos_consulta
     */
    public function setDatosConsulta(array $datos_consulta): void
    {
        $this->datos_consulta = $datos_consulta;
    }

    /**
     * @return string
     */
    public function getSlugTable(): string
    {
        return $this->slugTable;
    }

    /**
     * @param string $slugTable
     */
    public function setSlugTable(string $slugTable): void
    {
        $this->slugTable = $slugTable;
    }

    /**
     * @return string
     */
    public function getUrl(): string
    {
        return $this->url;
    }

    /**
     * @param string $url
     */
    public function setUrl(string $url): void
    {
        $this->url = $url;
    }

    /**
     * @return mixed
     */
    public function getData()
    {
        return $this->data;
    }

    /**
     * @param mixed $data
     */
    public function setData($data): void
    {
        $this->data = $data;
    }

    /**
     * @return mixed
     */
    public function getPageId()
    {
        return $this->page_id;
    }

    /**
     * @param mixed $page_id
     */
    public function setPageId($page_id): void
    {
        $this->page_id = $page_id;
    }

}