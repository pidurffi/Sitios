<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Comur\ImageBundle\Form\Type\CroppableImageType;
use MdlpSitioBundle\Services\SitioResolver;
use Comur\ImageBundle\Form\Type\CroppableGalleryType;

class GaleriaType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombre')
        ;
        
        	$builder->add('galeria',CroppableGalleryType::class,array(
        			'uploadConfig'=>array(
        					'uploadUrl'=> 'uploads/galerias',
        					'webDir' => 'uploads/galerias',
        			),
        			'cropConfig'=>array(
        					'minWidth' => 680,
        					'minHeight' => 390,
        					'thumbs' => array(
        							'0' => array(
        									'maxWidth' => 400,
        									'maxHeight' => 229,
        									'useAsFieldImage' => true
        							)
        					)
        			)
        	));
            
        return $builder;    
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Galeria'
        ));
        
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_galeria';
    }


}
