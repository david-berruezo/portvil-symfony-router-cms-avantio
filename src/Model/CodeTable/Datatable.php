<?php
namespace App\Model\CodeTable;

use App\Model\CodeTable\HtmlTable;
use App\Model\CodeTable\MyTable;

class Datatable
{

    private $table;

    private $template = [
        'table_open'          => '<table class="table table-striped table-bordered table-hover" id="menu">',
        'heading_row_start'   => '<tr>',
        'heading_row_end'     => '</tr>',
        'heading_cell_start'  => '<th>',
        'heading_cell_end'    => '</th>',

        'row_start'           => '<tr>',
        'row_end'             => '</tr>',
        'cell_start'          => '<td>',
        'cell_end'            => '</td>',

        'row_alt_starft'       => '<tr>',
        'row_alt_end'         => '</tr>',
        'cell_alt_start'      => '<td>',
        'cell_alt_end'        => '</td>',

        'table_close'         => '</table>'
    ];

    public function __construct()
    {
        // Solo construimos
    }

    public function initDatatable()
    {
        $this->table = new MyTable();
        //$this->table = new \CodeIgniter\View\Table();
        $this->table->setTemplate($this->template);
    }

    /**
     * @return string[]
     */
    public function getTemplate(): array
    {
        return $this->template;
    }


    /**
     * @param string[] $template
     */
    public function setTemplate(array $template): void
    {
        $this->template = $template;
    }


    /**
     * @return Datatable
     */
    public function getTable(): MyTable
    {
        return $this->table;
    }

    /**
     * @param Datatable $table
     */
    public function setTable(MyTable $table): void
    {
        $this->table = $table;
    }



}