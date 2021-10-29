//
//  HomePresenter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation

protocol HomePresentationLogic: AnyObject {
    
}

class HomePresenter {
    weak var vc: HomeDisplayLogic?
}

//MARK: Presentation logic
extension HomePresenter: HomePresentationLogic {
    
}
