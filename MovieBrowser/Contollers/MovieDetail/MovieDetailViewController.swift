//
//  MovieDetailViewController.swift
//  MovieBrowser
//
//  Created by Dipanjan Pal on 02/04/20.
//  Copyright © 2020 Dipanjan Pal. All rights reserved.
//

import UIKit
import FloatRatingView
class MovieDetailViewController: UIViewController {

    @IBOutlet weak var viewRating: FloatRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

