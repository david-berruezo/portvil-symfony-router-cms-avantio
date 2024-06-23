<?php
namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Delete;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Put;
use App\Repository\VariasRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Prueba;

#[ORM\Table(name: 'varias')]
#[ORM\Entity(repositoryClass: VariasRepository::class)]
/*#[ORM\Index(name: "idx_prueba", columns: ["prueba"])]*/
#[ApiResource(
    description: 'Una prueba',
    operations: [
        new Get(),
        new GetCollection(),
        New Post(),
        New Put(),
        New Patch(),
        New Delete(),
    ],
    normalizationContext: ['groups' => ['prueba']]
)]
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
    #[Groups('prueba',['read', 'write'])]
    private ?Prueba $prueba;

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

    public function setPrueba(?Prueba $prueba): void
    {
        $this->prueba = $prueba;
    }


    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

}
