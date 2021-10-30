//
//  MenuPresenter.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation
import UIKit

protocol MenuPresentationLogic: AnyObject {
    func presentSelectedVC(data: UIViewController?)
    func updateScreensCash(data: [String : UIImage])
}

class MenuPresenter {
    //MARK: - VC reference
    weak var viewController: MenuDisplayLogic?
}


// MARK: - Presentation logic
extension MenuPresenter: MenuPresentationLogic {
    
    func updateScreensCash(data: [String : UIImage]) {
        viewController?.updateScreensCash(with: data)
    }
    
    func presentSelectedVC(data: UIViewController?) {
        viewController?.displayInitionState(with: data)
    }
    
}
