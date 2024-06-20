<?php
namespace App\Tests\Unit\Entity;

use PHPUnit\Framework\TestCase;

class AvantioAccomodationsTest extends TestCase
{
    public function testGetId()
    {
       $this->assertIsInt(
            $this->id,
            "actual value is Integer or not"
       );
    }
}
?>
