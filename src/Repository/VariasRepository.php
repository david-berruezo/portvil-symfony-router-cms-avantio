<?php

namespace App\Repository;

use App\Entity\Varias;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Varias>
 *
 * @method Varias|null find($id, $lockMode = null, $lockVersion = null)
 * @method Varias|null findOneBy(array $criteria, array $orderBy = null)
 * @method Varias[]    findAll()
 * @method Varias[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VariasRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Varias::class);
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
