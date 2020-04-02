//
//  ViewController.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 01/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewShowAll: UIView!
    @IBOutlet weak var lblSort: UILabel!
    @IBOutlet weak var imgvwSort: UIImageView!
    @IBOutlet weak var viewSort: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var viewPopularity: UIView!
    @IBOutlet weak var collectionMovies: UICollectionView!
    
    
    var pageNo : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgvwSort.image = UIImage(named: "sort")
        
        addShadow(viewForshadow: viewSort)
        roundView(viewForRound: viewSort)
        
        addShadow(viewForshadow: viewRating)
        roundView(viewForRound: viewRating)
        
        addShadow(viewForshadow: viewPopularity)
        roundView(viewForRound: viewPopularity)
        
        addShadow(viewForshadow: viewShowAll)
        roundView(viewForRound: viewShowAll)

        setupInitialPosition()
        
        let nib1 = UINib(nibName: Constants.reuseID, bundle: Bundle.main)
        collectionMovies.register(nib1, forCellWithReuseIdentifier: Constants.reuseID)
    }

    @IBAction func onTapViewShowAll(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewRating.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewPopularity.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
            }) { (_) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewShowAll.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
                }, completion: { (_) in
                    self.imgvwSort.image = UIImage(named: "sort")
                    self.lblSort.text = "Sort"
                    print("view show all was tapped")
                    
                    // normal api call
                })
            }
        }
    }
    
    @IBAction func onTapViewPopularity(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewRating.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
        }) { (_) in
            UIView.animate(withDuration: 0.3, animations: {
                self.viewPopularity.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
            }) { (_) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewShowAll.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
                }, completion: { (_) in
                    self.imgvwSort.image = UIImage(named: "sort")
                    self.lblSort.text = "Sort"
                    print("view popularity was tapped")
                    
                    // sort by popularity api call
                })
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
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewShowAll.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
                }, completion: { (_) in
                    self.imgvwSort.image = UIImage(named: "sort")
                    self.lblSort.text = "Sort"
                    print("view rating was tapped")
                    // sort by rating api call
                })
            }
        }
    }
    @IBAction func onTapViewSort(_ sender: Any) {
        if imgvwSort.image == UIImage(named: "sort"){ // open filter menu
            UIView.animate(withDuration: 0.3, animations: {
                self.viewRating.transform = CGAffineTransform.identity
            }) { (_) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewPopularity.transform = CGAffineTransform.identity
                }) { (_) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.viewShowAll.transform = CGAffineTransform.identity
                    }, completion: { (_) in
                        self.imgvwSort.image = UIImage(named: "cancel")
                        self.lblSort.text = "Cancel"
                        print("view sort was tapped")
                    })
                }
            }
        }
        else{ // close filter menu
            UIView.animate(withDuration: 0.3, animations: {
                self.viewRating.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
            }) { (_) in
                UIView.animate(withDuration: 0.3, animations: {
                    self.viewPopularity.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
                }) { (_) in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.viewShowAll.transform = CGAffineTransform(translationX: 0, y: self.viewSort.center.y)
                    }, completion: { (_) in
                        print("view close filter was tapped")
                        self.imgvwSort.image = UIImage(named: "sort")
                        self.lblSort.text = "Sort"
                        // sort by rating api call
                    })
                }
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
        viewShowAll.transform = CGAffineTransform(translationX: 0, y: viewSort.center.y)
        viewRating.isHidden = false
        viewPopularity.isHidden = false
        viewShowAll.isHidden = false
    }
    
    func getMovies(){
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let movieDetailsVC = storyBoard.instantiateViewController(withIdentifier: Constants.movieDetailsVCID) as! MovieDetailViewController
        navigationController?.pushViewController(movieDetailsVC, animated: true)
        
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
    static let movieDetailsVCID = "MovieDetailViewController"
    static let epWithOutFilter = "include_adult=false&include_video=false&page="
    static let epWithPopularity = "sort_by=popularity.desc&include_adult=false&include_video=false&page="
    static let epWithRating = "sort_by=vote_average.desc&include_adult=false&include_video=false&page="
}
