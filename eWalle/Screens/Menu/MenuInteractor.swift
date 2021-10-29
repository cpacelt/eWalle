//
//  MenuInteractor.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation

protocol MenuBusinessLogic: AnyObject {
    func fetchMenuData()
}

class MenuInteractor {
    var presenter: MenuPresentationLogic?
    
    //MARK: Screens data placeholder
    var placeholder: [AppScreen] = []
}

// MARK: - Business logic
extension MenuInteractor: MenuBusinessLogic {
    
    //Fetch titles for menu
    func fetchMenuData() {
        
        let homeScreen = AppScreen(titled: "Home")
        let friendsScreen = AppScreen(titled: "Friends")
        let loginScreen = AppScreen(titled: "Login")
        
        placeholder = [homeScreen, friendsScreen, loginScreen]
        // Put code here...
        presenter?.presentMenuData(data: placeholder)
    }
    
    
}
