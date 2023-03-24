//
//  NewsTableViewCell.swift
//  NewsApi
//
//  Created by Salih on 24.03.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func generateCell(newsModel:NewsModel){
        
        newsTitle.text  = newsModel.title
        newsBody.text   = newsModel.body
        newsImage.image = getImage(newsModel.image)
        
    }
    
}
