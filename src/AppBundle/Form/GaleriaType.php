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
        					'minWidth' => $options['imagen_ancho'],
        					'minHeight' => $options['imagen_alto'],
        					'thumbs' => array(
        							'0' => array(
        									'maxWidth' => $options['th1_ancho'],
        									'maxHeight' => $options['th1_alto'],
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
            'data_class' => 'AppBundle\Entity\Galeria',
        		'imagen_ancho' => '680',
        		'imagen_alto' => '390',
        		'th1_ancho' => '400',
        		'th1_alto' => '229',
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
