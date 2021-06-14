//
//  OnBoardingCollectionViewCell.swift
//  DummySchProject
//
//  Created by babatundejimoh on 14/06/2021.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var firstLbl: UILabel?
    @IBOutlet weak var secondLbl: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateLabels(headerText: String, contentText: String) {
        self.firstLbl?.text = headerText
        self.secondLbl?.text = contentText
    }

}
