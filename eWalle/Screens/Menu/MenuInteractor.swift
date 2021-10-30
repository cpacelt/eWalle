//
//  MenuInteractor.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation
import UIKit

protocol MenuDataStore: AnyObject {
    var previous: UIViewController? { get set }
    var vcSnapshots: [String : UIImage]? { get set }
    
    func fetchInitionState()
    func fetchScreensCash()
}

protocol MenuBusinessLogic: AnyObject {
    
}

final class MenuInteractor: MenuDataStore {
    
    func fetchScreensCash() {
        presenter?.updateScreensCash(data: vcSnapshots!)
    }
    
    func fetchInitionState() {
        presenter?.presentSelectedVC(data: previous)
    }
    
    
    //MARK: - Data store
    weak var previous: UIViewController? = nil
    var vcSnapshots: [String : UIImage]? = [:]
    
    var presenter: MenuPresentationLogic?
    
}

// MARK: - Business logic
extension MenuInteractor: MenuBusinessLogic {
    
    
}

