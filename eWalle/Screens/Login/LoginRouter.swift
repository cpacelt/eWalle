//
//  LoginRouter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation
import UIKit

protocol LoginRoutingLogic: AnyObject {
    func navigateToHome()
    
}

class LoginRouter {
    weak var vc: UIViewController?
}

extension LoginRouter: LoginRoutingLogic {
    
    func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        vc?.show(menu, sender: nil)
        
    }

}
