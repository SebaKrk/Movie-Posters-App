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

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postersManager.delegate = self
        postersManager.getJSON()
        

            
    }
    
    
    @IBAction func moreInfoButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "movieDetailsSegue", sender: Any.self)

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationVC = segue.destination as? MovieDetailsViewController {
//            destinationVC.manager = postersManager
//        }
//    }
    
    
    @IBAction func ratingsButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "ratingsSegue", sender: Any.self)
        
    }
    
    func didIpdatePosters(posters: PostersModel) {
        DispatchQueue.main.async {
            self.titleLabel.text = posters.title
            
            let url = URL(string: "\(posters.poster)")
            
            self.posterImage.kf.setImage(with: url)
            
        }
    }

    
}
