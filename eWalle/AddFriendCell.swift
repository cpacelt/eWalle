//
//  FriendCell.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import UIKit

class AddFriendCell: UICollectionViewCell {
    //MARK: - Reuse identifier
    static let reuseIdentifier = "AddFriendCell"
    
    //MARK: - IBOutlets

    @IBOutlet weak var addFriendButton: UIButton!
    
    // MARK: Life circle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        setupConstraints()
    }
    
    // MARK: Prepare for showing
    func prepareToShow() {
        
        
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
        addFriendButton.translatesAutoresizingMaskIntoConstraints = false
        
        addFriendButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        addFriendButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    // MARK: - Actions
    
    @IBAction func addFriendAction(_ sender: Any) {
    }
    
}
