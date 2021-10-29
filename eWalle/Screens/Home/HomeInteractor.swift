//
//  HomeInteractor.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation

protocol HomeBusinessLogic: AnyObject {
    func getFriends()
    func getAccount()
    func getServices()
    func getSections()
}

class HomeInteractor {
    //MARK: - Presenter reference
    var presenter: HomePresentationLogic?
    
}

//MARK: - Business logic
extension HomeInteractor: HomeBusinessLogic {
    func getSections() {
        presenter?.presentSections()
    }
    
    func getFriends() {
        
        let f1 = Person(firstName: "Kate", secondNane: "Kiddleton", avatarImagePath: "avatar1")
        let f2 = Person(firstName: "Mike", secondNane: "Ford", avatarImagePath: "avatar1")
        let f3 = Person(firstName: "Paul", secondNane: "Layn", avatarImagePath: "avatar1")
        let f4 = Person(firstName: "Michael", secondNane: "Petrov", avatarImagePath: "avatar1")
        
        let friendsPlaceholder: [Person] = [f1, f2, f3, f4, f1, f2, f3, f4]
        
        presenter?.presentFriends(with: friendsPlaceholder)
    }
    
    func getAccount() {
        let me = Person(firstName: "Maria", secondNane: "Bell", avatarImagePath: "avatar1")
        let a1 = Account(me: me, sum: 30000)
        
        
        presenter?.presentAccount(with: [a1])
    }
    
    func getServices() {
        let s1 = Service(title: "Cash", overview: "", logoImagePath: "logout")
        let services = [s1, s1, s1, s1, s1, s1, s1, s1]
        presenter?.presentServices(with: services)
    }
    
    
}
