//
//  MovieDetailViewController.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 02/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import UIKit
import FloatRatingView
import SDWebImage
class MovieDetailViewController: UIViewController {

    @IBOutlet weak var viewLoading: UIView!
    @IBOutlet weak var imgvwPoster: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblMoviename: UILabel!
    @IBOutlet weak var lblRelesedate: UILabel!
    @IBOutlet weak var tvSynopsis: UITextView!
    @IBOutlet weak var viewRating: FloatRatingView!
    var movieID = ""
    var objMovieDetails : MovieDetailsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieDetails()
    }

    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getMovieDetails(){
        viewLoading.isHidden = false
        BaseNetwork.parse(endpoint: "movie/\(movieID)?api_key=dcb920405a6a8223246657973afaa111&language=en-US", dataToPost: [:], header: [:], instanceTypeToBeDecoded: objMovieDetails) { (modelMovie) in
            DispatchQueue.main.async {
                self.imgvwPoster.sd_setImage(with: URL(string: CommonConstants.POSTERPATH + (modelMovie?.poster_path ?? "")), placeholderImage: UIImage(named: "default"), options: SDWebImageOptions.avoidDecodeImage, completed: nil)
                self.lblRating.text = "\(modelMovie?.vote_average ?? 0.0) / 10"
                self.viewRating.rating = modelMovie?.vote_average ?? 0.0
                self.lblMoviename.text = modelMovie?.title
                self.lblRelesedate.text = "Relese date : " + (modelMovie?.release_date ?? "")
                self.tvSynopsis.text = modelMovie?.overview ?? ""
                self.viewLoading.isHidden = true
            }
        }
    }
}



