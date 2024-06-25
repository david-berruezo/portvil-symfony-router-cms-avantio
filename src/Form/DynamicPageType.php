<?php
namespace App\Form;

use App\Entity\DynamicGeocountry;
use App\Entity\DynamicGeoregion;
use App\Entity\DynamicPage;
use App\Entity\Language;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\DataMapperInterface;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DynamicPageType extends AbstractType implements DataMapperInterface
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {

        $builder->add('id',HiddenType::class,[
            "required" => false,'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('language',HiddenType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        // $options["lang_id_local"]
        $builder->add('language_local',HiddenType::class,[
            "data" => $options["request"]->get("lang"),
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            ),
            "mapped" => false
        ]);

        $builder->add('dynamicPage',HiddenType::class,[
            "required" => false,'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('tabla',HiddenType::class,[
            "required" => false,'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textTitle',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textareaDescription', TextareaType::class, array(
            /*
            'config' => array(
                'uiColor' => '#ffffff',
            ),
            */
        ));

        $builder->add('textPageTitle',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textSlug',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('autoSlug',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textMetaDescription',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textMetaKeywords',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textMetaRobots',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('textareaScriptsHeader', TextareaType::class, array(
            /*
            'config' => array(
                'uiColor' => '#ffffff',
            ),
            */
        ));

        $builder->add('textareaScriptsBody', TextareaType::class, array(
            /*
            'config' => array(
                'uiColor' => '#ffffff',
            ),
            */
        ));

        $builder->add('status',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('position',TextType::class,[
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);

        $builder->add('updateAt',DateType::class,[
            'widget' => 'text',
            "required" => false,
            'attr' => array(
                'class' => 'form-control'
            )
        ]);


        $builder->add('submit',SubmitType::class);

        /*
        $builder
            ->add('id')
            ->add('language')
            ->add('dynamicPages')
            ->add('textTitle')
            ->add('textSubtitle')
            ->add('textDtitle1')
            ->add('textDsubtitle1')
            ->add('textareaDdescription1')
            ->add('textDtitle2')
            ->add('textDsubtitle2')
            ->add('textareaDdescription2')
            ->add('textDtitle3')
            ->add('textDsubtitle3')
            ->add('textareaDdescription3')
            ->add('textareaDescriptionInferior')
            ->add('textareaDescriptionHome')
            ->add('textPageTitle')
            ->add('textSlug')
            ->add('autoSlug')
            ->add('textMetaKeywords')
            ->add('textMetaDescription')
            ->add('textMetaRobots')
            ->add('textareaScriptsHeader')
            ->add('textareaScriptsBody')
            ->add('status')
            ->add('position')
            ->add('createdAt')
            ->add('updatedAt')
            ->add('deletedAt')
            ->add('tabla')
        ;
        */
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => DynamicPages::class,
            // enable/disable CSRF protection for this form
            'csrf_protection' => true,
            // the name of the hidden HTML field that stores the token
            'csrf_field_name' => '_token',
            // an arbitrary string used to generate the value of the token
            // using a different string for each form improves its security
            'csrf_token_id'   => 'geocountry',
            'id' => null,
            'lang' => null,
            'lang_id' => null,
            'lang_local' => null,
            'lang_id_local' => null,
            'request' => null,
            'session' => null,
            'reflector' => null
        ]);
    }

    /**
     * @return mixed
     */
    public function getReflector()
    {
        return $this->reflector;
    }

    /**
     * @param mixed $options
     */
    public function setReflector($reflector): void
    {
        $this->reflector = $reflector;
    }

    public function mapDataToForms($viewData, \Traversable $forms): void
    {
        $forms = iterator_to_array($forms);

        // var_dump($forms);
        // die();
        $forms["updateAt"]->setData(new DateTime("2024-02-02"));
        $this->getLastId();
    }

    private function getLastId()
    {
        # geocountry
        $query = $this->em->createQuery('SELECT MAX(u.dynamicGeocountry) + 1 as next_id FROM App\Entity\DynamicGeocountry as u');
        $max_id = $query->getResult();
        if (is_array($max_id)){
            $id = $max_id[0]["next_id"];
        }else{
            $id = 1;
        }
        return $id;
    }

    private function printData(\Traversable $forms, &$viewData)
    {
        var_dump($this->request->getSession());
        var_dump($this->getParent());
        var_dump($forms->get("language_local")->getData());
        var_dump($viewData);
        var_dump($forms);
        var_dump($forms["language"]->getData());
        die();
    }



    public function mapFormsToData(\Traversable $forms, &$viewData):void
    {

        # printar data
        // $this->printData($forms, &$viewData);

        // var_dump($this->options->getProperties());

        $forms = iterator_to_array($forms);

        # insertamos nuevo objeto
        if ($forms["id"]->getData() == 0){
            $viewData = new DynamicGeocountry();
            $viewData->setId($this->getLastId().$forms["language"]->getData());
            $viewData->setLanguage($forms["language"]->getData());
            $viewData->setDynamicGeocountry($this->getLastId());
            # actualizamos nuevo objeto
        }else{
            # si el lenguage es diferente cambiamos al id correpondiente al lenguage
            $session = $this->requestStack->getSession();
            if (in_array($forms["language_local"]->getData(), $session->get("languages_vector"))) {
                $lang = array_search($forms["language_local"]->getData(),$session->get("languages_vector"));
            }
            if ($lang != $forms["language"]->getData()) {
                $temp_id = str_replace($forms["language"]->getData(),"",$forms["id"]->getData());
                $id = $temp_id.$lang;
                # dejamos con el id que ya tiene actual
            }else{
                $id = $forms["id"]->getData();
            }
            # lanzamos la consulta
            $vector_countries = $this->em->getRepository("App\Entity\DynamicGeocountry")->findBy(array("id" => $id));
            $viewData = $vector_countries[0];
            $viewData->setDynamicGeocountry($id);
        }

        $viewData->setTextTitle($forms["textTitle"]->getData());
        $viewData->setTextareaDescription(strip_tags($forms["textareaDescription"]->getData()));
        $viewData->setTextPageTitle($forms["textPageTitle"]->getData());
        $viewData->setTextSlug($forms["textSlug"]->getData());
        $viewData->setAutoSlug($forms["autoSlug"]->getData());
        $viewData->setTextMetaDescription($forms["textMetaDescription"]->getData());
        $viewData->setTextMetaKeywords($forms["textMetaKeywords"]->getData());
        $viewData->setTextMetaRobots($forms["textMetaRobots"]->getData());
        $viewData->setTextareaScriptsHeader(strip_tags($forms["textareaScriptsHeader"]->getData()));
        $viewData->setTextareaScriptsBody(strip_tags($forms["textareaScriptsBody"]->getData()));
        $viewData->setStatus($forms["status"]->getData());
        $viewData->setPosition($forms["position"]->getData());
        $viewData->setUpdateAt(new DateTime("2024-01-01"));

        # fill data dynamicGeoregion collection
        $regiones = $forms["dynamicGeoregion"]->getData();
        $languageRepository = $this->em->getRepository(Language::class);
        $language = $languageRepository->findBy(array("id" => 111));
        $dynamicGeoregionRepository = $this->em->getRepository(DynamicGeoregion::class);
        $dynamicGeoregion = $dynamicGeoregionRepository->findBy(array("id" => $regiones, "language" => $language[0]->getId()));
        foreach ($dynamicGeoregion as $region){
            $viewData->addDynamicGeoregion($region);
        }

    }

}
