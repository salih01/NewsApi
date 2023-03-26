//
//  FavoriteNewsViewController.swift
//  NewsApi
//
//  Created by Salih on 26.03.2023.
//

import UIKit

class FavoriteNewsViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let favoriteNewsManager = FavoriteNewsManager.shared
    var favoriteNewsData : [FavoriteNewsData] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        favoriteNewsData = favoriteNewsManager.fetchFavoriteNews()
        tableView.reloadData()
    }

    
    

}

extension FavoriteNewsViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteNewsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FavoriteNewsTableViewCell
        
        
              let favoriteNews = favoriteNewsData[indexPath.row]
              cell.configure(with: favoriteNews)
              
              return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              favoriteNewsManager.deleteFavoriteNews(at: indexPath.row)
              favoriteNewsData.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .fade)
          }
      }
    
}
