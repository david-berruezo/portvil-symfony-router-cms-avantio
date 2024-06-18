<?php
namespace App\Model\CodeTable;

use App\Model\CodeTable\HtmlTable;

class Registro
{

    # datos de las columnas de los registros
    private $datos = array();
    private $datos_consulta = array();

    # columna idioma columna acciones
    private $parametros_idioma = array();
    private $parametros_status = array();
    private $parametros_borrar = array();

    # languages
    private ?array $languages = null;
    private ?bool $is_language_group = null;

    # table slug
    private string $slugTable;

    # url
    private string $url;

    # other objects
    private $session;
    private $request;

    public function __construct()
    {
        // empty
    }


    /**
     * @param mixed $datos_consulta
     */
    public function setDatosConsulta(array $datos_consulta): void
    {
        $this->datos_consulta = $datos_consulta;
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
        $this->url = baseUrl($this->request);
        $url = $this->url . "/edit/".$this->getSlugTable()."/";

        $counter_columns = 0;
        foreach ($this->datos as &$dato) {
            $cadena_idioma = "";
            foreach ($dato as $index => $valor) {
                //p_($dato);
                if ($index == "idioma"){
                    // multilanguage
                    if ($this->is_language_group){
                        foreach ($this->languages as $language) {
                            if ($language->getLanguage() != "es")
                                $url = $this->url . $this->session->get("lang") . '/'. $this->getSlugTable() . '/editar/' . $valor;
                            else
                                $url = $this->url . $this->getSlugTable() . '/editar/' . $valor;
                            $cadena_idioma.= '<a href="'.$url.'" target="_blank"><i class="fa fa-pencil fa-fw"></i></a>';
                        } // end if
                        // no multilanguage
                    }else{
                        if (session()->get("lang") != "es"){
                            $url = $this->url . $this->session->get("lang") . '/'. $this->getSlugTable() . '/editar/' . $valor;
                        }else{
                            $url = $this->url . $this->getSlugTable() . '/editar/' . $valor;
                        }
                        $cadena_idioma.= '<a href="'.$url.'" target="_blank"><i class="fa fa-pencil fa-fw"></i></a>';
                    } // end if
                } // end if
            } // end foreach
            $dato["idioma"] = $cadena_idioma;
            //echo $cadena_idioma;
        } // end foreach
    }



    private function prepararDatosAcciones()
    {
        # predeterminados | solo para consulta
        $cadena_status_actived = '<a href="#" class="btn btn-warning" onclick="return confirm("¿ Quieres pausar esta entrada ?")"><i class="fa fa-pause fa-fw"></i></a>';
        $cadena_status_paused  = '<a href="#" class="btn btn-success" onclick="return confirm("¿ Quieres activar esta entrada ?")"><i class="fa fa-play fa-fw"></i></a>';

        # cogemos la url
        $this->url = baseUrl($this->request);
        $url = $this->url . "/edit/".$this->getSlugTable()."/";

        # delete
        $cadena_delete = '<a href="https://www.portvil-intranet.com/dynamic/ddelete/agencia/2" class="btn btn-danger" onclick="return confirm("¿ Quieres eliminar esta entrada permanentemente ?")"><i class="fa fa-trash-o fa-fw"></i></a>';

        # cogemos la url
        // $url = $this->url . "/edit";

        $temp = array();

        # primero agregamos el borrar
        $counter_status_borrar = 0;
        foreach ($this->datos as &$dato) {
            $cadena_idioma = "";
            foreach ($dato as $index => $valor) {
                if ($index == "acciones"){
                    $valor_delete = $valor[0];
                    if ($this->session->get("lang") != "es"){
                        $url = $this->url . $this->session->get("lang") .   '/' . $this->getSlugTable() .  '/borrar/'. $valor_delete;
                    }else{
                        $url = $this->url . $this->getSlugTable() .  '/borrar/' . $valor_delete;
                    }
                    $cadena_delete = '<a href="'.$url.'" class="btn btn-danger" onclick="return confirm("¿ Quieres eliminar esta entrada permanentemente ?")"><i class="fa fa-trash-o fa-fw"></i></a>&nbsp;';
                    $temp[$counter_status_borrar] = $cadena_delete;
                    $counter_status_borrar++;
                } // end if

            } // end foreach
        } // end foreach

        # luego agregaos el status
        $counter_status_borrar = 0;
        $counter_nuevo = 0;
        $cadena_status = '';
        foreach ($this->datos as &$dato) {
            $cadena_idioma = "";
            foreach ($dato as $index => $valor) {
                if ($index == "acciones"){
                    $link_status = $valor[1][0];
                    $pregunta_status = $valor[1][1];
                    if ($this->session->get("lang") != "es"){
                        $url = $this->url . $this->session->get("lang") . '/' .$this->getSlugTable() . '/' . $link_status;
                    }else{
                        $url = $this->url . $this->getSlugTable() .  '/' . $link_status;
                    }
                    $cadena_status = '<a href="'.$url.'" class="btn btn-warning" onclick="'.$pregunta_status.'")"><i class="fa fa-pause fa-fw"></i></a>';
                    $dato["acciones"] = $temp[$counter_nuevo] . $cadena_status;
                    $counter_nuevo++;
                } // end if
            } // end foreach
        } // end foreach
        //die();
    }

    /**
     * @return mixed
     */
    public function getDatosConsulta()
    {
        return $this->datos_consulta;
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
    public function getSession()
    {
        return $this->session;
    }

    /**
     * @param mixed $session
     */
    public function setSession($session): void
    {
        $this->session = $session;
    }

    /**
     * @return mixed
     */
    public function getRequest()
    {
        return $this->request;
    }

    /**
     * @param mixed $request
     */
    public function setRequest($request): void
    {
        $this->request = $request;
    }

}