<?php

namespace App\Entity;

use ApiPlatform\Metadata\ApiResource;
use App\Repository\PruebaRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\VariasPruebas;
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
    ]
)]

class Prueba
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título (máximo 255 caracteres)'])]
    private ?string $textTitle = "";

    /*
    #[ORM\OneToMany(targetEntity: VariasPruebas::class, mappedBy: 'prueba')]
    private ?Collection $variasPruebas;
    */

    public function getId(): ?int
    {
        return $this->id;
    }

    /*
    public function getVariasPruebas(): ?Collection
    {
        return $this->variasPruebas;
    }

    public function setVariasPruebas(?Collection $variasPruebas): void
    {
        $this->variasPruebas = $variasPruebas;
    }
    */

    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

}
