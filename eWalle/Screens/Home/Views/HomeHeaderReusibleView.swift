//
//  DetailViewControllerHeaderViewCollectionReusableView.swift
//  Tonight
//
//  Created by Роман Путинцев on 25.10.2021.
//

import UIKit

final class HomeHeaderReusibleView: UICollectionReusableView {
    
    //MARK: - Reuse identifier
    static let reuseIdentifier = "HomeHeaderReusibleView"
    
    
    
    //MARK: - Subviews
    
    let viewStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 10.0
        return stack
    }()
    
    let logoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .bottom
        stack.spacing = 10.0
        return stack
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "appLogo")
        
        return imageView
    }()
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        label.font = UIFont(name: "Ubuntu-Medium", size: 28)
        label.text = "eWalle"
        
        return label
    }()
    
    let firstSectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        label.text = "Hello"
        label.sizeToFit()
        return label
    }()
    
    let rightButton: UIButton = {
        let button = UIButton()
        let img = UIImage(named: "homeHederButton")
        button.setImage(img, for: .normal)
        
        return button
    }()
    
    
    //MARK: - Inits
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect){
        super.init(frame: CGRect.zero)

        logoStackView.addArrangedSubview(logoImageView)
        logoStackView.addArrangedSubview(appTitleLabel)
        
        viewStackView.addArrangedSubview(logoStackView)
        viewStackView.addArrangedSubview(firstSectionLabel)
        
        self.addSubview(viewStackView)
        self.addSubview(rightButton)
        
       // self.viewStackView.backgroundColor = .systemIndigo
        makeLayout()
    }
    
    //MARK: - Constraints setup
    private func makeLayout() {
        viewStackView.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        
        viewStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        viewStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        viewStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        viewStackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        rightButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        rightButton.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}

