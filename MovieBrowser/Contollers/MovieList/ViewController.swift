//
//  ViewController.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 01/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblFilterIndicator: UILabel!
    @IBOutlet weak var viewLoader : UIView!
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    @IBOutlet weak var viewShowAll: UIView!
    @IBOutlet weak var lblSort: UILabel!
    @IBOutlet weak var imgvwSort: UIImageView!
    @IBOutlet weak var viewSort: UIView!
    @IBOutlet weak var viewRating: UIView!
    @IBOutlet weak var viewPopularity: UIView!
    @IBOutlet weak var collectionMovies: UICollectionView!
    
    var totalPages : Int?
    var pageNo : Int = 1
    var objMovies : MoviesModel?
    var arrMovies = [Results]()
    var isPaging = false
    var selectedEndPoint = Constants.epWithOutFilter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgvwSort.image = UIImage(named: "sort")
        
        Common.roundView(viewForRound: lblFilterIndicator)
        
        Common.addShadow(viewForshadow: viewSort)
        Common.roundView(viewForRound: viewSort)
        
        Common.addShadow(viewForshadow: viewRating)
        Common.roundView(viewForRound: viewRating)
        
        Common.addShadow(viewForshadow: viewPopularity)
        Common.roundView(viewForRound: viewPopularity)
        
        Common.addShadow(viewForshadow: viewShowAll)
        Common.roundView(viewForRound: viewShowAll)
        
        setupInitialPosition()
        
        let nib1 = UINib(nibName: Constants.reuseID, bundle: Bundle.main)
        collectionMovies.register(nib1, forCellWithReuseIdentifier: Constants.reuseID)
        
        
        getMovies()
        
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
                    self.selectedEndPoint = Constants.epWithOutFilter
                    self.isPaging = false
                    self.totalPages = nil
                    self.pageNo = 1
                    self.arrMovies.removeAll()
                    self.getMovies()
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
                    self.selectedEndPoint = Constants.epWithPopularity
                    self.isPaging = false
                    self.totalPages = nil
                    self.pageNo = 1
                    self.arrMovies.removeAll()
                    self.getMovies()
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
                    self.selectedEndPoint = Constants.epWithRating
                    self.isPaging = false
                    self.totalPages = nil
                    self.pageNo = 1
                    self.arrMovies.removeAll()
                    self.getMovies()
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
    
    
    
    func setupInitialPosition(){
        viewRating.transform = CGAffineTransform(translationX: 0, y: viewSort.center.y)
        viewPopularity.transform = CGAffineTransform(translationX: 0, y: viewSort.center.y)
        viewShowAll.transform = CGAffineTransform(translationX: 0, y: viewSort.center.y)
        viewRating.isHidden = false
        viewPopularity.isHidden = false
        viewShowAll.isHidden = false
    }
    
    //MARK: api call
    
    func getMovies(){
        (selectedEndPoint == Constants.epWithOutFilter) ? (lblFilterIndicator.isHidden = true) : (lblFilterIndicator.isHidden = false)
        isPaging ? activityIndicator.startAnimating() : (viewLoader.isHidden = false)
        BaseNetwork.parse(endpoint: selectedEndPoint + "\(pageNo)", dataToPost: [:], header: [:], instanceTypeToBeDecoded: objMovies) { (modelMovies) in
            DispatchQueue.main.async {
                self.totalPages = modelMovies?.total_pages ?? -1
                if self.arrMovies.isEmpty{
                    self.arrMovies = modelMovies?.results ?? []
                }
                else{
                    for movie in modelMovies?.results ?? []{
                        self.arrMovies.append(movie)
                    }
                }
                self.collectionMovies.reloadData()
                self.viewLoader.isHidden = true
                self.isPaging = false
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as! MoviesCollectionCell
        let objMovie = arrMovies[indexPath.item]
        cell.lblMovieName.text = objMovie.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let movieDetailsVC = storyBoard.instantiateViewController(withIdentifier: Constants.movieDetailsVCID) as! MovieDetailViewController
        movieDetailsVC.movieID = "\(arrMovies[indexPath.item].id ?? -1)"
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            return UICollectionReusableView()
        }
        else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
            print(indexPath.item, indexPath.section)
            return footer
        }
    }
}

extension ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isPaging){
            if pageNo <= (totalPages ?? -1){
                activityIndicator.startAnimating()
                pageNo += 1
                isPaging = true
                getMovies()
            }
        }
    }
}


private enum Constants{
    static let reuseID = "MoviesCollectionCell"
    static let collectionCellheight : CGFloat = 202.0
    static let movieDetailsVCID = "MovieDetailViewController"
    static let epWithOutFilter = "discover/movie?api_key=dcb920405a6a8223246657973afaa111&language=en-US&include_adult=false&include_video=false&page="
    static let epWithPopularity = "discover/movie?api_key=dcb920405a6a8223246657973afaa111&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page="
    static let epWithRating = "discover/movie?api_key=dcb920405a6a8223246657973afaa111&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page="
}
