//
//  PostersViewController.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 11/11/2020.
//

import UIKit
import Kingfisher

class PostersViewController: UIViewController,PostersManagerDelegate {
   
   
    var postersManager = PostersManager()

    
    var setMovie = ""

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        postersManager.delegate = self
        
        titleLabel.text = setMovie

        postersManager.getJSON(for: setMovie)

    }
    
    
    @IBAction func moreInfoButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "movieDetailsSegue", sender: Any.self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MovieDetailsViewController
        vc.setMore = setMovie
    }
    
    
    @IBAction func ratingsButtonTapped(_ sender: Any) {
        print("ratingsButtonTapped")
//        performSegue(withIdentifier: "ratingsSegue", sender: Any.self)
        
    }
    
    func didIpdatePosters(posters: PostersModel) {
        DispatchQueue.main.async {
            self.titleLabel.text = posters.title
            
            let url = URL(string: "\(posters.poster)")
            
            self.posterImage.kf.setImage(with: url)
            
        }
    }
    func didUpdateMovie(movie: String) {
        DispatchQueue.main.async {
            self.titleLabel.text = movie
        }
    }
}
