//
//  FavoriteNewsManager.swift
//  NewsApi
//
//  Created by Salih on 25.03.2023.
//

import Foundation
import UIKit
import CoreData


class FavoriteNewsManager:FavoriteNewsDelegate {
    
    
    weak var delegate:FavoriteNewsDelegate?
    static let shared = FavoriteNewsManager()
    private init(){}
    
    let coreDataStack = CoreDataStack.shared
    
    func addFavoriteNews(title: String, body: String, imageURL: Data) {
        let context = coreDataStack.persistentContainer.viewContext
        let favoriteNews = FavoriteNews(context: context) //Core Data
        
        favoriteNews.title = title
        favoriteNews.body  = body
        favoriteNews.image = imageURL
        
        coreDataStack.saveContext()
        
    }
    func deleteFavoriteNews(at index: Int) {
        
        let context = coreDataStack.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<FavoriteNews> = FavoriteNews.fetchRequest()
        
        do {
            let favoriteNews = try context.fetch(fetchRequest)
            context.delete(favoriteNews[index])
            coreDataStack.saveContext()
            delegate?.deleteFavoriteNews(at: index)
        } catch {
            print("Error deleting favorite news with index \(index): \(error)")
        }
        
    }
    
    func fetchFavoriteNews() -> [FavoriteNewsData] {
        
        let context = coreDataStack.persistentContainer.viewContext
        let fetchRequest:NSFetchRequest<FavoriteNews> = FavoriteNews.fetchRequest()
        do {
            let favoriteNews = try context.fetch(fetchRequest)
            let favoriteNewsData = favoriteNews.map { FavoriteNewsData(title: $0.title ?? "", body: $0.body ?? "", imageURL: $0.image?.base64EncodedString() ?? "") }



            return favoriteNewsData
        }catch {
            print("Error fetching favorite news: \(error)")
            return []
        }
        
    }
  
 
    
}
