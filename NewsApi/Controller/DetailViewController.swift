//
//  DetailViewController.swift
//  NewsApi
//
//  Created by Salih on 24.03.2023.
//

import UIKit
import Kingfisher


class DetailViewController: UIViewController {
    
    var imageURL: URL?
    var titleText: String?
    var bodyText: String?
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addShadowAndRoundedCorners(cornerRadius: 10, shadowColor: .black, shadowOffset: CGSize(width: 0, height: 4), shadowOpacity: 0.7, shadowRadius: 7)

        if let imageURL = imageURL {
                    imageView.kf.setImage(with: imageURL)
                }
        titleLabel.text   = titleText
        bodyTextView.text = bodyText
    }
    
    
    
    @IBAction func favoriteButton(_ sender: Any) {
        
    }
    
    
}
