<?php
namespace App\Model\Entidad;

use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use DateTime;

class Entidad
{
    # entity Manager
    private $em;

    # doctrine
    private $doctrine;

    # connection dbal
    private $connection;


    public function __construct(EntityManagerInterface $em ,Connection $connection , ManagerRegistry $doctrine)
    {
        $this->em = $em;
        $this->connection = $connection;
        $this->doctrine = $doctrine;

    }

    public function fillGeoProperties()
    {
        $this->setId(0);
        $this->setLanguage(111);
        $this->setTextTitle("");
        $this->setTextareaDescription("");
        $this->setTextPageTitle("");
        $this->setTextSlug("");
        $this->setAutoSlug("");
        $this->setTextMetaDescription("");
        $this->setTextMetaKeywords("");
        $this->setTextMetaRobots("");
        $this->setTextareaScriptsHeader("");
        $this->setTextareaScriptsBody("");
        $this->setStatus("ACTIVED");
        $this->setPosition(0);
        $this->setUpdateAt(new DateTime("2024-01-01"));
    }


    /**
     * @return DynamicAgencia[] Returns an array of DynamicAgencia objects
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

        return $this->em->createQueryBuilder($letra)
            ->select($campos_tabla)
            ->orderBy($order_by_key, $order_by_value)
            ->getQuery()
            ->getResult()
            ;

        //->setMaxResults(10)
        //->andWhere('d.exampleField = :val')
        //->setParameter('val', $value)
    }


}