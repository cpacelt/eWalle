//
//  BalanceCell.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import UIKit

class BalanceCell: UICollectionViewCell {
    //MARK: - Reuse identifier
    static let reuseIdentifier = "BalanceCell"
    
    //MARK: - IBOutlets

    @IBOutlet weak var cellStackView: UIStackView!
    @IBOutlet weak var balanceLabelsStackView: UIStackView!
    
    @IBOutlet weak var currentBalanceStringLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    
    
    // MARK: Life circle methods
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
        prepareToShow()
        setupConstraints()
    }
    
    // MARK: Prepare for showing
    func prepareToShow() {
        

        balanceLabel.sizeToFit()
        
        
        self.contentView.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1).cgColor
        self.contentView.layer.cornerRadius = 12
        self.contentView.clipsToBounds = true
    
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
        
        cellStackView.translatesAutoresizingMaskIntoConstraints = false

        cellStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
      
  
    }
    //MARK: - Actions
    @IBAction func addButtonAction(_ sender: UIButton) {
    }
    
}
