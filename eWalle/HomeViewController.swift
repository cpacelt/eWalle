//
//  HomeViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 27.10.2021.
//

import UIKit



class HomeViewController: UICollectionViewController {
    
    private var storyBoardCollectionView: UICollectionView?
    
    
    // MARK: - Collection view layout
    enum Section: Int, CaseIterable {
        case balance
        case friends
        case services
        
        var cellsCount: Int {
            switch self {
            case .balance: return 1
            case .friends: return 7
            case .services: return 8
            }
        }
        
        var cellIdentifier: String {
            switch self {
            case .balance: return BalanceCell.reuseIdentifier
            case .friends: return FriendCell.reuseIdentifier
            case .services: return ServiceCell.reuseIdentifier
            }
        }
        
        var headers: String{
            switch self {
            case .balance: return "Account overview"
            case .friends: return "Send Money"
            case .services: return "Services"
            }
        }
        
        var layout: NSCollectionLayoutSection {
            switch self {
            case .balance: return balanceLayout
            case .friends: return friendsLayout
            case .services: return servicesLayout
            }
        }
        
        
        
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
        
    }
    
    
    // MARK: - Set layout for section
    let layout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            return sectionKind.layout
        }
        return layout
    }()
    
    
    
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
        
        storyBoardCollectionView = collectionView
        collectionView = UICollectionView(frame: storyBoardCollectionView!.frame, collectionViewLayout: layout)
        collectionView.register(SectionHeaderReusibleView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderReusibleView.reuseIdentifier)
        collectionView.register(HomeHeaderReusibleView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeHeaderReusibleView.reuseIdentifier)
        
    }
    
}


// MARK: UICollectionViewDataSource methods
extension HomeViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Section(rawValue: section)!.cellsCount
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionKind = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
        
        switch sectionKind {
            case .friends: return friendCellSetup(for: indexPath)
            case .balance: return balanceCellSetup(for: indexPath)
            case .services: return servicesCellSetup(for: indexPath)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if indexPath.section == 0 {
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeHeaderReusibleView.reuseIdentifier, for: indexPath) as! HomeHeaderReusibleView
            
            view.firstSectionLabel.text = Section(rawValue: indexPath.section)!.headers
            return view
            
        } else {
            
            
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderReusibleView.reuseIdentifier, for: indexPath) as! SectionHeaderReusibleView
            
            view.label.text = Section(rawValue: indexPath.section)!.headers
            return view
            
        }
        
    }
    
    
}


// MARK: UICollectionViewDelegate methods
extension HomeViewController {
    
    
}


//MARK: Cells setup methods
extension HomeViewController {
    
    func friendCellSetup(for indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell
        
        if indexPath.row == 0 {
            cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: AddFriendCell.reuseIdentifier, for: indexPath)
        } else {
            cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: FriendCell.reuseIdentifier, for: indexPath) as! FriendCell
        }
        
        return cell
    }
    
    func balanceCellSetup(for indexPath: IndexPath) -> BalanceCell {
        let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: BalanceCell.reuseIdentifier, for: indexPath) as! BalanceCell
        return cell
    }
    
    func servicesCellSetup(for indexPath: IndexPath) -> ServiceCell {
        let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: ServiceCell.reuseIdentifier, for: indexPath) as! ServiceCell
        return cell
    }
    
    
    
}


