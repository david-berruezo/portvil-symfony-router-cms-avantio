<?php

namespace App\Command;

# symfony
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Translation\LocaleSwitcher;
use Symfony\Contracts\Translation\TranslatorInterface;

# entities
use App\Entity\DynamicRooms;
use App\Entity\DynamicAccion;
use App\Entity\DynamicUrlDetalle;
use App\Entity\DynamicPages;
use App\Entity\Languages;
use App\Models\Urls;
use App\Service\Myconfig;


#[AsCommand(
    name: 'OpcionesCommand',
    description: 'Add a short description for your command',
)]
class OpcionesCommand extends Command
{

    # entity Manager
    private $em;

    # doctrine
    private $doctrine;

    # connection dbal
    private $connection;

    # translator and language
    private $translator;
    private $localeSwitcher;

    # environment
    private $environmentGroup = "";
    private $usuario_session = "";


    /**
     * Dependency Injection
     * inject Interface Entity Manager Doctrine
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(EntityManagerInterface $em , Connection $connection , ManagerRegistry $doctrine , TranslatorInterface $translator, LocaleSwitcher $localeSwitcher)
    {
        // guardamos los paraemtros
        // $this->config = $config;
        $this->em = $em;
        // $this->urls = $urls;
        $this->connection = $connection;
        $this->doctrine = $doctrine;
        // language and translator
        $this->localeSwitcher = $localeSwitcher;
        $this->translator = $translator;

        parent::__construct();

    }


    protected function configure(): void
    {
        $this
            ->addArgument('arg1', InputArgument::OPTIONAL, 'Argument description')
            ->addOption('option1', null, InputOption::VALUE_NONE, 'Option description')
        ;
    }


    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $arg1 = $input->getArgument('arg1');

        // init variables
        $this->init();

        # call to function
        // $this->getRepositories();

        if ($arg1) {
            $io->note(sprintf('You passed an argument: %s', $arg1));
            switch ($arg1){
                # build urls
                case "paginas":$this->buildUrls();
                break;
                case "create-repositories": $this->getRepositories();
                break;
                case "create-taxonomy-cities":$this->createTaxonomyCities();
                break;
            } // end switch
        } // end if

        if ($input->getOption('option1')) {
            // ...
        }

        $io->success('You have a new command! Now make it your own! Pass --help to see your options.');

        return Command::SUCCESS;
    }



    protected function init()
    {

        # check url and save environmentGroup
        // $absolute_url = full_url( $_SERVER );
        $absolute_url = __DIR__;

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

    }



    private function buildUrls()
    {

        $kernel = $this->getApplication()->getKernel();
        $container = $kernel->getContainer();

        # entityManager
        // $entityManager =  $container->get('doctrine')->getManager();
        $this->em      =  $container->get('doctrine')->getManager();

        # languages
        $languages_repository = $this->em->getRepository(Languages::class);
        $languages = $languages_repository->findAll();

        # pages
        $pages_repository = $this->em->getRepository(DynamicPages::class);
        $pages = $pages_repository->findAll();

        # url detalle
        $url_detalle_repository = $this->em->getRepository(DynamicUrlDetalle::class);
        $url_detalle = $url_detalle_repository->findAll();

        # acciones
        $acciones_repository = $this->em->getRepository(DynamicAccion::class);
        $acciones = $acciones_repository->findAll();

        # rooms
        $rooms_repository = $this->em->getRepository(DynamicRooms::class);
        $rooms = $rooms_repository->findAll();

        // esribimos el index
        # pages_yaml
        $vector_pages = array(
            "index" => [
                "path" => "/",
                "controller" => "App\Controller\Http\HomeController::index"
            ]
        );

        # fill array with pages
        foreach ($pages as $page) {
            $url = ($page->getTextSlug()) ? $page->getTextSlug() : $page->getAutoSlug();
            // si no es idioma español añadimos el slug
            if ($page->getLanguage() != 1){
                $vector_pages[$url."-idioma"] = array(
                    "path" => "/{_locale}/".$url,
                    "controller" => "App\Controller\Http\HomeController::segment_idioma"
                );
            // si es idioma español no añadimos el slug
            }else{
                $vector_pages[$url] = array(
                    "path" => "/".$url,
                    "controller" => "App\Controller\Http\HomeController::segment"
                );
            }
        }// end foreach

        # themes
        $themes = array(
            "gallery", "gallery-portvil" , "pagina_prueba","interficie_prereservation","interficie_reservation","interficie_cancel_reservation",'avantio_update_booking',
            'avantio_addComment', 'avantio_cancelBooking', 'avantio_GetAccommodationData',
            'avantio_GetAccommodationKinds', 'avantio_GetAccommodationList', 'avantio_GetAccommodationStatus', 'avantio_GetAllAccommodationList',
            'avantio_GetAvailabilities', 'avantio_getPrice', 'avantio_GetChanges', 'avantio_getCompanies', 'avantio_GetDiscountsSupplements',
            'avantio_GetExternalIDs', 'avantio_GetFeaturedAccommodations', 'avantio_GetGeographicAreas', 'avantio_GetAccommodationDescriptions',
            'avantio_GetLogicAreas', 'avantio_GetOccupationalRules', 'avantio_GetRates', 'avantio_GetRatesList', 'avantio_is_available', 'avantio_SetAccommodation',
            "tienes_alguna_duda_url","guardar-dictionary","ical_events","ical_events_form", "avantio_GetAccommodationCodes","test_email","theme_menu_lista_reservas_anterior_url",
            "theme_formulario_usuario_contactar_url_formulario" ,"theme_login_envio_password","id_avantio_portvil","comparar_id-avantio_portvil","ical_address_blancos","download_ical",
            "comparar_tablas","avantio_GetBookingList" , "avantio_GetBookingListPortvil" , "avantio_GetBookingListPropiedad","ical_events_form_address","ical_events_form_disponibilidad",
            "pagina_prueba_model","theme_menu_directos_reservas_nuevas","theme_menu_directos_reservas_anuladas","theme_menu_directos_opciones_nuevas","theme_menu_directos_opciones_anuladas",
            "theme_menu_directos_overbooking","theme_menu_directos_mis_opciones","theme_menu_directos_opciones_expiradas"
        );

        foreach ($languages as $language) {

            // cambiamos a idioma actual
            $this->localeSwitcher->setLocale($language->getLanguage());

            // themes
            foreach ($themes as $theme) {
                $url = $this->translator->trans($theme, domain:'messages');
                // si no es idioma español añadimos el slug
                if ($language->getLanguage() != "es"){
                    $vector_pages[$url."-idioma"] = array(
                        "path" => "/{_locale}/".$url,
                        "controller" => "App\Controller\Http\HomeController::segment_idioma"
                    );
                // si es idioma español no añadimos el slug
                }else{
                    $vector_pages[$url] = array(
                        "path" => "/".$url,
                        "controller" => "App\Controller\Http\HomeController::segment"
                    );
                }
            }

            foreach ($acciones as $accion) {
                if ($accion->getLanguage() != 1 && $accion->getId() == 1) {
                    $slug_accion = ($accion->getTextSlug()) ? $accion->getTextSlug() : $accion->getAutoSlug();
                    // $url_detalle
                    foreach ($url_detalle as $detalle) {
                        // si no es idioma español añadimos el slug
                        if ($detalle->getLanguage() != 1 && $detalle->getId() == 1) {
                            $slug_detalle = ($detalle->getTextSlug() && $detalle->getTextSlug() != null) ? $detalle->getTextSlug() : $detalle->getAutoSlug();
                            foreach ($rooms as $room) {
                                if ($room->getLanguage() != 1) {
                                    $slug_rooms = ($room->getTextSlug() && $rom->getTextSlug() != null) ? $room->getTextSlug() : $room->getAutoSlug();
                                    $url = $slug_accion . "/" . $slug_detalle . "/" . $slug_rooms;
                                    echo "1 url: " .$url. "\n";
                                    $vector_pages[$room->getTextTitle() . "-avantio" . "-idioma"] = array(
                                        "path" => "/{_locale}/" . $url,
                                        "controller" => "App\Controller\Http\HomeController::segment_idioma"
                                    );
                                }
                            } // end foreach
                        } // end if
                    } // end foreach
                // si es idioma español no añadimos el slug
                }else if($accion->getLanguage() == 1 && $accion->getId() == 1){
                    $slug_accion = ($accion->getTextSlug()) ? $accion->getTextSlug() : $accion->getAutoSlug();
                    // $url_detalle
                    foreach ($url_detalle as $detalle) {
                        // si no es idioma español añadimos el slug
                        if ($detalle->getLanguage() == 1 && $detalle->getId() == 1) {
                            $slug_detalle = ($detalle->getTextSlug() && $detalle->getTextSlug() != null) ? $detalle->getTextSlug() : $detalle->getAutoSlug();
                            foreach ($rooms as $room) {
                                if ($room->getLanguage() == 1) {
                                    $slug_rooms = ($room->getTextSlug() && $rom->getTextSlug() != null) ? $room->getTextSlug() : $room->getAutoSlug();
                                    $url = $slug_accion . "/" . $slug_detalle . "/" . $slug_rooms;
                                    echo "2 url: " .$url. "\n";
                                    // si es idioma español no añadimos el slug
                                    $vector_pages[$room->getTextTitle()."-avantio"] = array(
                                        "path" => "/".$url,
                                        "controller" => "App\Controller\Http\HomeController::segment"
                                    );
                                }
                            } // end foreach
                        } // end if
                    } // end foreach
                } // end if
            } // end foreach acciones

        } // end foreach languages

        // colocamos por defecto el lenguage español
        $this->localeSwitcher->setLocale("es");

        # guardamos fichero
        // agregamos yaml al routess
        # write vector into routes yaml vector
        $yaml = yaml_emit($vector_pages,YAML_UTF8_ENCODING , YAML_CR_BREAK);
        $path = dirname(__DIR__,2);
        $path.= "/config/";
        file_put_contents($path.'routes.yaml', $yaml);

        // remplazamos linias
        # replace 3 points and 3 lines
        $str = file_get_contents($path.'routes.yaml');
        $str = str_replace("...", "" , $str);
        $str = str_replace("---", "" , $str);
        file_put_contents($path.'routes.yaml', $str);


    } // end function

}
