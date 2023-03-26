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
        guard let title = titleText, let body = bodyText, let imageURL = imageURL else {
              return
         }
         
        let imageData = Data(url: imageURL)
         FavoriteNewsManager.shared.addFavoriteNews(title: title, body: body, imageURL: imageData!)
         
         let alertController = UIAlertController(title: "Favorilere Eklendi", message: "Haber favorilere eklendi.", preferredStyle: .alert)
         let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
         alertController.addAction(okAction)
         present(alertController, animated: true, completion: nil)
        
    }
    
    
}
