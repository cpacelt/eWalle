//
//  HomeViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayAccount(with data: [Account])
    func displayFriends(with data: [Person])
    func displayServices(with data: [Service])
    func displaySections(with data: [Section])
    func cleanSwiftAssembly()
}

final class HomeViewController: UICollectionViewController {
    var container: ViewControllersCustomContainer?
    
    
    // MARK: - Presenter reference
    var interactor: HomeBusinessLogic?
    var presenter: HomePresentationLogic?
    var router: HomeRoutingLogic?
    
    private var storyBoardCollectionView: UICollectionView?
    
    // MARK: - Data cash
    var friendsCash: [Person] = []
    var accountCash: [Account] = []
    var servicesCash: [Service] = []
    var sectionsCash: [Section] = []
    
    // MARK: - Balance section layout
    
    var balanceLayout: NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 2, leading: 10, bottom: 2, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1/*columns*/)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    // MARK: - Friends section layout
    
    var friendsLayout: NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalWidth(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1/*columns*/)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    
    // MARK: - Services section layout
    
     var servicesLayout: NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(20), heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4/*columns*/)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 10, leading: 20, bottom: 10, trailing: 20)
        return section
    }
    
    
    // MARK: - Set layout for section
    fileprivate func makeCollectionLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            //let sectionKind = Section.SectionKind(rawValue: sectionIndex)
            let kind = self.sectionsCash[sectionIndex].kind
            
            switch kind {
            case .balance: return self.balanceLayout
            case .friends: return self.friendsLayout
            case .services: return self.servicesLayout
            }
        }
        return layout
    }
    
    //MARK: - Inits
    // Comment if Storyboard
    
    //    init() {
    //        super.init(collectionViewLayout: self.layout)
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    
    //MARK: - Life circle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewSetup()
        
        cleanSwiftAssembly()
        interactor?.getAccount()
        interactor?.getFriends()
        interactor?.getServices()
        interactor?.getSections()
        
        
        router?.createMenu()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        router?.passSnapshot()
    }
    
}

// MARK: CollectionView DataSource
extension HomeViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsCash.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let sectionKind = sectionsCash[section].kind
        switch sectionKind {
        case .friends: return friendsCash.count
        case .balance: return accountCash.count
        case .services: return servicesCash.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionKind = sectionsCash[indexPath.section].kind
        switch sectionKind {
        case .friends: return friendCellSetup(for: indexPath)
        case .balance: return balanceCellSetup(for: indexPath)
        case .services: return servicesCellSetup(for: indexPath)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return makeSectionHeader(for: indexPath)
    }
    
}


// MARK: CollectionView Delegate
extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

// Home Header delegate
extension HomeViewController: HomeHeaderReusibleViewDelegate {
    func homeHeaderReusibleView(didTappedRightButton button: UIButton) {
        router?.navigateToMenu()
    }
    
}


//MARK: Reusible views setup
extension HomeViewController {
    
    fileprivate func friendCellSetup(for indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: AddFriendCell.reuseIdentifier, for: indexPath)
            return cell
        } else {
            let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: FriendCell.reuseIdentifier, for: indexPath) as! FriendCell
            cell.configureWith(person: self.friendsCash[indexPath.row - 1])
            return cell
        }
        
    }
    
    fileprivate func balanceCellSetup(for indexPath: IndexPath) -> BalanceCell {
        let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: BalanceCell.reuseIdentifier, for: indexPath) as! BalanceCell
        
        cell.balanceLabel.text = String(accountCash[indexPath.row].sum)
        
        return cell
    }
    
    fileprivate func servicesCellSetup(for indexPath: IndexPath) -> ServiceCell {
        let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: ServiceCell.reuseIdentifier, for: indexPath) as! ServiceCell
        cell.configure(with: servicesCash[indexPath.row])
        return cell
    }
    
    fileprivate func makeSectionHeader(for indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderReusibleView.reuseIdentifier, for: indexPath) as! HomeHeaderReusibleView
            view.firstSectionLabel.text = sectionsCash[indexPath.section].title
            view.rightButton.setImage(UIImage(named: sectionsCash[indexPath.section].rightButtonImagePath), for: .normal)
            view.delegate = self
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderReusibleView.reuseIdentifier, for: indexPath) as! SectionHeaderReusibleView
            view.label.text = sectionsCash[indexPath.section].title
            view.rightButton.setImage(UIImage(named: sectionsCash[indexPath.section].rightButtonImagePath), for: .normal)
            return view
        }
    }
    
}

//MARK: - CollectionView setup
extension HomeViewController {
    fileprivate func collectionViewSetup() {
        storyBoardCollectionView = collectionView
        collectionView = UICollectionView(frame: storyBoardCollectionView!.frame, collectionViewLayout: makeCollectionLayout())
        collectionView.register(SectionHeaderReusibleView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderReusibleView.reuseIdentifier)
        collectionView.register(HomeHeaderReusibleView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderReusibleView.reuseIdentifier)
    }
}


//MARK: - Display Logic
extension HomeViewController: HomeDisplayLogic {
    func displaySections(with data: [Section]) {
        sectionsCash = data
        collectionView.reloadData()
    }
    
    func displayAccount(with data: [Account]) {
        accountCash = data
        collectionView.reloadData()
    }
    
    func displayFriends(with data: [Person]) {
        friendsCash = data
        collectionView.reloadData()
    }
    
    func displayServices(with data: [Service]) {
        servicesCash = data
        collectionView.reloadData()
    }
    
    // MARK: - Clean swift assembly
    func cleanSwiftAssembly() {
        let vc = self
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        vc.router = router
        vc.presenter = presenter
        vc.interactor = interactor
        interactor.presenter = presenter
        presenter.vc = vc
        router.vc = vc
        
    }
    
}


