//
//  BaseView.swift
//  DummySchProject
//
//  Created by babatundejimoh on 11/06/2021.
//

import Foundation
import UIKit

enum NavigationStyle {
    case ViewHasNoNavbar
}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    //MARK: NavigationBarConfiguration
    func setupNavigationBar(style: NavigationStyle) {
        switch style {
        case .ViewHasNoNavbar:
            self.navigationController?.navigationBar.isHidden = true
        }
    }
}
