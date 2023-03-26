//
//  FavoriteNewsData.swift
//  NewsApi
//
//  Created by Salih on 25.03.2023.
//


import Foundation

protocol FavoriteNewsDelegate: AnyObject {
    func addFavoriteNews(title: String, body: String, imageURL: Data)
    func deleteFavoriteNews(at index: Int)
}

struct FavoriteNewsData {
    
    let title:String
    let body:String
    let imageURL:String
}
