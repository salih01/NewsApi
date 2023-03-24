//
//  GlobalHelpers.swift
//  NewsApi
//
//  Created by Salih on 24.03.2023.
//

import Foundation
import UIKit


// JSON  dan gelen image verisi string tipinde . O yüzden gelen veriyi image e dönüştürüyorum .

func getImage(_ type:String) -> UIImage? {
    
    return UIImage(named: type)
    
}

