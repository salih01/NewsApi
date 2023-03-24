//
//  GlobalHelpers.swift
//  NewsApi
//
//  Created by Salih on 24.03.2023.
//

import Foundation
import UIKit


// JSON  dan gelen image verisi string tipinde . O yüzden gelen veriyi image e dönüştürüyorum .
/*
func getImage(_ type:String) -> UIImage? {
    
    return UIImage(named: type)
    
}

*/

func getImage(from urlString: String?, completion: @escaping (UIImage?) -> Void) {
    guard let urlString = urlString, let url = URL(string: urlString) else {
        completion(nil)
        return
    }
    
    DispatchQueue.global(qos: .userInitiated).async {
        do {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async {
                completion(UIImage(data: data))
            }
        } catch {
            print("Error loading image from URL: \(error.localizedDescription)")
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
}
