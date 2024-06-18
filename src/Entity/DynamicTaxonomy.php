<?php
namespace App\Entity;

use App\Repository\DynamicTaxonomyRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * DynamicTaxonomy
 *
 */
#[ORM\Table(name: 'dynamic_taxonomy')]
#[ORM\Entity(repositoryClass: DynamicTaxonomyRepository::class)]
class DynamicTaxonomy
{
    /**
     * @var int
     *
     */
    #[ORM\Column(name: 'id', type: 'integer', nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'NONE')]
    private ?int $id = null;

    #[ORM\Column(name: 'language', type: 'integer', nullable: false)]
    private ?int $language;

    #[ORM\Column(name: 'dynamic_taxonomy', type: 'integer', nullable: false)]
    private ?int $dynamicTaxonomy;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título de la Taxonomía (en cabecera)'])]
    private ?string $textTitle;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_title_url', type: 'string', length: 75, nullable: true, options: ['comment' => 'título url'])]
    private ?string $textTitleUrl;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_title_plural', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título de la Taxonomía (plural, en cabecera)'])]
    private $textTitlePlural;

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_subtitle', type: 'string', length: 255, nullable: true, options: ['comment' => 'Subtítulo de la Cabecera'])]
    private ?string $textSubtitle = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'dynamic_taxonomy_group', type: 'string', length: 45, nullable: true, options: ['comment' => 'Grupos de taxonomias'])]
    private $dynamicTaxonomyGroup;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_description', type: 'text',  nullable: true, options: ['comment' => 'Descripción principal'])]
    private $textareaDescription;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_page_title', type: 'string', length: 45, nullable: true)]
    private $textPageTitle;

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'auto_slug', type: 'string', length: 255, nullable: false, options: ['comment' => 'Url corta (auto slug)'])]
    private $autoSlug = '';

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_slug', type: 'string', length: 255, nullable: false, options: ['comment' => 'Url manual (vacío usará auto slug)'])]
    private $textSlug = '';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_keywords', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Keywords (máx 255 characters)'])]
    private $textMetaKeywords;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_robots', type: 'string', length: 45, nullable: true, options: ['comment' => 'Meta Robots (max 45 characters)'])]
    private $textMetaRobots;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_description', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Description (max 255 characters)'])]
    private $textMetaDescription;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_header', type: 'text',  nullable: true, options: ['comment' => 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private $textareaScriptsHeader;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_body', type: 'text',  nullable: true, options: ['comment' => 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private $textareaScriptsBody;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'status', type: 'string', length: 128, nullable: true)]
    private $status;

    /**
     * @var int
     *
     */
    #[ORM\Column(name: 'position', type: 'integer', nullable: false)]
    private $position = '0';

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'status_realstate', type: 'string', length: 128, nullable: true)]
    private $statusRealstate;

    /**
     * @var \DateTime|null
     *
     */
    #[ORM\Column(name: 'update_at', type: 'datetime', nullable: true)]
    private $updateAt;

    public function getId(): int|string
    {
        return $this->id;
    }

    public function setId(int|string $id): void
    {
        $this->id = $id;
    }

    public function getLanguage(): ?int
    {
        return $this->language;
    }

    public function setLanguage(?int $language): void
    {
        $this->language = $language;
    }

    public function getDynamicTaxonomy(): ?int
    {
        return $this->dynamicTaxonomy;
    }

    public function setDynamicTaxonomy(?int $dynamicTaxonomy): void
    {
        $this->dynamicTaxonomy = $dynamicTaxonomy;
    }

    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

    public function getTextTitleUrl(): ?string
    {
        return $this->textTitleUrl;
    }

    public function setTextTitleUrl(?string $textTitleUrl): void
    {
        $this->textTitleUrl = $textTitleUrl;
    }

    public function getTextTitlePlural(): ?string
    {
        return $this->textTitlePlural;
    }

    public function setTextTitlePlural(?string $textTitlePlural): void
    {
        $this->textTitlePlural = $textTitlePlural;
    }

    public function getTextSubtitle(): ?string
    {
        return $this->textSubtitle;
    }

    public function setTextSubtitle(?string $textSubtitle): void
    {
        $this->textSubtitle = $textSubtitle;
    }

    public function getDynamicTaxonomyGroup(): ?string
    {
        return $this->dynamicTaxonomyGroup;
    }

    public function setDynamicTaxonomyGroup(?string $dynamicTaxonomyGroup): void
    {
        $this->dynamicTaxonomyGroup = $dynamicTaxonomyGroup;
    }

    public function getTextareaDescription(): ?string
    {
        return $this->textareaDescription;
    }

    public function setTextareaDescription(?string $textareaDescription): void
    {
        $this->textareaDescription = $textareaDescription;
    }

    public function getTextPageTitle(): ?string
    {
        return $this->textPageTitle;
    }

    public function setTextPageTitle(?string $textPageTitle): void
    {
        $this->textPageTitle = $textPageTitle;
    }

    public function getAutoSlug(): string
    {
        return $this->autoSlug;
    }

    public function setAutoSlug(string $autoSlug): void
    {
        $this->autoSlug = $autoSlug;
    }

    public function getTextSlug(): string
    {
        return $this->textSlug;
    }

    public function setTextSlug(string $textSlug): void
    {
        $this->textSlug = $textSlug;
    }

    public function getTextMetaKeywords(): ?string
    {
        return $this->textMetaKeywords;
    }

    public function setTextMetaKeywords(?string $textMetaKeywords): void
    {
        $this->textMetaKeywords = $textMetaKeywords;
    }

    public function getTextMetaRobots(): ?string
    {
        return $this->textMetaRobots;
    }

    public function setTextMetaRobots(?string $textMetaRobots): void
    {
        $this->textMetaRobots = $textMetaRobots;
    }

    public function getTextMetaDescription(): ?string
    {
        return $this->textMetaDescription;
    }

    public function setTextMetaDescription(?string $textMetaDescription): void
    {
        $this->textMetaDescription = $textMetaDescription;
    }

    public function getTextareaScriptsHeader(): ?string
    {
        return $this->textareaScriptsHeader;
    }

    public function setTextareaScriptsHeader(?string $textareaScriptsHeader): void
    {
        $this->textareaScriptsHeader = $textareaScriptsHeader;
    }

    public function getTextareaScriptsBody(): ?string
    {
        return $this->textareaScriptsBody;
    }

    public function setTextareaScriptsBody(?string $textareaScriptsBody): void
    {
        $this->textareaScriptsBody = $textareaScriptsBody;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): void
    {
        $this->status = $status;
    }

    public function getPosition(): int|string
    {
        return $this->position;
    }

    public function setPosition(int|string $position): void
    {
        $this->position = $position;
    }

    public function getStatusRealstate(): ?string
    {
        return $this->statusRealstate;
    }

    public function setStatusRealstate(?string $statusRealstate): void
    {
        $this->statusRealstate = $statusRealstate;
    }

    public function getUpdateAt(): ?\DateTime
    {
        return $this->updateAt;
    }

    public function setUpdateAt(?\DateTime $updateAt): void
    {
        $this->updateAt = $updateAt;
    }


}
