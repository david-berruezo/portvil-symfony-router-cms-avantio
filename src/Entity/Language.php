<?php
namespace App\Entity;

use App\Repository\LanguageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LanguageRepository::class)]
class Language
{

    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'NONE')]
    #[ORM\Column(name: 'id', type: 'integer', nullable: false, options: ['comment' => 'Identificador'])]
    private ?int $id=0;

    #[ORM\Column(name: 'language', type: 'string', length: 45, nullable: true, options: ['comment' => 'Identificador lenguaje'])]
    private ?string $language = "es";

    #[ORM\Column(name: 'text_title', type: 'string', length: 45, nullable: true, options: ['comment' => 'Identificador lenguaje'])]
    private ?string $textTitle = "es";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_name', type: 'string', length: 45, nullable: true, options: ['comment' => 'Idioma'])]
    private ?string $textName = "";

    /**
     * @var bool
     *
     */
    #[ORM\Column(name: 'number_actived', type: 'boolean', nullable: true, options: ['comment' => 'Activado'])]
    private ?int $numberActived = 0;

    /**
     * @var bool
     *
     */
    #[ORM\Column(name: 'number_default', type: 'boolean', nullable: true, options: ['comment' => 'Defecto'])]
    private ?int $numberDefault = 0;


    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_locale', type: 'string', length: 45, nullable: true, options: ['comment' => 'Local'])]
    private ?string $textLocale = '';

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_lang', type: 'string', length: 45, nullable: true, options: ['comment' => 'Texto Idioma'])]
    private ?string $textLang = '';

    #[ORM\Column(name: 'textarea_description', type: 'text',  nullable: true, options: ['comment' => 'Descripción'])]
    private ?string $textareaDescription = "";


    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_page_title', type: 'string', length: 120, nullable: true, options: ['comment' => 'Título de la pestaña de la página'])]
    private ?string $textPageTitle = "";

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url manual (vacío usará auto slug)'])]
    private ?string $textSlug = "";

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'auto_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url corta (auto slug)'])]
    private ?string $autoSlug = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_keywords', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Keywords (máx 255 carácteres)'])]
    private ?string $textMetaKeywords = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_description', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Description (max 255 characters)'])]
    private ?string $textMetaDescription = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_robots', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Robots (max 45 characters)'])]
    private ?string $textMetaRobots = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_header', type: 'text',  nullable: true, options: ['comment' => 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private ?string $textareaScriptsHeader = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_body', type: 'text',  nullable: true, options: ['comment' => 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private ?string $textareaScriptsBody = "";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'status', type: 'string', length: 128, nullable: true)]
    private ?string $status = "";


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

    /**
     * @var int
     *
     */
    #[ORM\Column(name: 'position', type: 'integer', nullable: true)]
    private ?int $position = 0;

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

    /**
     * @return mixed
     */
    public function getLanguage(): ?string
    {
        return $this->language;
    }

    /**
     * @param mixed $language
     */
    public function setLanguage(?string $language): void
    {
        $this->language = $language;
    }


    /*
    public function getDynamicGeocountry(): Collection
    {
        return $this->dynamicGeocountry;
    }


    public function setDynamicGeocountry(Collection $dynamicGeocountry): void
    {
        $this->dynamicGeocountry = $dynamicGeocountry;
    }


    public function addDynamicGeocountry(DynamicGeocountry $dynamicGeocountry): self
    {
        if (!$this->dynamicGeocountry->contains($dynamicGeocountry)){
            $this->dynamicGeocountry[] = $dynamicGeocountry;
            $dynamicGeocountry->setLanguage($this);
        }
        return $this;
    }

    public function removeDynamicGeocountry(DynamicGeocountry $dynamicGeocountry): self
    {
        if ($this->dynamicGeocountry->contains($dynamicGeocountry)) {
            $this->dynamicGeocountry->removeElement($dynamicGeoregion);
            $dynamicGeocountry->setLanguage(null);
        }
        return $this;
    }



    public function getDynamicGeoregion(): Collection
    {
        return $this->dynamicGeoregion;
    }


    public function setDynamicGeoregion(Collection $dynamicGeoregion): void
    {
        $this->dynamicGeoregion = $dynamicGeoregion;
    }


    public function addDynamicGeoregion(DynamicGeoregion $dynamicGeoregion): self
    {
        if (!$this->dynamicGeoregion->contains($dynamicGeoregion)){
            $this->dynamicGeoregion[] = $dynamicGeoregion;
            $dynamicGeoregion->setLanguage($this);
        }
        return $this;
    }

    public function removeDynamicGeoregion(DynamicGeoregion $dynamicGeoregion): self
    {
        if ($this->dynamicGeoregion->contains($dynamicGeoregion)) {
            $this->dynamicGeoregion->removeElement($dynamicGeoregion);
            $dynamicGeoregion->setLanguage(null);
        }
        return $this;
    }



    public function getDynamicGeocity(): Collection
    {
        return $this->dynamicGeocity;
    }


    public function setDynamicGeocity(Collection $dynamicGeocity): void
    {
        $this->dynamicGeocity = $dynamicGeocity;
    }


    public function addDynamicGeocity(DynamicGeocity $dynamicGeocity): self
    {
        if (!$this->dynamicGeocity->contains($dynamicGeocity)){
            $this->dynamicGeocity[] = $dynamicGeocity;
            $dynamicGeocity->setLanguage($this);
        }
        return $this;
    }

    public function removeDynamicGeocity(DynamicGeocity $dynamicGeocity): self
    {
        if ($this->dynamicGeocity->contains($dynamicGeocity)) {
            $this->dynamicGeocity->removeElement($dynamicGeocity);
            $dynamicGeocity->setLanguage(null);
        }
        return $this;
    }
    */

    /**
     * @return string|null
     */
    public function getTextName(): ?string
    {
        return $this->textName;
    }

    /**
     * @param string|null $textName
     */
    public function setTextName(?string $textName): void
    {
        $this->textName = $textName;
    }

    /**
     * @return bool|string
     */
    public function getNumberActived(): ?int
    {
        return $this->numberActived;
    }

    /**
     * @param bool|string $numberActived
     */
    public function setNumberActived(?int $numberActived): void
    {
        $this->numberActived = $numberActived;
    }

    /**
     * @return bool|string
     */
    public function getNumberDefault(): ?string
    {
        return $this->numberDefault;
    }

    /**
     * @param bool|string $numberDefault
     */
    public function setNumberDefault(?int $numberDefault): void
    {
        $this->numberDefault = $numberDefault;
    }

    /**
     * @return string
     */
    public function getTextLocale(): ?string
    {
        return $this->textLocale;
    }

    /**
     * @param string $textLocale
     */
    public function setTextLocale(?string $textLocale): void
    {
        $this->textLocale = $textLocale;
    }

    /**
     * @return string
     */
    public function getTextLang(): ?string
    {
        return $this->textLang;
    }

    /**
     * @param string $textLang
     */
    public function setTextLang(?string $textLang): void
    {
        $this->textLang = $textLang;
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
     * @return int|null
     */
    public function getPosition(): ?int
    {
        return $this->position;
    }


    /**
     * @param int|null $position
     */
    public function setPosition(?int $position): void
    {
        $this->position = $position;
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

    public function getTextSlug(): ?string
    {
        return $this->textSlug;
    }

    public function setTextSlug(?string $textSlug): void
    {
        $this->textSlug = $textSlug;
    }

    public function getAutoSlug(): ?string
    {
        return $this->autoSlug;
    }

    public function setAutoSlug(?string $autoSlug): void
    {
        $this->autoSlug = $autoSlug;
    }

    public function getTextMetaKeywords(): ?string
    {
        return $this->textMetaKeywords;
    }

    public function setTextMetaKeywords(?string $textMetaKeywords): void
    {
        $this->textMetaKeywords = $textMetaKeywords;
    }

    public function getTextMetaDescription(): ?string
    {
        return $this->textMetaDescription;
    }

    public function setTextMetaDescription(?string $textMetaDescription): void
    {
        $this->textMetaDescription = $textMetaDescription;
    }

    public function getTextMetaRobots(): ?string
    {
        return $this->textMetaRobots;
    }

    public function setTextMetaRobots(?string $textMetaRobots): void
    {
        $this->textMetaRobots = $textMetaRobots;
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

    public function getUpdatedAt(): ?\DateTime
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTime $updatedAt): void
    {
        $this->updatedAt = $updatedAt;
    }

    public function getDeletedAt(): ?\DateTime
    {
        return $this->deletedAt;
    }

    public function setDeletedAt(?\DateTime $deletedAt): void
    {
        $this->deletedAt = $deletedAt;
    }

}
