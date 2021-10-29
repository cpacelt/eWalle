//
//  HomePresenter.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation

protocol HomePresentationLogic: AnyObject {
    func presentAccount(with data: [Account])
    func presentFriends(with data: [Person])
    func presentServices(with data: [Service])
    func presentSections()
}

class HomePresenter {
    //MARK: - VC reference
    weak var vc: HomeDisplayLogic?
}

//MARK: Presentation logic
extension HomePresenter: HomePresentationLogic {
    func presentSections() {
        
        let s1 = Section(title: "Account Overview", rightButtonImagePath: "homeHeaderButton", kind: .balance)
        let s2 = Section(title: "Send Money", rightButtonImagePath: "friendsHeaderButton", kind: .friends)
        let s3 = Section(title: "Services", rightButtonImagePath: "servicesHeaderButton", kind: .services)
        
        let sections = [s1, s2, s3]
        
        vc?.displaySections(with: sections)
    }
    
    func presentAccount(with data: [Account]) {
        vc?.displayAccount(with: data)
    }
    
    func presentFriends(with data: [Person]) {
        vc?.displayFriends(with: data)
    }
    
    func presentServices(with data: [Service]) {
        vc?.displayServices(with: data)
    }
    
    
}
