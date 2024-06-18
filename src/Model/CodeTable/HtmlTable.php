<?php
namespace App\Model\CodeTable;

use App\Model\CodeTable\Cabecera;
use App\Model\CodeTable\Datatable;
use App\Model\CodeTable\Registro;

use App\Model\DynamicModel;

class HtmlTable
{
    # table
    private Datatable $datatable;
    private Cabecera $cabecera;
    private Registro $registro;

    public function __construct()
    {
        # Instanciación de objetos table
        $this->cabecera = new Cabecera();
        $this->registro = new Registro();
        $this->datatable = new Datatable();
    }


    public function crearColumnasCabecera()
    {
        $labels = $this->cabecera->getDefinicionLabelColumnasCabecera();
        $this->datatable->getTable()->setHeading($labels);
    }


    public function crearColumnasResultado()
    {

        # obtenemos registros
        $registros = $this->registro->getDatos();

        # guardamos registros en la tabla
        foreach ($registros as $item) {
            $this->datatable->getTable()->addRow($item);
        }
    }


    /**
     * @return Datatable
     */
    public function getDatatable(): Datatable
    {
        return $this->datatable;
    }

    /**
     * @param Datatable $datatable
     */
    public function setDatatable(Datatable $datatable): void
    {
        $this->datatable = $datatable;
    }

    /**
     * @return Cabecera
     */
    public function getCabecera(): Cabecera
    {
        return $this->cabecera;
    }

    /**
     * @param Cabecera $cabecera
     */
    public function setCabecera(Cabecera $cabecera): void
    {
        $this->cabecera = $cabecera;
    }

    /**
     * @return Registro
     */
    public function getRegistro(): Registro
    {
        return $this->registro;
    }

    /**
     * @param Registro $registro
     */
    public function setRegistro(Registro $registro): void
    {
        $this->registro = $registro;
    }

}