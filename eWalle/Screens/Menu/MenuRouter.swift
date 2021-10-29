//
//  MenuRouter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation

protocol MenuRoutingLogic: AnyObject {
    
}

protocol MenuDataPassing: AnyObject {
    var dataStorage: MenuDataStore? { get }
}

class MenuRouter: MenuDataPassing {
    var dataStorage: MenuDataStore?
    
}

extension MenuRouter: MenuRoutingLogic {
    
}

