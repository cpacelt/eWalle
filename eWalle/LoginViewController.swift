//
//  ViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var leftBarImage: UIImageView!
    
    @IBOutlet weak var promoStackView: UIStackView!
    @IBOutlet weak var promoImageView: UIImageView!
    @IBOutlet weak var promoAppTitleLabel: UILabel!
    @IBOutlet weak var promoTextLabel: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    // MARK: - Life circle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        constraintsSetup()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    
    // signInButton pressed
    @IBAction func signInAction(_ sender: UIButton) {
    }
    
    // signUpButton pressed
    @IBAction func signUpAction(_ sender: UIButton) {
    }
    

// MARK: - Constraints setup method
    func constraintsSetup() {
        
        
        // Constants (Need to become an enum)
        let leftBarImage_promoStackViewSpacing: CGFloat = -50.0
        let signUpButton_viewBottomSpacing: CGFloat = -40.0;
        let signUpButton_signInButtonSpacing: CGFloat = -15;
        
        
        // Autoresizing disable
        leftBarImage.translatesAutoresizingMaskIntoConstraints = false
        promoStackView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        
        leftBarImage.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor).isActive = true
        leftBarImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true

        promoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        promoStackView.leftAnchor.constraint(equalTo: leftBarImage.rightAnchor, constant: leftBarImage_promoStackViewSpacing).isActive = true
        promoStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        signInButton.centerXAnchor.constraint(equalTo: promoStackView.centerXAnchor).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: signUpButton_signInButtonSpacing).isActive = true
        signInButton.leftAnchor.constraint(equalTo: promoStackView.leftAnchor).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        signInButton.rightAnchor.constraint(equalTo: promoStackView.rightAnchor).isActive = true
        
        signUpButton.centerXAnchor.constraint(equalTo: signInButton.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: signUpButton_viewBottomSpacing).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }

    
}

