//
//  HomeInteractor.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation

protocol HomeBusinessLogic: AnyObject {
    
}

class HomeInteractor {
    var presenter: HomePresentationLogic?
}

//MARK: - Business logic
extension HomeInteractor: HomeBusinessLogic {
    
}
