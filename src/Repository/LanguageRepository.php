<?php

namespace App\Repository;

use App\Entity\Language;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Language>
 *
 * @method Language|null find($id, $lockMode = null, $lockVersion = null)
 * @method Language|null findOneBy(array $criteria, array $orderBy = null)
 * @method Language[]    findAll()
 * @method Language[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LanguageRepository extends ServiceEntityRepository
{

    private $em;

    public function __construct(ManagerRegistry $registry,EntityManagerInterface $em)
    {
        parent::__construct($registry, Language::class);
        $this->em = $em;
    }

    public function getAllData()
    {
        $sql = " SELECT u.id , u.language FROM 
        App\Entity\Language as u 
        WHERE (u.numberActived = 1)  ";

        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();
        $vector_languages = array();

        foreach ($rows as $row) {
            $vector_languages[$row["id"]] = $row["language"];
        }

        return $vector_languages;
    }

    public function getList($language)
    {
        $sql = " SELECT u FROM 
        App\Entity\Language as u 
        WHERE (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";

        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }


    /**
     * @return DynamicTaxonomy[] Returns an array of DynamicAgencia objects
     */
    public function listColumns($letra_query , $columns , $order_by): array
    {
        // Insertamos letra a todos los items del vector
        $letra = $letra_query;
        $campos = $columns;
        $campos_tabla = array();
        foreach($campos as $campo){
            $campo = $letra.'.'.$campo;
            array_push($campos_tabla,$campo);
        }
        // Insertamos letra en order by
        $order_by_key = key($order_by);
        $order_by_value = current($order_by);
        $order_by_key = $letra.".".$order_by_key;
        return $this->createQueryBuilder($letra)
            ->select($campos_tabla)
            ->orderBy($order_by_key, $order_by_value)
            ->getQuery()
            ->getResult()
            ;
        //->setMaxResults(10)
        //->andWhere('d.exampleField = :val')
        //->setParameter('val', $value)
    }

//    /**
//     * @return Language[] Returns an array of Language objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('l')
//            ->andWhere('l.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('l.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Language
//    {
//        return $this->createQueryBuilder('l')
//            ->andWhere('l.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
