<?php
namespace App\Repository;

use App\Entity\AvantioOccupationRules;
use App\Entity\DynamicGeocountry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;

# php libraries
use DateTime;

/**
 * @extends ServiceEntityRepository<DynamicGeocountry>
 *
 * @method DynamicGeocountry|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicGeocountry|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicGeocountry[]    findAll()
 * @method DynamicGeocountry[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DynamicGeocountryRepositoryTest extends ServiceEntityRepository
{

    protected $connection;

    private $em;

    private $requestStack;

    private $session;

    /*
    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack)
    {
        parent::__construct($registry, DynamicGeocountry::class);

        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;
    }
    */

    public function getList($language)
    {
        $sql = " SELECT u FROM App\Entity\DynamicGeocountry as u WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }


    public function findRegionsByLanguage($language)
    {
        # obtenemos pais y todas las regiones
        $dynamicGeocountry = $this->em->getRepository("App\Entity\DynamicGeocountry")->findBy(array("language" => $language));
        //echo "Nos encontramos todos las regiones <br>";
        foreach ($dynamicGeocountry as $item) {
            $dynamicGeoregion = $item->getDynamicGeoregion();
            $keys = $dynamicGeoregion->getKeys();
            $values = $dynamicGeoregion->getValues();
            //var_dump($keys);
            //var_dump($values);
            foreach ($dynamicGeoregion as $region) {
                //echo "Region id " .$region->getId() . " " .$region->getTextTitle() .   "<br>";
            }
            $filteredCollection = $dynamicGeoregion->filter(function($element) {
                return $element <> "";
            }); // [2, 3]
        }

        return $dynamicGeoregion;
    }

    public function findRegionsByIdCountry(int $idCountry , int $idLanguage)
    {
        $sql = " SELECT dg from App\Entity\DynamicGeocountry dg WHERE dg.id = ?1 and dg.language = ?2 ";
        $query = $this->em->createQuery($sql);
        $query->setParameters(array(
            1 => $idCountry,
            2 => $idLanguage
        ));
        $dynamicGeocountry = $query->getResult();
        foreach ($dynamicGeocountry as $item) {
            $dynamicGeoregion = $item->getDynamicGeoregion();
            $keys = $dynamicGeoregion->getKeys();
            $values = $dynamicGeoregion->getValues();
            foreach ($dynamicGeoregion as $region) {
                //echo "Region id " .$region->getId() . " " .$region->getTextTitle() .   "<br>";
            }
        }

        return $dynamicGeoregion;
    }



    public function insertGeographicGeocountry($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
    {

        # fecha
        $fecha_actual = new DateTime();
        $fecha_actual_string = $fecha_actual->format("Y-m-d H:i:s");

        foreach($xml->InternationalizedItem as $country){

            # leemos el language en texto
            $lang = (string)$country->Language;

            # corroboramos que en language exista
            if (in_array($lang,$languages)){

                foreach ($country->Countries->Country as $country) {
                    # geocountry
                    $id_lang = array_search($lang,$languages);
                    $country_name = (string)$country->Name;
                    $dynamic_geocountry = intval($country->CountryCode);
                    $country_id = intval($country->CountryCode) . $id_lang;
                    $url_country = url_semantica($country_name);

                    # replace
                    $replace_insert_geocountry[] = " REPLACE INTO dynamic_geocountry (id,dynamic_geocountry,language,text_title,auto_slug) VALUES ('" . $country_id . "', '" . $dynamic_geocountry . "' 
                ,   '" . addslashes($id_lang) . "', '" . addslashes($country_name) . "' , '" . addslashes($url_country) . "') ";
                }

            } // if corroborar language

        }// end foreach

        # execute replace
        foreach($replace_insert_geocountry as $geocountry){
            echo $geocountry . "\n";
            $count = $this->connection->executeStatement($geocountry);
            /*
            if (!$this->db->query($geocountry)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
        }

    } // end function




//    /**
//     * @return DynamicGeocountry[] Returns an array of DynamicGeocountry objects
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

//    public function findOneBySomeField($value): ?DynamicGeocountry
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
