<?php
namespace App\Repository;

use App\Entity\AvantioOccupationRules;
use App\Entity\DynamicGeocity;
use App\Entity\DynamicGeocountry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;

# php libraries
use DateTime;

/**
 * @extends ServiceEntityRepository<DynamicGeocity>
 *
 * @method DynamicGeocity|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicGeocity|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicGeocity[]    findAll()
 * @method DynamicGeocity[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DynamicGeocityRepository extends ServiceEntityRepository
{

    protected $connection;

    private $em;

    private $requestStack;

    private $session;

    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack)
    {
        parent::__construct($registry, DynamicGeocity::class);

        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;
    }



    public function getList($language)
    {

        $sql = " SELECT u FROM App\Entity\DynamicGeocity as u WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }



    public function insertGeographicGeocity($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
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

                            # replace
                            $replace_insert_geocity[] = " REPLACE INTO dynamic_geocity (id,dynamic_geocity,dynamic_georegion,language,text_title,auto_slug) 
VALUES ('" . $city_id . "', '" . $dynamic_geocity . "' , '" . $region_id . "' ,   '" . addslashes($id_lang) . "', '" . addslashes($city_name) . "' , '" . addslashes($url_city) . "') ";

                        } // end foreach

                    } // end foreach region

                } // end foreach countries

            } // if corroborar language

        }// end foreach country

        # execute replace
        foreach($replace_insert_geocity as $city){
            echo $city . "\n";
            $count = $this->connection->executeStatement($city);
            /*
            if (!$this->db->query($city)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
        }

    } // end function



//    /**
//     * @return DynamicGeocity[] Returns an array of DynamicGeocity objects
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

//    public function findOneBySomeField($value): ?DynamicGeocity
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
