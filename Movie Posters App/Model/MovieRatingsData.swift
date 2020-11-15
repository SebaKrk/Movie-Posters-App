//
//  MovieRatingsData.swift
//  Movie Posters App
//
//  Created by Sebastian Sciuba on 15/11/2020.
//

import Foundation

struct MovieRatingsData: Codable {
    let Ratings: [Ratings]
}
struct Ratings: Codable {
    let Source: String
    let Value: String
    
    private enum CodingKeys: String, CodingKey {
        case Source, Value
    }
}

