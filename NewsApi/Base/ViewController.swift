//
//  ViewController.swift
//  NewsApi
//
//  Created by Salih on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        NewsModel.getCall { newsModelArray in
            
            for data in newsModelArray {
                print("TİTLE : \(data.title)")
                print("IMAGE :\(data.image)")
                print("BODY :\(data.body)")

            }
        }
        
        //print(model.title)
    }

}

