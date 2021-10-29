//
//  Model.swift
//  eWalle
//
//  Created by Роман Путинцев on 29.10.2021.
//

import Foundation
import UIKit

struct AppScreen {
    let id: Int?
    let title: String?
    let snapshot: UIImage?
    
    init(withId id: Int? = nil, titled title: String? = nil, image: UIImage? = nil) {
        self.id = id
        self.title = title
        self.snapshot = image
    }
}

