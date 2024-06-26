<?php

namespace App\Command;

// symfony libraries
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
use Symfony\Component\HttpFoundation\Request;
// entities
use App\Entity\Languages;
// repositories
use App\Repository\LanguagesRepository;
// libraries
use App\Libraries\CurlRequest;

#[AsCommand(
    name: 'AvantioCommand',
    description: 'Add a short description for your command',
)]
class AvantioCommand extends Command
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

    // avantio
    private $avantio_credentials;
    private $avantio_files;

    // Files Downloaded
    private $files_downloaded = array();
    private $files_downloaded_temp = array();

    // report
    private $last_insert_id_report = 0;

    private $db = "";

    // numero de registro recursiva
    private $numero_registro = 1;

    # urldetalle
    private $url_detalle = "http://www.portvil.com/cms/prg/villas.php";


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

        if ($arg1) {
            // printeamos por panatalla opción
            $io->note(sprintf('You passed an argument: %s', $arg1));

            // incializamos
            $this->init();

            switch ($arg1){
                case "descargar-propiedades-avantio":
                    /*
                    # canales
                    //$this->compararNombresAgeniasConCanales();
                    # propiedades avantio
                    $this->descargarFicherosWebsiteAvantio("all");
                    $this->descargarPropiedadesAvantio(); // website
                    # ocupacion y disponibilididad
                    $this->descargarOcupacionDisponibilidad();
                    # propiedades inactvas avantio
                    $this->descargarPropiedadesAvantioNoactivas();
                    # borramos cache
                    */
                break;
            } // end switch
        }

        if ($input->getOption('option1')) {
            // ...
        }

        $io->success('You have a new command! Now make it your own! Pass --help to see your options.');

        return Command::SUCCESS;
    }


    protected function init()
    {

        $request = Request::createFromGlobals();
        //$request->server->get('HTTP_HOST');

        $vector_server = array(
            'HTTPS' => $request->server->get('HTTPS'),
            'SERVER_PROTOCOL' => $request->server->get('SERVER_PROTOCOL'),
            'SERVER_PORT' => $request->server->get('SERVER_PORT'),
            'HTTP_X_FORWARDED_HOST' => $request->server->get('HTTP_X_FORWARDED_HOST'),
            'SERVER_NAME' => $request->server->get('SERVER_NAME'),
        );

        //print_r($vector_server);
        //p_($request->server);
        //die();

        # check url and save environmentGroup
        # check url and save environmentGroup
        $absolute_url = full_url( $_SERVER );
        //echo $absolute_url . "<br>";
        //p_($_SERVER);
        //$absolute_url = __DIR__ ;
        //echo $absolute_url . "<br>";

        // creamos la conexión por defecto
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
            $this->usuario_session = "default";
            $this->environmentGroup = "default";
        } // end if

        # avantio connections
        //$this->setAvantioCredentials(null, "portvil");
        //$this->setAvantioFiles();

        // conectamos entityManger a la conexión que queremos
        $this->em = $this->doctrine->getManager($this->environmentGroup);

    } // end function

    /**
     * @param mixed $avantio_credentials
     */
    public function setAvantioCredentials($avantio_credentials , $mode)
    {


        # languages
        $languages_repository = $this->em->getRepository(Languages::class);
        $languages = $languages_repository->findAll();

        # data
        if(empty($avantio_credentials))
            if($mode == "test"){
                $avantio_credentials = array();
            }else if ($mode == "portvillas") {
                $avantio_credentials = array();
            }else if ($mode == "portvil") {
                $avantio_credentials = array();

            }// end if

        // print_r($avantio_credentials);
        // die();
        $this->avantio_credentials = $avantio_credentials;
    }

    private function descargarFicherosWebsiteAvantio(String $param)
    {
        // download files
        // $param = "all";
        $this->guardarParametrosFicherosWebsiteAvantio($param);
        $this->borrarFicherosWebsiteAvantio();
        $this->descargarFicherosXmlWebsiteAvantio();
    }



    /**
     * @param string $tipo
     */
    private function guardarParametrosFicherosWebsiteAvantio($tipo = "all")
    {
        if($tipo == 'all'){
            foreach($this->avantio_files as $kind => $elementos){
                foreach($elementos as $k => $data){
                    $this->avantio_files[$kind][$k]['update'] = 1;
                }
            }
        }elseif($tipo == 'static'){
            foreach($this->avantio_files['static'] as $k => $data){
                $this->avantio_files['static'][$k]['update']=1;
            }
        }elseif($tipo == 'dynamic'){
            foreach($this->avantio_files['dynamic'] as $k => $data){
                $this->avantio_files['dynamic'][$k]['update'] = 1;
            }
        }elseif($tipo == 'prices'){
            foreach($this->avantio_files['prices'] as $k => $data){
                $this->avantio_files['prices'][$k]['update'] = 1;
            }
        }elseif(isset($this->avantio_files['static'][$tipo])){
            $this->avantio_files['static'][$tipo]['update']=1;
        }elseif(isset($this->avantio_files['dynamic'][$tipo])){
            $this->avantio_files['static'][$tipo]['update']=1;
        }elseif(isset($this->avantio_files['prices'][$tipo])){
            $this->avantio_files['static'][$tipo]['update']=1;
        }

        if($tipo=='view_xml')
            $view_xml = true;

        //$this->write_report($tipo);


    } // end function



    private function borrarFicherosWebsiteAvantio()
    {
        $ts_referencia = intval(date("YmdHis",time() - $this->avantio_credentials['DELETE_TIME']));
        foreach(scandir(__DIR__.'/../xmldata/') as $file){
            if(strpos($file,'.xml') === FALSE) continue;
            list($name,$ts) = explode(".",$file);
            //if($ts_referencia > intval($ts))
            unlink(__DIR__.'/../xmldata/'.$file);
        }
    } // end function



    private function descargarFicherosXmlWebsiteAvantio()
    {

        // Load class
        $ch = new CurlRequest();

        foreach($this->avantio_files as $tipo => $elementos){

            foreach($elementos as $k => $data) {
                if (!$data['update']) continue;
                $url = $this->avantio_credentials['URL_FEEDS'] . $k . '/' . $this->avantio_credentials['PARTNER_CODE'];
                echo "DOWNLOAD:" . $url . "\n";
                $ts = date("YmdHis");
                $fdata_zip = $ch->get($url);
                echo "k:".$k."<br>";
                echo "ts:".$ts."<br>";
                if ($fdata_zip){
                    $file_unzip = __DIR__ . '/../xmldata/' . $k . '.' . $ts . '.xml';
                    $file_zip = $file_unzip . '.zip';
                    $fw = fopen($file_zip, 'w');
                    fwrite($fw, $fdata_zip);
                    fclose($fw);
                    $zip = new ZipArchive;
                    if ($zip->open($file_zip) === true) {
                        $filename = $zip->getNameIndex(0);
                        //if (is_file($filename)){
                        copy("zip://" . $file_zip . "#" . $filename, $file_unzip);
                        $zip->close();
                        unlink($file_zip);
                        $this->files_downloaded[$tipo][$k] = $file_unzip;
                        //}// end if
                    }// end if
                }// end if

            }// end foreach

        }// end foreach

    } // end function


}
