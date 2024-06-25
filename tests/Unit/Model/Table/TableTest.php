<?php
namespace App\Tests\Unit\Model\Table;

use App\Model\DynamicModel\DynamicModel;
use App\Model\Table\Cabecera;
use App\Model\Table\Datatable;
use App\Model\Table\Registro;
use Omines\DataTablesBundle\DataTableFactory;
use PHPUnit\Framework\TestCase;

use ReflectionClass;
use ReflectionException;
use ReflectionProperty;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Contracts\Translation\TranslatorInterface;

class TableTest extends TestCase
{

    public function testConstructorCallsInternalMethods()
    {
        $classname = 'App\Model\Table\Table';

        $table = $this->getMockBuilder($classname)
            ->disableOriginalConstructor()
            ->getMock();

        var_dump($table);

        /*
        // Get mock, without the constructor being called
        $mock = $this->getMockBuilder($classname)
            ->disableOriginalConstructor()
            ->getMock();

        var_dump($mock->getCabecera());
        var_dump($mock);


        // set expectations for constructor calls
        $mock->expects($this->once())
            ->method('setDoors')
            ->with(
                $this->equalTo(4)
            );
        */

        // now call the constructor
        $reflectedClass = new ReflectionClass($classname);
        $constructor = $reflectedClass->getConstructor();

        // $constructor->invoke($mock, 4);
    }
}
?>