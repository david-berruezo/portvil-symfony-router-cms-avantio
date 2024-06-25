<?php

namespace App\Repository;

use App\Entity\DynamicAdminPage;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\RequestStack;

/**
 * @extends ServiceEntityRepository<DynamicAdminPage>
 *
 * @method DynamicAdminPage|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicAdminPage|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicAdminPage[]    findAll()
 * @method DynamicAdminPage[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DynamicAdminPageRepository extends ServiceEntityRepository
{
    protected $connection;

    private $em;

    private $requestStack;

    private $session;


    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em , RequestStack $requestStack)
    {
        parent::__construct($registry, DynamicAdminPage::class);

        $this->connection = $connection;
        $this->em = $em;
        $this->requestStack = $requestStack;

    }


    public function getList($language)
    {

        $sql = " SELECT u FROM App\Entity\DynamicAdminPage as u WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
        $query = $this->em->createQuery($sql);
        $rows = $query->getResult();

        return $rows;
    }

//    /**
//     * @return DynamicAdminPages[] Returns an array of DynamicAdminPages objects
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

//    public function findOneBySomeField($value): ?DynamicAdminPages
//    {
//        return $this->createQueryBuilder('d')
//            ->andWhere('d.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
