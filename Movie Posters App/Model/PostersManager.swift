//
//  PostersManager.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 12/11/2020.
//

import Foundation

protocol PostersManagerDelegate {
    func didIpdatePosters (posters: PostersModel)
}

struct PostersManager {
    
    var delegate: PostersManagerDelegate?
    
    let baseURL = "https://www.omdbapi.com/?t="
    let apiKey = "b68fdd8a"
    let poster = "star+wars"
    
    func getJSON() {
        let urlString = "\(baseURL)\(poster)&apikey=\(apiKey)"
        
        print(urlString)
    
        if let url = URL(string: "\(urlString)") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error masage: \(error!)")
                    return
                }
                
                if let safeData = data {
                    if let postersData = self.parseJSON(appData: safeData) {
                        self.delegate?.didIpdatePosters(posters: postersData)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(appData: Data) -> PostersModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(PostersData.self, from: appData)
            
//            print(decodedData.Ratings[0].Source)
//            print(decodedData.Ratings[0].Value)
            
            let title = decodedData.Title
            let posterImage = decodedData.Poster
            let plot = decodedData.Plot
            let released = decodedData.Released
            let runtime = decodedData.Runtime
            let genre = decodedData.Genre
            let director = decodedData.Director
            let writer = decodedData.Writer
            let awards = decodedData.Awards
            let actors = decodedData.Actors
            let year = decodedData.Year
            
            
            let posterModel = PostersModel(title: title, poster: posterImage, plot: plot, released: released, runtime: runtime, genre: genre, director: director, writer: writer, awards: awards, actors: actors, year: year )
        
            
            return posterModel
            
        } catch {
            print("error masage in dp/catch block: \(error)")
            return  nil
        }
        
    }
    
}
