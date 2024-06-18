<?php
namespace App\Model\DynamicModel;

# symfony libraries
use App\Model\Users;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;

class DynamicModel
{
    # entity Manager
    private $em;

    # doctrine
    private $doctrine;

    # connection dbal
    private $connection;

    # table database
    private $table;

    private $is_language_group = true;

    # segment variables
    protected $segment;
    protected $filter;
    protected $filter_2;
    protected $filter_3;
    protected $filter_4;

    # paginas
    protected $page_id = -1;
    protected $nombre_tabla;
    protected $nombre_objeto;


    public function __construct(EntityManagerInterface $em ,Connection $connection , ManagerRegistry $doctrine)
    {
        $this->em = $em;
        $this->connection = $connection;
        $this->doctrine = $doctrine;

    }

    public function get_next_insert_id($table) {

        $sql = " SELECT MAX(id)+1 as nextid FROM $table ";
        $resultSet = $this->connection->executeQuery($sql); // Simple, but has several drawbacks
        $rows = $resultSet->fetchAllAssociative();

        return $rows;

    } // end function


    public function getLastId()
    {
        // Agregamos el nombre del formulario Type
        $form_object_vector = explode("\\",$this->nombre_objeto);
        $form_object = $form_object_vector[count($form_object_vector)-1];
        $form_object = lcfirst($form_object);

        # general table
        $query = $this->em->createQuery("SELECT MAX(u.$form_object) + 1 as next_id FROM App\Entity\$this->nombre_objeto as u");
        $max_id = $query->getResult();
        if (is_array($max_id)){
            $id = $max_id[0]["next_id"];
        }else{
            $id = 1;
        }
        return $id;
    }


    public function actualId()
    {
        // Agregamos el nombre del formulario Type
        $form_object_vector = explode("\\",$this->nombre_objeto);
        $form_object = $form_object_vector[count($form_object_vector)-1];
        $form_object = lcfirst($form_object);

        # general table
        $query = $this->em->createQuery("SELECT MAX(u.$form_object) as next_id FROM App\Entity\$this->nombre_objeto as u");
        $max_id = $query->getResult();
        if (is_array($max_id)){
            $id = $max_id[0]["next_id"];
        }else{
            $id = 1;
        }
        return $id;
    }


    public function getKeys()
    {
        # get database table
        $table = $this->getTable();
        # query
        $sql = " SHOW INDEX FROM $table WHERE Key_name = 'PRIMARY' ";
        $results = $this->connection->fetchAllAssociative($sql);


        if (count($results) > 1)
            return $results;
        else if (count($results) == 1)
            return $this->connection->fetchAssociative($sql);
        else
            return false;

    }// end function



    public function checkFieldExist($field)
    {
        # get database table
        $table = $this->getTable();

        # query
        $sql = " SHOW COLUMNS FROM $table LIKE '".$field."' ";
        $result = $this->connection->fetchAssociative($sql);

        if (is_array($result) && count($result) > 0){
            return $result;
        }else{
            return false;
        }

    }


    public function dlistIsDynamicTable($slug_table)
    {

        $is_dynamic = false;

        # tables
        $sql = " SHOW TABLES ";
        $tables = $this->connection->fetchAllAssociative($sql);

        # database name
        $database_name = $this->em->getConnection()->getDatabase();

        # get tables
        foreach($tables as $table){
            if(strpos($table["Tables_in_".$database_name] , "dynamic_") !== false){
                $temp_table = str_replace("dynamic_","",$table["Tables_in_".$database_name]);
                if ($slug_table == $temp_table)
                    $is_dynamic = true;
            }
        }

        return $is_dynamic;
    }


    public function get_dynamic_table_data_builder($slug, $idioma, $id = 0, $order = null)
    {

        $table = 'dynamic_' . $slug;

        if (!$this->table_exists($table))
            return array();

        $queryBuilder = $this->connection->createQueryBuilder();

        $where = '';

        if ($id)
            $where = ('id = '.$id);

        $where.= (' and language = '.$idioma);

        if (!is_null($order))
            $orderBy = $order;

        # where and order
        if($where && $order)
            $queryBuilder
                ->select()
                ->from($table)
                ->where($where)
                ->orderBy($orderBy)
            ;

        # where
        if($where && !$order)
            $queryBuilder
                ->select()
                ->from($table)
                ->where($where)
            ;

        # order
        if(!$where && $order)
            $queryBuilder
                ->select()
                ->from($table)
                ->orderBy($orderBy)
            ;


        if(!$where && !$order)
            $queryBuilder
                ->select()
                ->from($table)
            ;


        $sql = $queryBuilder->getSQL();
        $result = $this->connection->fetchAllAssociative($sql);

        return ($result) ? $result : false;

    }


    /**
     * @param $slug
     * @param $idioma
     * @param int $id
     * @param null $order
     * @return array
     */
    public function get_dynamic_table_data($slug, $idioma, $id = 0, $order = null) {

        $table = 'dynamic_' . $slug;

        if (!$this->table_exists($table))
            return array();

        $sql = " SELECT * FROM $table ";

        if ($id)
            $builder->where('id', $id);

        $builder->where('language', $idioma);

        if (!is_null($order))
            $builder->orderBy($order, 'ASC');


        $sql = $builder->getCompiledSelect();
        $query = $this->db->query($sql);

        // $query = $builder->get();
        

        return ($id) ? $query->getRow() : $query->getResult();

    }// end function



    /**
     * function get_dynamic_table_data_params
     * misma funcion que en user_general_model
     * dbal database abstraction layer
     * @param [type] $slug
     * @param [type] $idioma
     * @param array $params
     * @param [type] $order
     * @param array $where_in
     * @return void
     */

    public function get_dynamic_table_data_params($slug, $params = array(), $order = null, $where_in = array(), $prefix = 'dynamic_') {

        $table = $prefix . $slug;

        $sql = " SELECT * FROM $table ";

        if (!$this->table_exists($table))
            return array();

        if (!empty($params)){
            $sql.= " WHERE ";
            $counter_params = 0;
            foreach ($params as $index => $param) {
                if($counter_params == 0)
                    $sql.= " $index = ? ";
                else
                    $sql.= " AND $index = ? ";
                $counter_params++;
            }// end foreach
            $stmt = $this->connection->prepare($sql);
            $counter_params = 1;
            foreach ($params as $index => $param) {
                $stmt->bindValue($counter_params , $param);
                $counter_params++;
            }// end foreach
        }// end if

        $resultSet = $stmt->executeQuery();
        $rows = $resultSet->fetchAllAssociative();

        return $rows;

    }// end function



    public function table_exists($table) {
        $sql = "SHOW TABLES LIKE '" . $table . "'";
        $results = $this->connection->fetchAllAssociative($sql);
        return (!empty($results)) ? true : false;
    } // end function


    public function initDbal()
    {

        # dbal connection
        $connection = $this->entityManager->getConnection();

        # dbal
        $products = $connection->fetchAssociative('SELECT * FROM users');

        return $products;
    }


    public function initRepository(){

        $id = 1;
        $repository = $this->entityManager->getRepository(Users::class);

        $product = $repository->find($id);

        return $product;
    }


    /**
     * @return Connection
     */
    public function getConnection(): Connection
    {
        return $this->connection;
    }

    /**
     * @param Connection $connection
     */
    public function setConnection(Connection $connection): void
    {
        $this->connection = $connection;
    }


    /**
     * @return mixed
     */
    public function getTable()
    {
        return $this->table;
    }

    /**
     * @param mixed $table
     */
    public function setTable($table): void
    {
        $this->table = $table;
    }

    /**
     * @return EntityManagerInterface
     */
    public function getEm(): EntityManagerInterface
    {
        return $this->em;
    }

    /**
     * @param EntityManagerInterface $em
     */
    public function setEm(EntityManagerInterface $em): void
    {
        $this->em = $em;
    }

    /**
     * @return ManagerRegistry
     */
    public function getDoctrine(): ManagerRegistry
    {
        return $this->doctrine;
    }

    /**
     * @param ManagerRegistry $doctrine
     */
    public function setDoctrine(ManagerRegistry $doctrine): void
    {
        $this->doctrine = $doctrine;
    }

    public function isIsLanguageGroup(): bool
    {
        return $this->is_language_group;
    }

    public function setIsLanguageGroup(bool $is_language_group): void
    {
        $this->is_language_group = $is_language_group;
    }

    /**
     * @return mixed
     */
    public function getSegment()
    {
        return $this->segment;
    }

    /**
     * @param mixed $segment
     */
    public function setSegment($segment): void
    {
        $this->segment = $segment;
    }

    /**
     * @return mixed
     */
    public function getFilter()
    {
        return $this->filter;
    }

    /**
     * @param mixed $filter
     */
    public function setFilter($filter): void
    {
        $this->filter = $filter;
    }

    /**
     * @return mixed
     */
    public function getFilter2()
    {
        return $this->filter_2;
    }

    /**
     * @param mixed $filter_2
     */
    public function setFilter2($filter_2): void
    {
        $this->filter_2 = $filter_2;
    }

    /**
     * @return mixed
     */
    public function getFilter3()
    {
        return $this->filter_3;
    }

    /**
     * @param mixed $filter_3
     */
    public function setFilter3($filter_3): void
    {
        $this->filter_3 = $filter_3;
    }

    /**
     * @return mixed
     */
    public function getFilter4()
    {
        return $this->filter_4;
    }

    /**
     * @param mixed $filter_4
     */
    public function setFilter4($filter_4): void
    {
        $this->filter_4 = $filter_4;
    }

    public function getPageId(): int
    {
        return $this->page_id;
    }

    public function setPageId(int $page_id): void
    {
        $this->page_id = $page_id;
    }

    /**
     * @return mixed
     */
    public function getNombreTabla()
    {
        return $this->nombre_tabla;
    }

    /**
     * @param mixed $nombre_tabla
     */
    public function setNombreTabla($nombre_tabla): void
    {
        $this->nombre_tabla = $nombre_tabla;
    }

    /**
     * @return mixed
     */
    public function getNombreObjeto()
    {
        return $this->nombre_objeto;
    }

    /**
     * @param mixed $nombre_objeto
     */
    public function setNombreObjeto($nombre_objeto): void
    {
        $this->nombre_objeto = $nombre_objeto;
    }

}