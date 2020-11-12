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
    
    
//    var postersManager = PostersManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Please enter title of movie", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        
//        postersManager.getJSON()
        
        
    }

    @IBAction func searchButtonTapped(_ sender: Any) {
       performSegue(withIdentifier: "postersSegue", sender: self)
        
    }
    
}

