//
//  MenuPresenter.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation

protocol MenuPresentationLogic: AnyObject {
    func presentMenuData(data: [AppScreen])
}


class MenuPresenter {
    //MARK: - VC reference
    weak var viewController: MenuDisplayLogic?
}


// MARK: - Presentation logic
extension MenuPresenter: MenuPresentationLogic {
    
    func presentMenuData(data: [AppScreen]) {
        var titles: [String] = []
        data.forEach { titles.append($0.title ?? "") }
        viewController?.displayMenu(with: titles)
    }
    
    
}
