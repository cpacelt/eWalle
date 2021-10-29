//
//  Model.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation

struct AppScreen {
    let id: Int?
    let title: String?
    let snapshotPath: String?
    
    init(withId id: Int? = nil, titled title: String? = nil, imagePath: String? = nil) {
        self.id = id
        self.title = title
        self.snapshotPath = imagePath
    }
}

