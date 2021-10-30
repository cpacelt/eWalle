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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        vc?.present(login, animated: true, completion: nil)
        
    }
    
    func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        vc?.present(home, animated: true, completion: nil)
    }
    
    
}

