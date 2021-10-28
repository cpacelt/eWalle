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
            case .balance: return BalanceCell.reuseIdentifier
            case .friends: return FriendCell.reuseIdentifier
            case .services: return ServiceCell.reuseIdentifier
            }
        }
        
        var layout: NSCollectionLayoutSection {
            switch self {
            case .balance: return balanceLayout
            case .friends: return friendsLayout
            case .services: return servicesLayout
            }
        }
        
        var balanceLayout: NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 10, bottom: 2, trailing: 10)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1/*columns*/)
            
            let section = NSCollectionLayoutSection(group: group)
            
            
            let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                      heightDimension: .absolute(50.0))
                        let header = NSCollectionLayoutBoundarySupplementaryItem(
                            layoutSize: footerHeaderSize,
                            elementKind: UICollectionView.elementKindSectionHeader,
                            alignment: .top)
            section.boundarySupplementaryItems = [header] 
            
            
            section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        
        
        var friendsLayout: NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 5, leading: 0, bottom: 5, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalWidth(0.4))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1/*columns*/)
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                      heightDimension: .absolute(50.0))
                        let header = NSCollectionLayoutBoundarySupplementaryItem(
                            layoutSize: footerHeaderSize,
                            elementKind: UICollectionView.elementKindSectionHeader,
                            alignment: .top)
            section.boundarySupplementaryItems = [header]
            
            
            section.contentInsets = .init(top: 20, leading: 0, bottom: 20, trailing: 20)
            return section
        }
        
        
        var servicesLayout: NSCollectionLayoutSection {
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(20), heightDimension: .absolute(80))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4/*columns*/)
            
            let section = NSCollectionLayoutSection(group: group)
            
            let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                      heightDimension: .absolute(50.0))
                        let header = NSCollectionLayoutBoundarySupplementaryItem(
                            layoutSize: footerHeaderSize,
                            elementKind: UICollectionView.elementKindSectionHeader,
                            alignment: .top)
            section.boundarySupplementaryItems = [header]
            
            
            section.contentInsets = .init(top: 20, leading: 20, bottom: 10, trailing: 20)
            return section
        }
        
    }
    
    
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
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
        
        let cell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier: Section(rawValue: indexPath.section)!.cellIdentifier, for: indexPath)

        switch cell {
        case is FriendCell: let cell = cell as! FriendCell
            
            if indexPath.row == 0 {
                let addFriendCell = storyBoardCollectionView!.dequeueReusableCell(withReuseIdentifier:AddFriendCell.reuseIdentifier, for: indexPath)
                
                return addFriendCell
            }
            cell.prepareToShow()

        case is BalanceCell: let cell = cell as! BalanceCell
            cell.balanceLabel.text = "200000"

        case is ServiceCell: let cell = cell as! ServiceCell
            cell.prepareToShow()

        default: break

        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderReusibleView.reuseIdentifier, for: indexPath) as! SectionHeaderReusibleView
        
        return view
    }
    
    
}

// MARK: UICollectionViewDelegate methods
extension HomeViewController {
    

}
