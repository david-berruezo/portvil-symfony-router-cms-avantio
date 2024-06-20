<?php
namespace App\Entity;

# symfony
use App\Repository\AvantioAccomodationsRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

# libraries
use App\Model\Entidad\Entidad;

# entity
use App\Entity\AvantioAccomodationsPictures;
use App\Entity\DynamicRooms;

# php libraries
use DateTime;

#[ORM\Table(name:"avantio_accomodations")]
/*
#[ORM\Index(name: "idx_avantio_accomodations_pictures", columns: ["avantio_accomodations_pictures"])]
#[ORM\Index(name: "idx_avantio_pricemodifiers", columns: ["avantio_pricemodifiers"])]
#[ORM\Index(name: "idx_avantio_occupation_rules", columns: ["avantio_occupation_rules"])]
#[ORM\Index(name: "idx_avantio_availabilities", columns: ["avantio_availabilities"])]
#[ORM\Index(name: "idx_avantio_rates", columns: ["avantio_rates"])]
#[ORM\Index(name: "idx_dynamic_rooms", columns: ["dynamic_rooms"])]
#[ORM\Index(name: "idx_avantio_accomodations_extras", columns: ["avantio_accomodations_extras"])]
#[ORM\Index(name: "idx_avantio_accomodations_locations", columns: ["avantio_accomodations_locations"])]
#[ORM\Index(name: "idx_avantio_accomodations_nearest_places", columns: ["avantio_accomodations_nearest_places"])]
*/

#[ORM\Entity(repositoryClass: AvantioAccomodationsRepository::class)]
class AvantioAccomodations
{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy:"NONE")]
    #[ORM\Column(name: 'id', type: 'integer', nullable: false)]
    private ?int $id = 0;

    #[ORM\Column(name: 'avantio_accomodations', type: 'integer', nullable: false)]
    private ?int $avantioAccomodations;

    /*
    #[ORM\Column(name: 'avantio_accomodations_nearest_places', type: 'integer', nullable: false)]
    private ?int $avantioAccomodationsNearestPlaces = 0;

    #[ORM\Column(name: 'avantio_accomodations_extras', type: 'integer', nullable: true)]
    private ?int $avantioAccomodationsExtras;

    #[ORM\Column(name: 'avantio_accomodations_locations', type: 'integer', nullable: false)]
    private ?int $avantioAccomodationsLocations;


    #[ORM\OneToMany(targetEntity: DynamicRooms::class, mappedBy: 'dynamicRooms')]
    #[ORM\Column(name: 'dynamic_rooms', type: 'integer', nullable: false, options: ['comment' => 'dynamicRooms'])]
    private ?int $dynamicRooms;


    #[ORM\OneToMany(targetEntity: AvantioAvailabilities::class, mappedBy: 'avantioAccomodations')]
    #[ORM\Column(name: 'avantio_availabilities', type: 'integer', nullable: true, options: ['comment' => 'availabilities'])]
    private ?int $avantioAvailabilities;

    #[ORM\OneToMany(targetEntity: AvantioRates::class, mappedBy: 'avantioRates')]
    #[ORM\Column(name: 'avantio_rates', type: 'integer', nullable: false, options: ['comment' => 'rates'])]
    private ?int $avantioRates;

    #[ORM\OneToMany(targetEntity: AvantioOccupationRules::class, mappedBy: 'avantioAccomodations')]
    #[ORM\Column(name: 'avantio_occupation_rules', type: 'integer', nullable: false, options: ['comment' => 'occupation_rules'])]
    private ?int $avantioOccupationRules;

    #[ORM\OneToMany(targetEntity: AvantioPricemodifiers::class, mappedBy: 'avantioAccomodations')]
    #[ORM\Column(name: 'avantio_pricemodifiers', type: 'integer', nullable: false, options: ['comment' => 'pricemodifiers'])]
    private ?int $avantioPricemodifiers;

    #[ORM\OneToMany(targetEntity: AvantioAccomodationsPictures::class, mappedBy: 'avantioAccomodations')]
    #[ORM\Column(name: 'avantio_accomodations_pictures', type: 'integer', nullable: false, options: ['comment' => 'pictures'])]
    private ?int $avantioAccomodationsPictures;
    */

    #[ORM\ManyToOne(targetEntity: "DynamicTaxonomy" , cascade:["persist","remove"])]
    #[ORM\JoinColumn(name: "dynamic_taxonomy", referencedColumnName: "id")]
    private ?DynamicTaxonomy $dynamicTaxonomy;

    #[ORM\ManyToOne(targetEntity: "DynamicGeocountry" , cascade:["persist","remove"])]
    #[ORM\JoinColumn(name: "dynamic_geocountry", referencedColumnName: "id")]
    private ?DynamicGeocountry $dynamicGeocountry;

    #[ORM\ManyToOne(targetEntity: "DynamicGeoregion" , cascade:["persist","remove"])]
    #[ORM\JoinColumn(name: "dynamic_georegion", referencedColumnName: "id")]
    private ?DynamicGeoregion $dynamicGeoregion;

    #[ORM\ManyToOne(targetEntity: "DynamicGeocity" , cascade:["persist","remove"])]
    #[ORM\JoinColumn(name: "dynamic_geocity", referencedColumnName: "id")]
    private ?DynamicGeocity $dynamicGeocity;

    #[ORM\ManyToOne(targetEntity: "DynamicGeolocality" , cascade:["persist","remove"])]
    #[ORM\JoinColumn(name: "dynamic_geolocality", referencedColumnName: "id")]
    private ?DynamicGeolocality $dynamicGeolocality;

    #[ORM\ManyToOne(targetEntity: "DynamicGeodistrict" , cascade:["all"] )]
    #[ORM\JoinColumn(name: "dynamic_geodistrict", referencedColumnName: "id" , onDelete:"CASCADE" )]
    private ?DynamicGeodistrict $dynamicGeodistrict;

    #[ORM\Column(name: 'language', type: 'integer', nullable: false)]
    private ?int $language = 111;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Nombre del alojamiento'])]
    private ?string $textTitle = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_referencia', type: 'string', length: 45, nullable: true, options: ['comment' => 'Referencia'])]
    private ?string $textReferencia = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_userid', type: 'string', length: 75, nullable: true, options: ['comment' => 'Id usuario'])]
    private ?string $textUserid = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_company', type: 'string', length: 75, nullable: true, options: ['comment' => 'Nombre compañia'])]
    private ?string $textCompany = '';

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_companyid', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Id compañia'])]
    private ?int $numberCompanyid = 0;

    #[ORM\Column(name: 'text_numero_registro_turistico', type: 'string', length: 255, nullable: true, options: ['comment' => 'Número de registro turístico'])]
    private ?string $textNumeroRegistroTuristico = '';


    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_garantia', type: 'boolean', nullable: true)]
    private ?bool $checkboxGarantia = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_listado_garantia', type: 'boolean', nullable: true)]
    private ?bool $checkboxListadoGarantia = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_dashboard', type: 'boolean', nullable: true)]
    private ?bool $checkboxDashboard = false;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_cp', type: 'text', length: 65535, nullable: true, options: ['comment' => 'Código Postal'])]
    private ?string $textGeoCp = "";

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'dynamic_kind_of_way', type: 'integer', nullable: true)]
    private ?int $dynamicKindOfWay;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_calle', type: 'string', length: 255, nullable: true, options: ['comment' => 'Calle'])]
    private ?string $textGeoCalle = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_numero', type: 'string', length: 20, nullable: true, options: ['comment' => 'Número'])]
    private ?string $textGeoNumero = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_bloque', type: 'string', length: 20, nullable: true, options: ['comment' => 'Piso / Letra'])]
    private ?string $textGeoBloque = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_puerta', type: 'string', length: 20, nullable: true, options: ['comment' => 'Puerta'])]
    private ?string $textGeoPuerta = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_piso', type: 'string', length: 20, nullable: true, options: ['comment' => 'Piso'])]
    private ?string $textGeoPiso = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_latitud', type: 'string', length: 45, nullable: true, options: ['comment' => 'GPS Latitud'])]
    private ?string $textGeoLatitud = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_geo_longitud', type: 'string', length: 45, nullable: true, options: ['comment' => 'GPS Longitud'])]
    private ?string $textGeoLongitud = "";

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_geo_zoom', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Zoom Google Maps'])]
    private ?int $numberGeoZoom = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_unidades', type: 'smallint', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de alojamientos'])]
    private ?int $numberUnidades = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_metros_cuadrados', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Superficie parcela'])]
    private ?int $numberMetrosCuadrados = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_metros_cuadrados_utiles', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Superficie vivienda'])]
    private ?int $numberMetrosCuadradosUtiles = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_metros_cuadrados_construidos', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Metros cuadrados, superfície construida'])]
    private ?int $numberMetrosCuadradosConstruidos = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_metros_cuadrados_terraza', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Metros cuadrados, terraza'])]
    private ?int $numberMetrosCuadradosTerraza = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_capacidad_maxima', type: 'integer', nullable: true, options: ['default' => '1', 'unsigned' => true, 'comment' => 'Ocupación máxima adultos con niños'])]
    private ?int $numberCapacidadMaxima = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_capacidad_minima', type: 'integer', nullable: true, options: ['default' => '1', 'unsigned' => true, 'comment' => 'Ocupación mínima'])]
    private ?int $numberCapacidadMinima = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_capacidad_sin_suplemento', type: 'integer', nullable: true, options: ['comment' => 'Ocupación sin suplemento'])]
    private ?int $numberCapacidadSinSuplemento = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_habitaciones', type: 'integer', nullable: true, options: ['default' => '1', 'unsigned' => true, 'comment' => 'Número de habitaciones'])]
    private ?int $numberHabitaciones = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_camas_doble', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de camas dobles'])]
    private ?int $numberCamasDoble = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_camas_individual', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de camas individuales'])]
    private ?int $numberCamasIndividual = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_camas_king', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de camas king'])]
    private ?int $numberCamasKing = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_camas_queen', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de camas queen'])]
    private ?int $numberCamasQueen = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_sofas_cama', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de sofás cama'])]
    private ?int $numberSofasCama = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_sofas_cama_doble', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de sofás cama doble'])]
    private ?int $numberSofasCamaDoble = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_literas', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de literas'])]
    private ?int $numberLiteras = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_dormitorios_personal', type: 'integer', nullable: true, options: ['comment' => 'Dormitorios de personal'])]
    private ?int $numberDormitoriosPersonal = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_camas_supletorias', type: 'integer', nullable: true, options: ['comment' => 'Camas supletorias'])]
    private ?int $numberCamasSupletorias = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_aseos', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de aseos'])]
    private ?int $numberAseos = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_banyos_banyera', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de baños con bañera'])]
    private ?int $numberBanyosBanyera = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_banyos_ducha', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número de baños con ducha'])]
    private ?int $numberBanyosDucha = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_cocinas', type: 'integer', nullable: true, options: ['unsigned' => true, 'comment' => 'Número cocinas'])]
    private ?int $numberCocinas = 0;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'dynamic_kitchenclass', type: 'integer', nullable: true)]
    private ?int $dynamicKitchenclass;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'dynamic_kitchentype', type: 'integer', nullable: true)]
    private ?int $dynamicKitchentype;

    /**
     * @var int|nullhttps://teams.microsoft.com/l/meetup-join/19%3ameeting_Yjk0NDNmNGYtMDVmYS00ZWJjLThjOWQtYzljYTIxMGNkNmY4%40thread.v2/0?context=%7b%22Tid%22%3a%22bf28499d-e002-492f-ba23-96cacfc006bc%22%2c%22Oid%22%3a%2245cc1322-66b8-49c3-8c8a-2ea9451f15df%22%7d
     *
     */
    #[ORM\Column(name: 'number_fun', type: 'integer', nullable: true, options: ['comment' => 'ventilador'])]
    private ?int $numberFun = 0;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_orientacion', type: 'string', length: 75, nullable: true, options: ['comment' => 'Orientación'])]
    private ?string $textOrientacion = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_tipo_piscina', type: 'string', length: 255, nullable: true, options: ['comment' => 'Tipo piscina'])]
    private ?string $textTipoPiscina = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dimensiones_piscina', type: 'string', length: 75, nullable: true, options: ['comment' => 'dimensiones piscina'])]
    private ?string $textDimensionesPiscina = "";

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_piscina', type: 'boolean', nullable: true, options: ['comment' => 'piscina'])]
    private ?bool $checkboxPiscina = false;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'number_plazas_aparcamiento', type: 'integer', nullable: true, options: ['comment' => 'plazas de aparcamiento'])]
    private ?int $numberPlazasAparcamiento = 0;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_aparcamiento', type: 'boolean', nullable: true, options: ['comment' => 'aparcamiento'])]
    private ?bool $checkboxAparcamiento = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_tv', type: 'boolean', nullable: true, options: ['comment' => 'tv'])]
    private ?bool $checkboxTv = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_grups', type: 'boolean', nullable: true, options: ['comment' => 'grupos'])]
    private ?bool $checkboxGrups = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_jardin', type: 'boolean', nullable: true, options: ['comment' => 'jardín'])]
    private ?bool $checkboxJardin = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_muebles_jardin', type: 'boolean', nullable: true, options: ['comment' => 'muebles de jardín'])]
    private ?bool $checkboxMueblesJardin = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_plancha', type: 'boolean', nullable: true, options: ['comment' => 'plancha'])]
    private ?bool $checkboxPlancha = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_chimenea', type: 'boolean', nullable: true, options: ['comment' => 'chimenea'])]
    private ?bool $checkboxChimenea = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_barbacoa', type: 'boolean', nullable: true, options: ['comment' => 'barbacoa'])]
    private ?bool $checkboxBarbacoa = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_radio', type: 'boolean', nullable: true, options: ['comment' => 'radio'])]
    private ?bool $checkboxRadio = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_minibar', type: 'boolean', nullable: true, options: ['comment' => 'mini-bar'])]
    private ?bool $checkboxMinibar = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_terraza', type: 'boolean', nullable: true, options: ['comment' => 'terraza'])]
    private ?bool $checkboxTerraza = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_parcela_vallada', type: 'boolean', nullable: true, options: ['comment' => 'parcela vallada'])]
    private ?bool $checkboxParcelaVallada = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_caja_seguridad', type: 'boolean', nullable: true, options: ['comment' => 'caja fuerte'])]
    private ?bool $checkboxCajaSeguridad = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_ascensor', type: 'boolean', nullable: true, options: ['comment' => 'ascensor'])]
    private ?bool $checkboxAscensor = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_dvd', type: 'boolean', nullable: true, options: ['comment' => 'reproductor de DVD'])]
    private ?bool $checkboxDvd = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_balcon', type: 'boolean', nullable: true, options: ['comment' => 'balcón'])]
    private ?bool $checkboxBalcon = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_exprimidor', type: 'boolean', nullable: true, options: ['comment' => 'exprimidor'])]
    private ?bool $checkboxExprimidor = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_hervidor_electrico', type: 'boolean', nullable: true, options: ['comment' => 'hervidor electrico'])]
    private ?bool $checkboxHervidorElectrico = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_secador_pelo', type: 'boolean', nullable: true, options: ['comment' => 'secador de pelo'])]
    private ?bool $checkboxSecadorPelo = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_zona_ninos', type: 'boolean', nullable: true, options: ['comment' => 'zona para niños'])]
    private ?bool $checkboxZonaNinos = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_gimnasio', type: 'boolean', nullable: true, options: ['comment' => 'gimnasio'])]
    private ?bool $checkboxGimnasio = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_alarma', type: 'boolean', nullable: true, options: ['comment' => 'alarma'])]
    private ?bool $checkboxAlarma = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_tennis', type: 'boolean', nullable: true, options: ['comment' => 'pista de tenis'])]
    private ?bool $checkboxTennis = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_squash', type: 'boolean', nullable: true, options: ['comment' => 'squash'])]
    private ?bool $checkboxSquash = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_paddel', type: 'boolean', nullable: true, options: ['comment' => 'paddel'])]
    private ?bool $checkboxPaddel = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_sauna', type: 'boolean', nullable: true, options: ['comment' => 'sauna'])]
    private ?bool $checkboxSauna = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_jacuzzi', type: 'boolean', nullable: true, options: ['comment' => 'jacuzzi'])]
    private ?bool $checkboxJacuzzi = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_apta_discapacitados', type: 'boolean', nullable: true, options: ['comment' => 'Apta para discapacitados'])]
    private ?bool $checkboxAptaDiscapacitados = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_nevera', type: 'boolean', nullable: true, options: ['comment' => 'nevera'])]
    private ?bool $checkboxNevera = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_congelador', type: 'boolean', nullable: true, options: ['comment' => 'congelador'])]
    private ?bool $checkboxCongelador = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_lavavajillas', type: 'boolean', nullable: true, options: ['comment' => 'lavavajillas'])]
    private ?bool $checkboxLavavajillas = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_lavadora', type: 'boolean', nullable: true, options: ['comment' => 'lavadora'])]
    private ?bool $checkboxLavadora = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_secadora', type: 'boolean', nullable: true, options: ['comment' => 'secadora'])]
    private ?bool $checkboxSecadora = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_cafetera', type: 'boolean', nullable: true, options: ['comment' => 'cafetera'])]
    private ?bool $checkboxCafetera = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_tostadora', type: 'boolean', nullable: true, options: ['comment' => 'tostadora'])]
    private ?bool $checkboxTostadora = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_microondas', type: 'boolean', nullable: true, options: ['comment' => 'microondas'])]
    private ?bool $checkboxMicroondas = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_horno', type: 'boolean', nullable: true, options: ['comment' => 'horno'])]
    private ?bool $checkboxHorno = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_vajilla', type: 'boolean', nullable: true, options: ['comment' => 'vajilla'])]
    private ?bool $checkboxVajilla = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_utensilios_cocina', type: 'boolean', nullable: true, options: ['comment' => 'utensilios de concina'])]
    private ?bool $checkboxUtensiliosCocina = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_batidora', type: 'boolean', nullable: true, options: ['comment' => 'batidora'])]
    private ?bool $checkboxBatidora = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_extra_nevera', type: 'boolean', nullable: true, options: ['comment' => 'extra nevera'])]
    private ?bool $checkboxExtraNevera = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_vinoteca', type: 'boolean', nullable: true, options: ['comment' => 'vinoteca / frigorifico vinos'])]
    private ?bool $checkboxVinoteca = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_hervidor_agua', type: 'boolean', nullable: true, options: ['comment' => 'hervidor de agua'])]
    private ?bool $checkboxHervidorAgua = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_cafetera_nespresso', type: 'boolean', nullable: true, options: ['comment' => 'cafetera nespresso'])]
    private ?bool $checkboxCafeteraNespresso = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_wifi', type: 'boolean', nullable: true, options: ['comment' => 'wifi'])]
    private ?bool $checkboxWifi = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_aire_acondicionado', type: 'boolean', nullable: true, options: ['comment' => 'aire acondicionado'])]
    private ?bool $checkboxAireAcondicionado = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_ventilador', type: 'boolean', nullable: true, options: ['comment' => 'ventilador'])]
    private ?bool $checkboxVentilador = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_calefacion_central', type: 'boolean', nullable: true, options: ['comment' => 'calefacion central'])]
    private ?bool $checkboxCalefacionCentral = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_bomba_aire', type: 'boolean', nullable: true, options: ['comment' => 'bomba aire frio/calor'])]
    private ?bool $checkboxBombaAire = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_suelo_radiante', type: 'boolean', nullable: true, options: ['comment' => 'suelo radiante'])]
    private ?bool $checkboxSueloRadiante = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_cine', type: 'boolean', nullable: true, options: ['comment' => 'cine'])]
    private ?bool $checkboxCine = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_equipo_musica', type: 'boolean', nullable: true, options: ['comment' => 'equipo de musica'])]
    private ?bool $checkboxEquipoMusica = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_barbacoa_gas', type: 'boolean', nullable: true, options: ['comment' => 'barbacoa de gas'])]
    private ?bool $checkboxBarbacoaGas = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_bano_turco', type: 'boolean', nullable: true, options: ['comment' => 'baño turco'])]
    private ?bool $checkboxBanoTurco = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_billar', type: 'boolean', nullable: true, options: ['comment' => 'billar'])]
    private ?bool $checkboxBillar = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_ping_pong', type: 'boolean', nullable: true, options: ['comment' => 'ping pong'])]
    private ?bool $checkboxPingPong = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_seguridad_piscina', type: 'boolean', nullable: true, options: ['comment' => 'seguridad piscina'])]
    private ?bool $checkboxSeguridadPiscina = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_accesorios_yoga', type: 'boolean', nullable: true, options: ['comment' => 'accesorios yoga'])]
    private ?bool $checkboxAccesoriosYoga = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_hosekeeping', type: 'boolean', nullable: true, options: ['comment' => 'hosekeeping on site'])]
    private ?bool $checkboxHosekeeping = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_trona', type: 'boolean', nullable: true, options: ['comment' => 'trona'])]
    private ?bool $checkboxTrona = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_mascotas', type: 'boolean', nullable: true, options: ['comment' => 'mascotas'])]
    private ?bool $checkboxMascotas = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_helipuerto', type: 'boolean', nullable: true, options: ['comment' => 'helipuerto'])]
    private ?bool $checkboxHelipuerto = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_zona_de_bar_exterior', type: 'boolean', nullable: true, options: ['comment' => 'zona de bar exterior'])]
    private ?bool $checkboxZonaDeBarExterior = false;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'checkbox_discoteca_privada', type: 'boolean', nullable: true, options: ['comment' => 'discoteca privada'])]
    private ?bool $checkboxDiscotecaPrivada = false;

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'dynamic_taxonomy_geographic_language_fields_customitzation', type: 'integer', nullable: true, options: ['comment' => 'extra field'])]
    private ?int $dynamicTaxonomyGeographicLanguageFieldsCustomitzation;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'multiple_taxonomy_geographic_language_extra', type: 'string', length: 255, nullable: true, options: ['comment' => 'coleccion'])]
    private ?string $multipleTaxonomyGeographicLanguageExtra;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'multiple_taxonomy_geographic_language_carac', type: 'string', length: 255, nullable: true, options: ['comment' => 'carac avantio'])]
    private ?string $multipleTaxonomyGeographicLanguageCarac;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'id_avantio', type: 'boolean', nullable: true, options: ['comment' => 'id avantio'])]
    private ?bool $idAvantio = true;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'status', type: 'string', length: 128, nullable: true, options: ['default' => 'ACTIVED', 'comment' => 'estado'])]
    private ?string $status = 'ACTIVED';

    /**
     * @var int|null
     *
     */
    #[ORM\Column(name: 'position', type: 'integer', nullable: true, options: ['comment' => 'posicion'])]
    private ?int $position = 1;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_description', type: 'text',  nullable: true, options: ['comment' => 'Descripción principal'])]
    private $textareaDescription = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_page_title', type: 'text',  nullable: true, options: ['comment' => 'Título sobre el alojamiento'])]
    private $textPageTitle = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'auto_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url corta (auto slug)'])]
    private $autoSlug = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url manual (vacío usará auto slug)'])]
    private $textSlug = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_keywords', type: 'text',  nullable: true, options: ['comment' => 'Meta Keywords (máx 255 characters)'])]
    private $textMetaKeywords = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_robots', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Robots (max 45 characters)'])]
    private $textMetaRobots = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_description', type: 'text',  nullable: true, options: ['comment' => 'Meta Description (max 255 characters)'])]
    private $textMetaDescription = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_header', type: 'text',  nullable: true, options: ['comment' => 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private $textareaScriptsHeader = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_body', type: 'text',  nullable: true, options: ['comment' => 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private $textareaScriptsBody = "";


    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'created_at', type: 'datetime', nullable: true)]
    private ?datetime $createdAt;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'update_at', type: 'datetime', nullable: true)]
    private ?datetime $updateAt;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'deleted_at', type: 'datetime', nullable: true)]
    private ?datetime $deletedAt;

    /**
     * @var bool|null
     *
     */
    #[ORM\Column(name: 'is_deleted', type: 'boolean', nullable: true)]
    private ?bool $isDeleted = false;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'update_status_at', type: 'datetime', nullable: true)]
    private ?datetime $updateStatusAt;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function getAvantioAccomodations(): ?int
    {
        return $this->avantioAccomodations;
    }

    public function setAvantioAccomodations(?int $avantioAccomodations): void
    {
        $this->avantioAccomodations = $avantioAccomodations;
    }

    public function getLanguage(): ?int
    {
        return $this->language;
    }

    public function setLanguage(?int $language): void
    {
        $this->language = $language;
    }

    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

    public function getTextReferencia(): ?string
    {
        return $this->textReferencia;
    }

    public function setTextReferencia(?string $textReferencia): void
    {
        $this->textReferencia = $textReferencia;
    }

    public function getTextUserid(): ?string
    {
        return $this->textUserid;
    }

    public function setTextUserid(?string $textUserid): void
    {
        $this->textUserid = $textUserid;
    }

    public function getTextCompany(): ?string
    {
        return $this->textCompany;
    }

    public function setTextCompany(?string $textCompany): void
    {
        $this->textCompany = $textCompany;
    }

    public function getNumberCompanyid(): ?int
    {
        return $this->numberCompanyid;
    }

    public function setNumberCompanyid(?int $numberCompanyid): void
    {
        $this->numberCompanyid = $numberCompanyid;
    }

    public function getTextNumeroRegistroTuristico(): ?string
    {
        return $this->textNumeroRegistroTuristico;
    }

    public function setTextNumeroRegistroTuristico(?string $textNumeroRegistroTuristico): void
    {
        $this->textNumeroRegistroTuristico = $textNumeroRegistroTuristico;
    }

    public function getAvantioOccupationRules(): ?int
    {
        return $this->avantioOccupationRules;
    }

    public function setAvantioOccupationRules(?int $avantioOccupationRules): void
    {
        $this->avantioOccupationRules = $avantioOccupationRules;
    }

    public function getAvantioAvailabilities(): ?int
    {
        return $this->avantioAvailabilities;
    }

    public function setAvantioAvailabilities(?int $avantioAvailabilities): void
    {
        $this->avantioAvailabilities = $avantioAvailabilities;
    }

    public function getAvantioRates(): ?int
    {
        return $this->avantioRates;
    }

    public function setAvantioRates(?int $avantioRates): void
    {
        $this->avantioRates = $avantioRates;
    }

    public function getAvantioPricemodifiers(): ?int
    {
        return $this->avantioPricemodifiers;
    }

    public function setAvantioPricemodifiers(?int $avantioPricemodifiers): void
    {
        $this->avantioPricemodifiers = $avantioPricemodifiers;
    }

    public function getDynamicTaxonomy(): ?DynamicTaxonomy
    {
        return $this->dynamicTaxonomy;
    }

    public function setDynamicTaxonomy(?DynamicTaxonomy $dynamicTaxonomy): void
    {
        $this->dynamicTaxonomy = $dynamicTaxonomy;
    }

    public function getDynamicGeocountry(): ?DynamicGeocountry
    {
        return $this->dynamicGeocountry;
    }

    public function setDynamicGeocountry(?DynamicGeocountry $dynamicGeocountry): void
    {
        $this->dynamicGeocountry = $dynamicGeocountry;
    }

    public function getDynamicGeoregion(): ?DynamicGeoregion
    {
        return $this->dynamicGeoregion;
    }

    public function setDynamicGeoregion(?DynamicGeoregion $dynamicGeoregion): void
    {
        $this->dynamicGeoregion = $dynamicGeoregion;
    }

    public function getDynamicGeocity(): ?DynamicGeocity
    {
        return $this->dynamicGeocity;
    }

    public function setDynamicGeocity(?DynamicGeocity $dynamicGeocity): void
    {
        $this->dynamicGeocity = $dynamicGeocity;
    }

    public function getDynamicGeolocality(): ?DynamicGeolocality
    {
        return $this->dynamicGeolocality;
    }

    public function setDynamicGeolocality(?DynamicGeolocality $dynamicGeolocality): void
    {
        $this->dynamicGeolocality = $dynamicGeolocality;
    }

    public function getDynamicGeodistrict(): ?DynamicGeodistrict
    {
        return $this->dynamicGeodistrict;
    }

    public function setDynamicGeodistrict(?DynamicGeodistrict $dynamicGeodistrict): void
    {
        $this->dynamicGeodistrict = $dynamicGeodistrict;
    }

    public function getCheckboxGarantia(): ?bool
    {
        return $this->checkboxGarantia;
    }

    public function setCheckboxGarantia(?bool $checkboxGarantia): void
    {
        $this->checkboxGarantia = $checkboxGarantia;
    }

    public function getCheckboxListadoGarantia(): ?bool
    {
        return $this->checkboxListadoGarantia;
    }

    public function setCheckboxListadoGarantia(?bool $checkboxListadoGarantia): void
    {
        $this->checkboxListadoGarantia = $checkboxListadoGarantia;
    }

    public function getCheckboxDashboard(): ?bool
    {
        return $this->checkboxDashboard;
    }

    public function setCheckboxDashboard(?bool $checkboxDashboard): void
    {
        $this->checkboxDashboard = $checkboxDashboard;
    }

    public function getTextGeoCp(): ?string
    {
        return $this->textGeoCp;
    }

    public function setTextGeoCp(?string $textGeoCp): void
    {
        $this->textGeoCp = $textGeoCp;
    }

    public function getDynamicKindOfWay(): ?int
    {
        return $this->dynamicKindOfWay;
    }

    public function setDynamicKindOfWay(?int $dynamicKindOfWay): void
    {
        $this->dynamicKindOfWay = $dynamicKindOfWay;
    }

    public function getTextGeoCalle(): ?string
    {
        return $this->textGeoCalle;
    }

    public function setTextGeoCalle(?string $textGeoCalle): void
    {
        $this->textGeoCalle = $textGeoCalle;
    }

    public function getTextGeoNumero(): ?string
    {
        return $this->textGeoNumero;
    }

    public function setTextGeoNumero(?string $textGeoNumero): void
    {
        $this->textGeoNumero = $textGeoNumero;
    }

    public function getTextGeoBloque(): ?string
    {
        return $this->textGeoBloque;
    }

    public function setTextGeoBloque(?string $textGeoBloque): void
    {
        $this->textGeoBloque = $textGeoBloque;
    }

    public function getTextGeoPuerta(): ?string
    {
        return $this->textGeoPuerta;
    }

    public function setTextGeoPuerta(?string $textGeoPuerta): void
    {
        $this->textGeoPuerta = $textGeoPuerta;
    }

    public function getTextGeoPiso(): ?string
    {
        return $this->textGeoPiso;
    }

    public function setTextGeoPiso(?string $textGeoPiso): void
    {
        $this->textGeoPiso = $textGeoPiso;
    }

    public function getTextGeoLatitud(): ?string
    {
        return $this->textGeoLatitud;
    }

    public function setTextGeoLatitud(?string $textGeoLatitud): void
    {
        $this->textGeoLatitud = $textGeoLatitud;
    }

    public function getTextGeoLongitud(): ?string
    {
        return $this->textGeoLongitud;
    }

    public function setTextGeoLongitud(?string $textGeoLongitud): void
    {
        $this->textGeoLongitud = $textGeoLongitud;
    }

    public function getNumberGeoZoom(): ?int
    {
        return $this->numberGeoZoom;
    }

    public function setNumberGeoZoom(?int $numberGeoZoom): void
    {
        $this->numberGeoZoom = $numberGeoZoom;
    }

    public function getNumberUnidades(): int|string|null
    {
        return $this->numberUnidades;
    }

    public function setNumberUnidades(int|string|null $numberUnidades): void
    {
        $this->numberUnidades = $numberUnidades;
    }

    public function getNumberMetrosCuadrados(): int|string|null
    {
        return $this->numberMetrosCuadrados;
    }

    public function setNumberMetrosCuadrados(int|string|null $numberMetrosCuadrados): void
    {
        $this->numberMetrosCuadrados = $numberMetrosCuadrados;
    }

    public function getNumberMetrosCuadradosUtiles(): int|string|null
    {
        return $this->numberMetrosCuadradosUtiles;
    }

    public function setNumberMetrosCuadradosUtiles(int|string|null $numberMetrosCuadradosUtiles): void
    {
        $this->numberMetrosCuadradosUtiles = $numberMetrosCuadradosUtiles;
    }

    public function getNumberMetrosCuadradosConstruidos(): int|string|null
    {
        return $this->numberMetrosCuadradosConstruidos;
    }

    public function setNumberMetrosCuadradosConstruidos(int|string|null $numberMetrosCuadradosConstruidos): void
    {
        $this->numberMetrosCuadradosConstruidos = $numberMetrosCuadradosConstruidos;
    }

    public function getNumberMetrosCuadradosTerraza(): int|string|null
    {
        return $this->numberMetrosCuadradosTerraza;
    }

    public function setNumberMetrosCuadradosTerraza(int|string|null $numberMetrosCuadradosTerraza): void
    {
        $this->numberMetrosCuadradosTerraza = $numberMetrosCuadradosTerraza;
    }

    public function getNumberCapacidadMaxima(): int|string|null
    {
        return $this->numberCapacidadMaxima;
    }

    public function setNumberCapacidadMaxima(int|string|null $numberCapacidadMaxima): void
    {
        $this->numberCapacidadMaxima = $numberCapacidadMaxima;
    }

    public function getNumberCapacidadMinima(): int|string|null
    {
        return $this->numberCapacidadMinima;
    }

    public function setNumberCapacidadMinima(int|string|null $numberCapacidadMinima): void
    {
        $this->numberCapacidadMinima = $numberCapacidadMinima;
    }

    public function getNumberCapacidadSinSuplemento(): ?int
    {
        return $this->numberCapacidadSinSuplemento;
    }

    public function setNumberCapacidadSinSuplemento(?int $numberCapacidadSinSuplemento): void
    {
        $this->numberCapacidadSinSuplemento = $numberCapacidadSinSuplemento;
    }

    public function getNumberHabitaciones(): int|string|null
    {
        return $this->numberHabitaciones;
    }

    public function setNumberHabitaciones(int|string|null $numberHabitaciones): void
    {
        $this->numberHabitaciones = $numberHabitaciones;
    }

    public function getNumberCamasDoble(): int|string|null
    {
        return $this->numberCamasDoble;
    }

    public function setNumberCamasDoble(int|string|null $numberCamasDoble): void
    {
        $this->numberCamasDoble = $numberCamasDoble;
    }

    public function getNumberCamasIndividual(): int|string|null
    {
        return $this->numberCamasIndividual;
    }

    public function setNumberCamasIndividual(int|string|null $numberCamasIndividual): void
    {
        $this->numberCamasIndividual = $numberCamasIndividual;
    }

    public function getNumberCamasKing(): int|string|null
    {
        return $this->numberCamasKing;
    }

    public function setNumberCamasKing(int|string|null $numberCamasKing): void
    {
        $this->numberCamasKing = $numberCamasKing;
    }

    public function getNumberCamasQueen(): int|string|null
    {
        return $this->numberCamasQueen;
    }

    public function setNumberCamasQueen(int|string|null $numberCamasQueen): void
    {
        $this->numberCamasQueen = $numberCamasQueen;
    }

    public function getNumberSofasCama(): int|string|null
    {
        return $this->numberSofasCama;
    }

    public function setNumberSofasCama(int|string|null $numberSofasCama): void
    {
        $this->numberSofasCama = $numberSofasCama;
    }

    public function getNumberSofasCamaDoble(): int|string|null
    {
        return $this->numberSofasCamaDoble;
    }

    public function setNumberSofasCamaDoble(int|string|null $numberSofasCamaDoble): void
    {
        $this->numberSofasCamaDoble = $numberSofasCamaDoble;
    }

    public function getNumberLiteras(): int|string|null
    {
        return $this->numberLiteras;
    }

    public function setNumberLiteras(int|string|null $numberLiteras): void
    {
        $this->numberLiteras = $numberLiteras;
    }

    public function getNumberDormitoriosPersonal(): ?int
    {
        return $this->numberDormitoriosPersonal;
    }

    public function setNumberDormitoriosPersonal(?int $numberDormitoriosPersonal): void
    {
        $this->numberDormitoriosPersonal = $numberDormitoriosPersonal;
    }

    public function getNumberCamasSupletorias(): ?int
    {
        return $this->numberCamasSupletorias;
    }

    public function setNumberCamasSupletorias(?int $numberCamasSupletorias): void
    {
        $this->numberCamasSupletorias = $numberCamasSupletorias;
    }

    public function getNumberAseos(): int|string|null
    {
        return $this->numberAseos;
    }

    public function setNumberAseos(int|string|null $numberAseos): void
    {
        $this->numberAseos = $numberAseos;
    }

    public function getNumberBanyosBanyera(): int|string|null
    {
        return $this->numberBanyosBanyera;
    }

    public function setNumberBanyosBanyera(int|string|null $numberBanyosBanyera): void
    {
        $this->numberBanyosBanyera = $numberBanyosBanyera;
    }

    public function getNumberBanyosDucha(): int|string|null
    {
        return $this->numberBanyosDucha;
    }

    public function setNumberBanyosDucha(int|string|null $numberBanyosDucha): void
    {
        $this->numberBanyosDucha = $numberBanyosDucha;
    }

    public function getNumberCocinas(): int|string|null
    {
        return $this->numberCocinas;
    }

    public function setNumberCocinas(int|string|null $numberCocinas): void
    {
        $this->numberCocinas = $numberCocinas;
    }

    public function getDynamicKitchenclass(): ?int
    {
        return $this->dynamicKitchenclass;
    }

    public function setDynamicKitchenclass(?int $dynamicKitchenclass): void
    {
        $this->dynamicKitchenclass = $dynamicKitchenclass;
    }

    public function getDynamicKitchentype(): ?int
    {
        return $this->dynamicKitchentype;
    }

    public function setDynamicKitchentype(?int $dynamicKitchentype): void
    {
        $this->dynamicKitchentype = $dynamicKitchentype;
    }

    public function getNumberFun(): ?int
    {
        return $this->numberFun;
    }

    public function setNumberFun(?int $numberFun): void
    {
        $this->numberFun = $numberFun;
    }

    public function getTextOrientacion(): ?string
    {
        return $this->textOrientacion;
    }

    public function setTextOrientacion(?string $textOrientacion): void
    {
        $this->textOrientacion = $textOrientacion;
    }

    public function getTextTipoPiscina(): ?string
    {
        return $this->textTipoPiscina;
    }

    public function setTextTipoPiscina(?string $textTipoPiscina): void
    {
        $this->textTipoPiscina = $textTipoPiscina;
    }

    public function getTextDimensionesPiscina(): ?string
    {
        return $this->textDimensionesPiscina;
    }

    public function setTextDimensionesPiscina(?string $textDimensionesPiscina): void
    {
        $this->textDimensionesPiscina = $textDimensionesPiscina;
    }

    public function getCheckboxPiscina(): bool|string|null
    {
        return $this->checkboxPiscina;
    }

    public function setCheckboxPiscina(bool|string|null $checkboxPiscina): void
    {
        $this->checkboxPiscina = $checkboxPiscina;
    }

    public function getNumberPlazasAparcamiento(): ?int
    {
        return $this->numberPlazasAparcamiento;
    }

    public function setNumberPlazasAparcamiento(?int $numberPlazasAparcamiento): void
    {
        $this->numberPlazasAparcamiento = $numberPlazasAparcamiento;
    }

    public function getCheckboxAparcamiento(): ?bool
    {
        return $this->checkboxAparcamiento;
    }

    public function setCheckboxAparcamiento(?bool $checkboxAparcamiento): void
    {
        $this->checkboxAparcamiento = $checkboxAparcamiento;
    }

    public function getCheckboxTv(): bool|string|null
    {
        return $this->checkboxTv;
    }

    public function setCheckboxTv(bool|string|null $checkboxTv): void
    {
        $this->checkboxTv = $checkboxTv;
    }

    public function getCheckboxGrups(): bool|string|null
    {
        return $this->checkboxGrups;
    }

    public function setCheckboxGrups(bool|string|null $checkboxGrups): void
    {
        $this->checkboxGrups = $checkboxGrups;
    }

    public function getCheckboxJardin(): bool|string|null
    {
        return $this->checkboxJardin;
    }

    public function setCheckboxJardin(bool|string|null $checkboxJardin): void
    {
        $this->checkboxJardin = $checkboxJardin;
    }

    public function getCheckboxMueblesJardin(): bool|string|null
    {
        return $this->checkboxMueblesJardin;
    }

    public function setCheckboxMueblesJardin(bool|string|null $checkboxMueblesJardin): void
    {
        $this->checkboxMueblesJardin = $checkboxMueblesJardin;
    }

    public function getCheckboxPlancha(): bool|string|null
    {
        return $this->checkboxPlancha;
    }

    public function setCheckboxPlancha(bool|string|null $checkboxPlancha): void
    {
        $this->checkboxPlancha = $checkboxPlancha;
    }

    public function getCheckboxChimenea(): bool|string|null
    {
        return $this->checkboxChimenea;
    }

    public function setCheckboxChimenea(bool|string|null $checkboxChimenea): void
    {
        $this->checkboxChimenea = $checkboxChimenea;
    }

    public function getCheckboxBarbacoa(): bool|string|null
    {
        return $this->checkboxBarbacoa;
    }

    public function setCheckboxBarbacoa(bool|string|null $checkboxBarbacoa): void
    {
        $this->checkboxBarbacoa = $checkboxBarbacoa;
    }

    public function getCheckboxRadio(): bool|string|null
    {
        return $this->checkboxRadio;
    }

    public function setCheckboxRadio(bool|string|null $checkboxRadio): void
    {
        $this->checkboxRadio = $checkboxRadio;
    }

    public function getCheckboxMinibar(): bool|string|null
    {
        return $this->checkboxMinibar;
    }

    public function setCheckboxMinibar(bool|string|null $checkboxMinibar): void
    {
        $this->checkboxMinibar = $checkboxMinibar;
    }

    public function getCheckboxTerraza(): bool|string|null
    {
        return $this->checkboxTerraza;
    }

    public function setCheckboxTerraza(bool|string|null $checkboxTerraza): void
    {
        $this->checkboxTerraza = $checkboxTerraza;
    }

    public function getCheckboxParcelaVallada(): bool|string|null
    {
        return $this->checkboxParcelaVallada;
    }

    public function setCheckboxParcelaVallada(bool|string|null $checkboxParcelaVallada): void
    {
        $this->checkboxParcelaVallada = $checkboxParcelaVallada;
    }

    public function getCheckboxCajaSeguridad(): bool|string|null
    {
        return $this->checkboxCajaSeguridad;
    }

    public function setCheckboxCajaSeguridad(bool|string|null $checkboxCajaSeguridad): void
    {
        $this->checkboxCajaSeguridad = $checkboxCajaSeguridad;
    }

    public function getCheckboxAscensor(): bool|string|null
    {
        return $this->checkboxAscensor;
    }

    public function setCheckboxAscensor(bool|string|null $checkboxAscensor): void
    {
        $this->checkboxAscensor = $checkboxAscensor;
    }

    public function getCheckboxDvd(): bool|string|null
    {
        return $this->checkboxDvd;
    }

    public function setCheckboxDvd(bool|string|null $checkboxDvd): void
    {
        $this->checkboxDvd = $checkboxDvd;
    }

    public function getCheckboxBalcon(): bool|string|null
    {
        return $this->checkboxBalcon;
    }

    public function setCheckboxBalcon(bool|string|null $checkboxBalcon): void
    {
        $this->checkboxBalcon = $checkboxBalcon;
    }

    public function getCheckboxExprimidor(): bool|string|null
    {
        return $this->checkboxExprimidor;
    }

    public function setCheckboxExprimidor(bool|string|null $checkboxExprimidor): void
    {
        $this->checkboxExprimidor = $checkboxExprimidor;
    }

    public function getCheckboxHervidorElectrico(): bool|string|null
    {
        return $this->checkboxHervidorElectrico;
    }

    public function setCheckboxHervidorElectrico(bool|string|null $checkboxHervidorElectrico): void
    {
        $this->checkboxHervidorElectrico = $checkboxHervidorElectrico;
    }

    public function getCheckboxSecadorPelo(): bool|string|null
    {
        return $this->checkboxSecadorPelo;
    }

    public function setCheckboxSecadorPelo(bool|string|null $checkboxSecadorPelo): void
    {
        $this->checkboxSecadorPelo = $checkboxSecadorPelo;
    }

    public function getCheckboxZonaNinos(): bool|string|null
    {
        return $this->checkboxZonaNinos;
    }

    public function setCheckboxZonaNinos(bool|string|null $checkboxZonaNinos): void
    {
        $this->checkboxZonaNinos = $checkboxZonaNinos;
    }

    public function getCheckboxGimnasio(): bool|string|null
    {
        return $this->checkboxGimnasio;
    }

    public function setCheckboxGimnasio(bool|string|null $checkboxGimnasio): void
    {
        $this->checkboxGimnasio = $checkboxGimnasio;
    }

    public function getCheckboxAlarma(): bool|string|null
    {
        return $this->checkboxAlarma;
    }

    public function setCheckboxAlarma(bool|string|null $checkboxAlarma): void
    {
        $this->checkboxAlarma = $checkboxAlarma;
    }

    public function getCheckboxTennis(): bool|string|null
    {
        return $this->checkboxTennis;
    }

    public function setCheckboxTennis(bool|string|null $checkboxTennis): void
    {
        $this->checkboxTennis = $checkboxTennis;
    }

    public function getCheckboxSquash(): bool|string|null
    {
        return $this->checkboxSquash;
    }

    public function setCheckboxSquash(bool|string|null $checkboxSquash): void
    {
        $this->checkboxSquash = $checkboxSquash;
    }

    public function getCheckboxPaddel(): bool|string|null
    {
        return $this->checkboxPaddel;
    }

    public function setCheckboxPaddel(bool|string|null $checkboxPaddel): void
    {
        $this->checkboxPaddel = $checkboxPaddel;
    }

    public function getCheckboxSauna(): bool|string|null
    {
        return $this->checkboxSauna;
    }

    public function setCheckboxSauna(bool|string|null $checkboxSauna): void
    {
        $this->checkboxSauna = $checkboxSauna;
    }

    public function getCheckboxJacuzzi(): bool|string|null
    {
        return $this->checkboxJacuzzi;
    }

    public function setCheckboxJacuzzi(bool|string|null $checkboxJacuzzi): void
    {
        $this->checkboxJacuzzi = $checkboxJacuzzi;
    }

    public function getCheckboxAptaDiscapacitados(): bool|string|null
    {
        return $this->checkboxAptaDiscapacitados;
    }

    public function setCheckboxAptaDiscapacitados(bool|string|null $checkboxAptaDiscapacitados): void
    {
        $this->checkboxAptaDiscapacitados = $checkboxAptaDiscapacitados;
    }

    public function getCheckboxNevera(): bool|string|null
    {
        return $this->checkboxNevera;
    }

    public function setCheckboxNevera(bool|string|null $checkboxNevera): void
    {
        $this->checkboxNevera = $checkboxNevera;
    }

    public function getCheckboxCongelador(): bool|string|null
    {
        return $this->checkboxCongelador;
    }

    public function setCheckboxCongelador(bool|string|null $checkboxCongelador): void
    {
        $this->checkboxCongelador = $checkboxCongelador;
    }

    public function getCheckboxLavavajillas(): bool|string|null
    {
        return $this->checkboxLavavajillas;
    }

    public function setCheckboxLavavajillas(bool|string|null $checkboxLavavajillas): void
    {
        $this->checkboxLavavajillas = $checkboxLavavajillas;
    }

    public function getCheckboxLavadora(): bool|string|null
    {
        return $this->checkboxLavadora;
    }

    public function setCheckboxLavadora(bool|string|null $checkboxLavadora): void
    {
        $this->checkboxLavadora = $checkboxLavadora;
    }

    public function getCheckboxSecadora(): bool|string|null
    {
        return $this->checkboxSecadora;
    }

    public function setCheckboxSecadora(bool|string|null $checkboxSecadora): void
    {
        $this->checkboxSecadora = $checkboxSecadora;
    }

    public function getCheckboxCafetera(): bool|string|null
    {
        return $this->checkboxCafetera;
    }

    public function setCheckboxCafetera(bool|string|null $checkboxCafetera): void
    {
        $this->checkboxCafetera = $checkboxCafetera;
    }

    public function getCheckboxTostadora(): bool|string|null
    {
        return $this->checkboxTostadora;
    }

    public function setCheckboxTostadora(bool|string|null $checkboxTostadora): void
    {
        $this->checkboxTostadora = $checkboxTostadora;
    }

    public function getCheckboxMicroondas(): bool|string|null
    {
        return $this->checkboxMicroondas;
    }

    public function setCheckboxMicroondas(bool|string|null $checkboxMicroondas): void
    {
        $this->checkboxMicroondas = $checkboxMicroondas;
    }

    public function getCheckboxHorno(): bool|string|null
    {
        return $this->checkboxHorno;
    }

    public function setCheckboxHorno(bool|string|null $checkboxHorno): void
    {
        $this->checkboxHorno = $checkboxHorno;
    }

    public function getCheckboxVajilla(): bool|string|null
    {
        return $this->checkboxVajilla;
    }

    public function setCheckboxVajilla(bool|string|null $checkboxVajilla): void
    {
        $this->checkboxVajilla = $checkboxVajilla;
    }

    public function getCheckboxUtensiliosCocina(): bool|string|null
    {
        return $this->checkboxUtensiliosCocina;
    }

    public function setCheckboxUtensiliosCocina(bool|string|null $checkboxUtensiliosCocina): void
    {
        $this->checkboxUtensiliosCocina = $checkboxUtensiliosCocina;
    }

    public function getCheckboxBatidora(): ?bool
    {
        return $this->checkboxBatidora;
    }

    public function setCheckboxBatidora(?bool $checkboxBatidora): void
    {
        $this->checkboxBatidora = $checkboxBatidora;
    }

    public function getCheckboxExtraNevera(): ?bool
    {
        return $this->checkboxExtraNevera;
    }

    public function setCheckboxExtraNevera(?bool $checkboxExtraNevera): void
    {
        $this->checkboxExtraNevera = $checkboxExtraNevera;
    }

    public function getCheckboxVinoteca(): ?bool
    {
        return $this->checkboxVinoteca;
    }

    public function setCheckboxVinoteca(?bool $checkboxVinoteca): void
    {
        $this->checkboxVinoteca = $checkboxVinoteca;
    }

    public function getCheckboxHervidorAgua(): ?bool
    {
        return $this->checkboxHervidorAgua;
    }

    public function setCheckboxHervidorAgua(?bool $checkboxHervidorAgua): void
    {
        $this->checkboxHervidorAgua = $checkboxHervidorAgua;
    }

    public function getCheckboxCafeteraNespresso(): ?bool
    {
        return $this->checkboxCafeteraNespresso;
    }

    public function setCheckboxCafeteraNespresso(?bool $checkboxCafeteraNespresso): void
    {
        $this->checkboxCafeteraNespresso = $checkboxCafeteraNespresso;
    }

    public function getCheckboxWifi(): ?bool
    {
        return $this->checkboxWifi;
    }

    public function setCheckboxWifi(?bool $checkboxWifi): void
    {
        $this->checkboxWifi = $checkboxWifi;
    }

    public function getCheckboxAireAcondicionado(): ?bool
    {
        return $this->checkboxAireAcondicionado;
    }

    public function setCheckboxAireAcondicionado(?bool $checkboxAireAcondicionado): void
    {
        $this->checkboxAireAcondicionado = $checkboxAireAcondicionado;
    }

    public function getCheckboxVentilador(): ?bool
    {
        return $this->checkboxVentilador;
    }

    public function setCheckboxVentilador(?bool $checkboxVentilador): void
    {
        $this->checkboxVentilador = $checkboxVentilador;
    }

    public function getCheckboxCalefacionCentral(): ?bool
    {
        return $this->checkboxCalefacionCentral;
    }

    public function setCheckboxCalefacionCentral(?bool $checkboxCalefacionCentral): void
    {
        $this->checkboxCalefacionCentral = $checkboxCalefacionCentral;
    }

    public function getCheckboxBombaAire(): ?bool
    {
        return $this->checkboxBombaAire;
    }

    public function setCheckboxBombaAire(?bool $checkboxBombaAire): void
    {
        $this->checkboxBombaAire = $checkboxBombaAire;
    }

    public function getCheckboxSueloRadiante(): ?bool
    {
        return $this->checkboxSueloRadiante;
    }

    public function setCheckboxSueloRadiante(?bool $checkboxSueloRadiante): void
    {
        $this->checkboxSueloRadiante = $checkboxSueloRadiante;
    }

    public function getCheckboxCine(): ?bool
    {
        return $this->checkboxCine;
    }

    public function setCheckboxCine(?bool $checkboxCine): void
    {
        $this->checkboxCine = $checkboxCine;
    }

    public function getCheckboxEquipoMusica(): ?bool
    {
        return $this->checkboxEquipoMusica;
    }

    public function setCheckboxEquipoMusica(?bool $checkboxEquipoMusica): void
    {
        $this->checkboxEquipoMusica = $checkboxEquipoMusica;
    }

    public function getCheckboxBarbacoaGas(): ?bool
    {
        return $this->checkboxBarbacoaGas;
    }

    public function setCheckboxBarbacoaGas(?bool $checkboxBarbacoaGas): void
    {
        $this->checkboxBarbacoaGas = $checkboxBarbacoaGas;
    }

    public function getCheckboxBanoTurco(): ?bool
    {
        return $this->checkboxBanoTurco;
    }

    public function setCheckboxBanoTurco(?bool $checkboxBanoTurco): void
    {
        $this->checkboxBanoTurco = $checkboxBanoTurco;
    }

    public function getCheckboxBillar(): ?bool
    {
        return $this->checkboxBillar;
    }

    public function setCheckboxBillar(?bool $checkboxBillar): void
    {
        $this->checkboxBillar = $checkboxBillar;
    }

    public function getCheckboxPingPong(): ?bool
    {
        return $this->checkboxPingPong;
    }

    public function setCheckboxPingPong(?bool $checkboxPingPong): void
    {
        $this->checkboxPingPong = $checkboxPingPong;
    }

    public function getCheckboxSeguridadPiscina(): ?bool
    {
        return $this->checkboxSeguridadPiscina;
    }

    public function setCheckboxSeguridadPiscina(?bool $checkboxSeguridadPiscina): void
    {
        $this->checkboxSeguridadPiscina = $checkboxSeguridadPiscina;
    }

    public function getCheckboxAccesoriosYoga(): ?bool
    {
        return $this->checkboxAccesoriosYoga;
    }

    public function setCheckboxAccesoriosYoga(?bool $checkboxAccesoriosYoga): void
    {
        $this->checkboxAccesoriosYoga = $checkboxAccesoriosYoga;
    }

    public function getCheckboxHosekeeping(): ?bool
    {
        return $this->checkboxHosekeeping;
    }

    public function setCheckboxHosekeeping(?bool $checkboxHosekeeping): void
    {
        $this->checkboxHosekeeping = $checkboxHosekeeping;
    }

    public function getCheckboxTrona(): ?bool
    {
        return $this->checkboxTrona;
    }

    public function setCheckboxTrona(?bool $checkboxTrona): void
    {
        $this->checkboxTrona = $checkboxTrona;
    }

    public function getCheckboxMascotas(): ?bool
    {
        return $this->checkboxMascotas;
    }

    public function setCheckboxMascotas(?bool $checkboxMascotas): void
    {
        $this->checkboxMascotas = $checkboxMascotas;
    }

    public function getCheckboxHelipuerto(): ?bool
    {
        return $this->checkboxHelipuerto;
    }

    public function setCheckboxHelipuerto(?bool $checkboxHelipuerto): void
    {
        $this->checkboxHelipuerto = $checkboxHelipuerto;
    }

    public function getCheckboxZonaDeBarExterior(): ?bool
    {
        return $this->checkboxZonaDeBarExterior;
    }

    public function setCheckboxZonaDeBarExterior(?bool $checkboxZonaDeBarExterior): void
    {
        $this->checkboxZonaDeBarExterior = $checkboxZonaDeBarExterior;
    }

    public function getCheckboxDiscotecaPrivada(): ?bool
    {
        return $this->checkboxDiscotecaPrivada;
    }

    public function setCheckboxDiscotecaPrivada(?bool $checkboxDiscotecaPrivada): void
    {
        $this->checkboxDiscotecaPrivada = $checkboxDiscotecaPrivada;
    }

    public function getDynamicTaxonomyGeographicLanguageFieldsCustomitzation(): ?int
    {
        return $this->dynamicTaxonomyGeographicLanguageFieldsCustomitzation;
    }

    public function setDynamicTaxonomyGeographicLanguageFieldsCustomitzation(?int $dynamicTaxonomyGeographicLanguageFieldsCustomitzation): void
    {
        $this->dynamicTaxonomyGeographicLanguageFieldsCustomitzation = $dynamicTaxonomyGeographicLanguageFieldsCustomitzation;
    }

    public function getMultipleTaxonomyGeographicLanguageExtra(): ?string
    {
        return $this->multipleTaxonomyGeographicLanguageExtra;
    }

    public function setMultipleTaxonomyGeographicLanguageExtra(?string $multipleTaxonomyGeographicLanguageExtra): void
    {
        $this->multipleTaxonomyGeographicLanguageExtra = $multipleTaxonomyGeographicLanguageExtra;
    }

    public function getMultipleTaxonomyGeographicLanguageCarac(): ?string
    {
        return $this->multipleTaxonomyGeographicLanguageCarac;
    }

    public function setMultipleTaxonomyGeographicLanguageCarac(?string $multipleTaxonomyGeographicLanguageCarac): void
    {
        $this->multipleTaxonomyGeographicLanguageCarac = $multipleTaxonomyGeographicLanguageCarac;
    }

    public function getIdAvantio(): ?bool
    {
        return $this->idAvantio;
    }

    public function setIdAvantio(?bool $idAvantio): void
    {
        $this->idAvantio = $idAvantio;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): void
    {
        $this->status = $status;
    }

    public function getPosition(): int|string|null
    {
        return $this->position;
    }

    public function setPosition(int|string|null $position): void
    {
        $this->position = $position;
    }

    public function getCreatedAt(): ?\DateTime
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTime $createdAt): void
    {
        $this->createdAt = $createdAt;
    }

    public function getUpdateAt(): ?\DateTime
    {
        return $this->updateAt;
    }

    public function setUpdateAt(?\DateTime $updateAt): void
    {
        $this->updateAt = $updateAt;
    }

    public function getDeletedAt(): ?\DateTime
    {
        return $this->deletedAt;
    }

    public function setDeletedAt(?\DateTime $deletedAt): void
    {
        $this->deletedAt = $deletedAt;
    }

    public function getIsDeleted(): ?bool
    {
        return $this->isDeleted;
    }

    public function setIsDeleted(?bool $isDeleted): void
    {
        $this->isDeleted = $isDeleted;
    }

    public function getUpdateStatusAt(): ?\DateTime
    {
        return $this->updateStatusAt;
    }

    public function setUpdateStatusAt(?\DateTime $updateStatusAt): void
    {
        $this->updateStatusAt = $updateStatusAt;
    }

    public function getAvantioAccomodationsNearestPlaces(): ?int
    {
        return $this->avantioAccomodationsNearestPlaces;
    }

    public function setAvantioAccomodationsNearestPlaces(?int $avantioAccomodationsNearestPlaces): void
    {
        $this->avantioAccomodationsNearestPlaces = $avantioAccomodationsNearestPlaces;
    }

    public function getAvantioAccomodationsExtras(): ?int
    {
        return $this->avantioAccomodationsExtras;
    }

    public function setAvantioAccomodationsExtras(?int $avantioAccomodationsExtras): void
    {
        $this->avantioAccomodationsExtras = $avantioAccomodationsExtras;
    }

    public function getAvantioAccomodationsLocations(): ?int
    {
        return $this->avantioAccomodationsLocations;
    }

    public function setAvantioAccomodationsLocations(?int $avantioAccomodationsLocations): void
    {
        $this->avantioAccomodationsLocations = $avantioAccomodationsLocations;
    }

    public function getDynamicRooms(): ?int
    {
        return $this->dynamicRooms;
    }

    public function setDynamicRooms(?int $dynamicRooms): void
    {
        $this->dynamicRooms = $dynamicRooms;
    }

    public function getAvantioAccomodationsPictures(): ?int
    {
        return $this->avantioAccomodationsPictures;
    }

    public function setAvantioAccomodationsPictures(?int $avantioAccomodationsPictures): void
    {
        $this->avantioAccomodationsPictures = $avantioAccomodationsPictures;
    }

    public function getTextareaDescription(): ?string
    {
        return $this->textareaDescription;
    }

    public function setTextareaDescription(?string $textareaDescription): void
    {
        $this->textareaDescription = $textareaDescription;
    }

    public function getTextPageTitle(): ?string
    {
        return $this->textPageTitle;
    }

    public function setTextPageTitle(?string $textPageTitle): void
    {
        $this->textPageTitle = $textPageTitle;
    }

    public function getAutoSlug(): ?string
    {
        return $this->autoSlug;
    }

    public function setAutoSlug(?string $autoSlug): void
    {
        $this->autoSlug = $autoSlug;
    }

    public function getTextSlug(): ?string
    {
        return $this->textSlug;
    }

    public function setTextSlug(?string $textSlug): void
    {
        $this->textSlug = $textSlug;
    }

    public function getTextMetaKeywords(): ?string
    {
        return $this->textMetaKeywords;
    }

    public function setTextMetaKeywords(?string $textMetaKeywords): void
    {
        $this->textMetaKeywords = $textMetaKeywords;
    }

    public function getTextMetaRobots(): ?string
    {
        return $this->textMetaRobots;
    }

    public function setTextMetaRobots(?string $textMetaRobots): void
    {
        $this->textMetaRobots = $textMetaRobots;
    }

    public function getTextMetaDescription(): ?string
    {
        return $this->textMetaDescription;
    }

    public function setTextMetaDescription(?string $textMetaDescription): void
    {
        $this->textMetaDescription = $textMetaDescription;
    }

    public function getTextareaScriptsHeader(): ?string
    {
        return $this->textareaScriptsHeader;
    }

    public function setTextareaScriptsHeader(?string $textareaScriptsHeader): void
    {
        $this->textareaScriptsHeader = $textareaScriptsHeader;
    }

    public function getTextareaScriptsBody(): ?string
    {
        return $this->textareaScriptsBody;
    }

    public function setTextareaScriptsBody(?string $textareaScriptsBody): void
    {
        $this->textareaScriptsBody = $textareaScriptsBody;
    }


    // Nose utiliza en este momento
    public function getDlistDataAcommodationFranquiciado(&$data)
    {

        # cache | Mamcache
        if(class_exists('Memcache')){
            $memcache = new Memcache;
            $memcache->connect("localhost",11211);
        }else if (class_exists('Memcached')){
            $memcache = new Memcached;
            $memcache->addServer("localhost", 11211);
        }

        # get language session
        $session = session();
        $language = $session->get('lang');

        $sql = " SELECT * FROM avantio_accomodations_id_avantio_portvil ";
        $query = $this->db->query($sql);
        $avantio_accomodations_id_avantio_portvil = ($query->getResult()) ? $query->getResult() : false;

        //$memcache->delete("consulta_group_avantio_accomodations");
        //$propiedades = $memcache->get("consulta_group_avantio_accomodations");
        $propiedades = "";

        if (!$propiedades) {
            # exceptiones registros
            $properties_exceptions = array(
                24 => "Apt",
                69 => "LAVANDERIA",
                79 => "Apt",
                105 => "Por Fin",
                107 => "Apt",
                108 => "Apt",
                109 => "Apt",
                111 => "OFICINA",
                145 => "aPruebas",
                291 => "Test",
                534 => "Test2",
                588 => "New",
                693 => "New",
                694 => "New",
                695 => "New",
                696 => "New",
                700 => "New",
                701 => "New",
                703 => "New",
                705 => "New",
                706 => "New",
                707 => "New",
                708 => "New",
                712 => "New",
                713 => "New",
                716 => "New",
                720 => "New",
                721 => "New",
                723 => "New",
                724 => "New",
                725 => "New",
                727 => "New",
                728 => "New",
                730 => "New",
                731 => "New",
                733 => "New",
                735 => "New",
                737 => "New",
                749 => "New",
                785 => "New",
                786 => "New",
                791 => "New",
                793 => "New",
                718 => "ERROR 2",
                719 => "ERROR 1",
                798 => "New",
            );

            # condititons
            $cond_a = "";
            $cond_b = "";

            if (session()->get("grupo") == "propietario"){
                $id = session()->get("id");
                $sql = " SELECT * FROM dynamic_propietario as dp WHERE language = 'es' AND dp.user_users = $id ";
                $query = $this->db->query($sql);
                $row = $query->getRow();
                if ($row){
                    $rooms = $row->multiple_rooms;
                    if ($rooms){
                        // $cond_a .= " AND  ( FIND_IN_SET($rooms,aaia.id_portvil_todos) OR aaia.id_avantio IN($rooms) )";
                        $cond_a.= " AND  ac.id IN($rooms) ";
                        $cond_b.= " AND  ac.id IN($rooms) ";
                    }
                }
            }

            if (session()->get("grupo") == "agencia"){
                $id = session()->get("id");
                //echo "el id es: " .$id. "<br>";
                $sql = " SELECT * FROM dynamic_agencia as da WHERE language = 'es' AND da.user_users = $id ";
                $query = $this->db->query($sql);
                $row = $query->getRow();
                if ($row){
                    $rooms = $row->multiple_rooms;
                    if ($rooms){
                        $rooms = rtrim($rooms,',');
                        //$cond_a .= " AND  ( FIND_IN_SET($rooms,aaia.id_portvil_todos) OR aaia.id_avantio IN($rooms) )";
                        $cond_a.= " AND  ac.id IN($rooms) ";
                        $cond_b.= " AND  ac.id IN($rooms) ";
                    }
                }
            }


            $sql = " select ac.id as id, ac.text_userid ,  ac.text_title as text_title, ac.status , ac.id_avantio , ac.language ,  country.id as id_country, country.text_title as country_name,
region.id as id_region, region.text_title as region_name, city.id as id_city, city.text_title as city_name,
locality.id as id_locality, locality.text_title as locality_name , ds.text_slug , ds.auto_slug , 1 as id_avantio_portvil , ac.number_metros_cuadrados , ac.checkbox_piscina , ac.dynamic_taxonomy
from avantio_accomodations as ac
join dynamic_rooms as ds on ds.id = ac.id
left join dynamic_geocountry as country on country.id = ac.dynamic_geocountry
left join dynamic_georegion as region on region.id = ac.dynamic_georegion
left join dynamic_geocity as city on city.id = ac.dynamic_geocity
left join dynamic_geolocality as locality on locality.id = ac.dynamic_geolocality
where ac.language = '" . $language . "'
    AND country.language = '" . $language . "'
    AND region.language = '" . $language . "'
    AND city.language = '" . $language . "'
    AND locality.language = '" . $language . "'
    AND ds.language = '" . $language . "'
    AND ac.id <> 298050
    $cond_a
ORDER BY text_title , id asc ";
            $query = $this->db->query($sql);
            $avantio_properties = ($query->getResult()) ? $query->getResult() : false;
            //echo $sql . "<br><br><br>";

            if (!$avantio_properties){
                $avantio_properties = array();
            }

            $sql = " select DISTINCT(ac.text_title) , ac.id as id, ac.text_userid , ac.text_title as text_title, ac.status , ac.id_avantio , ac.language ,  country.id as id_country, country.text_title as country_name,
region.id as id_region, region.text_title as region_name, city.id as id_city, city.text_title as city_name,
locality.id as id_locality, locality.text_title as locality_name , ds.text_slug , ds.auto_slug , 2 as id_avantio_portvil, ac.number_metros_cuadrados , ac.checkbox_piscina , ac.dynamic_taxonomy
from hshv_avantio_accomodations_real as ac
join hshv_dynamic_rooms_real as ds on ds.id = ac.id
left join dynamic_geocountry as country on country.id = ac.dynamic_geocountry
left join dynamic_georegion as region on region.id = ac.dynamic_georegion
left join dynamic_geocity as city on city.id = ac.dynamic_geocity
left join dynamic_geolocality as locality on locality.id = ac.dynamic_geolocality
where ac.language = '" . $language . "'
    AND country.language = '" . $language . "'
    AND region.language = '" . $language . "'
    AND city.language = '" . $language . "'
    AND locality.language = '" . $language . "'
    AND ds.language = '" . $language . "'
    $cond_b
GROUP BY ac.text_title ORDER BY text_title , id asc ";
            //echo $sql . "<br>";

            $query = $this->db->query($sql);
            $hshv_avantio_properties = ($query->getResult()) ? $query->getResult() : false;
            //p_($hshv_avantio_properties);

            $counter_hshv_avantio_properties = 0;
            if (isset($hshv_avantio_properties) && $hshv_avantio_properties) {
                foreach ($hshv_avantio_properties as $hshv_avantio_property) {
                    /*
                    if (array_key_exists($hshv_avantio_property->id, $properties_exceptions) == true) {
                        //echo "encontrado";
                        unset($hshv_avantio_properties[$counter_hshv_avantio_properties]);
                        //$hshv_avantio_properties = array_values($hshv_avantio_properties);
                    }
                    */
                    if (isset($avantio_accomodations_id_avantio_portvil) && $avantio_accomodations_id_avantio_portvil){
                        foreach ($avantio_accomodations_id_avantio_portvil as $item) {
                            $vector_temp = explode(",", $item->id_portvil);
                            if (in_array($hshv_avantio_property->id, $vector_temp)) {
                                unset($hshv_avantio_properties[$counter_hshv_avantio_properties]);
                                //$hshv_avantio_properties = array_values($hshv_avantio_properties);
                            }
                        }
                    }
                    $counter_hshv_avantio_properties++;
                }
            }else{
                $hshv_avantio_properties = array();
            }

            // p_($hshv_avantio_properties);
            usort($hshv_avantio_properties,array($this,"ordenar_por_nombre"));
            usort($avantio_properties,array($this,"ordenar_por_nombre"));
            $propiedades = array_merge($avantio_properties,$hshv_avantio_properties);
            usort($propiedades,array($this,"ordenar_por_nombre"));
            //p_($propiedades);
            //p_($propiedades);
            //$propiedades = $avantio_properties + $hshv_avantio_properties;
            $data["consulta_group_avantio_accomodations"] = $propiedades;
            if (class_exists('Memcache'))
                $memcache->set("consulta_group_avantio_accomodations", $propiedades,false, 7200);
            else if(class_exists('Memcached'))
                $memcache->set("consulta_group_avantio_accomodations", $propiedades,7200);

            //echo "guardando";
        }else{
            $data["consulta_group_avantio_accomodations"] = $propiedades;
        } // end if


        return $data;

    }// end function

}
