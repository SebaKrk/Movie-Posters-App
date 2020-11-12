//
//  MovieDetailsViewController.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 12/11/2020.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var plotLabel: UILabel!
    
    var posterManager = PostersManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        plotLabel.textColor = .white
        plotLabel.numberOfLines = 0
        plotLabel.text = "Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire's world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader."
        

    }
    

    
}
