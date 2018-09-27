<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Comur\ImageBundle\Form\Type\CroppableImageType;

class PromocionType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            
        ->add('nombre')
        ->add('fecha_publicacion', DateType::class, ['widget' => 'single_text', 'html5' => false, 'format' => 'dd/MM/yyyy'])
        ->add('fecha_vencimiento', DateType::class, ['widget' => 'single_text', 'html5' => false, 'format' => 'dd/MM/yyyy'])
        ->add('generica')
        ->add('descripcion')
        //->add('mensaje')
        ->add('orden')
        /*
        ->add('descripcion')
        ->add('destacado');
        */
        ;
        
        
            $builder->add('imagen',CroppableImageType::class, array(
            'uploadConfig' => array(
                'uploadUrl' => "uploads/promociones",
                'webDir' => 'uploads/promociones'
            ),
            'cropConfig' => array(
                'minWidth' => 200,
                'minHeight' => 200
            ),
        ));
        
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Promocion'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_promocion';
    }


}
