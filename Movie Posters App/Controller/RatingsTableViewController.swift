//
//  RatingsTableViewController.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 13/11/2020.
//

import UIKit

class RatingsTableViewController: UITableViewController {
    
    var arrayRatings : [RatingsData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundColor = .lightGray
        
       
    }
    
    // MARK: - get JASON Data
    
    let baseURL = "https://www.omdbapi.com/?t="
    let apiKey = "b68fdd8a"
    let poster = "star+wars"
    
    func getJSON() {
        
        let urlString = "\(baseURL)\(poster)&apikey=\(apiKey)"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error masage \(error!)")
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let ratingsData = try decoder.decode([RatingsData].self, from: safeData)
                        DispatchQueue.main.async {
                            self.arrayRatings = ratingsData
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("error masage in do/catch block: \(error)")
                    }
                }
                
            }
            task.resume()
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        

        return cell
    }

}
