<?php
namespace App\Repository;

use App\Entity\DynamicTaxonomy;
use App\Entity\DynamicTaxonomyGroup;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

use DateTime;

/**
 * @extends ServiceEntityRepository<DynamicTaxonomyGroup>
 *
 * @method DynamicTaxonomyGroup|null find($id, $lockMode = null, $lockVersion = null)
 * @method DynamicTaxonomyGroup|null findOneBy(array $criteria, array $orderBy = null)
 * @method DynamicTaxonomyGroup[]    findAll()
 * @method DynamicTaxonomyGroup[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */

class DynamicTaxonomyGroupRepository extends ServiceEntityRepository
{
    # doctrine dbal
    protected $connection;

    # clase ModelRepository que llamamos mediante el método mágica __call
    private $model;

    # data del controlador
    protected $data;

    private $em;

    public function __construct(ManagerRegistry $registry , Connection $connection , EntityManagerInterface $em)
    {
        parent::__construct($registry, DynamicTaxonomyGroup::class);

        // inicializamos variables
        $this->connection = $connection;

        //$this->model = new ModelRepository($registry);
        $this->em = $em;
    }

    public function getList($language)
    {
        $sql = " SELECT u FROM 
        App\Entity\DynamicTaxonomyGroup as u 
        WHERE u.language = $language AND (u.status = 'ACTIVED' OR u.status = 'PAUSED' )  ";
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


    public function insertKinds($xml,$avantio_credentials,$ts,$ts_referencia,$languages)
    {

        # fecha
        $fecha_actual = new DateTime();
        $fecha_actual_string = $fecha_actual->format("Y-m-d H:i:s");

        foreach($xml->InternationalizedKinds as $kind){

            $lang = (string)$kind->Language;

            # corroboramos que en language exista
            if (in_array($lang,$languages)){

                $id_lang = array_search($lang,$languages);

                foreach($kind->MasterKind as $mkind){

                    $mkind_id = intval($mkind->MasterKindCode) . $id_lang;
                    $mking_name = (string)$mkind->MasterKindName;
                    $dynamic_taxonomy = intval($mkind->MasterKindCode);
                    $dynamic_taxonomy_group = intval($mkind->MasterKindCode);
                    $url_taxonomy  = url_semantica($mking_name);

                    if($lang!='ru'){
                        $auto_slug = url_semantica($mking_name);
                    }else{
                        $auto_slug = str_replace(" ","-",$mking_name);
                        $auto_slug = str_replace("--","-",$auto_slug);
                    }

                    # status actived or paused ONLY ACTIVED VILLA
                    /*
                    if($mking_name != "Villa"){
                        $status = "PAUSED";
                    }else{
                        $status = "ACTIVED";
                    }// end if
                    */

                    $status = "ACTIVED";

                    # replace
                    $replace_insert_taxonomy[] = " REPLACE INTO dynamic_taxonomy (id,dynamic_taxonomy , dynamic_taxonomy_group , language ,text_title,auto_slug)
    VALUES ('" . $mkind_id . "', '" . $dynamic_taxonomy . "' , '" . $dynamic_taxonomy_group . "' ,   '" . addslashes($id_lang) . "', '" . addslashes($mking_name) . "' , '" . addslashes($url_taxonomy) . "') ";

                }// end foreach

            } // end if

        }// end foreach

        # execute replace
        foreach($replace_insert_taxonomy as $taxonomy){
            $count = $this->connection->executeStatement($taxonomy);
            /*
            if (!$this->db->query($taxonomy)){
                $error = $db->error();
                echo "Error " . $error["code"] . " con la descripción " . $error["message"];
                die();
            }// end if
            */
        }

    } // end function

}