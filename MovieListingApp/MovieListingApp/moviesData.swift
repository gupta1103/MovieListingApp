//
//  moviesData.swift
//  MovieListingApp
//
//  Created by Akanksha on 25/06/21.
//

import Foundation

struct movie : Codable
{
    let title : String
    let overview : String
    let poster_path : String
}

struct movieData : Codable
{
    let movies : [movie]
}
