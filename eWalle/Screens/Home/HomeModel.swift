//
//  Model.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import Foundation


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

struct Account {
    let me: Person
    let sum: Int
}
