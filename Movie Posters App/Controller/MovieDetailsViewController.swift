//
//  MovieDetailsViewController.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 12/11/2020.
//

import UIKit

class MovieDetailsViewController: UIViewController, PostersManagerDelegate {

    
    
    
    @IBOutlet weak var plotText: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var awardsLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    
    var posterManager = PostersManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterManager.delegate = self
        posterManager.getJSON()
        
        view.backgroundColor = .black
        plotLabel.textColor = .white
        plotLabel.adjustsFontSizeToFitWidth = true
        plotLabel.numberOfLines = 0
        
        plotText.textColor = .white
        plotText.text = "About MOVIE: "
        
        
        titleLabel.textColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true

        titleLabel.textColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true
        
        yearLabel.textColor = .white
        yearLabel.adjustsFontSizeToFitWidth = true
        
        releasedLabel.textColor = .white
        releasedLabel.adjustsFontSizeToFitWidth = true
        
        runtimeLabel.textColor = .white
        runtimeLabel.adjustsFontSizeToFitWidth = true
        
        genreLabel.textColor = .white
        genreLabel.adjustsFontSizeToFitWidth = true
        
        directorLabel.textColor = .white
        directorLabel.adjustsFontSizeToFitWidth = true
        
        writerLabel.textColor = .white
        writerLabel.adjustsFontSizeToFitWidth = true
        
        awardsLabel.textColor = .white
        awardsLabel.adjustsFontSizeToFitWidth = true
        awardsLabel.numberOfLines = 0
        
        actorsLabel.textColor = .white
        actorsLabel.adjustsFontSizeToFitWidth = true
        actorsLabel.numberOfLines = 0
    }
    
    
    func didIpdatePosters(posters: PostersModel) {
        DispatchQueue.main.async {
            self.plotText.text = "PLOT:"
            self.plotLabel.text = "About Movie: \(posters.plot)"
            self.titleLabel.text = "Title: \(posters.title)"
            self.yearLabel.text = "Year: \(posters.year)"
            self.releasedLabel.text = "Released: \(posters.released)"
            self.runtimeLabel.text = "Runtime: \(posters.runtime)"
            self.genreLabel.text = "Genre: \(posters.genre)"
            self.directorLabel.text = "Director: \(posters.director)"
            self.writerLabel.text = "Writer: \(posters.writer)"
            self.awardsLabel.text = "Awards: \(posters.awards)"
            self.actorsLabel.text = "Actors: \(posters.actors)"
            
            
            
        }
        
    }
    

    
}
