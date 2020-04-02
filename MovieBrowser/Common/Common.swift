//
//  CommonConstants.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 01/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import Foundation
import UIKit
class Common{
    
   static let BASEURL = "https://api.themoviedb.org/3/"
    static let POSTERPATH = "https://image.tmdb.org/t/p/w500/"
    
    static func roundView(viewForRound : UIView){
        viewForRound.layer.cornerRadius = viewForRound.frame.width / 2
    }
    
    static func addShadow(viewForshadow : UIView){
        viewForshadow.layer.shadowColor = UIColor.gray.cgColor
        viewForshadow.layer.shadowOpacity = 1
        viewForshadow.layer.shadowOffset = CGSize.zero
        viewForshadow.layer.shadowRadius = 6
    }
}
