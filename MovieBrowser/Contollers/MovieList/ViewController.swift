//
//  ViewController.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 01/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewSort: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var viewPopularity: UIView!
    @IBOutlet weak var collectionMovies: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addShadow(viewForshadow: viewSort)
        roundView(viewForRound: viewSort)
        
        addShadow(viewForshadow: viewRating)
        roundView(viewForRound: viewRating)
        
        addShadow(viewForshadow: viewPopularity)
        roundView(viewForRound: viewPopularity)

        setupInitialPosition()
        
        let nib1 = UINib(nibName: Constants.reuseID, bundle: Bundle.main)
        collectionMovies.register(nib1, forCellWithReuseIdentifier: Constants.reuseID)
    }

    @IBAction func btnSortAction(_ sender: Any) {
    }
    
    func roundView(viewForRound : UIView){
        viewForRound.layer.cornerRadius = viewForRound.frame.width / 2
    }
    
    func addShadow(viewForshadow : UIView){
        viewForshadow.layer.shadowColor = UIColor.gray.cgColor
        viewForshadow.layer.shadowOpacity = 1
        viewForshadow.layer.shadowOffset = CGSize.zero
        viewForshadow.layer.shadowRadius = 6
    }
    
    func setupInitialPosition(){
        viewRating.transform = CGAffineTransform(translationX: 0, y: viewSort.center.y)
        viewPopularity.transform = CGAffineTransform(translationX: 0, y: viewSort.center.y)
        viewRating.isHidden = true
        viewPopularity.isHidden = true
    }
    
}


private enum Constants{
    static let reuseID = "MovieCollectionCell"
}
