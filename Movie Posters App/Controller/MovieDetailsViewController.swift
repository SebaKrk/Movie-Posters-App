//
//  MovieDetailsViewController.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 12/11/2020.
//

import UIKit

class MovieDetailsViewController: UIViewController, PostersManagerDelegate {
   
    
    
    
    @IBOutlet weak var plotLabel: UILabel!
    
    var posterManager = PostersManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterManager.delegate = self
        posterManager.getJSON()
        
        view.backgroundColor = .black
        plotLabel.textColor = .white
        plotLabel.adjustsFontSizeToFitWidth = true
        plotLabel.numberOfLines = 0
        plotLabel.text = "Luke Skywalker"
        

    }
    
    func didIpdatePosters(posters: PostersModel) {
        DispatchQueue.main.async {
            self.plotLabel.text = "About Movie: \(posters.plot)"
        }
        
    }
    

    
}
