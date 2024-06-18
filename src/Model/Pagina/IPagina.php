<?php
namespace App\Model\Pagina;
use Omines\DataTablesBundle\DataTableFactory;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validator\ValidatorInterface;

interface IPagina
{
    public function list();

    public function new(Request $request , ValidatorInterface $validator , $id);

    public function edit(Request $request , DatatableFactory $dataTableFactory ,ValidatorInterface $validator);

    public function remove($id , Request $request);
    
    public function play($id , Request $request);
    public function pause($id , Request $request);

}