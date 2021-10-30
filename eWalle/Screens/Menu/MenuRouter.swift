//
//  MenuRouter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation
import UIKit

protocol MenuRoutingLogic: AnyObject {
    func navigateToLogin()
    func navigateToHome()
}

protocol MenuDataPassing: AnyObject {
    var dataStorage: MenuDataStore? { get }
}

class MenuRouter: MenuDataPassing {
    
    weak var vc: UIViewController?
    var dataStorage: MenuDataStore?
    
}

extension MenuRouter: MenuRoutingLogic {
    func navigateToLogin() {
        guard let me = vc as? ContainerViewController else { return }
        me.switchToVC(titled: "Login")
    }
    
    func navigateToHome() {
        guard let me = vc as? ContainerViewController else { return }
        me.switchToVC(titled: "Home")
    }
    
    
}

