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

    @IBAction func onTapViewPopularity(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewRating.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewPopularity.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
            }) { (_) in
                print("view popularity was tapped")
                self.view.bringSubviewToFront(self.viewSort)
                // sort by popularity api call
            }
        }
    }
    @IBAction func onTapViewRating(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewRating.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewPopularity.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
            }) { (_) in
                print("view rating was tapped")
                self.view.bringSubviewToFront(self.viewSort)
                // sort by rating api call
            }
        }
    }
    @IBAction func onTapViewSort(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewRating.transform = CGAffineTransform.identity
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewPopularity.transform = CGAffineTransform.identity
            }) { (_) in
                print("view sort was tapped")
            }
        }
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
        viewRating.isHidden = false
        viewPopularity.isHidden = false
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as! MoviesCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: Constants.collectionCellheight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


private enum Constants{
    static let reuseID = "MoviesCollectionCell"
    static let collectionCellheight : CGFloat = 202.0
}
