<?php

namespace App\Repository;

use App\Entity\AvantioOccupationRules;
use App\Entity\DynamicGeodistrict;
use App\Entity\DynamicGeolocality;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;

# php libraries
use DateTime;

/**
 * @extends ServiceEntityRepository<DynamicGeolocality>
 *
 * @method DynamicGeolocality|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicGeolocality|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicGeolocality[]    findAll()
 * @method DynamicGeolocality[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DynamicGeolocalityRepository extends ServiceEntityRepository
{
    protected $connection;

    private $em;

    private $requestStack;

    private $session;

    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack)
    {
        parent::__construct($registry, DynamicGeolocality::class);

        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;
    }


    public function getList($language)
    {

        $sql = " SELECT u FROM App\Entity\DynamicGeolocality as u WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }



    public function insertGeographicGeolocality($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
    {

        # fecha
        $fecha_actual = new DateTime();
        $fecha_actual_string = $fecha_actual->format("Y-m-d H:i:s");

        foreach($xml->InternationalizedItem as $country){

            # leemos el language en texto
            $lang = (string)$country->Language;

            # corroboramos que en language exista
            if (in_array($lang,$languages)){

                # geocountry
                $id_lang = array_search($lang,$languages);
                $country_id = intval($country->Countries->Country->CountryCode) . $id_lang;

                foreach ($country->Countries->Country as $country) {

                    # geocountry
                    $id_lang = array_search($lang, $languages);
                    $country_name = (string)$country->Name;
                    $country_id = intval($country->CountryCode) . $id_lang;

                    foreach($country->Regions->Region as $region) {

                        $region_name = (string)$region->Name;
                        $region_id   = intval($region->RegionCode) . $id_lang;
                        $url_region  = url_semantica($region_name);
                        $dynamic_georegion = intval($region->RegionCode);

                        foreach($region->Cities->City as $city){

                            $city_name = (string)$city->Name;
                            $city_id = intval($city->CityCode) . $id_lang;
                            $url_city  = url_semantica($city_name);
                            $dynamic_geocity = intval($city->CityCode);

                            foreach($city->Localities->Locality as $locality){

                                $locality_name = (string)$locality->Name;
                                $locality_id = intval($locality->LocalityCode) . $id_lang;
                                $url_locality  = url_semantica($locality_name);
                                $dynamic_geolocality = intval($locality->LocalityCode);

                                # replace
                                $replace_insert_geolocality[] = " REPLACE INTO dynamic_geolocality (id,dynamic_geolocality,dynamic_geocity,language,text_title,auto_slug) 
    VALUES ('" . $locality_id . "', '" . $dynamic_geolocality . "' , '" . $city_id . "' ,   '" . addslashes($id_lang) . "', '" . addslashes($locality_name) . "' , '" . addslashes($url_locality) . "') ";

                            }// end foreach

                        } // end foreach

                    } // end foreach region

                } // end foreach countries

            } // if corroborar language

        }// end foreach country

        # execute replace
        foreach($replace_insert_geolocality as $locality){
            echo $locality . "\n";
            $count = $this->connection->executeStatement($locality);
            /*
            if (!$this->db->query($locality)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
        }

    } // end function


//    /**
//     * @return DynamicGeolocality[] Returns an array of DynamicGeolocality objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('d.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?DynamicGeolocality
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
