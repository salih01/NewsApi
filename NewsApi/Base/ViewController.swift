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
        
    
        let model = NewsModel()
        model.getCall()
        
        //print(model.title)
    }

}

