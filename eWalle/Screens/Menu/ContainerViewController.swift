//
//  ContainerViewController.swift
//  eWalle
//
//  Created by Роман Путинцев on 30.10.2021.
//

import UIKit


protocol ViewControllersCustomContainer: AnyObject {
    var controllers: [UIViewController] { get }
    func add (_ vc: UIViewController)
    func add (_ vcs: [UIViewController])
    func select (_ vc: UIViewController)
    func selectAt (_ index: Int)
    func deselect (_ vc: UIViewController)
    func deselectAt (_ index: Int)
    func switchTo(_ vc: UIViewController)
    func switchTo(_ index: Int)
    func switchToSelected()
    func switchToVC(titled titleName: String)
    func switchToMain()
}


protocol Contained {
    var container: ViewControllersCustomContainer? { get }
}

class ContainerViewController: UIViewController  {
    
    private(set) var controllers: [UIViewController] = []
    private var isSelected: [Bool] = []
    private var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}


// MARK: - ViewControllersCustomContainer
extension ContainerViewController: ViewControllersCustomContainer {

    func switchToMain() {
        self.show(self, sender: nil)
    }
    
    func switchToVC(titled titleName: String) {
        let vc = self.controllers.first{ $0.title == titleName }
        guard let vc = vc else { return }
        self.switchTo(vc)
    }
    
    func switchToSelected() {
        self.switchTo(selectedIndex)
    }
    

    func switchTo(_ vc: UIViewController) {
        guard let index = self.controllers.firstIndex(of: vc) else { return }
        switchTo(index)
        
    }
    
    func switchTo(_ index: Int) {
        if index >= controllers.count { return }
        self.show(controllers[index], sender: nil)
    }
    
    func add(_ vc: UIViewController) {
        self.addChild(vc)
        self.controllers.append(vc)
    }
    
    func add(_ vcs: [UIViewController]) {
        controllers.forEach { self.addChild($0)}
        self.controllers.append(contentsOf: vcs)
    }
    
    func select(_ vc: UIViewController) {
        guard let index = self.controllers.firstIndex(of: vc) else { return }
        selectAt(index)
    }
    
    func selectAt(_ index: Int) {
        self.selectedIndex = index
    }
    
    func deselect(_ vc: UIViewController) {
        guard let index = self.controllers.firstIndex(of: vc) else { return }
        deselectAt(index)
    }
    
    func deselectAt(_ index: Int) {
        self.selectedIndex = -1
    }
    
    
}
