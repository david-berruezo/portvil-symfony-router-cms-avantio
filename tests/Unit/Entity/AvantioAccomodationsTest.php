<?php
namespace App\Tests\Unit\Entity;

use PHPUnit\Framework\TestCase;

class AvantioAccomodationsTest extends TestCase
{
    public function testGetId()
    {
        $id = 2;
        $this->assertIsInt(
            $id,
            "actual value is Integer or not"
       );
    }
}
?>
