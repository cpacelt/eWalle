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
    @IBOutlet weak var balanceStackView: UIStackView!
    
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
    
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
      
    }
    //MARK: - Actions
    @IBAction func addButtonAction(_ sender: UIButton) {
    }
    
}
