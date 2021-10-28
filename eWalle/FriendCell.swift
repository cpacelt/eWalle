//
//  FriendCell.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import UIKit

class FriendCell: UICollectionViewCell {
    //MARK: - Reuse identifier
    static let reuseIdentifier = "FriendCell"
    
    //MARK: - IBOutlets
    @IBOutlet weak var cellStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
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
