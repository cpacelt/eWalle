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
        
        imageBackgroundView.contentMode = .scaleAspectFill
        
        self.imageBackgroundView.layer.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1).cgColor
        self.imageBackgroundView.layer.cornerRadius = 12
        self.imageBackgroundView.clipsToBounds = true
    }
    
    //MARK: - Constraints setup
    func setupConstraints() {
        
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        serviceImageView.translatesAutoresizingMaskIntoConstraints = false
        imageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        
        imageBackgroundView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageBackgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        serviceImageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor).isActive = true
        serviceImageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor).isActive = true
        
        
        
        cellStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        cellStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cellStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        // cellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    func configure(with service: Service) {
        self.serviceTitleLabel.text = service.title
        self.serviceImageView.image = UIImage(named: service.logoImagePath)
    }
    
}
