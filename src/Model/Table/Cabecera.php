<?php
namespace App\Model\Table;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\Translation\TranslatorInterface;

class Cabecera
{
    // definicion de columnas
    private $definicionLabelColumnasCabecera = array();
    private $definicionIdColumnasCabecera = array();
    private $definicionRawColumnasCabecera = array();

    private string $banderas = '';

    # translator
    protected TranslatorInterface $translator;

    # languages
    protected ?array $languages = null;
    protected ?bool $is_language_group = null;

    protected Request $request;
    protected $session;


    public function __construct(TranslatorInterface $translator , Request $request)
    {
        $this->translator = $translator;
        $this->request = $request;
        $this->session = $request->getSession();
    }


    public function init()
    {

        // Defimos todas las cadenas para todos los labels de las columnas y roles
        $this->definicionLabelColumnasCabecera = array(
            # lanaguage
            "language" => $this->session->get("lang"),
            # booking
            "id" => $this->translator->trans('theme_dlist_titulo_id'),
            "id_avantio"  => "Id Avantio",
            "id_portvil"  => "Id Portvil",
            "id_portvil_todos"  => "Id's Portvil",
            "titulo" => $this->translator->trans('theme_dlist_titulo_titulo'),
            "propiedad" => $this->translator->trans('theme_propiedad'),
            "referencia" => $this->translator->trans('theme_dlist_titulo_ref'),
            "acciones" => $this->translator->trans('theme_dlist_titulo_acciones'),
            "galeria" => $this->translator->trans('theme_dlist_titulo_galeria'),
            "vista_previa" => $this->translator->trans('theme_dlist_titulo_vista_previa'),
            "link" => $this->translator->trans('theme_dlist_titulo_link'),
            "url" => $this->translator->trans('theme_dlist_titulo_url'),
            "id_avantio"  => $this->translator->trans('theme_dlist_titulo_id_avantio'),
            "ciudad" => $this->translator->trans('theme_dlist_titulo_ciudad'),
            "localidad" => $this->translator->trans('theme_dlist_titulo_localidad'),
            "lenguaje" => $this->translator->trans('theme_dlist_titulo_lenguaje'),
            "locale" => $this->translator->trans('theme_dlist_titulo_locale'),
            "default" => $this->translator->trans('theme_dlist_titulo_defecto'),
            "ocupation_rules" => $this->translator->trans('theme_dlist_titulo_regla_ocupacion'),
            "foto" => $this->translator->trans('theme_dlist_titulo_foto'),
            "caracteristicas" => $this->translator->trans('theme_dlist_titulo_caracteristicas'),
            "reservar" => $this->translator->trans('theme_dlist_titulo_reservar'),
            "precio" => $this->translator->trans('theme_dlist_titulo_precio'),
            "reserva" => $this->translator->trans('theme_dlist_titulo_reserva'),
            "estancia" => $this->translator->trans('theme_dlist_titulo_estancia'),
            "estado" => $this->translator->trans('theme_dlist_titulo_estado'),
            "web" => $this->translator->trans('theme_dlist_titulo_web'),
            "booking_date" => $this->translator->trans('theme_booking_booking'),
            "pais" => $this->translator->trans('theme_dlist_titulo_country'),
            "region" => $this->translator->trans('theme_dlist_titulo_region'),
            "ciudad" => $this->translator->trans('theme_dlist_titulo_ciudad'),
            "habitaciones_personas" => $this->translator->trans('theme_dlist_hab_personas'),
            "minima_estancia" => $this->translator->trans('theme_dlist_estancia_minima'),
            # agencia
            "number_id_agenca_portvil" => $this->translator->trans('theme_number_id_agenca_portvil'),
            "descuento" => $this->translator->trans('theme_title_descuentos'),
            "tipo_descuento" => $this->translator->trans('theme_agencia_text_tipo_descuento'),
            "precio_limpio" => $this->translator->trans('theme_dlist_titulo_precio_limpio'),
            "precio_bruto" => $this->translator->trans('theme_dlist_titulo_precio_bruto'),
            # list booking
            "st" => "ST",
            "villa" => $this->translator->trans("titulo_propiedad_notificaciones_agencias_email"),
            "a" => "A",
            "f_reserva" => $this->translator->trans('theme_booking_f_reserva'),
            "cs" => "CS",
            "anc" => "A/N/C",
            "usuario" => $this->translator->trans('theme_booking_usuario'),
            "llegada" => $this->translator->trans('theme_booking_llegada'),
            "noches" => $this->translator->trans('theme_booking_noches'),
            "salida" => $this->translator->trans('theme_ocupacion_template_estancia_dias_salida_salida'),
            "cliente" => $this->translator->trans('theme_booking_customer'),
            "localizador" => $this->translator->trans('theme_booking_localizador'),
            "agencia" => $this->translator->trans("theme_nombre_agencia"),
            "descripcion" => $this->translator->trans("theme_url_configuracion_descripcion"),
            "superficie_vivienda" => $this->translator->trans('ficha.propiedad.number_metros_cuadrados_utiles'),
            "tipologia" => $this->translator->trans("theme_menu_tipologia"),
            "piscina" => $this->translator->trans("ficha.propiedad.titulo_piscina"),
            "nombre" => $this->translator->trans("theme_ocupacion_template_nombre"),
        );

        // identificadores de las columnas
        $this->definicionIdColumnasCabecera = array();

    }

    /**
     * @return array
     */
    public function getDefinicionLabelColumnasCabecera(): array
    {
        return $this->definicionLabelColumnasCabecera;
    }

    /**
     * @param array $definicionLabelColumnasCabecera
     */
    public function setDefinicionLabelColumnasCabecera(array $definicionLabelColumnasCabecera): void
    {
        $this->definicionLabelColumnasCabecera = $definicionLabelColumnasCabecera;
    }

    /**
     * @return array
     */
    public function getDefinicionIdColumnasCabecera(): array
    {
        return $this->definicionIdColumnasCabecera;
    }

    /**
     * @param array $definicionIdColumnasCabecera
     */
    public function setDefinicionIdColumnasCabecera(array $definicionIdColumnasCabecera): void
    {
        $this->definicionIdColumnasCabecera = $definicionIdColumnasCabecera;
    }

    /**
     * @return array
     */
    public function getDefinicionRawColumnasCabecera(): array
    {
        return $this->definicionRawColumnasCabecera;
    }

    /**
     * @param array $definicionRawColumnasCabecera
     */
    public function setDefinicionRawColumnasCabecera(array $definicionRawColumnasCabecera): void
    {
        $this->definicionRawColumnasCabecera = $definicionRawColumnasCabecera;
    }

    public function getBanderas():string
    {
        return $this->banderas;
    }


    public function setBanderas()
    {

        # set banderas
        $url = baseUrl($this->request);

        $bandera_url = $url . "/assets/themes/sbadmin2/flags/blank.png";

        // creamos banderas para todos los lenguages
        if($this->is_language_group){
            foreach($this->languages as $language){
                $flag = ($language->getLanguage() == 'en') ? "flag flag-gb" : "flag flag-". $language->getLanguage();
                $this->banderas.= '<img src="'.$bandera_url.'" style="margin-left:5px" class="'.$flag.'" alt="' . $language->getTextName() . '" />';
            }
            // creamos solo bandera idioma actual
        }else{
            foreach($this->languages as $language){
                if($language->getLanguage() == $this->session->get("lang")){
                    $flag = ($language->getLanguage() == 'en') ? "flag flag-gb" : "flag flag-". $language->getLanguage();
                    $this->banderas.= '<img src="'.$bandera_url.'" style="margin-left:5px" class="'.$flag.'" alt="' . $language->getTextName() . '" />';
                }
            } // end foreach
        } // end if


    } // end function


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
     * @return Request
     */
    public function getRequest(): Request
    {
        return $this->request;
    }

    /**
     * @param Request $request
     */
    public function setRequest(Request $request): void
    {
        $this->request = $request;
    }

}