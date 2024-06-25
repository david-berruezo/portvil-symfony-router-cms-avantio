<?php
namespace App\Repository;

use App\Entity\DynamicGeocountry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;
# entity
use App\Entity\DynamicPage;
use Symfony\Component\Translation\LocaleSwitcher;
use Symfony\Contracts\Translation\TranslatorInterface;


/**
 * @extends ServiceEntityRepository<DynamicPage>
 *
 * @method DynamicPage|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicPage|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicPage[]    findAll()
 * @method DynamicPage[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DynamicPageRepository extends ServiceEntityRepository
{
    protected $connection;

    private $em;

    private $requestStack;

    private $session;

    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack)
    {
        parent::__construct($registry, DynamicPage::class);

        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;
    }

    public function getList($language)
    {

        $sql = " SELECT u FROM App\Entity\DynamicPage as u WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }

    public function findRegionsByLanguage($language)
    {
        # obtenemos pais y todas las regiones
        $dynamicGeocountry = $this->em->getRepository("App\Entity\DynamicPage")->findBy(array("language" => $language));
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

    public function add(DynamicPage $entity, bool $flush = false): void
    {
        $this->em->persist($entity);

        if ($flush) {
            $this->em->flush();
        }
    }

    public function remove(DynamicPage $entity, bool $flush = false): void
    {
        $this->em->remove($entity);

        if ($flush) {
            $this->em->flush();
        }
    }



    public function findAllByParameters($parameters)
    {

        # query
        $consulta = $this->em->createQueryBuilder('pages');
        $consulta->innerJoin('pages.dynamicGalleryFranquiciaPrincipal','dynamic_gallery_franquicia_principal');
        $counter_param = 0;
        foreach ($parameters as $index => $item) {
            $consulta->andwhere('pages.'.$index.' = :'.$index);
            $consulta->setParameter($index, $item);
            $counter_param++;
        }// end foreach
        $sql = $consulta->getDQL();
        // echo $sql . "<br>";
        $query = $consulta->getQuery();
        $result = $query->getResult();

        return $result;

    }



    private function pageAll($page_id)
    {
        # query
        $sql = " SELECT ds.language , ds.text_slug , ds.auto_slug FROM App\Entity\DynamicPages ds WHERE id = :id AND language = :language AND status = :status  ";
        $consulta = $this->em->createQuery($sql);

    }



//    /**
//     * @return DynamicPages[] Returns an array of DynamicPages objects
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

//    public function findOneBySomeField($value): ?DynamicPages
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }


    /**
     * con este método llamamos a cualquier método de ModelReopository
     */

    /*
    public function __call($method , $args)
    {
        $this->model->$method($args);
    }
    */

}
