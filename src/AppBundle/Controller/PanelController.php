<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\RedirectResponse;
use AppBundle\Form\PerfilType;
use AppBundle\Entity\Servicio;
use AppBundle\Form\ServicioType;
use AppBundle\Entity\ObraSocial;
use AppBundle\Form\ObraSocialType;
use AppBundle\Entity\Galeria;
use AppBundle\Form\GaleriaType;
use AppBundle\Entity\Promocion;
use AppBundle\Form\PromocionType;

class PanelController extends PanelBaseController
{
    /**
     * @Template("AppBundle:Panel:home.html.twig")
     */
    public function indexAction(Request $request)
    {
        return array('');
    }
    
    /**
     * @Template("AppBundle:Usuario:perfil.html.twig")
     */
    public function PerfilAction(Request $request)
    {
        $user = $this->getUser();
        $form = $this->createForm(PerfilType::class,$user);
        
        $form->handleRequest($request);
        if(($form->isSubmitted())&&($form->isValid())) {
            $user = $form->getData();
            $this->getDoctrine()->getManager()->persist($user);
            $this->getDoctrine()->getManager()->flush();
            $this->addSuccessFlash('Su perfil ha sido modificado correctamente');
            return new RedirectResponse($this->generateUrl('homepage'));
        }
        
        return array('form'=>$form->createView());
    }
    
    /**
     * PROMOCIONES
     */
    
    /**
     * @Template("AppBundle:Panel:promocion-listado.html.twig")
     */
    public function promocionesAction(Request $request)
    {
        $promociones = $this->getDoctrine()->getRepository('AppBundle:Promocion')->findAll();
        return array('promociones'=>$promociones);
    }
    
    /**
     * @Template("AppBundle:Panel:promocion-form.html.twig")
     */
    public function promocionFormAction(Request $request) {
        $id = $request->query->get('id');
        if(empty($id)){
            $promocion = new Promocion();
        } else {
        	$promocion= $this->getDoctrine()->getRepository('AppBundle:Promocion')->find($id);
            if(!$promocion) {
                $this->addErrorFlash('Acceso incorrecto. Se ha enviado una notificación al administrador');
                return new RedirectResponse($this->generateUrl('homepage'));
            }
        }
        $form = $this->createForm(PromocionType::class,$promocion);
        
        $form->handleRequest($request);
        if(($form->isSubmitted())&&($form->isValid())) {
        	$promocion= $form->getData();
            $this->getDoctrine()->getManager()->persist($promocion);
            $this->getDoctrine()->getManager()->flush();
            $this->addSuccessFlash('La promoción ha sido guardada correctamente');
            return new RedirectResponse($this->generateUrl('panel_promociones'));
        }
        
        return array('form'=>$form->createView());
    }
    
    public function servicioDeleteAction(Request $request,$id) {
        if(empty($id)){
            $this->addErrorFlash('Acceso incorrecto. Se ha enviado una notificación al administrador');
            return new RedirectResponse($this->generateUrl('homepage'));
        } else {
            $servicio = $this->getDoctrine()->getRepository('AppBundle:Servicio')->find($id);
            if(!$servicio) {
                $this->addErrorFlash('Acceso incorrecto. Se ha enviado una notificación al administrador');
                return new RedirectResponse($this->generateUrl('homepage'));
            }
            $this->getDoctrine()->getManager()->remove($servicio);
            $this->getDoctrine()->getManager()->flush();
            $this->addSuccessFlash('El servicio ha sido eliminado correctamente');
            return new RedirectResponse($this->generateUrl('panel_servicios'));
        }
    }
    
    
    /****
     * GALERIA
     */
    
    /**
     * @Template("AppBundle:Panel:galerias-listado.html.twig")
     */
    public function galeriasAction(Request $request)
    {
        $galerias = $this->getDoctrine()->getRepository('AppBundle:Galeria')->findAll();
        return array('galerias'=>$galerias);
    }
    
    /**
     * @Template("AppBundle:Panel:galeria-form.html.twig")
     */
    public function galeriaFormAction(Request $request) {
        $id = $request->query->get('id');
        if(empty($id)){
            $galeria = new Galeria();
        } else {
            $galeria = $this->getDoctrine()->getRepository('AppBundle:Galeria')->find($id);
            if(!$galeria) {
                $this->addErrorFlash('Acceso incorrecto. Se ha enviado una notificación al administrador');
                return new RedirectResponse($this->generateUrl('homepage'));
            }
        }
        $form = $this->createForm(GaleriaType::class,$galeria);
        
        $form->handleRequest($request);
        if(($form->isSubmitted())&&($form->isValid())) {
            $galeria = $form->getData();
            $this->getDoctrine()->getManager()->persist($galeria);
            $this->getDoctrine()->getManager()->flush();
            $this->addSuccessFlash('La galeria ha sido guardada correctamente');
            return new RedirectResponse($this->generateUrl('panel_galerias'));
        }
        
        return array('form'=>$form->createView());
    }
    
    public function galeriaDeleteAction(Request $request,$id) {
        if(empty($id)){
            $this->addErrorFlash('Acceso incorrecto. Se ha enviado una notificación al administrador');
            return new RedirectResponse($this->generateUrl('homepage'));
        } else {
            $galeria = $this->getDoctrine()->getRepository('AppBundle:Galeria')->find($id);
            if(!$galeria) {
                $this->addErrorFlash('Acceso incorrecto. Se ha enviado una notificación al administrador');
                return new RedirectResponse($this->generateUrl('homepage'));
            }
            $this->getDoctrine()->getManager()->remove($galeria);
            $this->getDoctrine()->getManager()->flush();
            $this->addSuccessFlash('La galeria ha sido eliminada correctamente');
            return new RedirectResponse($this->generateUrl('panel_galerias'));
        }
    }
}


