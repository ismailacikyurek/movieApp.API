// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personTvsModel = try? newJSONDecoder().decode(PersonTvsModel.self, from: jsonData)

import Foundation

// MARK: - PersonTvsModel
struct PersonTvsModel: Codable {
    let cast: [CastTvs]?
    let id: Int?
}

// MARK: - Cast
struct CastTvs: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originCountry: [String]?
  //  let originalLanguage: OriginalLanguage?
    let originalName, overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate, name: String?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let episodeCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originCountry = "origin_country"
     //   case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character
        case creditID = "credit_id"
        case episodeCount = "episode_count"
    }
}

