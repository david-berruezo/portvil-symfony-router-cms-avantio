<?php
namespace App\Model\Formulario;

# php libararies
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use ReflectionClass;
use ReflectionProperty;
use DateTime;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class FormularioColecciones
{
    # database
    private $em;
    private $connection;

    # segment variables
    protected $segment;
    protected $filter;
    protected $filter_2;


    protected $filter_3;
    protected $filter_4;

    # form
    private $options;
    private $builder;
    private $excepciones;

    # object
    private $reflector;
    private $nombre_objeto;
    private $classString;
    private $session;

    # tipo accion | edit | new
    private $tipo_de_accion = "";


    public function crearRelaciones(&$builder, &$options)
    {
        # guardamos el builder form y las options del form
        $this->builder = $builder;
        $this->options = $options;

        # creamos los elementos para colecciones y dynamic
        foreach ($this->reflector->getProperties() as $property){
            $nombre_clase_actual_vector = explode("\\",$this->nombre_objeto);
            $nombre_clase_actual = $nombre_clase_actual_vector[count($nombre_clase_actual_vector)-1];
            $nombre_clase_actual = lcfirst($nombre_clase_actual);
            // Consultamos por los tipos de propiedad de cada propiedad
            $datos_variable = new ReflectionProperty($this->classString,$property->name);
            $nombre_clase = str_replace("App\\Entity\\","",$this->nombre_objeto);
            $nombre_clase = lcfirst($nombre_clase);
            // comprobamos si es un tipo de Coleccion
            // echo $property->name . "<br>";
            // var_dump($datos_variable->getType());
            if ($datos_variable->getType() != null){
                if(!in_array($property->name,$this->excepciones["dynamic"]) && !in_array($property->name,$this->excepciones["avantio"])) {
                    if ($datos_variable->getType()->getName() == "Doctrine\Common\Collections\Collection" || (strpos($property->name, "dynamic") !== false) && $property->name != $nombre_clase) {
                        # collection by id
                        $nombreColeccion = ucfirst($property->name);
                        $nombre_coleccion = str_replace("_", "", $nombreColeccion);
                        $nombre_repositorio = "App\\Repository\\" . $nombreColeccion . "Repository";
                        $dynamicColeccion = $this->em->getRepository("App\Entity\\" . $nombre_coleccion);
                        if (!$this->filter_2 || $this->filter_2 == 0) {
                            $dynamic = $dynamicColeccion->findBy(array("language" => $this->session->get("lang_id")));
                        } else {
                            if ($datos_variable->getType()->getName() == "Doctrine\Common\Collections\Collection") {
                                $dynamic = $dynamicColeccion->findBy(array("language" => $this->session->get("lang_id"), $nombre_clase => $this->filter_3));
                            }else{
                                //echo "entra";
                                $dynamic = $dynamicColeccion->findBy(array("language" => $this->session->get("lang_id")));
                            }
                        }
                        # dynamic entities
                        $departments_vector = array();
                        $departements = array();
                        foreach ($dynamic as $region) {
                            $departements[$region->getTextTitle()] = $region->getId();
                            $departments_vector[$region->getTextTitle()] = array("SELECTED" => "SELECTED");
                        }
                        // lcfirst($property->name)
                        $builder->add(lcfirst($property->name), ChoiceType::class, [
                            'placeholder' => 'Regiones',
                            'choices' => $departements,
                            'choice_attr' => $departments_vector,
                            'required' => false,
                            'disabled' => false,
                            'multiple' => true,
                            'attr' => array(
                                'class' => 'form-control'
                            ),
                            'data' => $departements
                        ]);
                        if ($this->classString == "App\Entity\AvantioAccomodations" && $property->name == "dynamicRooms") {
                            $builder->add('dynamicRooms', CollectionType::class, [
                                'entry_type' => DynamicRooms::class,
                                'entry_options' => ['label' => false],
                                'allow_add' => true,
                            ]);
                        }

                    } else {
                        // empty
                    } // end if $datos_variable->getType
                }// end if excepciones
            } // end if getType

        }// end foreach

    } // end function



    public function tratarColecciones(&$forms, &$viewData)
    {

        # tratamiento de url semantica
        $url_semantica = "";
        $autoSlug = "";
        $textSlug = "";
        $textTitle = "";

        //var_dump($this->excepciones);
        //die();

        # recorremos con reflector las propieaddes del objeto
        //var_dump($this->reflector->getProperties());
        foreach ($this->reflector->getProperties() as $property){
            if (!in_array($property->name,$this->excepciones["dynamic"]) && !in_array($property->name,$this->excepciones["avantio"]) ){
                //echo "propiedad: " .$property->name. "<br>";
                # obtenemos el nombre la propiedad y la ponemos la primera en mayusculas | ponemos metodo seter
                $nombrePropiedad = ucfirst($property->name);
                $metodo = "set".$nombrePropiedad;
                # miramos el tipo de dato de la propiedad
                $datos_variable = new ReflectionProperty($this->classString,$property->name);
                $nombre_clase = str_replace("App\\Entity\\","",$this->nombre_objeto);
                $nombre_clase = lcfirst($nombre_clase);
                if ($datos_variable->getType() != null){
                    if ($datos_variable->getType()->getName() == "Doctrine\Common\Collections\Collection") {
                        # fill data collection
                        if ($forms[$property->name]->getData()){
                            # Dynamic collection | DynamicGeoregion
                            $colecciones = $forms[$property->name]->getData();
                            $nombreColeccion = ucfirst($nombrePropiedad);
                            $metodo_coleccion = "add".$nombreColeccion;
                            $nombre_coleccion = str_replace("_", "", $nombreColeccion);
                            $nombre_repositorio = "App\\Repository\\" . $nombreColeccion . "Repository";
                            $dynamicColeccion = $this->em->getRepository("App\Entity\\" . $nombre_coleccion);
                            $dynamic = $dynamicColeccion->findBy(array("id" => $colecciones , "language" => $this->session->get("lang_id")));
                            foreach ($dynamic as $dyn){
                                $viewData->{$metodo_coleccion}($dyn);
                            }
                        } // end if
                    # cogemos el identificador del dynamic
                    }else if (strpos($nombrePropiedad, "Dynamic") !== false){
                        if ($forms[$property->name]->getData()){
                            $id = array_values($forms[$property->name]->getData());
                            if ($id){
                                if (is_array($id))
                                    $id = $id[0];

                                # Dynamic
                                $nombreColeccion = ucfirst($nombrePropiedad);
                                $nombre_coleccion = str_replace("_", "", $nombreColeccion);
                                $nombre_repositorio = "App\\Repository\\" . $nombreColeccion . "Repository";
                                $dynamicColeccion = $this->em->getRepository("App\Entity\\" . $nombre_coleccion);
                                $dynamic = $dynamicColeccion->findBy(array("id" => $id));
                                if (is_array($dynamic)){
                                    $dynamic = $dynamic[0];
                                }
                                $viewData->{$metodo}($dynamic);
                            } // end if
                        } // end if
                    }else if ($nombrePropiedad == "UpdateStatusAt" || $nombrePropiedad == "UpdateAt" || $nombrePropiedad == "DeletedAt") {
                        if ($forms[$property->name]->getData()) {
                            $fecha = new DateTime($forms[$property->name]->getData());
                        } else {
                            $fecha = new DateTime();
                        }
                        $viewData->{$metodo}($fecha);
                    }else if( ($property->name != $nombre_clase && $nombre_clase != "language") || ($nombre_clase == "language")  ){
                        # textTitle
                        if ($property->name == "textTitle"){
                            $textTitle = $forms[$property->name]->getData();
                        }
                        # textSlug
                        if ($property->name == "textSlug"){
                            $textSlug = $forms[$property->name]->getData();
                        }
                        if (isset($forms[$property->name])){
                            // echo "propiedad: " . $property->name . "valor: " . $forms[$property->name]->getData() . "<br>";
                            // var_dump($forms[$property->name]->getData());
                            $viewData->{$metodo}($forms[$property->name]->getData());
                        }

                    } // end if
                } // end if null variable

            } // end if exceptions

        } // end foreach

        # new | si es new creamos un nuevo id
        if ($this->tipo_de_accion == "new"){
            $this->nuevoId($viewData , $forms);
        # update | creamos url semantica si procede
        }else{
            if ($textSlug == ""){
                # creamos la nueva url
                $viewData->setAutoSlug(url_semantica($forms["textTitle"]->getData()));
            }
            $viewData->setTextPageTitle($forms["textTitle"]->getData());
        } // end if

        //var_dump($viewData);
        //die();

    } // end function



    private function nuevoId(&$viewData , $forms)
    {
        # obtenemos el nombre la propiedad
        $nombre_clase_actual_vector = explode("\\",$this->nombre_objeto);
        $nombre_clase_actual = $nombre_clase_actual_vector[count($nombre_clase_actual_vector)-1];
        $nombre_clase_actual = lcfirst($nombre_clase_actual);

        //var_dump($this->classString);
        //die();

        # si clase language cogo id sino cogo campo con nombre clase
        if ($this->classString == "App\Entity\Language"){
            $query = $this->em->createQuery("SELECT MAX(u.id) FROM $this->nombre_objeto u");
        }else{
            $query = $this->em->createQuery("SELECT MAX(u.$nombre_clase_actual) FROM $this->nombre_objeto u");
        }
        $count = $query->getSingleScalarResult();

        # si clase language sumo 111 sino sumo 1
        if ($this->classString == "App\Entity\Language"){
            $count+= 111;
        }else{
            $count++;
        }

        $metodo_nombre = "set" . ucfirst($nombre_clase_actual);

        # guardmaos propiedad del objeto | id objeto | lenguage
        if ($this->classString != "App\Entity\Language"){
            $viewData->setLanguage($this->session->get("lang_id"));
            $viewData->setId($count.$this->session->get("lang_id"));
        }else{
            $viewData->setId($count);
        }

        # si clase language guardo 111 mas sino guardo 1 mas el lenguage (111 o 222 o 333)
        if ($this->classString != "App\Entity\Language"){
            $viewData->{$metodo_nombre}($count.$this->session->get("language"));
        }

        //var_dump($viewData);
        //die();

        # creamos la nueva url
        $viewData->setTextPageTitle($forms["textTitle"]->getData());
        $viewData->setAutoSlug(url_semantica($forms["textTitle"]->getData()));

        # general fields
        $viewData->setStatus("ACTIVED");

        return $viewData;

    }

    /**
     * @return mixed
     */
    public function getExcepciones()
    {
        return $this->excepciones;
    }

    /**
     * @param mixed $excepciones
     */
    public function setExcepciones($excepciones): void
    {
        $this->excepciones = $excepciones;
    }

    /**
     * @return mixed
     */
    public function getOptions()
    {
        return $this->options;
    }

    /**
     * @param mixed $opciones
     */
    public function setOptions($options): void
    {
        $this->options = $options;
    }

    /**
     * @return mixed
     */
    public function getBuilder()
    {
        return $this->builder;
    }

    /**
     * @param mixed $builder
     */
    public function setBuilder($builder): void
    {
        $this->builder = $builder;
    }

    /**
     * @return mixed
     */
    public function getReflector()
    {
        return $this->reflector;
    }

    /**
     * @param mixed $reflector
     */
    public function setReflector($reflector): void
    {
        $this->reflector = $reflector;
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

    /**
     * @return mixed
     */
    public function getClassString()
    {
        return $this->classString;
    }

    /**
     * @param mixed $classString
     */
    public function setClassString($classString): void
    {
        $this->classString = $classString;
    }

    /**
     * @return mixed
     */
    public function getEm()
    {
        return $this->em;
    }

    /**
     * @param mixed $em
     */
    public function setEm($em): void
    {
        $this->em = $em;
    }

    /**
     * @return mixed
     */
    public function getConnection()
    {
        return $this->connection;
    }

    /**
     * @param mixed $connection
     */
    public function setConnection($connection): void
    {
        $this->connection = $connection;
    }

    /**
     * @return mixed
     */
    public function getSession()
    {
        return $this->session;
    }

    /**
     * @param mixed $session
     */
    public function setSession($session): void
    {
        $this->session = $session;
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

    public function getTipoDeAccion(): string
    {
        return $this->tipo_de_accion;
    }

    public function setTipoDeAccion(string $tipo_de_accion): void
    {
        $this->tipo_de_accion = $tipo_de_accion;
    }



}