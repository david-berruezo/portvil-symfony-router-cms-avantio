<?php
namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\PruebaRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Varias;
use ApiPlatform\Metadata\Delete;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use ApiPlatform\Metadata\Patch;
use ApiPlatform\Metadata\Post;
use ApiPlatform\Metadata\Put;

#[ORM\Entity(repositoryClass: PruebaRepository::class)]
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

class Prueba
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título (máximo 255 caracteres)'])]
    private ?string $textTitle = "";

    #[ORM\OneToMany(targetEntity: Varias::class, mappedBy: 'prueba',cascade: ['persist', 'remove'])]
    #[Groups('prueba',['read', 'write'])]
    private ?Collection $varias;

    public function getId(): ?int
    {
        return $this->id;
    }


    public function getVarias(): ?iterable
    {
        return $this->varias;
    }

    public function setVarias(?iterable $varias): void
    {
        $this->varias = $varias;
    }

    public function addVarias(Varias $varias)
    {

        # agregamos el nuevo Tag a la coleccion tags
        $this->varias->add($varias);

        return $this;

    }


    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

}
