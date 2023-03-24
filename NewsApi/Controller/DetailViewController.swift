//
//  DetailViewController.swift
//  NewsApi
//
//  Created by Salih on 24.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageName: UIImage?
    var titleText: String?
    var bodyText: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image   = imageName
        titleLabel.text   = titleText
        bodyTextView.text = bodyText
    }
    
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        
    }
    
    
}
