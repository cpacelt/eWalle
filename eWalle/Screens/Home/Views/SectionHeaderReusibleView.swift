//
//  SectionHeaderReusibleViewCollectionReusableView.swift
//  eWalle
//
//  Created by Роман Путинцев on 28.10.2021.
//

import UIKit

class SectionHeaderReusibleView: UICollectionReusableView {
    // MARK: - Reuse identifier
    static let reuseIdentifier = "SectionHeaderReusibleView"
    
    //MARK: Subviews
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        label.text = "Hello"
        return label
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        let img = UIImage(named: "homeHederButton")
        button.setImage(img, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)

        self.addSubview(label)
        self.addSubview(rightButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        rightButton.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
        rightButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
