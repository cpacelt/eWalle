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

        setupConstraints()
    }
    
    // MARK: Prepare for showing
    func prepareToShow() {
        
        avatarImageView.contentMode = .scaleAspectFit
        
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2;
        avatarImageView.layer.borderColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 0.2).cgColor
        avatarImageView.layer.borderWidth = 2
        nameLabel.sizeToFit()
        
        contentView.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1).cgColor
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
        
        
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
     

        cellStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        cellStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
}
