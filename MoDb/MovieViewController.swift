//
//  MovieViewController.swift
//  MoDb
//
//  Created by CLAG on 28/11/16.
//  Copyright © 2016 Clag. All rights reserved.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController {

    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieSummary: UITextView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    
    let dataProvider = LocalCoreDataService()
    var movie : Movie?
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movie = movie {
            
            if let image = movie.image {
                movieImage.kf.setImage(with: ImageResource(downloadURL: URL(string: image)!))
            }
            
            movieTitle.text = movie.title
            self.title = movie.title
        
            movieCategory.text = movie.category
            movieDirector.text = movie.director
            movieSummary.text = movie.summary
            
            configureFavoriteButton()
        }
    }
    
    
    func configureFavoriteButton() {
        if let movie = self.movie {
            if dataProvider.isMovieFavorite(movie: movie) {
                btnFavorite.setBackgroundImage(#imageLiteral(resourceName: "btn-on"), for: .normal)
                btnFavorite.setTitle("¡Quiero verla!", for: .normal)
            }else {
                btnFavorite.setBackgroundImage(#imageLiteral(resourceName: "btn-off"), for: .normal)
                btnFavorite.setTitle("No me interesa!", for: .normal)
            }
        }
    
    }
    
    @IBAction func favoritePressed(_ sender: UIButton) {
        
        if let movie = self.movie {
            dataProvider.markUnmarkFavorite(movie: movie)
            configureFavoriteButton()
        }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        movieSummary.scrollRangeToVisible(NSMakeRange(0, 0))
    }
    
    
}
