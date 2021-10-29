//
//  MenuViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {
    
    func displayMenu(with data: [String])
    func cleanSwiftAssembly()
}


class MenuViewController: UIViewController {
    //MARK: - Presenter reference
    var presenter: MenuPresentationLogic?
    var interactor: MenuBusinessLogic?
    
    // MARK: - Data cash
    var menuTitles = [String]()
    
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
    
    @IBOutlet weak var selectedVCImageView: UIImageView!
    //Buttons
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var menuCloseButton: UIButton!
    
    @IBOutlet weak var versionLabel: UILabel!
    
    //MARK: - Inits
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    //MARK: - LifeCircle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareSubviews()
        constraintsSetup()
        
        // Asembling...
        cleanSwiftAssembly()
        interactor?.fetchMenuData()
    }
    
    
    //MARK: - Subviews preparation
    fileprivate func prepareSubviews(){

        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        menuTableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        accountBackgroundRoundedView.backgroundColor = .white
        
        
        // Account view
        accountBackgroundRoundedView.layer.cornerRadius = 50
        accountBackgroundRoundedView.clipsToBounds = true
        
        // Menu table view
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    fileprivate func switchSelectedVCImageView(for indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.selectedVCImageView.image = self.view.snapshot
        }
    }
    
    //MARK: - Actions
    
    @IBAction func menuCloseButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func logoutButtonAction(_ sender: UIButton) {
    }
    
    //MARK: - Constraints setup method
    fileprivate func constraintsSetup() {
        
        accountBackgroundRoundedView.translatesAutoresizingMaskIntoConstraints = false
        accountStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        accountBackgroundRoundedView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: accountBackgroundRoundedView.layer.cornerRadius * -1.0).isActive = true
        accountBackgroundRoundedView.topAnchor.constraint(equalTo: view.topAnchor, constant: accountBackgroundRoundedView.layer.cornerRadius * -1.0).isActive = true
        accountBackgroundRoundedView.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        accountBackgroundRoundedView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: accountBackgroundRoundedView.layer.cornerRadius * 1.0 * 2.5).isActive = true
        
        accountStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        accountStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        accountStackView.rightAnchor.constraint(equalTo: accountBackgroundRoundedView.rightAnchor, constant: -20).isActive = true
        accountStackView.bottomAnchor.constraint(equalTo: accountBackgroundRoundedView.bottomAnchor, constant: -20).isActive = true
    }
    
    

}


// MARK: - menuTableView data source
extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier) as! MenuCell
        
        cell.cellLabel.text = menuTitles[indexPath.row]
        cell.cellLabel.sizeToFit()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switchSelectedVCImageView(for: indexPath)
    }

}



// MARK: - Display Logic
extension MenuViewController: MenuDisplayLogic {
    func displayMenu(with data: [String]) {
        self.menuTitles = data
        menuTableView.reloadData()
        
    }
    
    
// MARK: - Clean swift assembly
    func cleanSwiftAssembly() {
        let vc = self
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        
        vc.presenter = presenter
        vc.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = vc
        
    }
    
    
}

// MARK: Take screenshot
extension UIView {
    var snapshot: UIImage {
        return UIGraphicsImageRenderer(size: bounds.size).image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }

}
