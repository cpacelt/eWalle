//
//  MenuPresenter.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation
import UIKit

protocol MenuPresentationLogic: AnyObject {
    func presentMenuData(data: [AppScreen])
    func presentSelectedVC(data: AppScreen?)
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
    
    func presentSelectedVC(data: AppScreen?) {
        viewController?.displayInitionState(with: data)
    }
    
    func presentMenuData(data: [AppScreen]) {
        var titles: [String] = []
        data.forEach { titles.append($0.title ?? "") }
        viewController?.displayMenu(with: titles)
    }
    
    
}
