//
//  MenuViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var accountBackgroundRoundedView: UIView!
    @IBOutlet weak var accountStackView: UIStackView!
    @IBOutlet weak var nameLocationStackView: UIStackView!
    
    //Account views
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    //Menu table
    @IBOutlet weak var menuTableView: UITableView!
    
    //MARK: - LifeCircle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareSubviews()
        constraintsSetup()
    }
    
    
    //MARK: - Subviews preparation
    func prepareSubviews(){
        // Account view
        accountBackgroundRoundedView.layer.cornerRadius = 50
        accountBackgroundRoundedView.clipsToBounds = true
        
        // Menu table view
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    //MARK: - Actions
    
    //MARK: - Constraints setup method
    func constraintsSetup() {
        
        accountBackgroundRoundedView.translatesAutoresizingMaskIntoConstraints = false
        accountStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        accountBackgroundRoundedView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: accountBackgroundRoundedView.layer.cornerRadius * -1.0).isActive = true
        accountBackgroundRoundedView.topAnchor.constraint(equalTo: view.topAnchor, constant: accountBackgroundRoundedView.layer.cornerRadius * -1.0).isActive = true
        accountBackgroundRoundedView.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        accountBackgroundRoundedView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: accountBackgroundRoundedView.layer.cornerRadius * 1.0 * 2.5).isActive = true
        
        accountStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        accountStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        accountStackView.rightAnchor.constraint(equalTo: accountBackgroundRoundedView.rightAnchor, constant: -20).isActive = true
        accountStackView.bottomAnchor.constraint(equalTo: accountBackgroundRoundedView.bottomAnchor, constant: -20).isActive = true
    }

}


// MARK: - menuTableView data source
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier) as! MenuCell
        
        return cell
    }
    

}
