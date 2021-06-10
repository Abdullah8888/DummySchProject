//
//  HomeViewControllerWrapper.swift
//  DummySchProject
//
//  Created by babatundejimoh on 10/06/2021.
//

import Foundation
import SwiftUI
import UIKit
struct HomeViewControllerWrapper: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        HomeViewController(nibName: "HomeViewController", bundle: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
