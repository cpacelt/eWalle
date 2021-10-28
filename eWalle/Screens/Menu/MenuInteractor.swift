//
//  MenuInteractor.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation

protocol BusinessLogic: AnyObject {
    func fetchMenuData()
}

class MenuInteractor {
    var presenter: PresentationLogic?
}

// MARK: - Business logic
extension MenuInteractor: BusinessLogic {
    
    
    func fetchMenuData() {
        
        // Put code here...
        let placeholder = ["Home", "Credits", "Services", "Recent"]
        presenter?.presentMenuData(data: placeholder)
    }
    
    
}
