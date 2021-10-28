//
//  ServiceCell.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import UIKit

class ServiceCell: UICollectionViewCell {
    // MARK: - Reuse identifier
    static let reuseIdentifier = "ServiceCell"
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var cellStackView: UIStackView!
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    
    
    // MARK: Life circle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        prepareToShow()
        setupConstraints()
    }
    
    // MARK: Prepare for showing
    func prepareToShow() {
    
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
      
    }
    
    
}
