<?php
namespace App\Form;

use App\Model\Formulario\FormularioColecciones;
use App\Entity\DynamicGeocountry;
use App\Entity\DynamicGeodistrict;
use App\Entity\Language;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\DataMapperInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\OptionsResolver\OptionsResolver;

# php libararies
use ReflectionClass;
use ReflectionProperty;
use DateTime;


class DynamicGeodistrictType extends AbstractType implements DataMapperInterface
{

    # database
    private $em;
    private $connection;

    # formulario
    private $formulario_colecciones;
    private $excepciones;

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

    # objetos
    private $request;
    private $reflector;
    private $session;
    private $segmento;

    # language
    private $slug;
    private $lang;
    private $lang_id;
    private $lang_local;
    private $lang_id_local;
    private $action;

    # tipo accion | edit | new
    private $tipo_de_accion = "";

    # excepciones
    private $twig_excepciones;

    public function __construct(EntityManagerInterface $em ,   private RequestStack $requestStack , Connection $connection , FormularioColecciones $formulario_colecciones)
    {
        $this->em = $em;
        //$this->request = $request;
        $this->session = $this->requestStack->getSession();
        $this->formulario_colecciones = $formulario_colecciones;
    }


    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        /*
        # language
        $languageRepository = $this->em->getRepository(Language::class);
        $language = $languageRepository->findBy(array("id" => 111));
        */

        # guardamos datos

        # segment variables
        $this->segment = $options["segment"];
        $this->filter = $options["filter"];
        $this->filter_2 = $options["filter_2"];
        $this->filter_3 = $options["filter_3"];
        $this->filter_4 = $options["filter_4"];

        # paginas
        $this->page_id = $options["page_id"];
        $this->nombre_tabla = $options["nombre_tabla"];
        $this->nombre_objeto = $options["nombre_objeto"];
        $this->classString = $options["classString"];
        $this->url = $options["url"];

        # objetos
        $this->reflector = $options["reflector"];
        $this->segmento = $options["segmento"];
        $this->request = $options["request"];

        # language
        $this->slug = $options["slug"];
        $this->lang = $options["lang"];
        $this->lang_id = $options["lang_id"];
        $this->lang_local = $options["lang_local"];
        $this->lang_id_local = $options["lang_id_local"];
        $this->action = $options["action"];

        # guardamos fechas
        $fecha_generica = new DateTime();
        $fecha_generica_string = $fecha_generica->format("Y-m-d");

        # enviamos el tipo de accion edit o new
        $this->tipo_de_accion = $options["tipo_de_accion"];

        $this->twig_excepciones = $options["twig_excepciones"];
        //var_dump($this->twig_excepciones);

        $builder
            ->add('id')
            ->add('language')
            ->add('dynamicGeodistrict')
            ->add('textTitle')
            ->add('textareaDescription')
            ->add('textPageTitle')
            ->add('textSlug')
            ->add('autoSlug')
            ->add('textMetaKeywords')
            ->add('textMetaDescription')
            ->add('textMetaRobots')
            ->add('textareaScriptsHeader')
            ->add('textareaScriptsBody')
            ->add('status')
            ->add('position')
            ->add('createdAt')
            ->add('updatedAt')
            ->add('deletedAt')
        ;

        $builder->add('submit',SubmitType::class);

        # guardamos las excepciones
        $this->setExcepciones(null);

        # agregamos campos dynamic relaciones
        // $this->crearRelaciones($builder, $options);

        # agregamos variables a formulario colecciones
        //$this->formulario_colecciones->setBuilder($builder);
        //$this->formulario_colecciones->setOptions($options);
        $this->formulario_colecciones->setEm($this->em);
        $this->formulario_colecciones->setExcepciones($this->twig_excepciones);
        $this->formulario_colecciones->setReflector($this->reflector);
        $this->formulario_colecciones->setNombreObjeto($this->nombre_objeto);
        $this->formulario_colecciones->setClassString($this->classString);
        $this->formulario_colecciones->setSession($this->session);
        # urls
        $this->formulario_colecciones->setSegment($this->segment);
        $this->formulario_colecciones->setFilter($this->filter);
        $this->formulario_colecciones->setFilter2($this->filter_2);
        $this->formulario_colecciones->setFilter3($this->filter_3);
        $this->formulario_colecciones->setFilter4($this->filter_4);

        # creamos las colecciones
        $this->formulario_colecciones->crearRelaciones($builder, $options);

        # metodos transformacion before post and after post
        $builder->setDataMapper($this);

    }

    /**
     * @return mixed
     */
    public function getExcepciones()
    {
        return $this->excepciones;
    }


    /**
     * @param mixed $excepciones
     */
    public function setExcepciones(?array $excepciones): void
    {
        if (!$excepciones){
            # ponemos unas excepciones
            $this->excepciones = array(
                "auto_slug",
                //"avantioAccomodations",
                "avantioOccupationRules",
                "avantioAvailabilities",
                "avantioRates",
                "avantioPricemodifiers",
                "avantioAccomodationsPictures",
                "avantioAccomodationsNearestPlaces",
                "avantioAccomodationsExtras",
                "avantioAccomodationsLocations",
                "dynamicRooms",
                "hshvAvantioAccomodations",
                "hshvAvantioOccupationRules",
                "hshvAvantioAvailabilities",
                "hshvAvantioRates",
                "hshvAvantioPricemodifiers",
                "hshvAvantioAccomodationsPictures",
                "hshvAvantioAccomodationsNearestPlaces",
                "hshvAvantioAccomodationsExtras",
                "hshvAvantioAccomodationsLocations",
                "hshvDynamicRooms",
                "dynamicKindOfWay",
                "dynamicKitchenclass",
                "dynamicKitchentype",
                "dynamicTaxonomyGeographicLanguageFieldsCustomitzation",
                //"dynamicGeocountry",
                //"dynamicGeoregion",
                //"dynamicGeocity",
                //"dynamicGeolocality",
                //"dynamicGeodistrict",
                //"dynamicTaxonomy",
                "dynamicTaxonomyGroup",
                "multipleTaxonomyGeographicLanguageExtra",
                "multipleTaxonomyGeographicLanguageCarac"
            );

        }else{
            $this->excepciones = $excepciones;
        }
    }

    public function mapDataToForms($viewData, \Traversable $forms): void
    {
        $forms = iterator_to_array($forms);
        // var_dump($forms);
        // die();
        // $forms["updateAt"]->setData(new DateTime("2024-02-02"));

    }


    public function mapFormsToData(\Traversable $forms, &$viewData):void
    {
        $forms = iterator_to_array($forms);
        // var_dump($forms);

        # viewData es el objeto $avantioAccomodations
        $this->formulario_colecciones->tratarColecciones($forms,$viewData);

        # viewData es el objeto $avantioAccomodations
        $this->formulario_colecciones->setTipoDeAccion($this->tipo_de_accion);
        $this->formulario_colecciones->setExcepciones($this->twig_excepciones);
        $this->formulario_colecciones->tratarColecciones($forms,$viewData);

    }



    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class'      => DynamicGeodistrict::class,
            //'avantio_accomodations' => null,
            'segment' => null,
            'filter' => null,
            'filter_2' => null,
            'filter_3' => null,
            'filter_4' => null,
            'nombre_objeto' => null,
            'classString' => null,
            'page_id' => null,
            'nombre_tabla' => null,
            'url' => null,
            'segmento' => null,
            'request' => null,
            'reflector' => null,
            'identificador' => null,
            'slug' => null,
            'lang' => null,
            'lang_id' => null,
            'lang_local' => null,
            'lang_id_local' => null,
            'action' => null,
            // enable/disable CSRF protection for this form
            'csrf_protection' => true,
            // the name of the hidden HTML field that stores the token
            'csrf_field_name' => '_token',
            // an arbitrary string used to generate the value of the token
            // using a different string for each form improves its security
            'csrf_token_id'   => 'generico',
            'allow_extra_fields' => true,
            'tipo_de_accion' => null,
            'twig_excepciones' => null,
        ]);
    }
}
