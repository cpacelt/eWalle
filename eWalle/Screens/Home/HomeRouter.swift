//
//  HomeRouter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation
import UIKit

protocol HomeRoutingLogic: AnyObject {
    func navigateToMenu()
    func passSnapshot()
    
}

class HomeRouter {
    weak var vc: UIViewController?
}

extension HomeRouter: HomeRoutingLogic {
    func passSnapshot() {
        // Parent is MenuVC
        guard let menu = vc?.presentingViewController as? MenuViewController else { return }
        menu.router?.dataStorage?.vcSnapshots?[vc?.title ?? ""] = vc?.view.snapshot
    }
    
    
    func navigateToMenu() {
        // Parent is MenuVC
        guard let menu = vc?.presentingViewController as? MenuViewController else { return }
        menu.router?.dataStorage?.previous = vc
        vc?.dismiss(animated: true, completion: nil)

    }

}

