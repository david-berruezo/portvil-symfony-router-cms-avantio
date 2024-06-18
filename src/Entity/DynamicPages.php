<?php
namespace App\Entity;

use App\Repository\DynamicPagesRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Tabla;

/**
 * DynamicPages
 *
 */
#[ORM\Table(name: 'dynamic_pages')]
#[ORM\Entity(repositoryClass: DynamicPagesRepository::class)]
class DynamicPages
{
    /**
     * @var int
     *
     */
    #[ORM\Column(name: 'id', type: 'integer', nullable: false)]
    #[ORM\Id]
    #[ORM\GeneratedValue(strategy: 'NONE')]
    private ?int $id=0;

    #[ORM\Column(name: 'language', type: 'integer', nullable: false)]
    private ?int $language = 111;

    #[ORM\ManyToOne(targetEntity: Tabla::class, inversedBy: 'dynamicPages')]
    #[ORM\JoinColumn(name: 'tabla_id', referencedColumnName: 'id')]
    private ?Tabla $tabla = null;

    #[ORM\Column(name: 'dynamic_pages', type: 'integer', nullable: false)]
    private ?int $dynamicPages = 0;

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_title', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título Cabecera'])]
    private $textTitle="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_subtitle', type: 'string', length: 255, nullable: true, options: ['comment' => 'Subtítulo Cabecera (máx 100 carácteres)'])]
    private $textSubtitle="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dtitle_1', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título 1'])]
    private $textDtitle1="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dsubtitle_1', type: 'string', length: 255, nullable: true, options: ['comment' => 'Subtítulo 1'])]
    private $textDsubtitle1="";


    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_ddescription_1', type: 'text', nullable: true, options: ['comment' => 'Descripción 1'])]
    private $textareaDdescription1="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dtitle_2', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título 2'])]
    private $textDtitle2="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dsubtitle_2', type: 'string', length: 255, nullable: true, options: ['comment' => 'Subtítulo 2'])]
    private $textDsubtitle2="";


    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_ddescription_2', type: 'text', nullable: true, options: ['comment' => 'Descripción 2'])]
    private $textareaDdescription2="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dtitle_3', type: 'string', length: 255, nullable: true, options: ['comment' => 'Título 3'])]
    private $textDtitle3="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_dsubtitle_3', type: 'string', length: 255, nullable: true, options: ['comment' => 'Subtítulo 3'])]
    private $textDsubtitle3="";


    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_ddescription_3', type: 'text', nullable: true, options: ['comment' => 'Descripción 3'])]
    private $textareaDdescription3="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_description_inferior', type: 'text', nullable: true, options: ['comment' => 'Contenido de la página Inferior'])]
    private $textareaDescriptionInferior="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_description_home', type: 'text', nullable: true, options: ['comment' => 'Descripción 2'])]
    private $textareaDescriptionHome="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_page_title', type: 'string', length: 120, nullable: true, options: ['comment' => 'Título de la pestaña de la página'])]
    private $textPageTitle="";

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'text_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url manual (vacío usará auto slug)'])]
    private $textSlug="";

    /**
     * @var string
     *
     */
    #[ORM\Column(name: 'auto_slug', type: 'string', length: 255, nullable: true, options: ['comment' => 'Url corta (auto slug)'])]
    private $autoSlug="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_keywords', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Keywords (máx 255 carácteres)'])]
    private $textMetaKeywords="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_description', type: 'string', length: 255, nullable: true, options: ['comment' => 'Meta Description (max 255 characters)'])]
    private $textMetaDescription="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'text_meta_robots', type: 'string', length: 45, nullable: true, options: ['comment' => 'Meta Robots (max 45 characters)'])]
    private $textMetaRobots="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_header', type: 'text', nullable: true, options: ['comment' => 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private $textareaScriptsHeader="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'textarea_scripts_body', type: 'text', nullable: true, options: ['comment' => 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)'])]
    private $textareaScriptsBody="";

    /**
     * @var string|null
     *
     */
    #[ORM\Column(name: 'status', type: 'string', length: 128, nullable: true)]
    private $status="";

    /**
     * @var int
     *
     */
    #[ORM\Column(name: 'position', type: 'integer', nullable: false)]
    private $position=1;


    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId(int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return Languages|null
     */
    public function getLanguage(): ?int
    {
        return $this->language;
    }

    /**
     * @param Languages|null $language
     */
    public function setLanguage(?int $language): void
    {
        $this->language = $language;
    }

    /**
     * @return int|null
     */
    public function getDynamicPages(): ?int
    {
        return $this->dynamicPages;
    }

    /**
     * @param int|null $dynamicPages
     */
    public function setDynamicPages(?int $dynamicPages): void
    {
        $this->dynamicPages = $dynamicPages;
    }

    /**
     * @return null
     */
    public function getTabla(): ?Tabla
    {
        return $this->tabla;
    }

    /**
     * @param null $tabla
     */
    public function setTabla(?Tabla $tabla)
    {
        $this->tabla = $tabla;
    }

    /**
     * @return string|null
     */
    public function getTextTitle(): ?string
    {
        return $this->textTitle;
    }

    /**
     * @param string|null $textTitle
     */
    public function setTextTitle(?string $textTitle): void
    {
        $this->textTitle = $textTitle;
    }

    /**
     * @return string|null
     */
    public function getTextSubtitle(): ?string
    {
        return $this->textSubtitle;
    }

    /**
     * @param string|null $textSubtitle
     */
    public function setTextSubtitle(?string $textSubtitle): void
    {
        $this->textSubtitle = $textSubtitle;
    }

    /**
     * @return string|null
     */
    public function getTextDtitle1(): ?string
    {
        return $this->textDtitle1;
    }

    /**
     * @param string|null $textDtitle1
     */
    public function setTextDtitle1(?string $textDtitle1): void
    {
        $this->textDtitle1 = $textDtitle1;
    }

    /**
     * @return string|null
     */
    public function getTextDsubtitle1(): ?string
    {
        return $this->textDsubtitle1;
    }

    /**
     * @param string|null $textDsubtitle1
     */
    public function setTextDsubtitle1(?string $textDsubtitle1): void
    {
        $this->textDsubtitle1 = $textDsubtitle1;
    }

    /**
     * @return string|null
     */
    public function getTextareaDdescription1(): ?string
    {
        return $this->textareaDdescription1;
    }

    /**
     * @param string|null $textareaDdescription1
     */
    public function setTextareaDdescription1(?string $textareaDdescription1): void
    {
        $this->textareaDdescription1 = $textareaDdescription1;
    }

    /**
     * @return string|null
     */
    public function getTextDtitle2(): ?string
    {
        return $this->textDtitle2;
    }

    /**
     * @param string|null $textDtitle2
     */
    public function setTextDtitle2(?string $textDtitle2): void
    {
        $this->textDtitle2 = $textDtitle2;
    }

    /**
     * @return string|null
     */
    public function getTextDsubtitle2(): ?string
    {
        return $this->textDsubtitle2;
    }

    /**
     * @param string|null $textDsubtitle2
     */
    public function setTextDsubtitle2(?string $textDsubtitle2): void
    {
        $this->textDsubtitle2 = $textDsubtitle2;
    }

    /**
     * @return string|null
     */
    public function getTextareaDdescription2(): ?string
    {
        return $this->textareaDdescription2;
    }

    /**
     * @param string|null $textareaDdescription2
     */
    public function setTextareaDdescription2(?string $textareaDdescription2): void
    {
        $this->textareaDdescription2 = $textareaDdescription2;
    }

    /**
     * @return string|null
     */
    public function getTextDtitle3(): ?string
    {
        return $this->textDtitle3;
    }

    /**
     * @param string|null $textDtitle3
     */
    public function setTextDtitle3(?string $textDtitle3): void
    {
        $this->textDtitle3 = $textDtitle3;
    }

    /**
     * @return string|null
     */
    public function getTextDsubtitle3(): ?string
    {
        return $this->textDsubtitle3;
    }

    /**
     * @param string|null $textDsubtitle3
     */
    public function setTextDsubtitle3(?string $textDsubtitle3): void
    {
        $this->textDsubtitle3 = $textDsubtitle3;
    }

    /**
     * @return string|null
     */
    public function getTextareaDdescription3(): ?string
    {
        return $this->textareaDdescription3;
    }

    /**
     * @param string|null $textareaDdescription3
     */
    public function setTextareaDdescription3(?string $textareaDdescription3): void
    {
        $this->textareaDdescription3 = $textareaDdescription3;
    }

    /**
     * @return string|null
     */
    public function getTextareaDescriptionInferior(): ?string
    {
        return $this->textareaDescriptionInferior;
    }

    /**
     * @param string|null $textareaDescriptionInferior
     */
    public function setTextareaDescriptionInferior(?string $textareaDescriptionInferior): void
    {
        $this->textareaDescriptionInferior = $textareaDescriptionInferior;
    }

    /**
     * @return string|null
     */
    public function getTextareaDescriptionHome(): ?string
    {
        return $this->textareaDescriptionHome;
    }

    /**
     * @param string|null $textareaDescriptionHome
     */
    public function setTextareaDescriptionHome(?string $textareaDescriptionHome): void
    {
        $this->textareaDescriptionHome = $textareaDescriptionHome;
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
    public function getTextSlug(): string
    {
        return $this->textSlug;
    }

    /**
     * @param string $textSlug
     */
    public function setTextSlug(string $textSlug): void
    {
        $this->textSlug = $textSlug;
    }

    /**
     * @return string
     */
    public function getAutoSlug(): string
    {
        return $this->autoSlug;
    }

    /**
     * @param string $autoSlug
     */
    public function setAutoSlug(string $autoSlug): void
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
     * @return int
     */
    public function getPosition(): int
    {
        return $this->position;
    }

    /**
     * @param int $position
     */
    public function setPosition(int $position): void
    {
        $this->position = $position;
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


