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
    var description: String? = nil
    var user: User? = nil
//    var currentUserCollections: [JSONAny?]?
//    var urls: Urls?
//    var links: ResultLinks?

    enum CodingKeys: String, CodingKey {
        case user
        case description

    }
    
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            do {
                user  = values.contains(.user) ?  try values.decode(User.self, forKey: .user) : nil
                description = values.contains(.description) ?  try values.decode(String.self, forKey: .description) : nil
            } catch {
                user  = values.contains(.user) ?  try values.decode(User.self, forKey: .user) : nil
                description = """
                Lorem ipsum dolor sit amet consectetur adipiscing elit enim et, aliquam netus integer fringilla augue fermentum nam penatibus, magnis sapien morbi feugiat ac habitasse condimentum ad. Parturient et metus massa taciti dictum, velit morbi quis purus torquent, montes ridiculus tellus sociis. Euismod vulputate fringilla curabitur quis dignissim phasellus ligula mattis rutrum platea vitae luctus scelerisque posuere, sem montes quisque primis iaculis fusce cubilia integer taciti at ullamcorper orci eros.
                """
            }
        
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
    var id:  String? = nil
    var username:  String? = nil
    var name:  String? = nil
    var firstName:  String? = nil
    var lastName: String? = nil
    var profileImage: ProfileImage?
    var links: UserLinks?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case profileImage = "profile_image"
        case links
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = values.contains(.id) ?  try values.decode(String.self, forKey: .id) : ""
            username = values.contains(.username) ?  try values.decode(String.self, forKey: .username) : ""
            name = values.contains(.name) ?  try values.decode(String.self, forKey: .name) : ""
            firstName = values.contains(.firstName) ?  try values.decode(String.self, forKey: .firstName) : ""
            lastName = values.contains(.lastName) ?  try values.decode(String.self, forKey: .lastName) : ""
            profileImage = values.contains(.profileImage) ?  try values.decode(ProfileImage.self, forKey: .profileImage) : nil
            links = values.contains(.links) ?  try values.decode(UserLinks.self, forKey: .links) : nil
        } catch  {
            id = values.contains(.id) ?  try values.decode(String.self, forKey: .id) : ""
            username = values.contains(.username) ?  try values.decode(String.self, forKey: .username) : ""
            name = values.contains(.name) ?  try values.decode(String.self, forKey: .name) : ""
            firstName = "first_name"
            lastName =  "last_nsmr"
            profileImage = values.contains(.profileImage) ?  try values.decode(ProfileImage.self, forKey: .profileImage) : nil
            links = values.contains(.links) ?  try values.decode(UserLinks.self, forKey: .links) : nil
        }
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        linksSelf = values.contains(.linksSelf) ?  try values.decode(String.self, forKey: .linksSelf) : ""
        html = values.contains(.linksSelf) ?  try values.decode(String.self, forKey: .html) : ""
        photos = values.contains(.photos) ?  try values.decode(String.self, forKey: .photos) : ""
        likes = values.contains(.likes) ?  try values.decode(String.self, forKey: .likes) : ""
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        small = values.contains(.small) ?  try values.decode(String.self, forKey: .small) : ""
        medium = values.contains(.medium) ?  try values.decode(String.self, forKey: .medium) : ""
        large = values.contains(.large) ?  try values.decode(String.self, forKey: .large) : ""
    }
}

