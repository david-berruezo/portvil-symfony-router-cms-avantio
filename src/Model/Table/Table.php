<?php
namespace App\Model\Table;

use App\Model\Table\Cabecera;
use App\Model\Table\Registro;
use App\Model\Table\Datatable;

use App\Model\DynamicModel\DynamicModel;
use Symfony\Component\HttpFoundation\Request;
use Omines\DataTablesBundle\DataTableFactory;
use Omines\DataTablesBundle\Adapter\ArrayAdapter;
use Omines\DataTablesBundle\Adapter\Doctrine\ORMAdapter;
use Omines\DataTablesBundle\Column\TextColumn;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Contracts\Translation\TranslatorInterface;
use Omines\DataTablesBundle\DataTable as DataTableOmines;

class Table
{

    # table
    protected Datatable $datatable;
    protected Cabecera $cabecera;
    protected Registro $registro;

    public function __construct(DataTableFactory $dataTableFactory , TranslatorInterface $translator , Request $request , DynamicModel $dynamicModel)
    {
        # Instanciación de objetos table
        $this->cabecera = new Cabecera($translator,$request);
        $this->registro = new Registro($translator,$request);
        $this->datatable = new Datatable($dataTableFactory);

    }

    
    public function crearColumnasCabecera()
    {
        # labels
        $labels = $this->cabecera->getDefinicionLabelColumnasCabecera();
        # id
        $ids = $this->cabecera->getDefinicionIdColumnasCabecera();
        # raw
        $raws = $this->cabecera->getDefinicionRawColumnasCabecera();

        # datatable
        $table = $this->datatable->getTable();

        $counter = 0;
        foreach ($labels as $item) {
            $table->add($ids[$counter],TextColumn::class,['label' => $item , 'raw' => (bool)$raws[$counter]]);
            $counter++;
        }
    }

    public function crearRegistrosTabla()
    {
        # datatable
        $table = $this->datatable->getTable();

        $table->createAdapter(ArrayAdapter::class , $this->registro->getDatos());
    }


    public function finalizarTabla()
    {
        # datatable
        $table = $this->datatable->getTable();

        // manejador datatable
        $table->handleRequest($this->getCabecera()->getRequest());

        if ($table->isCallback()) {
            return $table->getResponse();
        }
    }


    public function getCabecera(): \App\Model\Table\Cabecera
    {
        return $this->cabecera;
    }


    public function setCabecera(\App\Model\Table\Cabecera $cabecera): void
    {
        $this->cabecera = $cabecera;
    }


    public function getRegistro(): \App\Model\Table\Registro
    {
        return $this->registro;
    }


    public function setRegistro(\App\Model\Table\Registro $registro): void
    {
        $this->registro = $registro;
    }

    /**
     * @return \App\Model\Table\Datatable
     */
    public function getDatatable(): \App\Model\Table\Datatable
    {
        return $this->datatable;
    }

    /**
     * @param \App\Model\Table\Datatable $datatable
     */
    public function setDatatable(\App\Model\Table\Datatable $datatable): void
    {
        $this->datatable = $datatable;
    }
    
}
