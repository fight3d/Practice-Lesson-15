// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userResponse = try? newJSONDecoder().decode(UserResponse.self, from: jsonData)

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let results: [Users]

}

// MARK: - Result
struct Users: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob, registered: Dob
    let phone, cell: String
    let picture: Picture

}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - Location
struct Location: Codable {
    let city, state, country: String
}

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}

// MARK: - Name
struct Name: Codable {
    let title: String
    let first, last: String
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

