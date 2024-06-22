<?php
namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\VariasRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Prueba;

#[ORM\Table(name: 'varias')]
#[ORM\Entity(repositoryClass: VariasRepository::class)]
/*#[ORM\Index(name: "idx_prueba", columns: ["prueba"])]*/

class Varias
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título (máximo 255 caracteres)'])]
    private ?string $textTitle = "";

    #[ORM\ManyToOne(targetEntity: Prueba::class, inversedBy: 'varias')]
    #[ORM\JoinColumn(name: 'prueba', referencedColumnName: 'id')]
    private ?int $prueba;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    public function getPrueba(): ?int
    {
        return $this->prueba;
    }

    public function setPrueba(?int $prueba): void
    {
        $this->prueba = $prueba;
    }


    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

}
