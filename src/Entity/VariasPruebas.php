<?php
namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\VariasPruebasRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Prueba;

#[ORM\Entity(repositoryClass: VariasPruebasRepository::class)]
/*#[ORM\Index(name: "idx_prueba", columns: ["prueba"])]*/
#[ApiResource]
class VariasPruebas
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título (máximo 255 caracteres)'])]
    private ?string $textTitle = "";

    /*
    #[ORM\ManyToOne(targetEntity: Prueba::class, inversedBy: 'variasPruebas')]
    #[ORM\JoinColumn(name: 'prueba', referencedColumnName: 'id')]
    private ?Prueba $prueba;
    */

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }
    /*
    public function getPrueba(): ?\App\Entity\Prueba
    {
        return $this->prueba;
    }

    public function setPrueba(?\App\Entity\Prueba $prueba): void
    {
        $this->prueba = $prueba;
    }
    */

    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

}
