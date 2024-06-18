<?php
namespace App\Repository;

use App\Entity\HshvAvantioAccomodations;
use App\Entity\DynamicRooms;
use App\Entity\AvantioAccomodations;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\DBAL\Connection;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\HshvAvantioAccomodationsRepository;
use Doctrine\ORM\Query\ResultSetMappingBuilder;

# php libraies
use DateTime;

/**
 * @extends ServiceEntityRepository<AvantioAccomodations>
 *
 * @method AvantioAccomodations|null find($id, $lockMode = null, $lockVersion = null)
 * @method AvantioAccomodations|null findOneBy(array $criteria, array $orderBy = null)
 * @method AvantioAccomodations[]    findAll()
 * @method AvantioAccomodations[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AvantioAccomodationsRepository extends ServiceEntityRepository
{
    protected $connection;

    private $em;

    private $requestStack;

    private $session;


    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack )
    {
        parent::__construct($registry, AvantioAccomodations::class);
        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;
    }


    public function getList($language)
    {

        # relation foreign key
        /*
        $sql = " SELECT aa , dt
        FROM App\Entity\AvantioAccomodations aa
        LEFT JOIN aa.dynamicRooms dt
        WHERE aa.language = $language AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' ) AND dt.language = $language AND (dt.status = 'ACTIVED' OR dt.status = 'PAUSED' ) ";


        # relation without any association
        $sql = " SELECT aa
        FROM App\Entity\AvantioAccomodations aa 
        JOIN App\Entity\DynamicRooms dt WITH aa.dynamicRooms = dt.dynamicRooms
        WHERE aa.language = $language AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' ) AND dt.language = $language AND (dt.status = 'ACTIVED' OR dt.status = 'PAUSED' ) ";
        */

        $sql = " SELECT aa
        FROM App\Entity\AvantioAccomodations aa 
        WHERE aa.language = $language AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' ) ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;

    }


    public function getListHydratation()
    {
        $sql = " SELECT aa.* , dt.*
        FROM avantio_accomodations aa
        LEFT JOIN dynamic_rooms dt  on dt.dynamic_rooms = aa.dynamic_rooms
        WHERE aa.language = 111
        AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' )
        AND dt.language = 111 AND (dt.status = 'ACTIVED' OR dt.status = 'PAUSED' ) ";
        $rsm = new ResultSetMappingBuilder($this->em, ResultSetMappingBuilder::COLUMN_RENAMING_INCREMENT);
        $rsm->addRootEntityFromClassMetadata('App\Entity\AvantioAccomodations', 'aa');
        $rsm->addJoinedEntityFromClassMetadata('App\Entity\DynamicRooms', 'dt', 'aa', 'dynamicRooms', array('dynamicRooms' => 'dynamicRooms'));
        $query = $this->em->createNativeQuery($sql, $rsm);
        $rows = $query->getResult();
    }


    public function getPropiedades($parametros)
    {
        # query mismo idioma pagina
        $language = $parametros["language"];
        $id = $parametros["id"];

        /*
        $sql = " SELECT aa.id , aa.textTitle,  dt.textareaDescription
        FROM App\Entity\AvantioAccomodations aa 
        JOIN App\Entity\DynamicRooms dt WITH aa.dynamicRooms = dt.dynamicRooms
        WHERE aa.language = $language AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' ) AND aa.id = $id AND dt.language = $language AND (dt.status = 'ACTIVED' OR dt.status = 'PAUSED' ) AND dt.id = $id ";
        */

        $sql = " SELECT aa
        FROM App\Entity\AvantioAccomodations aa 
        WHERE aa.language = $language AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' ) AND aa.id = $id ";

        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();


        /*
        $sql = " SELECT aa.* , dt.*
        FROM avantio_accomodations aa
        LEFT JOIN dynamic_rooms dt  on dt.dynamic_rooms = aa.dynamic_rooms
        WHERE aa.language = 111 AND aa.id = 371247111
        AND (aa.status = 'ACTIVED' OR aa.status = 'PAUSED' )
        AND dt.language = 111 AND (dt.status = 'ACTIVED' OR dt.status = 'PAUSED' ) ";

        $rsm = new ResultSetMappingBuilder($this->em, ResultSetMappingBuilder::COLUMN_RENAMING_INCREMENT);
        $rsm->addRootEntityFromClassMetadata('App\Entity\AvantioAccomodations', 'aa');
        $rsm->addJoinedEntityFromClassMetadata('App\Entity\DynamicRooms', 'dt', 'aa', 'dynamicRooms', array('dynamicRooms' => 'dynamicRooms'));
        $query = $this->em->createNativeQuery($sql, $rsm);
        $rows = $query->getResult();

        if (is_array($rows))
            var_dump($rows[0]);
        die();
        */

        return $rows;
    }


    public function getProperty($language)
    {

    }


    public function getFichasNuevo()
    {

        $session_lang = $this->session->get("lang");
        $session_lang_id = $this->session->get("lang_id");

        $sql = " SELECT todo.* FROM
(
SELECT haar.id , haar.hshv_avantio_accomodations ,  haar.text_title , haar.status , dt.text_title AS text_title_taxonomy , dg.text_title as locality_name , 
haar.dynamic_taxonomy , haar.number_metros_cuadrados , haar.checkbox_piscina , 1 as id_portvil , 0 AS id_avantio , haar.hshv_avantio_accomodations as union_tablas 
FROM hshv_avantio_accomodations AS haar 
LEFT JOIN dynamic_taxonomy AS dt ON dt.id = haar.dynamic_taxonomy AND dt.language = $session_lang_id 
LEFT JOIN dynamic_geolocality AS dg ON dg.id = haar.dynamic_geolocality AND dg.language = $session_lang_id
WHERE haar.language = $session_lang_id
UNION 
SELECT aa.id , aa.avantio_accomodations , aa.text_title , aa.status , dt_dos.text_title AS text_title_taxonomy , dg_dos.text_title as locality_name , 
aa.dynamic_taxonomy , aa.number_metros_cuadrados , aa.checkbox_piscina, 0 as id_portvil , 1 AS id_avantio , 0 as union_tablas
FROM avantio_accomodations AS aa 
LEFT JOIN dynamic_taxonomy AS dt_dos ON dt_dos.id = aa.dynamic_taxonomy AND dt_dos.language = $session_lang_id 
LEFT JOIN dynamic_geolocality AS dg_dos ON dg_dos.id = aa.dynamic_geolocality AND dg_dos.language = $session_lang_id
WHERE aa.language = $session_lang_id
) as todo 
GROUP BY todo.id order by text_title ";

        $resultSet = $this->connection->executeQuery($sql);
        $vector_objetos = array();

        $hshv_repository = $this->em->getRepository(HshvAvantioAccomodations::class);

        while (($row = $resultSet->fetchAssociative()) !== false) {
            # obtenemos objetos de origen
            /*
            if ($row["id_portvil"] != 1){
                $objeto = $this->findBy(array("id" => $row["id"] , "language" => $session_lang_id));
                array_push($vector_objetos,$objeto);
            }else{
                $objeto = $hshv_repository->findBy(array("id" => $row["id"] , "language" => $session_lang_id));
                array_push($vector_objetos,$objeto);
            }
            */

            $objeto = (object) $row;

            array_push($vector_objetos,$objeto);
        }


        return $vector_objetos;

    }

    

    public function save(AvantioAccomodations $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(AvantioAccomodations $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return AvantioAccomodations[] Returns an array of AvantioAccomodations objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('a.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?AvantioAccomodations
//    {
//        return $this->createQueryBuilder('a')
//            ->andWhere('a.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }


    # insertamos accommodations
    public function insertAccomodations($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
    {

        # vectores
        $replace_insert_accomodations = array();
        $replace_avantio_rooms = array();

        # languages id | nombre
        // $vector_languages = $this->createLanguageVector($languages);
        // print_r($vector_languages);


        foreach($xml->Accommodation as $accommodation){

            # situación del aalojamiento | geolocalities
            $geocountry = (intval($accommodation->LocalizationData->Country->CountryCode)) ? intval($accommodation->LocalizationData->Country->CountryCode) : 0;

            # restringimos solo por pais de España
            //if ($geocountry == 1){

            # ficha principal
            // $id = intval($accommodation->AccommodationId);
            $avantio_accomodations = intval($accommodation->AccommodationId);

            # name explode by . | , | - |  and delete it
            $name = explode('.' , (string)$accommodation->AccommodationName);
            if ($name[0])
                $text_title = $name[0];
            else
                $text_title = (string)$accommodation->AccommodationName;
            $name = explode(',' , $text_title);
            if ($name[0])
                $text_title = $name[0];
            else
                $text_title = $text_title;
            $name = explode('-' , $text_title);
            if ($name[0])
                $text_title = $name[0];
            else
                $text_title = $text_title;

            $text_referencia = intval($accommodation->AccommodationId);
            $number_unidades = intval($accommodation->AccommodationUnits);
            $text_userid = (string)$accommodation->UserId;
            $text_company = (string)$accommodation->Company;
            $number_companyid=intval($accommodation->CompanyId);
            $text_numero_registro_turistico=(string)$accommodation->TouristicRegistrationNumber;
            # ficha principal | tablas avantio
            $avantio_occupation_rules=intval($accommodation->OccupationalRuleId);
            $avantio_pricemodifiers=intval($accommodation->PriceModifierId);
            $avantio_gallery=intval($accommodation->IdGallery);
            $taxonomy=intval($accommodation->MasterKind->MasterKindCode);
            # situación del aalojamiento | geolocalities
            $geocountry = (intval($accommodation->LocalizationData->Country->CountryCode)) ? intval($accommodation->LocalizationData->Country->CountryCode) : 0;
            $georegion = (intval($accommodation->LocalizationData->Region->RegionCode)) ? intval($accommodation->LocalizationData->Region->RegionCode) : 0;
            $geocity = (intval($accommodation->LocalizationData->City->CityCode)) ? intval($accommodation->LocalizationData->City->CityCode) : 0;
            $geolocality = (intval($accommodation->LocalizationData->Locality->LocalityCode)) ? intval($accommodation->LocalizationData->Locality->LocalityCode) : 0;
            $geodistrict = (intval($accommodation->LocalizationData->District->DistrictCode)) ? intval($accommodation->LocalizationData->District->DistrictCode) : 0;
            $text_geo_cp = (intval($accommodation->LocalizationData->District->PostalCode)) ? intval($accommodation->LocalizationData->District->PostalCode) : 0;
            # no usado
            $dynamic_geoarea = intval($accommodation->LocalizationData->AreaDist->AreaCode);
            $dynamic_georesort = intval($accommodation->LocalizationData->Resort->ResortCode);
            # situación del aalojamiento | calle piso bloque
            $text_geo_tipo_calle=(string)$accommodation->LocalizationData->KindOfWay;
            $text_geo_calle=(string)$accommodation->LocalizationData->Way;
            $text_geo_numero=(string)$accommodation->LocalizationData->Number;
            $text_geo_bloque=(string)$accommodation->LocalizationData->Block;
            $text_geo_puerta=(string)$accommodation->LocalizationData->Door;
            $text_geo_piso=(string)$accommodation->LocalizationData->Floor;
            # situación del aalojamiento | geo latitud longitud
            $text_geo_latitud=(string)$accommodation->LocalizationData->GoogleMaps->Latitude;
            $text_geo_longitud=(string)$accommodation->LocalizationData->GoogleMaps->Longitude;
            $number_geo_zoom=intval($accommodation->LocalizationData->GoogleMaps->Zoom);
            # distribución
            $number_capacidad_maxima = intval($accommodation->Features->Distribution->PeopleCapacity);
            $number_capacidad_minima = intval($accommodation->Features->Distribution->MinimumOccupation);
            $checkbox_grups =((string)$accommodation->Features->Distribution->AcceptYoungsters == 'true') ? 1 : 0;
            $number_capacidad_sin_suplemento = intval($accommodation->Features->Distribution->OccupationWithoutSupplement);
            $number_metros_cuadrados_utiles = intval($accommodation->Features->Distribution->AreaHousing->Area);
            $text_metros_cuadrados_utiles_unidades = (string)$accommodation->Features->Distribution->AreaHousing->AreaUnit;
            $number_metros_cuadrados = intval($accommodation->Features->Distribution->AreaPlot->Area);
            $text_metros_cuadrados_unidades = (string)$accommodation->Features->Distribution->AreaPlot->AreaUnit;
            $checkbox_ascensor = ((string)$accommodation->Features->HouseCharacteristics->Elevator == 'true') ? 1 : 0;
            # distribución | dormitorios
            $number_habitaciones = intval($accommodation->Features->Distribution->Bedrooms);
            $number_camas_doble = intval($accommodation->Features->Distribution->DoubleBeds);
            $number_camas_individual = intval($accommodation->Features->Distribution->IndividualBeds);
            $number_sofas_cama = intval($accommodation->Features->Distribution->IndividualSofaBed);
            $number_sofas_cama_doble = intval($accommodation->Features->Distribution->DoubleSofaBed);
            $number_camas_queen = intval($accommodation->Features->Distribution->QueenBeds);
            $number_camas_king = intval($accommodation->Features->Distribution->KingBeds);
            $number_literas = intval($accommodation->Features->Distribution->Berths);
            # distribución | baños
            $number_aseos = intval($accommodation->Features->Distribution->Toilets);
            $number_banyos_banyera = intval($accommodation->Features->Distribution->BathroomWithBathtub);
            $number_banyos_ducha = intval($accommodation->Features->Distribution->BathroomWithShower);
            $checkbox_sauna = ((string)$accommodation->Features->HouseCharacteristics->Sauna == 'true') ? 1 : 0;
            $checkbox_jacuzzi = ((string)$accommodation->Features->HouseCharacteristics->Jacuzzi == 'true') ? 1 : 0;
            $checkbox_secador_pelo = ((string)$accommodation->Features->HouseCharacteristics->HairDryer == 'true') ? 1 : 0;
            # distribución | cocina
            $text_cocina_clase = (string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenClass;
            $text_cocina_tipo = (string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenType;
            $number_cocinas = intval($accommodation->Features->HouseCharacteristics->Kitchen->NumberOfKitchens);
            $checkbox_nevera = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Fridge == 'true') ? 1 : 0;
            $checkbox_congelador = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Freezer == 'true') ? 1 : 0;
            $checkbox_lavavajillas = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Dishwasher == 'true') ? 1 : 0;
            $checkbox_cafetera = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->CoffeeMachine == 'true') ? 1 : 0;
            $checkbox_freidora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Fryer == 'true') ? 1 : 0;
            $checkbox_tostadora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Toaster == 'true') ? 1 : 0;
            $checkbox_vajilla = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->TableWare == 'true') ? 1 : 0;
            $checkbox_utensilios_cocina = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenUtensils == 'true') ? 1 : 0;
            $checkbox_microondas = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Microwave == 'true') ? 1 : 0;
            $checkbox_horno = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Oven == 'true') ? 1 : 0;
            # distribución | accesorios hogar
            $checkbox_lavadora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->WashingMachine == 'true') ? 1 : 0;
            $checkbox_secadora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Dryer == 'true') ? 1 : 0;
            $checkbox_plancha = ((string)$accommodation->Features->HouseCharacteristics->Iron == 'true') ? 1 : 0;
            $checkbox_tv = ((string)$accommodation->Features->HouseCharacteristics->TV == 'true') ? 1 : 0;
            $number_televisions = intval($accommodation->Features->HouseCharacteristics->NumOfTelevisions);
            $checkbox_tv_satelite = intval($accommodation->Features->HouseCharacteristics->TVSatellite->Value);
            $number_televisions_satelite = intval($accommodation->Features->HouseCharacteristics->TVSatellite->Value);
            $checkbox_tv_satelite_english = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageEN == 'true') ? 1 : 0;
            $checkbox_tv_satelite_spanish = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageES == 'true') ? 1 : 0;
            $checkbox_tv_satelite_french = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageFR == 'true') ? 1 : 0;
            $checkbox_tv_satelite_german = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageDE == 'true') ? 1 : 0;
            $checkbox_tv_satelite_dutch = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageDU == 'true') ? 1 : 0;
            $checkbox_tv_satelite_russia = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageRU == 'true') ? 1 : 0;
            $checkbox_tv_satelite_norwegian = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageNO == 'true') ? 1 : 0;
            $checkbox_tv_satelite_swedish = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageSV == 'true') ? 1 : 0;
            $number_apartados_electricos_anti_mosquitos = intval($accommodation->Features->HouseCharacteristics->NumOfElectronicMosquitoRepeller);
            $checkbox_caja_seguridad = ((string)$accommodation->Features->HouseCharacteristics->SecurityBox == 'true') ? 1 :0;
            $checkbox_minibar = ( (string)$accommodation->Features->HouseCharacteristics->MiniBar == 'true') ? 1 : 0;
            $number_fun = intval($accommodation->Features->HouseCharacteristics->NumOfFans);
            $checkbox_piscina = isset($accommodation->Features->HouseCharacteristics->SwimmingPool) ? 1 : 0;
            $text_dimensiones_piscina = isset($accommodation->Features->HouseCharacteristics->SwimmingPool->Dimensions) ? $accommodation->Features->HouseCharacteristics->SwimmingPool->Dimensions : "";
            $checkbox_jardin=((string)$accommodation->Features->HouseCharacteristics->Garden == 'true')?1:0;
            $checkbox_muebles_jardin=((string)$accommodation->Features->HouseCharacteristics->GardenFurniture == 'true')?1:0;
            $checkbox_chimenea=((string)$accommodation->Features->HouseCharacteristics->FirePlace == 'true')?1:0;
            $checkbox_barbacoa=((string)$accommodation->Features->HouseCharacteristics->Barbacue == 'true')?1:0;
            $checkbox_radio=((string)$accommodation->Features->HouseCharacteristics->Radio == 'true')?1:0;
            $checkbox_terraza=((string)$accommodation->Features->HouseCharacteristics->Terrace == 'true')?1:0;
            $checkbox_parcela_vallada=((string)$accommodation->Features->HouseCharacteristics->FencedPlot == 'true')?1:0;
            $checkbox_dvd=((string)$accommodation->Features->HouseCharacteristics->DVD == 'true')?1:0;
            $checkbox_balcon=((string)$accommodation->Features->HouseCharacteristics->Balcony == 'true')?1:0;
            $checkbox_exprimidor=((string)$accommodation->Features->HouseCharacteristics->JuiceSqueazer == 'true')?1:0;
            $checkbox_hervidor_electrico=((string)$accommodation->Features->HouseCharacteristics->ElectricKettle == 'true')?1:0;
            $checkbox_zona_ninos=((string)$accommodation->Features->HouseCharacteristics->ChildrenArea == 'true')?1:0;
            $checkbox_gimnasio=((string)$accommodation->Features->HouseCharacteristics->Gym == 'true')?1:0;
            $checkbox_alarma=((string)$accommodation->Features->HouseCharacteristics->Alarm == 'true')?1:0;
            $checkbox_tennis=((string)$accommodation->Features->HouseCharacteristics->Tennis == 'true')?1:0;
            $checkbox_squash=((string)$accommodation->Features->HouseCharacteristics->Squash == 'true')?1:0;
            $checkbox_paddel=((string)$accommodation->Features->HouseCharacteristics->Paddel == 'true')?1:0;
            $checkbox_apta_discapacitados=((string)$accommodation->Features->HouseCharacteristics->HandicappedFacilities == 'apta-discapacitados')?1:0;
            // $checkbox_fumadores=((string)$accommodation->Features->HouseCharacteristics->SmokingAllowed == 'true')?1:0;
            # tipo piscina
            $text_tipo_piscina =(string)$accommodation->Features->HouseCharacteristics->SwimmingPool->PoolType;
            $text_tipo_piscina =(strlen($text_tipo_piscina)==0) ? 'comunitaria' : $text_tipo_piscina;
            $text_tipo_piscina = ($checkbox_piscina) ? $text_tipo_piscina: '';

            // status
            $status = "ACTIVED";

            # fecha
            $fecha_actual = new DateTime();
            $fecha_actual_string = $fecha_actual->format("Y-m-d H:i:s");

            foreach($languages as $key_lang => $language) {

                # guardamos id + language
                $id = intval($accommodation->AccommodationId) . $key_lang;
                $id_lang = $key_lang;
                echo "id_lang: " . $id_lang . "\n";

                # situación del aalojamiento | geolocalities
                $dynamic_geocountry = $geocountry . $id_lang;
                $dynamic_georegion = $georegion . $id_lang;
                $dynamic_geocity = $geocity . $id_lang;
                $dynamic_geolocality = $geolocality . $id_lang;
                $dynamic_geodistrict = $geodistrict . $id_lang;
                $dynamic_taxonomy = $id_lang;

                $dynamic_taxonomy = $taxonomy . $id_lang;


                # avantio_accomodations
                # avantio_occupation_rules,avantio_pricemodifiers,avantio_gallery,

                $replace_insert_accomodations[] = " REPLACE INTO avantio_accomodations (id,avantio_accomodations,dynamic_rooms,avantio_accomodations_extras,avantio_accomodations_locations,avantio_accomodations_nearest_places,language,text_title,text_referencia,text_numero_registro_turistico,
                        avantio_availabilities,avantio_rates,avantio_occupation_rules,avantio_pricemodifiers,dynamic_taxonomy, dynamic_geocountry,dynamic_georegion,dynamic_geocity,
                        dynamic_geolocality,avantio_accomodations_pictures, dynamic_geodistrict,text_geo_cp , text_geo_calle,text_geo_numero,
                        text_geo_bloque,text_geo_puerta,text_geo_piso,text_geo_latitud,
                        text_geo_longitud,number_geo_zoom,number_unidades,number_capacidad_maxima,
                        number_capacidad_minima,number_capacidad_sin_suplemento,number_habitaciones,number_camas_doble, number_camas_queen , number_camas_king ,
                        number_camas_individual,number_sofas_cama,number_sofas_cama_doble,number_literas,
                        number_aseos, number_banyos_banyera,number_banyos_ducha,number_metros_cuadrados,number_metros_cuadrados_utiles,
                        number_cocinas,number_fun, checkbox_piscina,text_dimensiones_piscina,checkbox_grups,checkbox_tv,checkbox_jardin,checkbox_muebles_jardin,
                        checkbox_plancha,checkbox_chimenea,checkbox_barbacoa,checkbox_radio,
                        checkbox_minibar,checkbox_terraza,checkbox_parcela_vallada,checkbox_caja_seguridad,
                        checkbox_ascensor,checkbox_dvd,checkbox_balcon,checkbox_exprimidor,
                        checkbox_hervidor_electrico,checkbox_secador_pelo,checkbox_zona_ninos,checkbox_gimnasio,
                        checkbox_alarma,checkbox_tennis,checkbox_squash,checkbox_paddel,
                        checkbox_sauna,checkbox_jacuzzi,checkbox_apta_discapacitados,
                        checkbox_nevera,checkbox_congelador,
                        checkbox_lavavajillas,checkbox_lavadora,checkbox_secadora,checkbox_cafetera,
                        checkbox_tostadora,checkbox_microondas,checkbox_horno,checkbox_vajilla,
                        checkbox_utensilios_cocina,text_userid,text_company,number_companyid,
                        text_tipo_piscina,id_avantio,status , update_at) VALUES ('" . $id . "', '" . $avantio_accomodations . "' , '" . $avantio_accomodations . "' , '" . $avantio_accomodations . "' , '" . $avantio_accomodations . "', '" . $avantio_accomodations . "' ,   '" . addslashes($id_lang) . "', '" . addslashes($text_title) . "','" . addslashes($text_referencia) . "','" . addslashes($text_numero_registro_turistico) . "',
                        '" . $avantio_accomodations . "' , '" . $avantio_accomodations . "' , '" . $avantio_occupation_rules . "' , '" . $avantio_pricemodifiers . "' , '" . addslashes($dynamic_taxonomy) . "',
                        '" . addslashes($dynamic_geocountry) . "','" . addslashes($dynamic_georegion) . "','" . addslashes($dynamic_geocity) . "','" . addslashes($dynamic_geolocality) . "', '" . addslashes($avantio_accomodations) . "' ,
                        '" . addslashes($dynamic_geodistrict) . "', '" . addslashes($text_geo_cp) . "', '" . addslashes($text_geo_calle) . "','" . addslashes($text_geo_numero) . "',
                        '" . addslashes($text_geo_bloque) . "','" . addslashes($text_geo_puerta) . "','" . addslashes($text_geo_piso) . "','" . addslashes($text_geo_latitud) . "',
                        '" . addslashes($text_geo_longitud) . "','" . addslashes($number_geo_zoom) . "','" . addslashes($number_unidades) . "','" . addslashes($number_capacidad_maxima) . "',
                        '" . addslashes($number_capacidad_minima) . "','" . addslashes($number_capacidad_sin_suplemento) . "', '" . addslashes($number_habitaciones) . "','" . addslashes($number_camas_doble) . "',
                        '" . addslashes($number_camas_individual) . "', '" . addslashes($number_sofas_cama) . "','" . addslashes($number_sofas_cama_doble) . "','" . addslashes($number_literas) . "', '" . addslashes($number_camas_queen) . "' , '" . addslashes($number_camas_king) . "',
                        '" . addslashes($number_aseos) . "', '" . addslashes($number_banyos_banyera) . "','" . addslashes($number_banyos_ducha) . "','" . addslashes($number_metros_cuadrados) . "','" . addslashes($number_metros_cuadrados_utiles) . "',
                        '" . addslashes($number_cocinas) . "' , '" . addslashes($number_fun) . "' , '" . addslashes($checkbox_piscina) . "',  '" . addslashes($text_dimensiones_piscina) . "' , '" . addslashes($checkbox_grups) . "','" . addslashes($checkbox_tv) . "',
                        '" . addslashes($checkbox_jardin) . "','" . addslashes($checkbox_muebles_jardin) . "', '" . addslashes($checkbox_plancha) . "','" . addslashes($checkbox_chimenea) . "','" . addslashes($checkbox_barbacoa) . "',
                        '" . addslashes($checkbox_radio) . "', '" . addslashes($checkbox_minibar) . "','" . addslashes($checkbox_terraza) . "','" . addslashes($checkbox_parcela_vallada) . "','" . addslashes($checkbox_caja_seguridad) . "',
                        '" . addslashes($checkbox_ascensor) . "','" . addslashes($checkbox_dvd) . "','" . addslashes($checkbox_balcon) . "','" . addslashes($checkbox_exprimidor) . "',
                        '" . addslashes($checkbox_hervidor_electrico) . "','" . addslashes($checkbox_secador_pelo) . "','" . addslashes($checkbox_zona_ninos) . "','" . addslashes($checkbox_gimnasio) . "',
                        '" . addslashes($checkbox_alarma) . "','" . addslashes($checkbox_tennis) . "','" . addslashes($checkbox_squash) . "','" . addslashes($checkbox_paddel) . "',
                        '" . addslashes($checkbox_sauna) . "','" . addslashes($checkbox_jacuzzi) . "','" . addslashes($checkbox_apta_discapacitados) . "',
                        '" . addslashes($checkbox_nevera) . "','" . addslashes($checkbox_congelador) . "',
                        '" . addslashes($checkbox_lavavajillas) . "','" . addslashes($checkbox_lavadora) . "','" . addslashes($checkbox_secadora) . "','" . addslashes($checkbox_cafetera) . "',
                        '" . addslashes($checkbox_tostadora) . "','" . addslashes($checkbox_microondas) . "','" . addslashes($checkbox_horno) . "','" . addslashes($checkbox_vajilla) . "',
                        '" . addslashes($checkbox_utensilios_cocina) . "','" . addslashes($text_userid) . "','" . addslashes($text_company) . "','" . addslashes($number_companyid) . "',
                        '" . addslashes($text_tipo_piscina) . "' , '1' ,'" . addslashes($status) . "' , '" . addslashes($fecha_actual_string) . "') ";

                # dynamic_rooms
                $replace_avantio_rooms[] = " REPLACE INTO dynamic_rooms (id,dynamic_rooms,language,text_title,auto_slug,status,id_avantio,update_at) VALUES  (".$id.", '" . $avantio_accomodations . "' , '".$id_lang."','".addslashes($text_title)."','".url_semantica($text_title)."','ACTIVED',1 , '".$fecha_actual_string."') ";

            } // end foreach languages

            // } // restricción por pais

        } // end foreach accommodations

        # execute avantio_accomodations
        foreach($replace_insert_accomodations as $accomodation){
            $count = $this->connection->executeStatement($accomodation);
        }

        # execute dynamic_rooms
        foreach($replace_avantio_rooms as $accomodation){
            $count = $this->connection->executeStatement($accomodation);
        }


        # extras
        $replace_special = array();
        $replace_common = array();
        $counter = 0;
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations = intval($accommodation->AccommodationId);
            # special service
            if (!$accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService) continue;
            foreach($accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService as $service){
                $dynamic_services = intval($service->Code);
                $checkbox_included = ((string)$service->IncludedInPrice == 'true') ? 1 : 0;
                $price = intval($service->AdditionalPrice->Quantity);
                $price_unit = (string)$service->AdditionalPrice->Unit;
                $price_children = intval($service->AdditionalPriceChildren->Quantity);
                $price_children_unit = ($price_children > 0) ? (string)$service->AdditionalPriceChildren->Unit : 'RESERVA';
                $checkbox_pago_en_reserva = ((string)$service->PayTime=='LLEGADA') ? 0 : 1;
                $checkbox_opcional = ((string)$service->Application=='OPCIONAL') ? 1 : 0;
                $text_type = (string)$service->Type;
                $text_parking_location = (string)$service->ParkingLocation;
                $number_limit_weight = (string)$service->LimitWeight;
                $replace_special[] = "REPLACE INTO avantio_accomodations_extras(id,avantio_accomodations,dynamic_services,checkbox_included,price, price_unit,price_children,price_children_unit,checkbox_pago_en_reserva, checkbox_opcional,text_type,text_parking_location,number_limit_weight)  
VALUES ('". addslashes($counter) . "' , '" . addslashes($avantio_accomodations) . "' , '" . addslashes($dynamic_services) . "' , '" . addslashes($checkbox_included) . "' , '" . addslashes($price) . "'
, '" . addslashes($price_unit) . "', '" . addslashes($price_children) . "' , '" . addslashes($price_children_unit) . "' , '" . addslashes($checkbox_pago_en_reserva) . "' , '" . addslashes($checkbox_opcional) . "'  
,'".addslashes($text_type)."' ,'".addslashes($text_parking_location)."' ,'".intval($number_limit_weight)."' ) ";
                $counter++;
            } // emd foreach special services
            # common services
            if (!$accommodation->Features->ExtrasAndServices->CommonServices->CommonService) continue;
            foreach($accommodation->Features->ExtrasAndServices->CommonServices->CommonService as $service){
                $dynamic_services=intval($service->Code);
                $checkbox_included=((string)$service->IncludedInPrice == 'true')?1:0;
                $price=intval($service->AdditionalPrice->Quantity);
                $price_unit=(string)$service->AdditionalPrice->Unit;
                $price_children=intval($service->AdditionalPriceChildren->Quantity);
                $price_children_unit=($price_children > 0) ? (string)$service->AdditionalPriceChildren->Unit : 'RESERVA';
                $checkbox_pago_en_reserva=((string)$service->PayTime=='LLEGADA')?0:1;
                $checkbox_opcional=((string)$service->Application=='OPCIONAL')?1:0;
                $text_type=(string)$service->Type;
                $text_parking_location=(string)$service->ParkingLocation;
                $number_limit_weight=(string)$service->LimitWeight;
                $replace_common[] = " REPLACE INTO avantio_accomodations_extras(id,avantio_accomodations,dynamic_services,checkbox_included,price, price_unit,price_children,price_children_unit,checkbox_pago_en_reserva, checkbox_opcional,text_type,text_parking_location,number_limit_weight)  
VALUES ('". addslashes($counter) . "' , '" . addslashes($avantio_accomodations) . "' , '" . addslashes($dynamic_services) . "' , '" . addslashes($checkbox_included) . "' , '" . addslashes($price) . "'
, '" . addslashes($price_unit) . "', '" . addslashes($price_children) . "' , '" . addslashes($price_children_unit) . "' , '" . addslashes($checkbox_pago_en_reserva) . "' , '" . addslashes($checkbox_opcional) . "'  
,'".addslashes($text_type)."' ,'".addslashes($text_parking_location)."' ,'".intval($number_limit_weight)."' ) ";
                $counter++;
            } // end foreach special service
        } // end foreach accomodation

        # special
        if(!empty($replace_special)){
            foreach ($replace_special as $sql) {
                $count = $this->connection->executeStatement($sql);
            }
        }

        # special
        if(!empty($replace_common)){
            foreach ($replace_common as $sql) {
                $count = $this->connection->executeStatement($sql);
            }
        }


        # locations
        $replace = array();
        $counter = 0;
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations = intval($accommodation->AccommodationId);
            $text_title = $accommodation->AccommodationName;
            $loc_where=(string)$accommodation->Features->Location->LocationDescription->Where;
            $loc_howto=(string)$accommodation->Features->Location->LocationDescription->Howto;
            $loc_desc1=(string)$accommodation->Features->Location->LocationDescription->Description1;
            $loc_desc2=(string)$accommodation->Features->Location->LocationDescription->Description2;
            $beach_name=(string)$accommodation->Features->Location->LocationDistances->BeachDistance->Name;
            $beach_dist=floatval($accommodation->Features->Location->LocationDistances->BeachDistance->Value);
            $beach_unit=(string)$accommodation->Features->Location->LocationDistances->BeachDistance->Unit;
            //$beach_dist=(strtoupper($beach_unit)=='KM')? intval( 1000*$beach_dist ) : intval($beach_dist);
            $golf_name=(string)$accommodation->Features->Location->LocationDistances->GolfDistance->Name;
            $golf_dist=floatval($accommodation->Features->Location->LocationDistances->GolfDistance->Value);
            $golf_unit=(string)$accommodation->Features->Location->LocationDistances->GolfDistance->Unit;
            //$golf_dist=(strtoupper($golf_unit)=='KM')? intval( 1000*$golf_dist ) : intval($golf_dist);
            $city_name=(string)$accommodation->Features->Location->LocationDistances->CityDistance->Name;
            $city_dist=floatval($accommodation->Features->Location->LocationDistances->CityDistance->Value);
            $city_unit=(string)$accommodation->Features->Location->LocationDistances->CityDistance->Unit;
            //$city_dist=(strtoupper($city_unit)=='KM')? intval( 1000*$city_dist ) : intval($city_dist);
            $super_name=(string)$accommodation->Features->Location->LocationDistances->SuperMarketDistance->Name;
            $super_dist=floatval($accommodation->Features->Location->LocationDistances->SuperMarketDistance->Value);
            $super_unit=(string)$accommodation->Features->Location->LocationDistances->SuperMarketDistance->Unit;
            //$super_dist=(strtoupper($super_unit)=='KM')? intval( 1000*$super_dist ) : intval($super_dist);
            $airport_name=(string)$accommodation->Features->Location->LocationDistances->AirportDistance->Name;
            $airport_dist=floatval($accommodation->Features->Location->LocationDistances->AirportDistance->Value);
            $airport_unit=(string)$accommodation->Features->Location->LocationDistances->AirportDistance->Unit;
            //$airport_dist=(strtoupper($airport_unit)=='KM')? intval( 1000*$airport_dist ) : intval($airport_dist);
            $train_name=(string)$accommodation->Features->Location->LocationDistances->TrainStationDistance->Name;
            $train_dist=floatval($accommodation->Features->Location->LocationDistances->TrainStationDistance->Value);
            $train_unit=(string)$accommodation->Features->Location->LocationDistances->TrainStationDistance->Unit;
            //$train_dist=(strtoupper($train_unit)=='KM')? intval( 1000*$train_dist ) : intval($train_dist);
            $bus_name=(string)$accommodation->Features->Location->LocationDistances->StopBusDistance->Name;
            $bus_dist=floatval($accommodation->Features->Location->LocationDistances->StopBusDistance->Value);
            $bus_unit=(string)$accommodation->Features->Location->LocationDistances->StopBusDistance->Unit;
            //$bus_dist=(strtoupper($bus_unit)=='KM')? intval( 1000*$bus_dist ) : intval($bus_dist);
            $view_to_beach=( (string)$accommodation->Features->Location->LocationViews->ViewToBeach == 'true' ) ? 1:0;
            $view_to_swimming_pool=( (string)$accommodation->Features->Location->LocationViews->ViewToSwimmingPool == 'true' ) ? 1:0;
            $view_to_golf=( (string)$accommodation->Features->Location->LocationViews->ViewToGolf == 'true' ) ? 1:0;
            $view_to_garden=( (string)$accommodation->Features->Location->LocationViews->ViewToGarden == 'true' ) ? 1:0;
            $view_to_river=( (string)$accommodation->Features->Location->LocationViews->ViewToRiver == 'true' ) ? 1:0;
            $view_to_mountain=( (string)$accommodation->Features->Location->LocationViews->ViewToMountain == 'true' ) ? 1:0;
            $view_to_lake=( (string)$accommodation->Features->Location->LocationViews->ViewToLake == 'true' ) ? 1:0;
            $first_line_beach=( (string)$accommodation->Features->Location->FirstBeachLine == 'true' ) ? 1:0;
            $first_line_golf=( (string)$accommodation->Features->Location->FirstGolfLine == 'true' ) ? 1:0;
            $replace[] = " REPLACE INTO avantio_accomodations_locations (id,avantio_accomodations,text_title,text_loc_where,text_loc_howto,text_loc_desc1,text_loc_desc2,
                    text_beach_name,number_beach_dist,text_beach_dist_unit, text_golf_name , number_golf_dist , text_golf_dist_unit,
                    text_city_name,number_city_dist,text_city_dist_unit,text_super_name,number_super_dist,text_super_dist_unit,
                    text_airport_name,number_airport_dist,text_airport_dist_unit,text_train_name,number_train_dist,text_train_dist_unit,
                    text_bus_name,number_bus_dist,text_bus_dist_unit,checkbox_view_to_beach,checkbox_view_to_swimming_pool,
                    checkbox_view_to_golf,checkbox_view_to_garden,checkbox_view_to_river,checkbox_view_to_mountain,
                    checkbox_view_to_lake,checkbox_first_line_beach,checkbox_first_line_golf, id_avantio , position) VALUES  ('".$counter."','".$avantio_accomodations."', '".addslashes($text_title)."' , 
                    '".addslashes($loc_where)."','".addslashes($loc_howto)."','".addslashes($loc_desc1)."','".addslashes($loc_desc2)."',
                    '".addslashes($beach_name)."' ,'".addslashes($beach_dist)."','".addslashes($beach_unit)."','".addslashes($golf_name)."','".addslashes($golf_dist)."','".addslashes($golf_unit)."',
                    '".addslashes($city_name)."','".addslashes($city_dist)."','".addslashes($city_unit)."','".addslashes($super_name)."','".addslashes($super_dist)."','".addslashes($super_unit)."',
                    '".addslashes($airport_name)."','".addslashes($airport_dist)."', '".addslashes($airport_unit)."', '".addslashes($train_name)."','".addslashes($train_dist)."',
                    '".addslashes($train_unit)."', '".addslashes($bus_name)."','".addslashes($bus_dist)."','".addslashes($bus_unit)."','".intval($view_to_beach)."','".intval($view_to_swimming_pool)."',
                    '".intval($view_to_golf)."','".intval($view_to_garden)."','".intval($view_to_river)."','".intval($view_to_mountain)."',
                    '".intval($view_to_lake)."','".intval($first_line_beach)."','".intval($first_line_golf)."' , 1, 0 )";
            $counter++;
        } // end foreach locations

        if(!empty($replace)){
            foreach ($replace as $sql) {
                $count = $this->connection->executeStatement($sql);
            }
        }

        # nearest place
        $replace = array();
        $counter = 0;
        $anyo_actual = intval(date("Y"));
        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations = intval($accommodation->AccommodationId);
            if (!$accommodation->Features->Location->NearestPlaces->NearestPlace) continue;
            foreach($accommodation->Features->Location->NearestPlaces->NearestPlace as $place){
                $place_type = (string)$place->PlaceType;
                $place_name = (string)$place->Name;
                $distance = floatval($place->Value);
                $place_unit = (string)$place->Unit;
                // $distance = (strtoupper($place_unit)=='KM')? intval( 1000*$distance ) : intval($distance);
                $replace[] = "REPLACE INTO avantio_accomodations_nearest_places(id,avantio_accomodations,place_type,place_name,distance,dist_unit) VALUES ('".$counter."' , '".$avantio_accomodations."' , '".addslashes($place_type)."','".addslashes($place_name)."','".intval($distance)."' ,'".addslashes($place_unit)."') ";
                $counter++;
            }
        }

        if(!empty($replace)){
            foreach ($replace as $sql){
                $count = $this->connection->executeStatement($sql);
            }
        }

    } // end function


    private function createLanguageVector($languages)
    {
        $vector_languages = array();

        foreach ($languages as $language) {
            $vector_languages[$language->getId()] = $language->getLanguage();
        }

        return $vector_languages;
    }


    public function insertAccomodationsOld($xml,$avantio_credentials,$ts,$ts_referencia,$actived_languages_id,$actived_languages)
    {

        # check foreign keys
        $sql = " SET FOREIGN_KEY_CHECKS=0; ";
        $count = $this->connection->executeStatement($sql);

        // $sql = " ALTER TABLE dynamic_rooms DROP FOREIGN KEY FK_DBD743EDEDB3F304 ";
        // $sql = " DROP INDEX UNIQ_DBD743EDEDB3F304 ON dynamic_rooms ";
        // $count = $this->connection->executeStatement($sql);

        $sql = " DROP TABLE IF EXISTS avantio_accomodations_tmp ";
        $count = $this->connection->executeStatement($sql);
        // echo $count; // 1

        //$sql = " DROP TABLE IF EXISTS avantio_inmovilla ";
        //$count = $this->connection->executeStatement($sql);
        // echo $count; // 1

        $sql = "CREATE TABLE avantio_accomodations_tmp LIKE avantio_accomodations";
        $count = $this->connection->executeStatement($sql);

        //$sql = "CREATE TABLE avantio_inmovilla LIKE avantio_accomodations";
        //$count = $this->connection->executeStatement($sql);

        // $sql = " ALTER TABLE dynamic_rooms ADD UNIQUE INDEX 'FK_DBD743EDEDB3F304' avantio_inmovilla  DROP FOREIGN KEY ";
        // $sql = " CREATE UNIQUE INDEX UNIQ_DBD743EDEDB3F304 ON dynamic_rooms(avantio_inmovilla) using BTREE ";
        // UNIQUE INDEX `UNIQ_DBD743EDEDB3F304` (`avantio_inmovilla`) USING BTREE,
        // $count = $this->connection->executeStatement($sql);

        $inserts = array();
        $anyo_actual = intval(date("Y"));

        # array
        $inserts_json = array();
        $cadena_json  = '[';
        $vector_json  = array();

        //echo "escribimos xml";
        //print_r($xml);

        # counter
        $counter = 1;
        foreach($xml->Accommodation as $accommodation){
            //print_r($accommodation);
            # ficha principal
            $id = intval($accommodation->AccommodationId);
            # name explode by . | , | - |  and delete it
            $name = explode('.' , (string)$accommodation->AccommodationName);
            if ($name[0])
                $text_title = $name[0];
            else
                $text_title = (string)$accommodation->AccommodationName;
            $name = explode(',' , $text_title);
            if ($name[0])
                $text_title = $name[0];
            else
                $text_title = $text_title;
            $name = explode('-' , $text_title);
            if ($name[0])
                $text_title = $name[0];
            else
                $text_title = $text_title;

            $text_referencia = $id;
            $number_unidades = intval($accommodation->AccommodationUnits);
            $text_userid = (string)$accommodation->UserId;
            $text_company = (string)$accommodation->Company;
            $number_companyid=intval($accommodation->CompanyId);
            $text_numero_registro_turistico=(string)$accommodation->TouristicRegistrationNumber;
            # ficha principal | tablas avantio
            $avantio_occupation_rules = intval($accommodation->OccupationalRuleId);
            $avantio_pricemodifiers = intval($accommodation->PriceModifierId);
            $avantio_gallery = intval($accommodation->IdGallery);
            $dynamic_taxonomy = intval($accommodation->MasterKind->MasterKindCode);
            # situación del aalojamiento | geolocalities
            $dynamic_geocountry = (intval($accommodation->LocalizationData->Country->CountryCode)) ? intval($accommodation->LocalizationData->Country->CountryCode) : 0;
            $dynamic_georegion = (intval($accommodation->LocalizationData->Region->RegionCode)) ? intval($accommodation->LocalizationData->Region->RegionCode) : 0;
            $dynamic_geocity = (intval($accommodation->LocalizationData->City->CityCode)) ? intval($accommodation->LocalizationData->City->CityCode) : 0;
            $dynamic_geolocality = (intval($accommodation->LocalizationData->Locality->LocalityCode)) ? intval($accommodation->LocalizationData->Locality->LocalityCode) : 0;
            $dynamic_geodistrict = (intval($accommodation->LocalizationData->District->DistrictCode)) ? intval($accommodation->LocalizationData->District->DistrictCode) : 0;
            $text_geo_cp = (intval($accommodation->LocalizationData->District->PostalCode)) ? intval($accommodation->LocalizationData->District->PostalCode) : 0;
            # no usado
            $dynamic_geoarea = intval($accommodation->LocalizationData->AreaDist->AreaCode);
            $dynamic_georesort = intval($accommodation->LocalizationData->Resort->ResortCode);
            # situación del aalojamiento | calle piso bloque
            $text_geo_tipo_calle=(string)$accommodation->LocalizationData->KindOfWay;
            $text_geo_calle=(string)$accommodation->LocalizationData->Way;
            $text_geo_numero=(string)$accommodation->LocalizationData->Number;
            $text_geo_bloque=(string)$accommodation->LocalizationData->Block;
            $text_geo_puerta=(string)$accommodation->LocalizationData->Door;
            $text_geo_piso=(string)$accommodation->LocalizationData->Floor;
            # situación del aalojamiento | geo latitud longitud
            $text_geo_latitud=(string)$accommodation->LocalizationData->GoogleMaps->Latitude;
            $text_geo_longitud=(string)$accommodation->LocalizationData->GoogleMaps->Longitude;
            $number_geo_zoom=intval($accommodation->LocalizationData->GoogleMaps->Zoom);
            # distribución
            $number_capacidad_maxima = intval($accommodation->Features->Distribution->PeopleCapacity);
            $number_capacidad_minima = intval($accommodation->Features->Distribution->MinimumOccupation);
            $checkbox_grups =((string)$accommodation->Features->Distribution->AcceptYoungsters == 'true') ? 1 : 0;
            $number_capacidad_sin_suplemento = intval($accommodation->Features->Distribution->OccupationWithoutSupplement);
            $number_metros_cuadrados_utiles = intval($accommodation->Features->Distribution->AreaHousing->Area);
            $text_metros_cuadrados_utiles_unidades = (string)$accommodation->Features->Distribution->AreaHousing->AreaUnit;
            $number_metros_cuadrados = intval($accommodation->Features->Distribution->AreaPlot->Area);
            $text_metros_cuadrados_unidades = (string)$accommodation->Features->Distribution->AreaPlot->AreaUnit;
            $checkbox_ascensor = ((string)$accommodation->Features->HouseCharacteristics->Elevator == 'true') ? 1 : 0;
            # distribución | dormitorios
            $number_habitaciones = intval($accommodation->Features->Distribution->Bedrooms);
            $number_camas_doble = intval($accommodation->Features->Distribution->DoubleBeds);
            $number_camas_individual = intval($accommodation->Features->Distribution->IndividualBeds);
            $number_sofas_cama = intval($accommodation->Features->Distribution->IndividualSofaBed);
            $number_sofas_cama_doble = intval($accommodation->Features->Distribution->DoubleSofaBed);
            $number_camas_queen = intval($accommodation->Features->Distribution->QueenBeds);
            $number_camas_king = intval($accommodation->Features->Distribution->KingBeds);
            $number_literas = intval($accommodation->Features->Distribution->Berths);
            # distribución | baños
            $number_aseos = intval($accommodation->Features->Distribution->Toilets);
            $number_banyos_banyera = intval($accommodation->Features->Distribution->BathroomWithBathtub);
            $number_banyos_ducha = intval($accommodation->Features->Distribution->BathroomWithShower);
            $checkbox_sauna = ((string)$accommodation->Features->HouseCharacteristics->Sauna == 'true') ? 1 : 0;
            $checkbox_jacuzzi = ((string)$accommodation->Features->HouseCharacteristics->Jacuzzi == 'true') ? 1 : 0;
            $checkbox_secador_pelo = ((string)$accommodation->Features->HouseCharacteristics->HairDryer == 'true') ? 1 : 0;
            # distribución | cocina
            $text_cocina_clase = (string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenClass;
            $text_cocina_tipo = (string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenType;
            $number_cocinas = intval($accommodation->Features->HouseCharacteristics->Kitchen->NumberOfKitchens);
            $checkbox_nevera = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Fridge == 'true') ? 1 : 0;
            $checkbox_congelador = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Freezer == 'true') ? 1 : 0;
            $checkbox_lavavajillas = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Dishwasher == 'true') ? 1 : 0;
            $checkbox_cafetera = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->CoffeeMachine == 'true') ? 1 : 0;
            $checkbox_freidora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Fryer == 'true') ? 1 : 0;
            $checkbox_tostadora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Toaster == 'true') ? 1 : 0;
            $checkbox_vajilla = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->TableWare == 'true') ? 1 : 0;
            $checkbox_utensilios_cocina = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->KitchenUtensils == 'true') ? 1 : 0;
            $checkbox_microondas = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Microwave == 'true') ? 1 : 0;
            $checkbox_horno = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Oven == 'true') ? 1 : 0;
            # distribución | accesorios hogar
            $checkbox_lavadora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->WashingMachine == 'true') ? 1 : 0;
            $checkbox_secadora = ((string)$accommodation->Features->HouseCharacteristics->Kitchen->Dryer == 'true') ? 1 : 0;
            $checkbox_plancha = ((string)$accommodation->Features->HouseCharacteristics->Iron == 'true') ? 1 : 0;
            $checkbox_tv = ((string)$accommodation->Features->HouseCharacteristics->TV == 'true') ? 1 : 0;
            $number_televisions = intval($accommodation->Features->HouseCharacteristics->NumOfTelevisions);
            $checkbox_tv_satelite = intval($accommodation->Features->HouseCharacteristics->TVSatellite->Value);
            $number_televisions_satelite = intval($accommodation->Features->HouseCharacteristics->TVSatellite->Value);
            $checkbox_tv_satelite_english = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageEN == 'true') ? 1 : 0;
            $checkbox_tv_satelite_spanish = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageES == 'true') ? 1 : 0;
            $checkbox_tv_satelite_french = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageFR == 'true') ? 1 : 0;
            $checkbox_tv_satelite_german = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageDE == 'true') ? 1 : 0;
            $checkbox_tv_satelite_dutch = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageDU == 'true') ? 1 : 0;
            $checkbox_tv_satelite_russia = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageRU == 'true') ? 1 : 0;
            $checkbox_tv_satelite_norwegian = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageNO == 'true') ? 1 : 0;
            $checkbox_tv_satelite_swedish = ((string)$accommodation->Features->HouseCharacteristics->TVSatellite->LanguageSV == 'true') ? 1 : 0;
            $number_apartados_electricos_anti_mosquitos = intval($accommodation->Features->HouseCharacteristics->NumOfElectronicMosquitoRepeller);
            $checkbox_caja_seguridad = ((string)$accommodation->Features->HouseCharacteristics->SecurityBox == 'true') ? 1 :0;
            $checkbox_minibar = ( (string)$accommodation->Features->HouseCharacteristics->MiniBar == 'true') ? 1 : 0;
            $number_fun = intval($accommodation->Features->HouseCharacteristics->NumOfFans);
            $checkbox_piscina = isset($accommodation->Features->HouseCharacteristics->SwimmingPool) ? 1 : 0;
            $text_dimensiones_piscina = isset($accommodation->Features->HouseCharacteristics->SwimmingPool->Dimensions) ? $accommodation->Features->HouseCharacteristics->SwimmingPool->Dimensions : "";
            $checkbox_jardin=((string)$accommodation->Features->HouseCharacteristics->Garden == 'true')?1:0;
            $checkbox_muebles_jardin=((string)$accommodation->Features->HouseCharacteristics->GardenFurniture == 'true')?1:0;
            $checkbox_chimenea=((string)$accommodation->Features->HouseCharacteristics->FirePlace == 'true')?1:0;
            $checkbox_barbacoa=((string)$accommodation->Features->HouseCharacteristics->Barbacue == 'true')?1:0;
            $checkbox_radio=((string)$accommodation->Features->HouseCharacteristics->Radio == 'true')?1:0;
            $checkbox_terraza=((string)$accommodation->Features->HouseCharacteristics->Terrace == 'true')?1:0;
            $checkbox_parcela_vallada=((string)$accommodation->Features->HouseCharacteristics->FencedPlot == 'true')?1:0;
            $checkbox_dvd=((string)$accommodation->Features->HouseCharacteristics->DVD == 'true')?1:0;
            $checkbox_balcon=((string)$accommodation->Features->HouseCharacteristics->Balcony == 'true')?1:0;
            $checkbox_exprimidor=((string)$accommodation->Features->HouseCharacteristics->JuiceSqueazer == 'true')?1:0;
            $checkbox_hervidor_electrico=((string)$accommodation->Features->HouseCharacteristics->ElectricKettle == 'true')?1:0;
            $checkbox_zona_ninos=((string)$accommodation->Features->HouseCharacteristics->ChildrenArea == 'true')?1:0;
            $checkbox_gimnasio=((string)$accommodation->Features->HouseCharacteristics->Gym == 'true')?1:0;
            $checkbox_alarma=((string)$accommodation->Features->HouseCharacteristics->Alarm == 'true')?1:0;
            $checkbox_tennis=((string)$accommodation->Features->HouseCharacteristics->Tennis == 'true')?1:0;
            $checkbox_squash=((string)$accommodation->Features->HouseCharacteristics->Squash == 'true')?1:0;
            $checkbox_paddel=((string)$accommodation->Features->HouseCharacteristics->Paddel == 'true')?1:0;
            $checkbox_apta_discapacitados=((string)$accommodation->Features->HouseCharacteristics->HandicappedFacilities == 'apta-discapacitados')?1:0;
            // $checkbox_fumadores=((string)$accommodation->Features->HouseCharacteristics->SmokingAllowed == 'true')?1:0;
            # tipo piscina
            $text_tipo_piscina =(string)$accommodation->Features->HouseCharacteristics->SwimmingPool->PoolType;
            $text_tipo_piscina =(strlen($text_tipo_piscina)==0) ? 'comunitaria' : $text_tipo_piscina;
            $text_tipo_piscina = ($checkbox_piscina) ? $text_tipo_piscina: '';
            foreach($actived_languages_id as $language) {
                // ,'" . addslashes($avantio_gallery) . "'
                $inserts[] = "('" . $id . "', '" . $language . "', '" . addslashes($text_title) . "','" . addslashes($text_referencia) . "','" . addslashes($text_numero_registro_turistico) . "',
                        '" . addslashes($avantio_occupation_rules) . "','" . addslashes($avantio_pricemodifiers) . "','" . addslashes($avantio_gallery) . "','" . addslashes($dynamic_taxonomy) . "',
                        '" . addslashes($dynamic_geocountry) . "','" . addslashes($dynamic_georegion) . "','" . addslashes($dynamic_geocity) . "','" . addslashes($dynamic_geolocality) . "',
                        '" . addslashes($dynamic_geodistrict) . "')";

                //echo $sql . "\n";
                //echo "lenguage: ".$language . "\n";
                if ($language == 1) {
                // if ($language == "es") {
                    # keep json
                    $row_values = array(
                        "id" => $id,
                        "language" => addslashes($language),
                        "text_title" => addslashes($text_title),
                        "text_referencia" => addslashes($text_referencia),
                        "text_numero_registro_turistico" => addslashes($text_numero_registro_turistico),
                        "avantio_occupation_rules" => $avantio_occupation_rules,
                        "avantio_pricemodifiers" => addslashes($avantio_pricemodifiers),
                        "avantio_accomodations_pictures" => addslashes($avantio_gallery),
                        "dynamic_taxonomy" => addslashes($dynamic_taxonomy),
                        "dynamic_geocountry" => addslashes($dynamic_geocountry),
                        "dynamic_georegion" => addslashes($dynamic_georegion),
                        "dynamic_geocity" => addslashes($dynamic_geocity),
                        "dynamic_geolocality" => addslashes($dynamic_geolocality),
                        "dynamic_geodistrict" => addslashes($dynamic_geodistrict),
                    );
                    // if ($counter == 83){
                    array_push($vector_json,$row_values);
                    $counter++;
                } // end if

                if (count($inserts) >= $avantio_credentials['INSERT_COUNT']) {
                    // avantio_gallery,
                    $sql = "INSERT INTO avantio_accomodations_tmp 
                        (id,language,text_title,text_referencia,text_numero_registro_turistico,
                        avantio_occupation_rules,avantio_pricemodifiers,avantio_accomodations_pictures,dynamic_taxonomy,
                        dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,
                        dynamic_geodistrict) VALUES ".implode(",",$inserts) . ";";
                    //echo $sql . "\n";
                    $count = $this->connection->executeStatement($sql);
                    $inserts = array();
                }// end if
            }// end foreach languages
        }// end foreach accommodations first bucle

        if(!empty($inserts)){
            // avantio_gallery,
            $sql = "INSERT INTO avantio_accomodations_tmp 
                        (id,language,text_title,text_referencia,text_numero_registro_turistico,
                        avantio_occupation_rules,avantio_pricemodifiers,avantio_accomodations_pictures,dynamic_taxonomy,
                        dynamic_geocountry,dynamic_georegion,dynamic_geocity,dynamic_geolocality,
                        dynamic_geodistrict) VALUES ".implode(",",$inserts) . ";";

            //echo $sql . "\n";
            $count = $this->connection->executeStatement($sql);

            $inserts = array();
        }// end if empty insert

        $sql = "RENAME TABLE avantio_accomodations TO avantio_accomodations_back, avantio_accomodations_tmp TO avantio_accomodations, avantio_accomodations_back TO avantio_accomodations_tmp;";
        $count = $this->connection->executeStatement($sql);

        # extras
        $sql = " DROP TABLE IF EXISTS avantio_accomodations_extras_tmp; ";
        $count = $this->connection->executeStatement($sql);

        $sql = " CREATE TABLE avantio_accomodations_extras_tmp LIKE avantio_accomodations_extras; ";
        $count = $this->connection->executeStatement($sql);

        foreach($xml->Accommodation as $accommodation){
            $avantio_accomodations = intval($accommodation->AccommodationId);

            # special service
            if (!$accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService) continue;
            foreach($accommodation->Features->ExtrasAndServices->SpecialServices->SpecialService as $service){
                $dynamic_services = intval($service->Code);
                $checkbox_included = ((string)$service->IncludedInPrice == 'true') ? 1 : 0;
                $price = intval($service->AdditionalPrice->Quantity);
                $price_unit = (string)$service->AdditionalPrice->Unit;
                $price_children = intval($service->AdditionalPriceChildren->Quantity);
                $price_children_unit = ($price_children > 0) ? (string)$service->AdditionalPriceChildren->Unit : 'RESERVA';
                $checkbox_pago_en_reserva = ((string)$service->PayTime=='LLEGADA') ? 0 : 1;
                $checkbox_opcional = ((string)$service->Application=='OPCIONAL') ? 1 : 0;
                $text_type = (string)$service->Type;
                $text_parking_location = (string)$service->ParkingLocation;
                $number_limit_weight = (string)$service->LimitWeight;
                $inserts[] = "('".$avantio_accomodations."','".addslashes($dynamic_services)."','".addslashes($checkbox_included)."','".addslashes($price)."',
                        '".$price_unit."','".addslashes($price_children)."','".addslashes($price_children_unit)."','".addslashes($checkbox_pago_en_reserva)."',
                        '".$checkbox_opcional."','".addslashes($text_type)."','".addslashes($text_parking_location)."','".intval($number_limit_weight)."')";
                if(count($inserts) >= $avantio_credentials['INSERT_COUNT']){
                    $sql = "INSERT INTO avantio_accomodations_extras_tmp 
                            (id,dynamic_services,checkbox_included,price,
                            price_unit,price_children,price_children_unit,checkbox_pago_en_reserva,
                            checkbox_opcional,text_type,text_parking_location,number_limit_weight)
                             VALUES ".implode(",",$inserts).";";
                    $count = $this->connection->executeStatement($sql);
                    $inserts = array();
                }// end if special service
            } // emd foreach special services
            # common services
            if (!$accommodation->Features->ExtrasAndServices->CommonServices->CommonService) continue;
            foreach($accommodation->Features->ExtrasAndServices->CommonServices->CommonService as $service){
                $dynamic_services=intval($service->Code);
                $checkbox_included=((string)$service->IncludedInPrice == 'true')?1:0;
                $price=intval($service->AdditionalPrice->Quantity);
                $price_unit=(string)$service->AdditionalPrice->Unit;
                $price_children=intval($service->AdditionalPriceChildren->Quantity);
                $price_children_unit=($price_children > 0) ? (string)$service->AdditionalPriceChildren->Unit : 'RESERVA';
                $checkbox_pago_en_reserva=((string)$service->PayTime=='LLEGADA')?0:1;
                $checkbox_opcional=((string)$service->Application=='OPCIONAL')?1:0;
                $text_type=(string)$service->Type;
                $text_parking_location=(string)$service->ParkingLocation;
                $number_limit_weight=(string)$service->LimitWeight;
                $inserts[]="('".$avantio_accomodations."','".addslashes($dynamic_services)."','".addslashes($checkbox_included)."','".addslashes($price)."',
                        '".$price_unit."','".addslashes($price_children)."','".addslashes($price_children_unit)."','".addslashes($checkbox_pago_en_reserva)."',
                        '".$checkbox_opcional."','".addslashes($text_type)."','".addslashes($text_parking_location)."','".intval($number_limit_weight)."')";
                if(count($inserts)>=$avantio_credentials['INSERT_COUNT']){
                    $sql="INSERT INTO avantio_accomodations_extras_tmp 
                            (id,dynamic_services,checkbox_included,price,
                            price_unit,price_children,price_children_unit,checkbox_pago_en_reserva,
                            checkbox_opcional,text_type,text_parking_location,number_limit_weight)
                             VALUES ".implode(",",$inserts).";";
                    $count = $this->connection->executeStatement($sql);
                    $inserts = array();
                } // end if common service
            } // end foreach special service
        } // end foreach accomodation
        if(!empty($inserts)){
            $sql="INSERT INTO avantio_accomodations_extras_tmp 
                    (id,dynamic_services,checkbox_included,price,
                    price_unit,price_children,price_children_unit,checkbox_pago_en_reserva,
                    checkbox_opcional,text_type,text_parking_location,number_limit_weight)
                     VALUES ".implode(",",$inserts).";";
            $count = $this->connection->executeStatement($sql);
            $inserts=array();
        }

        $sql = "RENAME TABLE avantio_accomodations_extras TO avantio_accomodations_extras_back, avantio_accomodations_extras_tmp TO avantio_accomodations_extras, avantio_accomodations_extras_back TO avantio_accomodations_extras_tmp;";
        $count = $this->connection->executeStatement($sql);

        # check foreign keys
        $sql = " SET FOREIGN_KEY_CHECKS=1; ";
        $count = $this->connection->executeStatement($sql);

        /*
        # ACCOMODATIONS TO DYNAMIC_ROOMS
        $sql="DROP TABLE IF EXISTS tmp_dynamic_rooms;";
        $count = $this->connection->executeStatement($sql);

        $sql="CREATE TABLE tmp_dynamic_rooms LIKE dynamic_rooms;";
        $count = $this->connection->executeStatement($sql);

        $sql="UPDATE tmp_dynamic_rooms SET status='PAUSED';";
        $count = $this->connection->executeStatement($sql);
        */

    } // end function insert_accommodation




    /**
     * @param $filters
     * @param $language
     * @return array
     */
    public function get_reservations_by_filters($filters, $language)
    {
        # condiciones
        $cond_a = "";
        $cond_aa = "";
        $cond_b = "";
        $cond_bb = "";

        # vectors
        $return = array();
        $return_own = array();
        $accomodations_list = array();
        $accomodations_list_own = array();

        # url
        $absolute_url = full_url($_SERVER);
        $absolute_url_without_parameters = full_url_without_parameters();

        # booking preferences
        $booking = "";
        $booking_propietario = "";
        $booking_agencia = "";

        $cond_a  = "";

        # checkin and checkout
        if (isset($filters["search_checkin"]) && $filters["search_checkin"] != "" && isset($filters["search_checkin"]) && $filters["search_checkout"] != "") {
            $cond_a.= " AND ab.start_date >= '" . $filters["search_checkin"] . "' AND ab.start_date <= '" . $filters["search_checkout"] . "'  ";
            $cond_b.= " AND  hab.start_date >= '" . $filters["search_checkin"] . "' AND hab.start_date <= '" . $filters["search_checkout"] . "' ";
        }

        # checkin checkout booking
        if (isset($filters["search_checkin_booking"])) {
            $cond_a.= " AND ab.booking_date >= '" . $filters["search_checkin_booking"] . "' AND ab.booking_date <= '" . $filters["search_checkout_booking"] . "'  ";
            $cond_b.= " AND  hab.booking_date >= '" . $filters["search_checkin_booking"] . "' AND hab.booking_date <= '" . $filters["search_checkout_booking"] . "' ";
        }



        $sql = " SELECT todo.* FROM
(
SELECT ab.booking_code, aa.text_userid , ab.start_date , ab.end_date , ab.booking_date , abam.total_price , aa.text_title, ds.text_slug , 
ds.auto_slug , abo.adults_number , abo.child1_age , abo.child2_age , abo.child3_age , abo.child4_age , abo.child5_age , abo.child6_age , abo.child_number ,  abc.name , abc.surname , 
abd.id_booking_type , abd.web , abag.id_agencia , aba.avantio_accomodations , aba.booking_code_reservation , aba.cs, 1 as opcion_avantio_portvil , da.text_title as nombre_agencia,
us.text_username as usuario ,haa_dos.text_title as portvil_accommodation  , abd.id_booking_type_booking , abd.number_cuna , abp.amount as cantidad_payment , 
dt.number_comision as descuento , dt.checkbox_fijo , dt.checkbox_comision
FROM avantio_booking as ab 
JOIN avantio_booking_amount as abam ON abam.booking_code = ab.booking_code 
LEFT JOIN avantio_booking_payment as abp ON abp.booking_code = ab.booking_code AND abp.payment_status <> 'PENDING' AND abam.rental_price = abp.amount
JOIN avantio_booking_details as abd ON abd.booking_code = ab.booking_code 
JOIN avantio_booking_accommodation as aba ON aba.booking_code = ab.booking_code 
LEFT JOIN avantio_booking_occupants as abo ON abo.booking_code = ab.booking_code 
LEFT JOIN avantio_client as abc ON abc.booking_code = ab.booking_code 
LEFT JOIN avantio_accomodations as aa ON aa.id = aba.avantio_accomodations AND aa.language = 'es' 
LEFT JOIN hshv_avantio_accomodations_real as haa_dos ON haa_dos.id = aba.avantio_accomodations AND haa_dos.language = 'es'
LEFT JOIN dynamic_rooms as ds ON ds.id = aa.id AND ds.language = 'es' 
LEFT JOIN avantio_booking_agencia AS abag ON abag.booking_code = ab.booking_code 
LEFT JOIN dynamic_agencia as da ON da.id = abag.id_agencia AND da.language = 'es'
LEFT JOIN dynamic_tarifas AS dt ON dt.id = da.dynamic_tarifas
LEFT JOIN avantio_booking_usuario as abu ON abu.booking_code = ab.booking_code
LEFT JOIN users as us ON us.id = abu.id_usuario
WHERE 1 $cond_a
GROUP BY ab.booking_code 
) AS todo 
order by todo.booking_date desc , todo.booking_code DESC ";


        $resultSet = $this->connection->executeQuery($sql); // Simple, but has several drawbacks
        $bookings = $resultSet->fetchAllAssociative();

        return $bookings;

    } // end function

    public function getSession():Session
    {
        return $this->session;
    }

    public function setSession(\Symfony\Component\HttpFoundation\Session\Session $session)
    {
        $this->session = $session;
    }

    public function getConnection(): Connection
    {
        return $this->connection;
    }

    public function setConnection(Connection $connection): void
    {
        $this->connection = $connection;
    }

    public function getEm(): EntityManagerInterface
    {
        return $this->em;
    }

    public function setEm(EntityManagerInterface $em): void
    {
        $this->em = $em;
    }

    public function getRequestStack(): RequestStack
    {
        return $this->requestStack;
    }

    public function setRequestStack(RequestStack $requestStack): void
    {
        $this->requestStack = $requestStack;
    }



}
