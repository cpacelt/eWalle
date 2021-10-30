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
    func passSnapshot()
}



class LoginRouter {
    weak var vc: UIViewController?
}

extension LoginRouter: LoginRoutingLogic {
    func passSnapshot() {
        guard let menu = vc?.presentingViewController as? MenuViewController else { return }
        
        DispatchQueue.main.async {
            menu.router?.dataStorage?.vcSnapshots?[self.vc?.title ?? ""] = self.vc?.view.snapshot
        }
        
    }
    
    func navigateToHome() {
        
        // Parent is MenuVC
        guard let menu = vc?.presentingViewController as? MenuViewController else { return }
        
        menu.router?.dataStorage?.previous = self.vc
        // menu.router?.dataStorage?.vcSnapshots?[self.vc?.title ?? ""] = self.vc?.view.snapshot
        
        vc?.dismiss(animated: true, completion: nil)
        
    }
    
}
