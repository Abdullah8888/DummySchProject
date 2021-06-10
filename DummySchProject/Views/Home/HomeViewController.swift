//
//  HomeViewController.swift
//  DummySchProject
//
//  Created by babatundejimoh on 10/06/2021.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    lazy var loginView: UIHostingController = {
        return UIHostingController(rootView:  LoginView())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showLoginView(_ sender: UIButton) {
        self.navigationController?.pushViewController(loginView, animated: true)
    }

}
