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
 
    func getCall(){
        
        // MARK: - URL adresine burada Alamofire ile istek atıyoruz eğer sonuç başarılysa .succes düşüyor değilse error alıyoruz
        let api = "https://eventregistry.org/api/v1/article/getArticles?apiKey=b90b0dd3-6390-4b0a-bbac-97227bb8f515&lang=eng"
        
        let request = AF.request(api)
            .responseJSON { response in
                
                
                switch response.result {
                case .success:
                    
                    let json = JSON(response.value)
                    
                   // MARK: -  amacım jsondan gelen bir veri var . Ve bu aslında dictionary tipinde key value . Keyini verdim value ulaşmaya çalışıyorum
                    self._title = json["articles"]["results"][0]["title"].string// articles dizisinin altındaki results dizisine ulaşmaya çalıştım
                    self._body  = json["articles"]["results"][0]["body"].string// articles dizisinin altındaki results dizisine ulaşmaya çalıştım
                    self._image = json["articles"]["results"][0]["image"].string// articles dizisinin altındaki results dizisine ulaşmaya çalıştım
                    //print(json)
                    print("Title :\(self.title)")
                    print("Image :\(self.image)")
                    print("Body :\(self.body)")
                    
                    
                    
                case let .failure(error):
                    print(error)
            }
                
        }
        
    }
    
}
