<?php
namespace App\Model\Table;

use App\Model\DynamicModel\DynamicModel;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\Translation\TranslatorInterface;
use Omines\DataTablesBundle\DataTableFactory;
use Omines\DataTablesBundle\DataTable as DataTableOmines;

class Datatable
{
    # datatable factoria
    protected DataTableFactory $dataTableFactory;
    # datatable
    protected DataTableOmines $table;

    public function __construct(DataTableFactory $dataTableFactory)
    {
        # creamos la datatable desde la factory
        $this->dataTableFactory = $dataTableFactory;
        $this->table = $this->dataTableFactory->create();
    }

    /**
     * @return Datatable
     */
    public function getTable(): DataTableOmines
    {
        return $this->table;
    }

    /**
     * @param Datatable $table
     */
    public function setTable(DataTableOmines $table): void
    {
        $this->table = $table;
    }



}