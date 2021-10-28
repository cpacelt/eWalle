//
//  MenuCell.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit

class MenuCell: UITableViewCell {
    // MARK: - Reuse identifier
    static let reuseIdentifier = "MenuCell"
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var cellBookmarkView: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        prepareToShow()
        setupConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        
        if selected {
            cellBookmarkView.backgroundColor = self.tintColor
            
            //Need to becom global an enum
            cellLabel.font = UIFont.boldSystemFont(ofSize: 16)
            cellLabel.sizeToFit()
        } else {
            cellBookmarkView.backgroundColor = self.backgroundColor
            cellLabel.font = UIFont.systemFont(ofSize: 16)
        }
        
    }
    
    // MARK: Prepare for showing
    func prepareToShow() {
        cellLabel.adjustsFontSizeToFitWidth = true
        self.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.selectionStyle = .none
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
        cellBookmarkView.translatesAutoresizingMaskIntoConstraints = false
        
        cellBookmarkView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        cellBookmarkView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        cellBookmarkView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        cellBookmarkView.rightAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 4).isActive = true
    }
    

}


