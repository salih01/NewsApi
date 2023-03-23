//
//  NewsView.swift
//  NewsApi
//
//  Created by Salih on 23.03.2023.
//

import UIKit

class NewsView: UIView {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func mainInit(){
        Bundle.main.loadNibNamed("NewsView", owner: self)
        addSubview(mainView)
        mainView.frame = self.bounds
        mainView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        setupTableView()

    }
    
    private func setupTableView(){
        
    }
    
}
