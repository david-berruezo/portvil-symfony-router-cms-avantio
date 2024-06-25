<?php
namespace App\Tests\Functional\Controller\Admin;

use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Model\DynamicModel\DynamicModel;
use App\Security\LoginFormAuthenticator;
use Doctrine\DBAL\Connection;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Omines\DataTablesBundle\DataTableFactory;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;
use Symfony\Component\Translation\LocaleSwitcher;
use Symfony\Contracts\Translation\TranslatorInterface;
use PHPUnit\Framework\TestCase;

class SecurityControllerTest extends TestCase
{

    /*
    public function __construct(
        DataTableFactory $dataTableFactory, EntityManagerInterface $em , Connection $connection , ManagerRegistry $doctrine , RequestStack $requestStack , TranslatorInterface $translator,
        LocaleSwitcher $localeSwitcher , UrlGeneratorInterface $urlGenerator
    )
    {

        // guardamos los parametros
        $this->em = $em;
        $this->connection = $connection;
        $this->doctrine = $doctrine;
        $this->requestStack = $requestStack;

        # translator
        $this->translator = $translator;
        $this->localeSwitcher = $localeSwitcher;

        # datatable
        $this->dataTableFactory = $dataTableFactory;
        // $this->datatable = $dataTableFactory->create();

        # inicializamos DynamicModel
        $this->dynamicModel = new DynamicModel($em , $connection , $doctrine);

        # request
        $this->request = Request::createFromGlobals();

        //$this->session = $this->request->getSession();
        $this->session = $this->requestStack->getSession();

        $this->urlGenerator = $urlGenerator;
    }
    */

    public function login(AuthenticationUtils $authenticationUtils): Response
    {

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();

        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        $roles = [];

        if ($this->getUser()) {
            $roles = $this->getUser()->getRoles();
        }

        /*
        if (in_array('ROLE_ADMIN', $roles)) {
            return $this->redirectToRoute('dashboard'); // Redirect admin to /products
        } elseif (in_array('ROLE_USER', $roles)) {
            //return $this->redirectToRoute('app_user_access'); // Redirect user to /user
        } elseif (in_array('IS_AUTHENICATED_USER', $roles)) {
            //return $this->redirectToRoute('app_login'); // Redirect user to /user
        }
        */

        return $this->render('/security/login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error
        ]);
    }


    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }



    public function forget(): Response
    {
        return $this->render('sections/login/forget.html.twig', [
            'controller_name' => 'HomeController',
        ]);

    }

    #[Route(path: '/login_old', name: 'app_login_old')]
    public function loginOld(AuthenticationUtils $authenticationUtils): Response
    {
        // if ($this->getUser()) {
        //     return $this->redirectToRoute('target_path');
        // }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }


    public function register(Request $request, UserPasswordHasherInterface $userPasswordHasher, UserAuthenticatorInterface $userAuthenticator, LoginFormAuthenticator $authenticator,  EntityManagerInterface $entityManager): Response
    {
        # nuevo usuario
        $user = new User();

        # creamos y manejamos el formulario
        $form = $this->createForm(RegistrationFormType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            # guardamos datos
            $entityManager->persist($user);
            $entityManager->flush();

            // do anything else you need here, like send an email
            // return $this->redirectToRoute('geo-propiedades-listar');
            return $userAuthenticator->authenticateUser(
                $user,
                $authenticator,
                $request
            );
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);

    }


}
