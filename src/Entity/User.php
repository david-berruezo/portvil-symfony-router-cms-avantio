<?php
namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(repositoryClass: UserRepository::class)]
#[UniqueEntity(fields: ['email'], message: 'There is already an account with this email')]
class User implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;
    #[ORM\Column(name: 'text_username', type: 'string', length: 120, nullable: true, options: ['comment' => 'Título de la pestaña de la página'])]
    private ?string $textUsername;
    #[ORM\Column(length: 180, unique: true)]
    private ?string $email = null;
    #[ORM\Column(name:'roles', type: 'json')]
    private array $roles = [];

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
    private ?int $position;

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

    /**
     * @var string The hashed password
     */
    #[ORM\Column]
    private ?string $password = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): static
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials(): void
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
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

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): void
    {
        $this->status = $status;
    }

    public function getPosition(): ?int
    {
        return $this->position;
    }

    public function setPosition(?int $position): void
    {
        $this->position = $position;
    }

    public function getCreatedAt(): ?\DateTime
    {
        return $this->createdAt;
    }

    public function setCreatedAt(?\DateTime $createdAt): void
    {
        $this->createdAt = $createdAt;
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

    public function getTextUsername(): ?string
    {
        return $this->textUsername;
    }

    public function setTextUsername(?string $textUsername): void
    {
        $this->textUsername = $textUsername;
    }

}
