//
//  FavoriteNewsTableViewCell.swift
//  NewsApi
//
//  Created by Salih on 26.03.2023.
//

import UIKit
import Kingfisher

class FavoriteNewsTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with news: FavoriteNewsData) {
           title.text = news.title
           body.text = news.body
           
        if let imageData = Data(base64Encoded: news.imageURL, options: .ignoreUnknownCharacters) {
               imageCell.image = UIImage(data: imageData)
           }
       }

}
