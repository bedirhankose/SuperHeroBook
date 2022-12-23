//
//  DetailsViewController.swift
//  SuperHeroBook
//
//  Created by Bedirhan Köse on 23.12.22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ImageLabel: UILabel!
    
    var chosenHeroName = ""
    var chosenHeroImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = UIImage(named: chosenHeroImageName)
        ImageLabel.text = chosenHeroName

    }
    

    
    

}
