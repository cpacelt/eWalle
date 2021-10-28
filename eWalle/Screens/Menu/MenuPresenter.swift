//
//  MenuPresenter.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation

protocol PresentationLogic: AnyObject {
    func presentMenuData(data: [String])
}


class MenuPresenter {
    //MARK: - VC reference
    weak var viewController: DisplayLogic?
}


// MARK: - Presentation logic
extension MenuPresenter: PresentationLogic {
    
    func presentMenuData(data: [String]) {
        viewController?.displayMenu(with: data)
    }
    
    
}
