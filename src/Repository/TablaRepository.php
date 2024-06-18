<?php
namespace App\Repository;

use App\Entity\Tabla;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;


/**
 * @extends ServiceEntityRepository<Tabla>
 *
 * @method Tabla|null find($id, $lockMode = null, $lockVersion = null)
 * @method Tabla|null findOneBy(array $criteria, array $orderBy = null)
 * @method Tabla[]    findAll()
 * @method Tabla[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TablaRepository extends ServiceEntityRepository
{

    public function __construct(ManagerRegistry $registry, EntityManagerInterface $em)
    {
        parent::__construct($registry, Tabla::class);
        $this->em = $em;
    }


//    /**
//     * @return Tabla[] Returns an array of Tabla objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('t')
//            ->andWhere('t.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('t.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Tabla
//    {
//        return $this->createQueryBuilder('t')
//            ->andWhere('t.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
