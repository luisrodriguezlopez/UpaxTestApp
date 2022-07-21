//
//  SearchEntity.swift
//  UpaxTestApp
//
//  Created by coppel on 20/07/22.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SearchResponse: Codable {
    let total, totalPages: Int?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
//    var id: String?
//    var createdAt: String?
//    var width, height: Int?
//    var color, blurHash: String?
//    var likes: Int?
//    var likedByUser: Bool?
//    var resultDescription: String?
    var user: User?
//    var currentUserCollections: [JSONAny?]?
//    var urls: Urls?
//    var links: ResultLinks?

    enum CodingKeys: String, CodingKey {
      
        case user

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = values.contains(.id) ?  try values.decode(String.self, forKey: .id) : ""
//        createdAt = values.contains(.createdAt) ?  try values.decode(String.self, forKey: .createdAt) : ""
//        width = values.contains(.width) ?  try values.decode(Int.self, forKey: .width) : 0
//        height = values.contains(.height) ?  try values.decode(Int.self, forKey: .height) : 0
//        color = values.contains(.color) ?  try values.decode(String.self, forKey: .color) : ""
//         blurHash = values.contains(.blurHash) ?  try values.decode(String.self, forKey: .blurHash) : ""
//        likes = values.contains(.likes) ?  try values.decode(Int.self, forKey: .likes) : 0
//        likedByUser = values.contains(.likedByUser) ?  try values.decode(Bool.self, forKey: .likedByUser) : false
//        resultDescription = values.contains(.resultDescription) ?  try values.decode(String.self, forKey: .resultDescription) : ""
        user  = values.contains(.user) ?  try values.decode(User.self, forKey: .user) : nil
//        currentUserCollections = values.contains(.currentUserCollections) ?  try values.decode([JSONAny].self, forKey: .currentUserCollections) : []
//        urls = values.contains(.urls) ?  try values.decode(Urls.self, forKey: .urls) : nil
//        links = values.contains(.links) ?  try values.decode(ResultLinks.self, forKey: .links) : nil
        
    }

}

// MARK: - ResultLinks
struct ResultLinks: Codable {
    let linksSelf: String?
    let html, download: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
    }
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb: String?
}

// MARK: - User
struct User: Codable {
    let id, username, name, firstName: String?
    let lastName: String?
    let profileImage: ProfileImage?
    let links: UserLinks?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
        case links
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = values.contains(.id) ?  try values.decode(String.self, forKey: .id) : ""
        username = values.contains(.username) ?  try values.decode(String.self, forKey: .username) : ""
        name = values.contains(.name) ?  try values.decode(String.self, forKey: .name) : ""
        firstName = values.contains(.firstName) ?  try values.decode(String.self, forKey: .firstName) : ""
        lastName = values.contains(.lastName) ?  try values.decode(String.self, forKey: .lastName) : ""
        profileImage = values.contains(.profileImage) ?  try values.decode(ProfileImage.self, forKey: .profileImage) : nil
        links = values.contains(.links) ?  try values.decode(UserLinks.self, forKey: .links) : nil
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf: String?
    let html: String?
    let photos, likes: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

