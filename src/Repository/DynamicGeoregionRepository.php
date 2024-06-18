<?php
namespace App\Repository;

# entities
use App\Entity\AvantioOccupationRules;
use App\Entity\DynamicGeodistrict;
use App\Entity\DynamicGeoregionTranslation;
use App\Entity\DynamicGeoregion;
use App\Entity\Language;

# symfony libraries
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;

# php libraries
use DateTime;

/**
 * @extends ServiceEntityRepository<DynamicGeoregion>
 *
 * @method DynamicGeoregion|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicGeoregion|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicGeoregion[]    findAll()
 * @method DynamicGeoregion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DynamicGeoregionRepository extends ServiceEntityRepository
{
    protected $connection;

    private $em;

    private $requestStack;

    private $session;

    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack)
    {
        parent::__construct($registry, DynamicGeoregion::class);

        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;
    }

    public function getList($language)
    {

        $sql = " SELECT u FROM App\Entity\DynamicGeoregion as u WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }



    public function insertGeographicGeoregion($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
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
                    $id_lang = array_search($lang,$languages);
                    $country_name = (string)$country->Name;
                    $country_id = intval($country->CountryCode) . $id_lang;

                    foreach($country->Regions->Region as $region) {

                        $region_name = (string)$region->Name;
                        $region_id   = intval($region->RegionCode) . $id_lang;
                        $url_region  = url_semantica($region_name);
                        $dynamic_georegion = intval($region->RegionCode);

                        # replace
                        $replace_insert_goregion[] = " REPLACE INTO dynamic_georegion (id,dynamic_georegion,dynamic_geocountry,language,text_title,auto_slug) 
VALUES ('" . $region_id . "', '" . $dynamic_georegion . "' , '" . $country_id . "' ,   '" . addslashes($id_lang) . "', '" . addslashes($region_name) . "' , '" . addslashes($url_region) . "') ";

                    } // end foreach region

                } // end foreach

            } // if corroborar language

        }// end foreach country

        # execute replace
        foreach($replace_insert_goregion as $region){
            echo $region . "\n";
            $count = $this->connection->executeStatement($region);
            /*
            if (!$this->db->query($region)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
        }

    } // end function




//    /**
//     * @return DynamicGeoregion[] Returns an array of DynamicGeoregion objects
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

//    public function findOneBySomeField($value): ?DynamicGeoregion
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }


}
