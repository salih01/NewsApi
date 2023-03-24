//
//  NewsModel.swift
//  NewsApi
//
//  Created by Salih on 23.03.2023.
//

import Foundation
import Alamofire
import SwiftyJSON


class NewsModel {
    
    private var _title: String!
    private var _image: String!
    private var _body: String!
    
    var title:String {
        if _title == nil  {
            _title = ""
        }
        return _title
    }
    var image:String {
        if _image == nil {
            _image = ""
        }
        return _image
    }
    var body:String {
        if _body == nil {
            _body = ""
        }
        return _body
    }
    
   
    
    
    init(newsDictionary: Dictionary<String,AnyObject>) {
        self._title = newsDictionary["title"] as? String ?? ""
        self._body = newsDictionary["body"] as? String ?? ""
        self._image = newsDictionary["image"] as? String ?? ""
    }

 
   class func getCall(completion: @escaping(_ newsModelArray:[NewsModel]) -> Void){
        
        // MARK: - URL adresine burada Alamofire ile istek atıyoruz eğer sonuç başarılysa .succes düşüyor değilse error alıyoruz
        let api = "https://eventregistry.org/api/v1/article/getArticles?apiKey=b90b0dd3-6390-4b0a-bbac-97227bb8f515&lang=eng"
        
        let request = AF.request(api).responseJSON { response in
                
            var newsModelArray = [NewsModel]()
            switch response.result {
                case .success:
                    
                    let json = JSON(response.value)
                    
                   // MARK: -  amacım jsondan gelen bir veri var . Ve bu aslında dictionary tipinde key value . Keyini verdim value ulaşmaya çalışıyorum
                if let dictionary = response.value as? Dictionary<String,AnyObject>,
                   let articles = dictionary["articles"] as? Dictionary<String, AnyObject>,
                   let list = articles["results"] as? [Dictionary<String,AnyObject>] {
                       for item in list {
                           let newsModel = NewsModel(newsDictionary: item)
                           newsModelArray.append(newsModel)
                       }
                }

                completion(newsModelArray)
            
                case let .failure(error):
                    print(error)
                //completion(newsModelArray)
                
            }
                
        }
        
    }
    
}
