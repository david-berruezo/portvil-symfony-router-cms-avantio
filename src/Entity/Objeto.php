<?php

namespace App\Entity;

use App\Repository\ObjetoRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ObjetoRepository::class)]
class Objeto
{
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'NONE')]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título (máximo 255 caracteres)'])]
    private ?string $textTitle;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_description', type: 'text',  nullable: true, options: ['comment' => 'Descripción'])]
    private ?string $textareaDescription;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_page_title', type: 'string', length: 120, nullable: true, options: ['comment' => 'Título de la pestaña de la página'])]
    private ?string $textPageTitle;

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url manual (vacío usará auto slug)'])]
    private ?string $textSlug;

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'auto_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url corta (auto slug)'])]
    private ?string $autoSlug;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_keywords', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Keywords (máx 255 carácteres)'])]
    private ?string $textMetaKeywords;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_description', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Description (max 255 characters)'])]
    private ?string $textMetaDescription;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_robots', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Robots (max 45 characters)'])]
    private ?string $textMetaRobots;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_header', type: 'text',  nullable: true, options: ['comment' => 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private ?string $textareaScriptsHeader;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_body', type: 'text',  nullable: true, options: ['comment' => 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private ?string $textareaScriptsBody;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'status', type: 'string', length: 128, nullable: true)]
    private ?string $status;

    /**
     * @var int
     *
     */
    #[ORM\Column(name: 'position', type: 'integer', nullable: true)]
    private ?string $position;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'created_at', type: 'datetime', nullable: true)]
    private ?\DateTime $createdAt;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'updated_at', type: 'datetime', nullable: true)]
    private ?\DateTime $updatedAt;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'deleted_at', type: 'datetime', nullable: true)]
    private ?\DateTime $deletedAt;



    public function __construct()
    {
        # initialize collections
        //$this->dynamicGeoregion = new ArrayCollection();
    }


    /**
     * @return int
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    /**
     * @param string $textTitle
     */
    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }



    /**
     * @return string|null
     */
    public function getStatus(): ?string
    {
        return $this->status;
    }

    /**
     * @param string|null $status
     */
    public function setStatus(?string $status): void
    {
        $this->status = $status;
    }

    /**
     * @return int|string
     */
    public function getPosition(): ?int
    {
        return $this->position;
    }

    /**
     * @param int|string $position
     */
    public function setPosition(?int $position): void
    {
        $this->position = $position;
    }

    /**
     * @return \DateTime|null
     */
    public function getUpdateAt(): ?\DateTime
    {
        return $this->updateAt;
    }


    /**
     * @param \DateTime|null $updateAt
     */
    public function setUpdateAt(?\DateTime $updateAt): void
    {
        $this->updateAt = $updateAt;
    }

    /**
     * @return string|null
     */
    public function getTextareaDescription(): ?string
    {
        return $this->textareaDescription;
    }

    /**
     * @param string|null $textareaDescription
     */
    public function setTextareaDescription(?string $textareaDescription): void
    {
        $this->textareaDescription = $textareaDescription;
    }

    /**
     * @return string|null
     */
    public function getTextPageTitle(): ?string
    {
        return $this->textPageTitle;
    }

    /**
     * @param string|null $textPageTitle
     */
    public function setTextPageTitle(?string $textPageTitle): void
    {
        $this->textPageTitle = $textPageTitle;
    }

    /**
     * @return string
     */
    public function getTextSlug(): ?string
    {
        return $this->textSlug;
    }

    /**
     * @param string $textSlug
     */
    public function setTextSlug(?string $textSlug): void
    {
        $this->textSlug = $textSlug;
    }

    /**
     * @return string
     */
    public function getAutoSlug(): ?string
    {
        return $this->autoSlug;
    }

    /**
     * @param string $autoSlug
     */
    public function setAutoSlug(?string $autoSlug): void
    {
        $this->autoSlug = $autoSlug;
    }

    /**
     * @return string|null
     */
    public function getTextMetaKeywords(): ?string
    {
        return $this->textMetaKeywords;
    }

    /**
     * @param string|null $textMetaKeywords
     */
    public function setTextMetaKeywords(?string $textMetaKeywords): void
    {
        $this->textMetaKeywords = $textMetaKeywords;
    }

    /**
     * @return string|null
     */
    public function getTextMetaDescription(): ?string
    {
        return $this->textMetaDescription;
    }

    /**
     * @param string|null $textMetaDescription
     */
    public function setTextMetaDescription(?string $textMetaDescription): void
    {
        $this->textMetaDescription = $textMetaDescription;
    }

    /**
     * @return string|null
     */
    public function getTextMetaRobots(): ?string
    {
        return $this->textMetaRobots;
    }

    /**
     * @param string|null $textMetaRobots
     */
    public function setTextMetaRobots(?string $textMetaRobots): void
    {
        $this->textMetaRobots = $textMetaRobots;
    }

    /**
     * @return string|null
     */
    public function getTextareaScriptsHeader(): ?string
    {
        return $this->textareaScriptsHeader;
    }

    /**
     * @param string|null $textareaScriptsHeader
     */
    public function setTextareaScriptsHeader(?string $textareaScriptsHeader): void
    {
        $this->textareaScriptsHeader = $textareaScriptsHeader;
    }

    /**
     * @return string|null
     */
    public function getTextareaScriptsBody(): ?string
    {
        return $this->textareaScriptsBody;
    }

    /**
     * @param string|null $textareaScriptsBody
     */
    public function setTextareaScriptsBody(?string $textareaScriptsBody): void
    {
        $this->textareaScriptsBody = $textareaScriptsBody;
    }

    /**
     * @return \DateTime|null
     */
    public function getCreatedAt(): ?\DateTime
    {
        return $this->createdAt;
    }

    /**
     * @param \DateTime|null $createdAt
     */
    public function setCreatedAt(?\DateTime $createdAt): void
    {
        $this->createdAt = $createdAt;
    }

    /**
     * @return \DateTime|null
     */
    public function getUpdatedAt(): ?\DateTime
    {
        return $this->updatedAt;
    }

    /**
     * @param \DateTime|null $updatedAt
     */
    public function setUpdatedAt(?\DateTime $updatedAt): void
    {
        $this->updatedAt = $updatedAt;
    }

    /**
     * @return \DateTime|null
     */
    public function getDeletedAt(): ?\DateTime
    {
        return $this->deletedAt;
    }

    /**
     * @param \DateTime|null $deletedAt
     */
    public function setDeletedAt(?\DateTime $deletedAt): void
    {
        $this->deletedAt = $deletedAt;
    }
}
