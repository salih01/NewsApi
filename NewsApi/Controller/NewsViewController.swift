//
//  NewsViewController.swift
//  NewsApi
//
//  Created by Salih on 23.03.2023.
//

import UIKit

class NewsViewController: UIViewController ,NewsViewDelegate{
   
    @IBOutlet weak var scrollView: UIScrollView!

    var newsView: NewsView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         newsView = NewsView()
         newsView.delegate = self // NewsViewDelegate protokolünü uygulayın
         scrollView.addSubview(newsView)
     }
     
     override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         newsView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
         getNewsCall()
     }
     
     private func getNewsCall(){
         NewsModel.getCall { [weak self] newsModelArray in
             self?.newsView.newsDataArray = newsModelArray
             self?.newsView.tableView.reloadData()
         }
     }
     
    func didSelectNews(_ news: NewsModel) {
        guard let parentVC = parent else {return}
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        getNewsCall()

        if let imageURL = URL(string: news.image) {
            detailVC.imageURL = imageURL
        } else {
            print("Error: Failed to create image URL from '\(news.image)'")
        }
        
        detailVC.titleText = news.title
        detailVC.bodyText = news.body
        parentVC.present(detailVC, animated: true, completion: nil)
    }


   

}
