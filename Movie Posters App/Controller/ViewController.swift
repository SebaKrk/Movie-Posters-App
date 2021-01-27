//
//  ViewController.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 11/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var movie = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Please enter title of movie", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
    }
    
    
    // MARK: - Search Field
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        if let movieSearch = searchTextField.text {
            movie = movieSearch.replacingOccurrences(of: " ", with: "%20")
            print(movieSearch)
            print(movie)
            
            performSegue(withIdentifier: "postersSegue", sender: self)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PostersViewController
        vc.setMovie = movie
        
    }
}

