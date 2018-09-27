<?php
namespace AppBundle\EventListener;

use Avanzu\AdminThemeBundle\Event\SidebarMenuEvent;
use Symfony\Component\HttpFoundation\Request;
use Avanzu\AdminThemeBundle\Model\MenuItemModel;
use MdlpBundle\Entity\User;

class MyMenuItemListListener {
    
    // ...
	private $sec;
	public function __construct($secSt) {
		$this->sec = $secSt;
	}
    
	protected function getUser() {
		if (null === $token = $this->sec->getToken()) {
			return;
		}
		
		if (!is_object($user = $token->getUser())) {
			// e.g. anonymous authentication
			return;
		}
		
		return $user;
		// retrieve your concrete user model or entity
	}
	
    public function onSetupMenu(SidebarMenuEvent $event) {
        
        $request = $event->getRequest();
        
        foreach ($this->getMenu($request) as $item) {
            $event->addItem($item);
        }
        
    }
    
    protected function getMenu(Request $request) {
    	$user = $this->getUser();
        $menuItems = array();
        $menuItems[] = new MenuItemModel('panel_promociones', "Promociones", "panel_promociones");
        $menuItems[] = new MenuItemModel('panel_galerias', "Galerías", "panel_galerias");
        $menuItems[] = new MenuItemModel('fos_user_security_logout', "Salir", "fos_user_security_logout");
        return $this->activateByRoute($request->get('_route'), $menuItems);
    }
    
    protected function activateByRoute($route, $items) {
        
        foreach($items as $item) {
            if($item->hasChildren()) {
                $this->activateByRoute($route, $item->getChildren());
            }
            else {
                if($item->getRoute() == $route) {
                    $item->setIsActive(true);
                }
            }
        }
        
        return $items;
    }
    
}