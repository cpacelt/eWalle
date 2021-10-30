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
        let home = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        
        vc?.modalPresentationStyle = .overFullScreen
        vc?.present(home, animated: true, completion: nil)
        
    }

}
