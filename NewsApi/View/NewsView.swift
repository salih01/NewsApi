//
//  NewsView.swift
//  NewsApi
//
//  Created by Salih on 23.03.2023.
//

import UIKit

protocol NewsViewDelegate: class {
    func didSelectNews(_ news: NewsModel)
}


class NewsView: UIView {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var newsModel:NewsModel!
    var newsDataArray:[NewsModel] = []
    weak var delegate: NewsViewDelegate?
    var parentViewController:ViewController!
   
    
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
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
    
}
extension NewsView:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(newsDataArray.count,20)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        cell.generateCell(newsModel: newsDataArray[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print(delegate?.didSelectNews(newsDataArray[indexPath.row]))
       }
 
}
