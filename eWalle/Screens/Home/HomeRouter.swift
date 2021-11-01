//
//  HomeRouter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation
import UIKit
import SideMenu

protocol HomeRoutingLogic: AnyObject {
    func navigateToMenu()
    func passSnapshot()
    func createMenu()
    
}

class HomeRouter {
    weak var vc: UIViewController?
    var menuVC: MenuViewController?
    

}

extension HomeRouter: HomeRoutingLogic {
    func passSnapshot() {
        // Parent is MenuVC
        self.menuVC?.router?.dataStorage?.vcSnapshots?[vc?.title ?? ""] = vc?.view.snapshot
    }
    
    
    func navigateToMenu() {
        // Parent is MenuVC
        guard let menu = vc?.presentingViewController as? MenuViewController else { return }
        menu.router?.dataStorage?.previous = vc
        
        vc?.dismiss(animated: true, completion: nil)

    }

    
    
    func createMenu() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.add(self.vc!)
        let menu = SideMenuNavigationController(rootViewController: menuVC)
        menu.leftSide = true
        menu.menuWidth = UIScreen.main.bounds.width - 10
        menu.navigationBar.isHidden = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.vc!.view)
        self.menuVC = menuVC
    }
}

