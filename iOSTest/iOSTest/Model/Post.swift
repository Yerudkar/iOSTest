//
//  Post.swift
//  iOSTest
//
//  Created by Madhuri Yerudkar on 26/04/24.
//

import Foundation

struct Post : Codable {
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        body = try values.decodeIfPresent(String.self, forKey: .body)
    }

}

