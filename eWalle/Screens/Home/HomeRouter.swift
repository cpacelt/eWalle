//
//  HomeRouter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation
import UIKit

protocol HomeRoutingLogic: AnyObject {
    func navigateToMenu(from screen: AppScreen)
    
}

class HomeRouter {
    weak var vc: UIViewController?
}

extension HomeRouter: HomeRoutingLogic {
    func navigateToMenu(from screen: AppScreen) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
        vc?.show(menu, sender: nil)
        
        menu.router?.dataStorage?.vcSnapshots?[screen.title ?? ""] = screen.snapshot        
        menu.router?.dataStorage?.previous = screen
        
    }

}

