//
//  MenuInteractor.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation
import UIKit

protocol MenuDataStore: AnyObject {
    var previous: AppScreen? { get set }
    var vcSnapshots: [String : UIImage]? { get set }
    
    func fetchInitionState()
    func fetchScreensCash()
}

protocol MenuBusinessLogic: AnyObject {
    func fetchMenuData()
}

final class MenuInteractor: MenuDataStore {
    
    func fetchScreensCash() {
        presenter?.updateScreensCash(data: vcSnapshots!)
    }
    
    func fetchInitionState() {
        
        presenter?.presentSelectedVC(data: previous)
    }
    
    
    //MARK: - Data store
    var previous: AppScreen? = nil
    var vcSnapshots: [String : UIImage]? = [:]
    
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

