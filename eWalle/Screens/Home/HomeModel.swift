//
//  Model.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation

struct Account {
    let me: Person
    let sum: Int
}

struct Person {
    let firstName: String
    let secondNane: String
    let avatarImagePath: String
}

struct Service {
    let title: String
    let overview: String
    let logoImagePath: String
}

struct Section {
    
    let title: String
    let rightButtonImagePath: String
    let kind: SectionKind
    
    enum SectionKind: Int {
        // WARN: - You shouldn't change the direction
        // let kind = SectionKind(rawValue: indexPath.section) usecase
        case balance
        case friends
        case services
    }
    
}
