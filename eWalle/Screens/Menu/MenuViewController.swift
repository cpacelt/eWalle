//
//  MenuViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit

protocol MenuDisplayLogic: AnyObject {
    func updateScreensCash(with data: [String : UIImage])
    func displayMenu(with data: [String])
    func displayInitionState(with data: AppScreen?)
    func cleanSwiftAssembly()
}

class MenuViewController: UIViewController {
    //MARK: - Presenter reference
    var presenter: MenuPresentationLogic?
    var interactor: (MenuBusinessLogic & MenuDataStore)?
    var router: (MenuRoutingLogic & MenuDataPassing)?
    
    // MARK: - Data cash
    var menuTitlesCash = [String]()
    
    var screensCash = [String : UIImage]()
    var selectedRow: Int = 0
    
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
        
        
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .crossDissolve
        
        // Do any additional setup after loading the view.
        prepareSubviews()
        constraintsSetup()
        
        // Asembling...
        cleanSwiftAssembly()
        interactor?.fetchMenuData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.fetchScreensCash()
        interactor?.fetchInitionState()
        
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
        
        // Background VC Image
        selectedVCImageView.contentMode = .scaleAspectFill
        
        // Get screen width, height to compute image zise and rounding corners more beatyful)
        let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        
        selectedVCImageView.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: screenWidth / 1.5, height: screenHeight / 1.5))
        
        selectedVCImageView.layer.cornerRadius = 15
        selectedVCImageView.clipsToBounds = true
        
        let transform = CGAffineTransform(rotationAngle: CGFloat.pi / -10)
        selectedVCImageView.transform = transform
        
    }
    
    fileprivate func switchSelectedVCImageView(for indexPath: IndexPath) {
        DispatchQueue.main.async {
            
            UIView.transition(with: self.selectedVCImageView, duration: 0.4, options: .transitionCrossDissolve , animations: {
                self.selectedVCImageView.image = self.screensCash[self.menuTitlesCash[indexPath.row]]
                    }, completion: nil)
            
            
            
        }
    }
    
    //MARK: - Actions
    
    @IBAction func menuCloseButtonAction(_ sender: UIButton) {
        switch selectedRow {
        case 0: router?.navigateToHome()
        case 1: router?.navigateToLogin()
        case 2: router?.navigateToLogin()
        default: return
        }
        
    }
    
    @IBAction func logoutButtonAction(_ sender: UIButton) {
        router?.navigateToLogin()
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
        return menuTitlesCash.count
    }
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: MenuCell.reuseIdentifier) as! MenuCell
        
        cell.cellLabel.text = menuTitlesCash[indexPath.row]
        cell.cellLabel.sizeToFit()
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        switchSelectedVCImageView(for: indexPath)
    }
    
}


// MARK: - Display Logic
extension MenuViewController: MenuDisplayLogic {
    
    func updateScreensCash(with data: [String : UIImage]) {
        self.screensCash = data
    }
    
    func displayInitionState(with data: AppScreen?) {
        
        let index = menuTitlesCash.firstIndex(of: data?.title ?? "")
        self.menuTableView.selectRow(at: IndexPath(row: index ?? 0, section: 0), animated: false, scrollPosition: .none)

        self.selectedVCImageView.image = screensCash[data?.title ?? ""]
        
    }
    
    func displayMenu(with data: [String]) {
        self.menuTitlesCash = data
        menuTableView.reloadData()
        
    }
    
    
    // MARK: - Clean swift assembly
    func cleanSwiftAssembly() {
        let vc = self
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        let router = MenuRouter()
        
        vc.presenter = presenter
        vc.interactor = interactor
        vc.router = router
        interactor.presenter = presenter
        presenter.viewController = vc
        router.vc = vc
        router.dataStorage = interactor
        
    }
    
}

// MARK: Take screenshot
extension UIView {
    var snapshot: UIImage {
        return UIGraphicsImageRenderer(size: self.bounds.size).image { _ in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        
    }
}
