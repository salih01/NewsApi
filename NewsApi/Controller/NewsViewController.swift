//
//  NewsViewController.swift
//  NewsApi
//
//  Created by Salih on 23.03.2023.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let newsView = NewsView()
        scrollView.addSubview(newsView)
        newsView.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        
        getNewsCall(newsView: newsView)
    }
    
    
    private func getNewsCall(newsView:NewsView){
        
        NewsModel.getCall { newsModelArray in
            newsView.newsDataArray = newsModelArray
            newsView.tableView.reloadData()
        }
        
    }

}
