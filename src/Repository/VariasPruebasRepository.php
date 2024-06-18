<?php

namespace App\Repository;

use App\Entity\VariasPruebas;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<VariasPruebas>
 *
 * @method VariasPruebas|null find($id, $lockMode = null, $lockVersion = null)
 * @method VariasPruebas|null findOneBy(array $criteria, array $orderBy = null)
 * @method VariasPruebas[]    findAll()
 * @method VariasPruebas[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VariasPruebasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, VariasPruebas::class);
    }

//    /**
//     * @return VariasPruebas[] Returns an array of VariasPruebas objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('v')
//            ->andWhere('v.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('v.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?VariasPruebas
//    {
//        return $this->createQueryBuilder('v')
//            ->andWhere('v.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
