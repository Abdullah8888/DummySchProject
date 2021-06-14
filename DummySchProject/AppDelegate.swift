//
//  AppDelegate.swift
//  DummySchProject
//
//  Created by babatundejimoh on 10/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        PersistenceManager.sharedManager.setupDataStack()
        window = UIWindow(frame: UIScreen.main.bounds)        
        let hostVC = PersistenceManager.sharedManager
                            .isBoardingScreenShown() ?
            LoginViewController(nibName: "LoginViewController", bundle: nil) :
            OnBoardingViewController(nibName: "OnBoardingViewController", bundle: nil)

        let rootVC = UINavigationController(rootViewController: hostVC)
    
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

