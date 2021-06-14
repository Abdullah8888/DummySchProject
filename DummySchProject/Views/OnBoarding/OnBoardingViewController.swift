//
//  OnBoardingViewController.swift
//  DummySchProject
//
//  Created by babatundejimoh on 13/06/2021.
//

import UIKit
import SwiftUI
class OnBoardingViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var constraint1: NSLayoutConstraint?
    
    @IBOutlet weak var constraint2: NSLayoutConstraint?
    @IBOutlet weak var constraint3: NSLayoutConstraint?
    
    @IBOutlet weak var loginBtn: UIButton?
    @IBOutlet weak var signupBtn: UIButton?
    @IBOutlet weak var onBoardingCollectionView: UICollectionView?
    @IBOutlet weak var pageControl: UIPageControl?
    @IBOutlet weak var animatedContainerView: UIView?
    lazy var animatedConnectionView: UIHostingController = {
            return UIHostingController(rootView:  AnimatedConnectionView())
    }()
    let viewModel = OnBoardingViewModel()
    private var currentIndexPath : IndexPath?
    private var scrolltimer : Timer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar(style: .ViewHasNoNavbar)
        setupACUsers()
        self.loginBtn?.layer.borderWidth = 1
        self.loginBtn?.layer.borderColor = UIColor(hexString: "#FF661F").cgColor
        onBoardingCollectionView?.delegate = self
        onBoardingCollectionView?.dataSource = self
        registerReusableViewsForCollectionView(collecctionView: onBoardingCollectionView!)
        self.onBoardingCollectionView?.collectionViewLayout = self.getLayout()
        self.currentIndexPath = IndexPath(row: 0, section: 0)
        self.pageControl?.numberOfPages = self.viewModel.headerTexts.count
        self.pageControl?.currentPage = (self.currentIndexPath?.row)!
        //self.pageControl?.set
        if (self.viewModel.headerTexts.count > 1) {
            
            if (self.scrolltimer == nil) {
                self.scrolltimer = Timer.scheduledTimer(timeInterval: 10.0,
                                                        target: self,
                                                        selector: #selector(scrollSlider),
                                                        userInfo: nil,
                                                        repeats: true)
            }
            
        }
        self.setupBtnShadow(self.loginBtn!)
        self.setupBtnShadow(self.signupBtn!)
        print("height is \(UIScreen.main.bounds.height)")
        self.updateConstraints()
    }
    
    func setupACUsers() {
        animatedConnectionView.view.translatesAutoresizingMaskIntoConstraints = false
        //addChild(animatedConnectionView)
        self.animatedContainerView?.addSubview(animatedConnectionView.view)
        animatedConnectionView.view.topAnchor.constraint(equalTo: self.animatedContainerView!.topAnchor).isActive = true
        animatedConnectionView.view.bottomAnchor.constraint(equalTo: self.animatedContainerView!.bottomAnchor).isActive = true
        animatedConnectionView.view.leadingAnchor.constraint(equalTo: self.animatedContainerView!.leadingAnchor).isActive = true
        animatedConnectionView.view.trailingAnchor.constraint(equalTo: self.animatedContainerView!.trailingAnchor).isActive = true
    }
    
    //MARK: Collection
    public func registerReusableViewsForCollectionView(collecctionView: UICollectionView) {
        collecctionView.register(UINib(nibName: "OnBoardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnBoardingCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.headerTexts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCollectionViewCell",
                                                      for: indexPath) as! OnBoardingCollectionViewCell
        cell.updateLabels(headerText: self.viewModel.headerTexts[indexPath.row],
                          contentText: self.viewModel.contextTexts[indexPath.row])
        return cell
    }
    
    @objc func scrollSlider() {
        
        self.currentIndexPath = IndexPath.init(row: (self.currentIndexPath?.row)!+1, section: 0)
        
        if ((self.currentIndexPath?.row)! >= self.viewModel.headerTexts.count) {
            self.currentIndexPath = IndexPath.init(row: 0, section: 0)
        }
        
        self.onBoardingCollectionView?.scrollToItem(at: self.currentIndexPath!, at: .centeredHorizontally, animated: true)
        pageControl?.currentPage = (self.currentIndexPath?.row)!
    }
    
    func getLayout() -> UICollectionViewLayout
    {
        let layout:UICollectionViewFlowLayout =  UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0.0;
        layout.minimumLineSpacing = 0.0
        
        return layout as UICollectionViewLayout
    }
    
    @IBAction func login(_ sender: UIButton) {
    }
    
    @IBAction func signUp(_ sender: UIButton) {
    }
    
    func setupBtnShadow(_ btn: UIButton) {
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.3
        btn.layer.shadowOffset = .zero
        btn.layer.shadowRadius = 3
        //btn.layer.shadowPath = UIBezierPath(rect: btn.bounds).cgPath
    }
    
    func updateConstraints() {
        if UIScreen.main.bounds.height <= 667 {
            self.constraint1?.constant = 30
            self.constraint2?.constant = 15
            self.constraint3?.constant = 24
        }
    }
}
