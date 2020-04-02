//
//  MoviesCollectionCell.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 01/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import UIKit

class MoviesCollectionCell: UICollectionViewCell {
    @IBOutlet weak var viewParent: UIView!
    
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var imgvwPoster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewParent.layer.cornerRadius = 8
    }

}
